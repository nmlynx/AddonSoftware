[[SFE_WOLSISSU.<CUSTOM>]]
init_cols: rem ---  Init grid columns
	rem --- Init the Item ID
	callpoint!.setColumnData("<<DISPLAY>>.ITEM_ID",str(callpoint!.getDevObject("item_id")),1)

	rem ---  Init qty_issued
	if callpoint!.getDevObject("lotser")="S" then 
		callpoint!.setColumnEnabled(num(callpoint!.getValidationRow()),"SFE_WOLSISSU.QTY_ISSUED",0)
	else
		callpoint!.setColumnEnabled(num(callpoint!.getValidationRow()),"SFE_WOLSISSU.QTY_ISSUED",1)
	endif
	return

get_tot_ls_qty_issued: rem --- Get total lot/serial issued quantity and total issue cost
	sfe_wolsissu_dev=fnget_dev("SFE_WOLSISSU")
	dim sfe_wolsissu$:fnget_tpl$("SFE_WOLSISSU")
	tot_ls_qty_issued=0
	tot_ls_issue_cost=0
	sfe_womatisd_key$=callpoint!.getDevObject("sfe_womatisd_key")
	read(sfe_wolsissu_dev,key=sfe_womatisd_key$,dom=*next)
	while 1
		sfe_wolsissu_key$=key(sfe_wolsissu_dev,end=*break)
		if pos(sfe_womatisd_key$=sfe_wolsissu_key$)<>1 then break
		readrecord(sfe_wolsissu_dev)sfe_wolsissu$
		tot_ls_qty_issued=tot_ls_qty_issued+sfe_wolsissu.qty_issued
		tot_ls_issue_cost=tot_ls_issue_cost+sfe_wolsissu.qty_issued*sfe_wolsissu.issue_cost
	wend
	callpoint!.setDevObject("tot_ls_qty_issued",tot_ls_qty_issued)
	callpoint!.setDevObject("tot_ls_issue_cost",tot_ls_issue_cost)
	return
[[SFE_WOLSISSU.LOTSER_NO.BINP]]
rem --- Init the Item ID
	callpoint!.setColumnData("<<DISPLAY>>.ITEM_ID",str(callpoint!.getDevObject("item_id")),1)
[[SFE_WOLSISSU.AGDR]]
rem ---  Init grid columns
	gosub init_cols
[[SFE_WOLSISSU.AREC]]
rem --- Init how many lot/serial items are left to issue
	tot_ls_qty_issued=num(callpoint!.getDevObject("tot_ls_qty_issued"))
	womatisd_qty_issued=num(callpoint!.getDevObject("womatisd_qty_issued"))
	callpoint!.setDevObject("left_to_issue",womatisd_qty_issued-tot_ls_qty_issued)

rem ---  Init grid columns
	gosub init_cols
[[SFE_WOLSISSU.AWRI]]
rem wgh ... stopped
rem wgh ... sfe_wolsissu only written on save ... but update inventory on row exit
rem wgh ... 3400 REM " --- Write
rem wgh ... 3410 IF O9$=T1$ AND O9=T[0] THEN GOTO 3460
rem wgh ... 3415 IF O9$="" THEN GOTO 3440
rem wgh ... 3420 LET O$=O9$,O8=O9,I=-1
rem wgh ... 3430 GOSUB 3600

rem wgh ... 3600 REM " --- IVM-02 Commit / Uncommit to Offset IVM-07 Process Below "
rem wgh ... 3602 REM " --- IVC.UA commits/ Uncomits IVM-02 again when committing IVM-07
rem wgh ... 3604 REM " --- This pass negates the IVM-02 update "
rem wgh ... 3605 DIM PARAMS[0],PARAMS$[4],ITEMS$[3],REFS$[11],REFS[5],IVFILES[44]
rem wgh ... 3606 LET PARAMS$[0]=F0$(7,3),PARAMS$[1]=F0$(4,3),PARAMS$[2]=P2$,PARAMS$[3]=P3$
rem wgh ... 3607 LET PARAMS$[4]=P4$
rem wgh ... 3610 LET IVFILES[1]=IVM01_DEV,IVFILES[2]=IVM02_DEV,IVFILES[7]=IVM07_DEV
rem wgh ... 3620 LET IVFILES[17]=IVM17_DEV
rem wgh ... 3625 IF I=1 THEN LET ACTION$="UC" ELSE IF I=(-1) THEN LET ACTION$="CO"
rem wgh ... 3630 LET ITEMS$[0]=T0$(1,2),ITEMS$[1]=W1$(19,2),ITEMS$[2]=W1$(21,20)
rem wgh ... 3640 LET ITEMS$[3]=" ",REFS[0]=O8
rem wgh ... 3660 CALL "IVC.UA",ACTION$,IVFILES[ALL],PARAMS[ALL],PARAMS$[ALL],ITEMS$[ALL],REFS$[ALL],REFS[ALL],STATUS
rem wgh ... 3700 REM " --- IVM-07 Commit / Uncommit / Total
rem wgh ... 3710 LET IVFILES[1]=IVM01_DEV,IVFILES[2]=IVM02_DEV,IVFILES[7]=IVM07_DEV
rem wgh ... 3720 LET IVFILES[17]=IVM17_DEV
rem wgh ... 3730 IF I=1 THEN LET ACTION$="CO" ELSE IF I=(-1) THEN LET ACTION$="UC"
rem wgh ... 3740 LET ITEMS$[0]=T0$(1,2),ITEMS$[1]=W1$(19,2),ITEMS$[2]=W1$(21,20)
rem wgh ... 3750 LET ITEMS$[3]=O$,REFS[0]=O8
rem wgh ... 3760 CALL "IVC.UA",ACTION$,IVFILES[ALL],PARAMS[ALL],PARAMS$[ALL],ITEMS$[ALL],REFS$[ALL],REFS[ALL],STATUS
rem wgh ... 3780 LET O7=O7+O8*I
rem wgh ... 3790 RETURN 

rem wgh ... 3440 LET O$=T1$,O8=T[0],I=1
rem wgh ... 3450 GOSUB 3600

rem wgh ... 3600 REM " --- IVM-02 Commit / Uncommit to Offset IVM-07 Process Below "
rem wgh ... 3602 REM " --- IVC.UA commits/ Uncomits IVM-02 again when committing IVM-07
rem wgh ... 3604 REM " --- This pass negates the IVM-02 update "
rem wgh ... 3605 DIM PARAMS[0],PARAMS$[4],ITEMS$[3],REFS$[11],REFS[5],IVFILES[44]
rem wgh ... 3606 LET PARAMS$[0]=F0$(7,3),PARAMS$[1]=F0$(4,3),PARAMS$[2]=P2$,PARAMS$[3]=P3$
rem wgh ... 3607 LET PARAMS$[4]=P4$
rem wgh ... 3610 LET IVFILES[1]=IVM01_DEV,IVFILES[2]=IVM02_DEV,IVFILES[7]=IVM07_DEV
rem wgh ... 3620 LET IVFILES[17]=IVM17_DEV
rem wgh ... 3625 IF I=1 THEN LET ACTION$="UC" ELSE IF I=(-1) THEN LET ACTION$="CO"
rem wgh ... 3630 LET ITEMS$[0]=T0$(1,2),ITEMS$[1]=W1$(19,2),ITEMS$[2]=W1$(21,20)
rem wgh ... 3640 LET ITEMS$[3]=" ",REFS[0]=O8
rem wgh ... 3660 CALL "IVC.UA",ACTION$,IVFILES[ALL],PARAMS[ALL],PARAMS$[ALL],ITEMS$[ALL],REFS$[ALL],REFS[ALL],STATUS
rem wgh ... 3700 REM " --- IVM-07 Commit / Uncommit / Total
rem wgh ... 3710 LET IVFILES[1]=IVM01_DEV,IVFILES[2]=IVM02_DEV,IVFILES[7]=IVM07_DEV
rem wgh ... 3720 LET IVFILES[17]=IVM17_DEV
rem wgh ... 3730 IF I=1 THEN LET ACTION$="CO" ELSE IF I=(-1) THEN LET ACTION$="UC"
rem wgh ... 3740 LET ITEMS$[0]=T0$(1,2),ITEMS$[1]=W1$(19,2),ITEMS$[2]=W1$(21,20)
rem wgh ... 3750 LET ITEMS$[3]=O$,REFS[0]=O8
rem wgh ... 3760 CALL "IVC.UA",ACTION$,IVFILES[ALL],PARAMS[ALL],PARAMS$[ALL],ITEMS$[ALL],REFS$[ALL],REFS[ALL],STATUS
rem wgh ... 3780 LET O7=O7+O8*I
rem wgh ... 3790 RETURN 

rem wgh ... 3455 LET O9$=T1$,O9=T[0]
rem wgh ... 3460 LET L=L+1; PRINT @(0,21),'LD','LD'
rem wgh ... 3480 WRITE (WOE14_DEV,KEY=T0$(1,17))IOL=WOE14A ... sfe_wolsissu
rem wgh ... 3485 IF V3=4 THEN GOTO 4000
rem wgh ... 3490 GOTO 1000
[[SFE_WOLSISSU.LOTSER_NO.AVAL]]
rem --- lotser_no is disabled except for a new row, so can init entire new row here.
	lotser_no$=callpoint!.getUserInput()
	if lotser_no$=callpoint!.getColumnData("SFE_WOLSISSU.LOTSER_NO") then
		rem --- Do not re-init if user returns to lotser_no field on a new row
		break
	endif

rem --- Get data for this lot/serial number
	item_id$=callpoint!.getDevObject("item_id")
	warehouse_id$=callpoint!.getDevObject("warehouse_id")
	ivm_lsmaster_dev=fnget_dev("IVM_LSMASTER")
	dim ivm_lsmaster$:fnget_tpl$("IVM_LSMASTER")
	findrecord(ivm_lsmaster_dev,key=firm_id$+warehouse_id$+item_id$+lotser_no$)ivm_lsmaster$

rem --- Init issued quantity to quantity left to issue
	tot_ls_qty_issued=num(callpoint!.getDevObject("tot_ls_qty_issued"))
	womatisd_qty_issued=num(callpoint!.getDevObject("womatisd_qty_issued"))
	if callpoint!.getDevObject("lotser")="S" then
		if womatisd_qty_issued<0 then
			wolsissu_qty_issued=-1
		else
			wolsissu_qty_issued=1
		endif
	else
		wolsissu_qty_issued=womatisd_qty-tot_ls_qty_issued
	endif

rem --- Can't return serialized item if it's already on hand.
	if wolsissu_qty_issued<0 and callpoint!.getDevObject("lotser")="S" and ivm_lsmaster.qty_on_hand<>0 then
		msg_id$="SF_SERIAL_ON_HAND"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Enough on hand?
	if ivm_lsmaster.qty_on_hand<ivm_lsmaster.qty_commit or ivm_lsmaster.qty_on_hand=0 then
		msg_id$="SF_QTY_NOT_AVAIL"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Don't issue more than are available
	if wolsissu_qty_issued>ivm_lsmaster.qty_on_hand-ivm_lsmaster.qty_commit then
		wolsissu_qty_issued=ivm_lsmaster.qty_on_hand-ivm_lsmaster.qty_commit
	endif

rem --- Set issue cost and quantity issued
	callpoint!.setColumnData("SFE_WOLSISSU.ISSUE_COST",str(ivm_lsmaster.unit_cost))
	callpoint!.setColumnData("SFE_WOLSISSU.QTY_ISSUED",str(wolsissu_qty_issued))

rem --- Update quantity left_to_issue and tot_ls_qty_issued
	left_to_issue=num(callpoint!.getDevObject("left_to_issue"))
	callpoint!.setDevObject("left_to_issue",left_to_issue-wolsissu_qty_issued)
	callpoint!.setDevObject("tot_ls_qty_issued",tot_ls_qty_issued+wolsissu_qty_issued)

print "ls AVAL: tot_ls_qty_issued="+str(tot_ls_qty_issued)
print "ls AVAL: left_to_issue="+str(left_to_issue)
rem wgh
[[SFE_WOLSISSU.AOPT-LLOK]]
rem --- Do lot/serial lookup
	warehouse_id$     = callpoint!.getDevObject("warehouse_id")
	item_id$   = callpoint!.getDevObject("item_id")
	womatisd_qty_issued=num(callpoint!.getDevObject("womatisd_qty_issued"))

	dim dflt_data$[3,1]
	dflt_data$[1,0] = "ITEM_ID"
	dflt_data$[1,1] = item_id$
	dflt_data$[2,0] = "WAREHOUSE_ID"
	dflt_data$[2,1] = warehouse_id$
	dflt_data$[3,0] = "LOTS_TO_DISP"
	if womatisd_qty_issued > 0 then
		dflt_data$[3,1] = "O"; rem --- open lots for issues
	else
		dflt_data$[3,1] = "C"; rem --- closed lots for returns 
	endif

	rem --- Call IVC_LOTLOOKUP form
	rem ---     returns: devObject("selected_lot")         : The lot/serial# selected for this item
	rem ---                   devObject("selected_lot_avail"): The amount select for this lot, or 1 for serial#
	rem ---                   devObject("selected_lot_cost") : The cost of the selected lot
	call stbl("+DIR_SYP")+"bam_run_prog.bbj","IVC_LOTLOOKUP",stbl("+USER_ID"),"","",table_chans$[all],"",dflt_data$[all]

rem --- Verify lot/serial available qty
	if callpoint!.getDevObject("selected_lot") <> null() then 
		selected_lot$ = str(callpoint!.getDevObject("selected_lot"))
		selected_lot_avail = num(callpoint!.getDevObject("selected_lot_avail"))
		selected_lot_cost = num(callpoint!.getDevObject("selected_lot_cost"))
			
		if selected_lot_avail=0 and womatisd_qty_issued>0 then
			if callpoint!.getDevObject("lotser") = "S" then
				lot_ser$ = Translate!.getTranslation("AON_SERIAL_NUMBER")
			else
				lot_ser$ = Translate!.getTranslation("AON_LOT")
			endif
			msg_id$ = "OP_LOT_NONE_AVAIL"
			dim msg_tokens$[1]
			msg_tokens$[1] = lot_ser$
			gosub disp_message
			break; rem --- exit callpoint
		endif

		rem --- Update grid with selected lot/serial info
		tot_ls_qty_issued=num(callpoint!.getDevObject("tot_ls_qty_issued"))
		left_to_issue=num(callpoint!.getDevObject("left_to_issue"))
		qty_issued=min( abs(selected_lot_avail), abs(left_to_issue) ) * sgn(womatisd_qty_issued)
		callpoint!.setDevObject("left_to_issue",left_to_issue-qty_issued)
		callpoint!.setDevObject("tot_ls_qty_issued",tot_ls_qty_issued+qty_issued)
		callpoint!.setColumnData("SFE_WOLSISSU.WO_LOCATION",str(callpoint!.getDevObject("wo_location")))
		callpoint!.setColumnData("SFE_WOLSISSU.WO_NO",str(callpoint!.getDevObject("wo_no")))
		callpoint!.setColumnData("SFE_WOLSISSU.WOMATISD_SEQ_REF",str(callpoint!.getDevObject("womatisd_seq_ref")))
		callpoint!.setColumnData( "SFE_WOLSISSU.LOTSER_NO", selected_lot$,1)
		callpoint!.setColumnData("SFE_WOLSISSU.QTY_ISSUED", str(qty_issued),1)
		callpoint!.setColumnData("SFE_WOLSISSU.ISSUE_COST", str(selected_lot_cost),1)
		callpoint!.setStatus("MODIFIED")
	endif
[[SFE_WOLSISSU.QTY_ISSUED.AVAL]]
rem --- Nothing to do if qty_issued hasn't changed
	qty_issued=num(callpoint!.getUserInput())
	prev_qty_issued=num(callpoint!.getColumnData("SFE_WOLSISSU.QTY_ISSUED"))
	if qty_issued=prev_qty_issued then
		rem --- No need to validate qty_issued, nor update quantity left_to_issue and tot_ls_qty_issued
		break
	endif

rem --- Get data for this lot/serial number
	lotser_no$=callpoint!.getColumnData("SFE_WOLSISSU.LOTSER_NO")
	item_id$=callpoint!.getDevObject("item_id")
	warehouse_id$=callpoint!.getDevObject("warehouse_id")
	ivm_lsmaster_dev=fnget_dev("IVM_LSMASTER")
	dim ivm_lsmaster$:fnget_tpl$("IVM_LSMASTER")
	findrecord(ivm_lsmaster_dev,key=firm_id$+warehouse_id$+item_id$+lotser_no$)ivm_lsmaster$

rem --- Verify quantiy available
	if qty_issued>0 and qty_issued>ivm_lsmaster.qty_on_hand-ivm_lsmaster.qty_commit then
		msg_id$="SF_QTY_NOT_AVAIL"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Update quantity left_to_issue and tot_ls_qty_issued
	left_to_issue=num(callpoint!.getDevObject("left_to_issue"))
	tot_ls_qty_issued=num(callpoint!.getDevObject("tot_ls_qty_issued"))
	callpoint!.setDevObject("left_to_issue",left_to_issue+prev_qty_issued-qty_issued)
	callpoint!.setDevObject("tot_ls_qty_issued",tot_ls_qty_issued-prev_qty_issued+qty_issued)

print "qty AVAL: tot_ls_qty_issued="+str(tot_ls_qty_issued)
print "qty AVAL: left_to_issue="+str(left_to_issue)
rem wgh
[[SFE_WOLSISSU.AGRN]]
rem -- Init hidden key fields
	callpoint!.setColumnData("SFE_WOLSISSU.WO_LOCATION",str(callpoint!.getDevObject("wo_location")))
	callpoint!.setColumnData("SFE_WOLSISSU.WO_NO",str(callpoint!.getDevObject("wo_no")))
	callpoint!.setColumnData("SFE_WOLSISSU.WOMATISD_SEQ_REF",str(callpoint!.getDevObject("womatisd_seq_ref")))

rem --- Set focus on lotser_no
	callpoint!.setFocus(num(callpoint!.getValidationRow()),"SFE_WOLSISSU.LOTSER_NO")
[[SFE_WOLSISSU.AUDE]]
rem wgh ... stopped
rem wgh ... need to handle commits
rem wgh ... sfe_wolsissu only written on save ... but update inventory on row exit
[[SFE_WOLSISSU.BEND]]
rem --- Have enough lot/serials been entered?
	tot_ls_qty_issued=num(callpoint!.getDevObject("tot_ls_qty_issued"))
	womatisd_qty_issued=num(callpoint!.getDevObject("womatisd_qty_issued"))
	if tot_ls_qty_issued<womatisd_qty_issued then
		if callpoint!.getDevObject("lotser") = "S" then
			lot_ser$ = Translate!.getTranslation("AON_SERIAL_NUMBER")
		else
			lot_ser$ = Translate!.getTranslation("AON_LOT")
		endif
		msg_id$ = "SF_TOO_FEW_LS"
		dim msg_tokens$[3]
		msg_tokens$[1] = lot_ser$
		msg_tokens$[2] = str(tot_ls_qty_issued)
		msg_tokens$[3] = str(womatisd_qty_issued)
		gosub disp_message
		if msg_opt$="C"
rem wgh ... stopped
rem wgh ... may be repeating last line when aborting
			callpoint!.setStatus("ABORT")
			break
		endif
	endif

rem --- Have too many lot/serials been entered?
	if tot_ls_qty_issued>womatisd_qty_issued then
		if callpoint!.getDevObject("lotser") = "S" then
			lot_ser$ = Translate!.getTranslation("AON_SERIAL_NUMBER")
		else
			lot_ser$ = Translate!.getTranslation("AON_LOT")
		endif
		msg_id$ = "SF_TOO_MANY_LS"
		dim msg_tokens$[3]
		msg_tokens$[1] = lot_ser$
		msg_tokens$[2] = str(tot_ls_qty_issued)
		msg_tokens$[3] = str(womatisd_qty_issued)
		gosub disp_message
		if msg_opt$="C"
rem wgh ... may be repeating last line when aborting
			callpoint!.setStatus("ABORT")
			break
		endif
	endif

rem --- Set total lot/serial issued quantity and total issue cost
	gosub get_tot_ls_qty_issued
[[SFE_WOLSISSU.BDEL]]
rem wgh ... stopped
rem wgh ... sfe_wolsissu only written on save ... but update inventory on row exit
rem wgh ... 3500 REM " --- Delete"
rem wgh ... 3510 REMOVE (WOE14_DEV,KEY=T0$(1,17),DOM=3520) ... sfe_wolsissu
rem wgh ... 3520 PRINT @(0,L),'CL',@(0,21),'LD','LD',
rem wgh ... 3540 IF O9$="" THEN GOTO 3590
rem wgh ... 3550 LET O$=O9$,O8=O9,I=-1
rem wgh ... 3570 GOSUB 3600

rem wgh ... 3600 REM " --- IVM-02 Commit / Uncommit to Offset IVM-07 Process Below "
rem wgh ... 3602 REM " --- IVC.UA commits/ Uncomits IVM-02 again when committing IVM-07
rem wgh ... 3604 REM " --- This pass negates the IVM-02 update "
rem wgh ... 3605 DIM PARAMS[0],PARAMS$[4],ITEMS$[3],REFS$[11],REFS[5],IVFILES[44]
rem wgh ... 3606 LET PARAMS$[0]=F0$(7,3),PARAMS$[1]=F0$(4,3),PARAMS$[2]=P2$,PARAMS$[3]=P3$
rem wgh ... 3607 LET PARAMS$[4]=P4$
rem wgh ... 3610 LET IVFILES[1]=IVM01_DEV,IVFILES[2]=IVM02_DEV,IVFILES[7]=IVM07_DEV
rem wgh ... 3620 LET IVFILES[17]=IVM17_DEV
rem wgh ... 3625 IF I=1 THEN LET ACTION$="UC" ELSE IF I=(-1) THEN LET ACTION$="CO"
rem wgh ... 3630 LET ITEMS$[0]=T0$(1,2),ITEMS$[1]=W1$(19,2),ITEMS$[2]=W1$(21,20)
rem wgh ... 3640 LET ITEMS$[3]=" ",REFS[0]=O8
rem wgh ... 3660 CALL "IVC.UA",ACTION$,IVFILES[ALL],PARAMS[ALL],PARAMS$[ALL],ITEMS$[ALL],REFS$[ALL],REFS[ALL],STATUS
rem wgh ... 3700 REM " --- IVM-07 Commit / Uncommit / Total
rem wgh ... 3710 LET IVFILES[1]=IVM01_DEV,IVFILES[2]=IVM02_DEV,IVFILES[7]=IVM07_DEV
rem wgh ... 3720 LET IVFILES[17]=IVM17_DEV
rem wgh ... 3730 IF I=1 THEN LET ACTION$="CO" ELSE IF I=(-1) THEN LET ACTION$="UC"
rem wgh ... 3740 LET ITEMS$[0]=T0$(1,2),ITEMS$[1]=W1$(19,2),ITEMS$[2]=W1$(21,20)
rem wgh ... 3750 LET ITEMS$[3]=O$,REFS[0]=O8
rem wgh ... 3760 CALL "IVC.UA",ACTION$,IVFILES[ALL],PARAMS[ALL],PARAMS$[ALL],ITEMS$[ALL],REFS$[ALL],REFS[ALL],STATUS
rem wgh ... 3780 LET O7=O7+O8*I
rem wgh ... 3790 RETURN 
[[SFE_WOLSISSU.BSHO]]
rem --- Set STBLs needed for lot/serial file validation
	x$=stbl("+WAREHOUSE_ID",callpoint!.getDevObject("warehouse_id"))
	x$=stbl("+ITEM_ID",callpoint!.getDevObject("item_id"))

rem --- Init lot/serial button
	switch pos(callpoint!.getDevObject("lotser")="LS")
		case 1
			callpoint!.setOptionText("LLOK",Translate!.getTranslation("AON_LOT_LOOKUP"))
			break
		case 2
			callpoint!.setOptionText("LLOK",Translate!.getTranslation("AON_SERIAL_LOOKUP"))
			break
		case default
			callpoint!.setOptionEnabled("LLOK",0)
			break
	swend

rem --- Init how many lot/serial items issued already
	gosub get_tot_ls_qty_issued
