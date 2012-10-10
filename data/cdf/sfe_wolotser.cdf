[[SFE_WOLOTSER.COMPLETE_FLG.BINP]]
rem --- Initialize complete flag
	this_ls_sch_qty=num(callpoint!.getColumnData("SFE_WOLOTSER.SCH_PROD_QTY"))
	this_cls_inp_qty=num(callpoint!.getColumnData("SFE_WOLOTSER.CLS_INP_QTY"))
	this_ls_cls_todt=num(callpoint!.getColumnData("SFE_WOLOTSER.QTY_CLS_TODT"))
	if this_ls_sch_qty=this_cls_inp_qty+this_ls_cls_todt and
:	callpoint!.getColumnData("SFE_WOLOTSER.COMPLETE_FLG")<>"Y" then
		callpoint!.setColumnData("SFE_WOLOTSER.COMPLETE_FLG","Y",1)
		callpoint!.setStatus("MODIFIED")
	endif
[[SFE_WOLOTSER.CLS_INP_QTY.BINP]]
rem --- Capture current lot/ser cls_inpt_qty so can make adjustments if it gets changed
	prev_cls_inp_qty=num(callpoint!.getColumnData("SFE_WOLOTSER.CLS_INP_QTY"))
	callpoint!.setDevObject("prev_cls_inp_qty",prev_cls_inp_qty)

	rem --- Initialize cls_inpt_qty as needed
	this_ls_sch_qty=num(callpoint!.getColumnData("SFE_WOLOTSER.SCH_PROD_QTY"))
	this_ls_cls_todt=num(callpoint!.getColumnData("SFE_WOLOTSER.QTY_CLS_TODT"))
	if prev_cls_inp_qty=0 and  this_ls_cls_todt<>this_ls_sch_qty then
		callpoint!.setColumnData("SFE_WOLOTSER.CLS_INP_QTY",str(this_ls_sch_qty-this_ls_cls_todt),1)
		callpoint!.setStatus("MODIFIED")
	endif
[[SFE_WOLOTSER.AUDE]]
rem --- Adjust how many lot/serial items have been scheduled
	ls_sch_qty=callpoint!.getDevObject("ls_sch_qty")
	ls_sch_qty=ls_sch_qty+num(callpoint!.getColumnData("SFE_WOLOTSER.SCH_PROD_QTY"))
	callpoint!.setDevObject("ls_sch_qty",ls_sch_qty)

rem --- Adjust how many lot/serial items have been closed
	ls_close_qty=callpoint!.getDevObject("ls_close_qty")
	ls_close_qty=ls_close_qty+num(callpoint!.getColumnData("SFE_WOLOTSER.CLS_INP_QTY"))
	callpoint!.setDevObject("ls_close_qty",ls_close_qty)
[[SFE_WOLOTSER.BDEL]]
rem --- Adjust how many lot/serial items have been scheduled
	ls_sch_qty=callpoint!.getDevObject("ls_sch_qty")
	ls_sch_qty=ls_sch_qty-num(callpoint!.getColumnData("SFE_WOLOTSER.SCH_PROD_QTY"))
	callpoint!.setDevObject("ls_sch_qty",ls_sch_qty)

rem --- Adjust how many lot/serial items have been closed
	ls_close_qty=callpoint!.getDevObject("ls_close_qty")
	ls_close_qty=ls_close_qty-num(callpoint!.getColumnData("SFE_WOLOTSER.CLS_INP_QTY"))
	callpoint!.setDevObject("ls_close_qty",ls_close_qty)
[[SFE_WOLOTSER.SCH_PROD_QTY.BINP]]
rem --- Capture current lot/ser sch_prod_qty so can make adjustments if it gets changed
	prev_ls_sch_qty=num(callpoint!.getColumnData("SFE_WOLOTSER.SCH_PROD_QTY"))
	callpoint!.setDevObject("prev_ls_sch_qty",prev_ls_sch_qty)

rem --- Initialize sch_prod_qty for lotted item
	if prev_ls_sch_qty=0 and callpoint!.getDevObject("lotser")="L" then
		wo_close_qty=num(callpoint!.getDevObject("cls_inp_qty"))
		if callpoint!.getDevObject("wolotser_action")="close" then
			rem --- Only being used with sfe_woclose form
			ls_close_qty=callpoint!.getDevObject("ls_close_qty")
			callpoint!.setColumnData("SFE_WOLOTSER.SCH_PROD_QTY",str(wo_close_qty-ls_close_qty),1)
			callpoint!.setStatus("MODIFIED")
		else
			rem --- Not being used with sfe_woclose form
			wo_sch_qty=num(callpoint!.getDevObject("prod_qty"))
			wo_cls_todt=num(callpoint!.getDevObject("qty_cls_todt"))
			callpoint!.setColumnData("SFE_WOLOTSER.SCH_PROD_QTY",str(wo_sch_qty-(wo_close_qty+wo_cls_todt)),1)
			callpoint!.setStatus("MODIFIED")
		endif
	endif
[[SFE_WOLOTSER.AGRN]]
rem --- Validate lot/serial quantities the first time in the grid
	if callpoint!.getDevObject("check_ls_qty") then
		callpoint!.setDevObject("check_ls_qty",0)
		gosub validate_ls_qty
	endif
[[SFE_WOLOTSER.AOPT-ACLS]]
rem wgh ... stopped here
rem wgh ... looks like woc.ca does the auto-close
rem wgh ... 6326 IF P3$(17,1)="S" AND Y>1 AND V3=1 THEN CALL "WOC.CA",SERIAL$,WOE06_DEV,SYS01_DEV,A0$(5,7),STATUS ELSE GOTO 6335
[[SFE_WOLOTSER.BEND]]
rem --- Get how many lot/serial items need to be closed
	gosub get_close_qty_needed

rem --- Validate lot/serial quantities
rem --- Register will prevents running update if have bad  lot/serial quantities
	gosub validate_ls_qty

rem wgh ... stopped here
rem wgh ... what happens if sfe_wolotser is saved but sfe_woclose is not?????????????
rem wgh ... in sfe_woclose remove sfe_wolotser if no SFE_CLOSEDWO record, or just leave for future close???????
[[SFE_WOLOTSER.<CUSTOM>]]
rem ==========================================================================
get_close_qty_needed: rem --- Get how many lot/serial items have been closed, and how many have been scheduled
rem ==========================================================================
	wolotser_dev=fnget_dev("SFE_WOLOTSER")
	dim wolotser$:fnget_tpl$("SFE_WOLOTSER")

	ls_sch_qty=0
	ls_close_qty=0
	wo_location$=callpoint!.getDevObject("wo_loc")
	wo_no$=callpoint!.getDevObject("wo_no")
	read (wolotser_dev,key=firm_id$+wo_location$+wo_no$,dom=*next)
	while 1		
		wolotser_key$=key(wolotser_dev,end=*break)
		if pos(firm_id$+wo_location$+wo_no$=wolotser_key$)<>1 then break
		readrecord (wolotser_dev)wolotser$
		ls_sch_qty=ls_sch_qty+wolotser.sch_prod_qty
		ls_close_qty=ls_close_qty+(wolotser.cls_inp_qty+wolotser.qty_cls_todt)
	wend
	callpoint!.setDevObject("ls_sch_qty",ls_sch_qty)
	callpoint!.setDevObject("ls_close_qty",ls_close_qty)
	return

rem ==========================================================================
validate_ls_qty: rem --- Validate lot/serial quantities
rem --- validation_err: output
rem ==========================================================================
	validation_err=0
	sf_units_mask$=callpoint!.getDevObject("sf_units_mask")
	wo_sch_qty=num(callpoint!.getDevObject("prod_qty"))
	wo_close_qty=num(callpoint!.getDevObject("cls_inp_qty"))
	wo_cls_todt=num(callpoint!.getDevObject("qty_cls_todt"))
	ls_sch_qty=callpoint!.getDevObject("ls_sch_qty")
	ls_close_qty=callpoint!.getDevObject("ls_close_qty")

	if callpoint!.getDevObject("wolotser_action")<>"close" then
		rem --- Not being used with sfe_woclose form

		if ls_sch_qty<>0 and ls_sch_qty<wo_sch_qty-wo_cls_todt then
			msg_id$="SF_LS_SCH_LT_WO_SCH"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(ls_sch_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(wo_sch_qty-wo_cls_todt:sf_units_mask$),3)
			gosub disp_message
			validation_err=1
		endif

		if ls_sch_qty>wo_sch_qty-wo_cls_todt then
			msg_id$="SF_LS_SCH_GT_WO_SCH"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(ls_sch_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(wo_sch_qty-wo_cls_todt:sf_units_mask$),3)
			gosub disp_message
			validation_err=2
		endif
	else
		rem --- Only being used with sfe_woclose form

		if ls_sch_qty<wo_close_qty then
			msg_id$="SF_LS_SCH_LT_WO_CLS"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(ls_sch_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(wo_close_qty:sf_units_mask$),3)
			gosub disp_message
			validation_err=3
		endif

		if ls_sch_qty>wo_close_qty then
			msg_id$="SF_LS_SCH_GT_WO_CLS"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(ls_sch_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(wo_close_qty:sf_units_mask$),3)
			gosub disp_message
			validation_err=4
		endif

		if ls_close_qty<ls_sch_qty then
			msg_id$="SF_LS_CLS_LT_LS_SCH"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(ls_close_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(ls_sch_qty:sf_units_mask$),3)
			gosub disp_message
			validation_err=5
		endif

		if ls_close_qty>ls_sch_qty then
			msg_id$="SF_LS_CLS_GT_LS_SCH"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(ls_close_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(ls_sch_qty:sf_units_mask$),3)
			gosub disp_message
			validation_err=6
		endif
	endif
	return
[[SFE_WOLOTSER.AGDR]]
rem --- Disable all input fields if lot/serial has been closed
	if callpoint!.getColumnData("SFE_WOLOTSER.CLOSED_FLAG")="Y" then
		this_row=callpoint!.getValidationRow()
		callpoint!.setColumnEnabled(this_row,"SFE_WOLOTSER.LOTSER_NO",0)
		callpoint!.setColumnEnabled(this_row,"SFE_WOLOTSER.WO_LS_CMT",0)
		callpoint!.setColumnEnabled(this_row,"SFE_WOLOTSER.SCH_PROD_QTY",0)
		callpoint!.setColumnEnabled(this_row,"SFE_WOLOTSER.CLS_INP_QTY",0)
		callpoint!.setColumnEnabled(this_row,"SFE_WOLOTSER.COMPLETE_FLG",0)
	endif
[[SFE_WOLOTSER.CLS_INP_QTY.AVAL]]
rem --- Validate this cls_inp_qty if changed
	this_cls_inp_qty=num(callpoint!.getUserInput())
	prev_cls_inp_qty=callpoint!.getDevObject("prev_cls_inp_qty")
	if this_cls_inp_qty<>prev_cls_inp_qty
		rem --- Restrict cls_inp_qty value for serialized items
		if callpoint!.getDevObject("lotser")="S" and (this_cls_inp_qty<0 or this_cls_inp_qty>1) then
			callpoint!.setStatus("ABORT")
			break
		endif

		rem --- Adjust how many lot/serial items have been closed
		ls_close_qty=callpoint!.getDevObject("ls_close_qty")
		ls_close_qty=ls_close_qty+this_cls_inp_qty-prev_cls_inp_qty
		callpoint!.setDevObject("ls_close_qty",ls_close_qty)

		rem --- Update complete flag and closed cost
		this_ls_sch_qty=num(callpoint!.getColumnData("SFE_WOLOTSER.SCH_PROD_QTY"))
		this_ls_cls_todt=num(callpoint!.getColumnData("SFE_WOLOTSER.QTY_CLS_TODT"))
		if this_cls_inp_qty<>0 then
			if this_cls_inp_qty=this_ls_sch_qty-this_ls_cls_todt and
:			callpoint!.getColumnData("SFE_WOLOTSER.COMPLETE_FLG")<>"Y" then
				callpoint!.setColumnData("SFE_WOLOTSER.COMPLETE_FLG","Y",1)
			endif
			if num(callpoint!.getColumnData("SFE_WOLOTSER.CLOSED_COST"))=0 then
				callpoint!.setColumnData("SFE_WOLOTSER.CLOSED_COST",callpoint!.getDevObject("closed_cost"),1)
			endif
		else
			if callpoint!.getColumnData("SFE_WOLOTSER.COMPLETE_FLG")<>"" then
				callpoint!.setColumnData("SFE_WOLOTSER.COMPLETE_FLG","",1)
			endif
			if num(callpoint!.getColumnData("SFE_WOLOTSER.CLOSED_COST"))<>0 then
				callpoint!.setColumnData("SFE_WOLOTSER.CLOSED_COST",str(0),1)
			endif
		endif

		rem --- Validate this_cls_inp_qty
		if this_cls_inp_qty+this_ls_cls_todt<this_ls_sch_qty then
			msg_id$="SF_LS_CLS_LT_LS_SCH"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(this_cls_inp_qty+this_ls_cls_todt:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(this_ls_sch_qty:sf_units_mask$),3)
			gosub disp_message
		endif
		if this_cls_inp_qty+this_ls_cls_todt>this_ls_sch_qty then
			msg_id$="SF_LS_CLS_GT_LS_SCH"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(this_cls_inp_qty+this_ls_cls_todt:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(this_ls_sch_qty:sf_units_mask$),3)
			gosub disp_message
		endif
	endif
[[SFE_WOLOTSER.AOPT-AUTO]]
rem wgh ... stopped here
rem wgh ... 6400 REM " --- Auto Generate Numbers"
rem wgh ... 6410 DIM SERIAL$[1]
rem wgh ... 6420 LET SERIAL$[0]=STR(NEEDED)
rem wgh ... 6430 CALL "IVC.SN",SYS01_DEV,V2,NEEDED,SERIAL$[ALL],STATUS
rem wgh ... 6440 IF STATUS>0 THEN GOSUB 6000; GOTO 6690
rem wgh ... 6450 IF NUM(W0$(12,3))+NUM(SERIAL$[0])-1>999 THEN GOSUB 6000; GOTO 6690
rem wgh ... 6455 IF NUM(SERIAL$[0])=0 THEN GOTO 6690
rem wgh ... 6460 FOR X0=1 TO NUM(SERIAL$[0])
rem wgh ... 6470 DIM X0$(20)
rem wgh ... 6480 LET X0$(1)=SERIAL$[X0]
rem wgh ... 6490 FIND (IVM07_DEV,KEY=N0$+A0$(54)+X0$,DOM=6550)IOL=IVM07A
rem wgh ... 6500 IF D[1]-D[2]>0 THEN GOTO 6510 ELSE GOTO 6550
rem wgh ... 6510 LET V4$="WARNING: Serial Number On Hand - OK"
rem wgh ... 6520 PRINT @(V1,V2),'RB',
rem wgh ... 6530 CALL "SYC.YN",1,V4$,2,V$,V3
rem wgh ... 6540 IF V$="N" THEN EXITTO 6690 ELSE GOTO 6550
rem wgh ... 6550 NEXT X0
rem wgh ... 6610 FOR X0=1 TO NUM(SERIAL$[0])
rem wgh ... 6620 DIM W[5]
rem wgh ... 6630 LET W1$(1)="",W1$(37)=SERIAL$[X0]
rem wgh ... 6640 LET W[0]=1,NEEDED=NEEDED-W[0]
rem wgh ... 6650 WRITE (WOE06_DEV,KEY=W0$(1,14))IOL=WOE06A
rem wgh ... 6660 LET W0=NUM(W0$(12,3))+1
rem wgh ... 6670 LET W0$(12,3)=STR(W0:"000")
rem wgh ... 6680 NEXT X0
rem wgh ... 6690 RETURN 
[[SFE_WOLOTSER.LOTSER_NO.AVAL]]
rem --- Verify lot/serial can be used
	lotser_no$=callpoint!.getUserInput()
	lsmaster_dev=fnget_dev("@IVM_LSMASTER")
	dim lsmaster$:fnget_tpl$("@IVM_LSMASTER")
	warehouse_id$=callpoint!.getDevObject("warehouse_id")
	item_id$=callpoint!.getDevObject("item_id")
	lsmaster_found=0
	findrecord(lsmaster_dev,key=firm_id$+warehouse_id$+item_id$+lotser_no$,dom=*next)lsmaster$; lsmaster_found=1
	if lsmaster_found and lsmaster.qty_on_hand-lsmaster.qty_commit>0 then
		if callpoint!.getDevObject("lotser")="S" then
			rem --- Can't use serial number that is already on hand
			msg_id$="SF_SERIAL_ON_HAND"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		else
			rem --- Warn that items are already on hand for this lot
			msg_id$="SF_LOT_AVAILABLE"
			gosub disp_message
		endif
	endif

rem --- Initialize serialized quantity to one
	if callpoint!.getDevObject("lotser")="S" and
:	callpoint!.getColumnData("SFE_WOLOTSER.SCH_PROD_QTY")="0" then
		callpoint!.setColumnData("SFE_WOLOTSER.SCH_PROD_QTY","1",1)

		rem --- CLS_INP_QTY is disabled for serialized items, so adjust lot/serial quantity here
		ls_sch_qty=callpoint!.getDevObject("ls_sch_qty")
		ls_sch_qty=ls_sch_qty-1
		callpoint!.setDevObject("ls_sch_qty",ls_sch_qty)
	endif
[[SFE_WOLOTSER.SCH_PROD_QTY.AVAL]]
rem --- Validate this sch_prod_qty if changed
	this_ls_sch_qty=num(callpoint!.getUserInput())
	prev_ls_sch_qty=callpoint!.getDevObject("prev_ls_sch_qty")
	if this_ls_sch_qty<>prev_ls_sch_qty then
		rem --- Adjust how many lot/serial items have been scheduled
		ls_sch_qty=callpoint!.getDevObject("ls_sch_qty")
		ls_sch_qty=ls_sch_qty+this_ls_sch_qty-prev_ls_sch_qty
		callpoint!.setDevObject("ls_sch_qty",ls_sch_qty)

	rem --- Validate this_ls_sch_qty
		wo_close_qty=num(callpoint!.getDevObject("cls_inp_qty"))
		if this_ls_sch_qty<wo_close_qty then
			msg_id$="SF_LS_SCH_LT_WO_CLS"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(this_ls_sch_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(ls_close_qty:sf_units_mask$),3)
			gosub disp_message
		endif
		if this_ls_sch_qty>wo_close_qty then
			msg_id$="SF_LS_SCH_GT_WO_CLS"
			dim msg_tokens$[2]
			msg_tokens$[1]=cvs(str(this_ls_sch_qty:sf_units_mask$),3)
			msg_tokens$[2]=cvs(str(wo_close_qty:sf_units_mask$),3)
			gosub disp_message
		endif
	endif
[[SFE_WOLOTSER.BSHO]]
rem --- Disable all input fields if work order has been closed
	if callpoint!.getDevObject("wo_status")="C" then
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.LOTSER_NO",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.WO_LS_CMT",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.SCH_PROD_QTY",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.CLS_INP_QTY",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.COMPLETE_FLG",-1)
	endif

rem --- Disable fields when closing work order, or not
	if callpoint!.getDevObject("wolotser_action")<>"close" then
		rem --- Not being used with sfe_woclose form
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.CLS_INP_QTY",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.COMPLETE_FLG",-1)
	endif

rem --- Disable sch_prod_qty field if serialized
	if callpoint!.getDevObject("lotser")="S" 		
		callpoint!.setColumnEnabled(-1,"SFE_WOLOTSER.SCH_PROD_QTY",-1)
	endif

rem --- Get how many lot/serial items need to be closed
	gosub get_close_qty_needed
	callpoint!.setDevObject("check_ls_qty",1)

rem --- Disable auto-assign and auto-close options as needed
	if callpoint!.getDevObject("lotser")<>"S" then
		rem --- Disable auto-assign and auto-close options when not serialized
		callpoint!.setOptionEnabled("AUTO",0)
		callpoint!.setOptionEnabled("ACLS",0)
	else
		close_qty_needed=num(callpoint!.getDevObject("cls_inp_qty"))-callpoint!.getDevObject("ls_sch_qty")
		if close_qty_needed<=1 then
			rem --- Disable auto-assign options when don't need more than one
			callpoint!.setOptionEnabled("AUTO",0)
		endif
		ls_qty_not_closed=callpoint!.getDevObject("ls_sch_qty")-callpoint!.getDevObject("ls_close_qty")
		if callpoint!.getDevObject("wolotser_action")<>"close" or ls_qty_not_closed<=1 then
			rem --- Disable auto-close options when not being used with sfe_woclose form 
			rem --- or don't have more than one ready to close
			callpoint!.setOptionEnabled("ACLS",0)
		endif
	endif

rem --- Get SF unit mask
	call stbl("+DIR_PGM")+"adc_getmask.aon","","SF","U","",sf_units_mask$,0,0
	callpoint!.setDevObject("sf_units_mask",sf_units_mask$)
