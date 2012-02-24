[[SFE_WOMATISD.AWRI]]
rem --- Inform user when item quantity is recommitted
	warehouse_id$=callpoint!.getColumnData("SFE_WOMATISD.WAREHOUSE_ID")
	item_id$=callpoint!.getColumnData("SFE_WOMATISD.ITEM_ID")
	qty_ordered=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))
	tot_qty_iss=num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS"))
	qty_issued=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ISSUED"))
	if qty_issued<0 and qty_ordered>0 then
		msg_id$="SF_ITEM_RECOMMIT"
		dim msg_tokens$[2]
		msg_tokens$[1] = str(abs(qty_issued))
		msg_tokens$[2] = cvs(item_id$, 2)
		gosub disp_message
	endif

rem --- Initialize inventory item update
	call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

rem --- Do initial commit for new records
rem --- (For new records qty_ordered=qty_issued and tot_qty_iss=0)
	if callpoint!.getGridRowNewStatus(callpoint!.getValidationRow())="Y" then
		qty_ordered=qty_issued
		callpoint!.setColumnData("SFE_WOMATISD.QTY_ORDERED",str(qty_ordered),1)

		items$[1]=warehouse_id$
		items$[2]=item_id$
		refs[0]=qty_ordered-tot_qty_iss
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	endif

rem --- Adjust committed if issue qty exceeds ordered qty 
rem --- (For new records qty_ordered=qty_issued and tot_qty_iss=0)
	if qty_issued+tot_qty_iss>qty_ordered then
		comit_qty=qty_issued+tot_qty_iss-qty_ordered
		items$[1]=warehouse_id$
		items$[2]=item_id$
		refs[0]=qty_issued+tot_qty_iss-qty_ordered
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

		rem --- Update order quantity with adjusted committed quantity
		sfe_womatisd_dev=fnget_dev("SFE_WOMATISD")
		dim sfe_womatisd$:fnget_tpl$("SFE_WOMATISD")
		sfe_womatisd_key$=firm_id$+
:			callpoint!.getColumnData("SFE_WOMATISD.WO_LOCATION")+
:			callpoint!.getColumnData("SFE_WOMATISD.WO_NO")+
:			callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO")
		readrecord(sfe_womatisd_dev,key=sfe_womatisd_key$)sfe_womatisd$
		sfe_womatisd.qty_ordered=qty_issued+tot_qty_iss
		writerecord(sfe_womatisd_dev,key=sfe_womatisd_key$)sfe_womatisd$
	endif

rem wgh ... stopped
rem wgh ... 3500 REM " --- Process Lot/Serial "
rem wgh ... 3510 IF POS(P3$(17,1)="LS")=0 OR B2$(19,2)<>"YY" THEN GOTO 3580
rem wgh ... 3520 IF O0=2 THEN GOTO 3580
rem wgh ... 3530 IF L<=L1 THEN GOTO 3570
rem wgh ... 3540 PRINT @(0,L1),'LD',
rem wgh ... 3550 LET L=L-1
rem wgh ... 3560 GOTO 3530
rem wgh ... 3570 RUN "WOE.DC" ... lot/serial O0=0 or 1
rem wgh ... 3580 REM " --- Return From Lot/Serial "
rem wgh ... 3585 LET O0=0
rem wgh ... 3590 IF V3=4 THEN GOTO 4000
rem wgh ... 3600 LET L=L+2,O1$=W1$(19),O1=W[0]-W[1],I0=0,O0=0
rem wgh ... 3610 GOTO 1010

rem --- Refresh grid row display with updated data
	callpoint!.setStatus("REFGRID")
[[SFE_WOMATISD.ADEL]]
rem wgh ... stopped
rem wgh ... 3700 REM " --- Delete"
rem wgh ... should this test include if B2$(19,2)="YY" ???
rem wgh ... B2$(19,1)=lotted/serialized item
rem wgh ... B2$(20,1)=inventoried
rem wgh ... 3740 IF POS(P3$(17,1)="LS")=0 THEN GOTO 3765
rem wgh ... 3750 LET O0=3
rem wgh ... 3760 RUN "WOE.DC" ... lot/serial O0=3
rem wgh ... 3765 GOSUB 6100

rem wgh ... 6100 REM " --- Delete Line Item "
rem wgh ... 6110 LET V4$="Delete Issue Only And Retain Commitment"
rem wgh ... 6120 CALL "SYC.YN",1,V4$,2,V$,V3
rem wgh ... 6130 ON POS(V$="YN") GOTO 6100,6190,6140
rem wgh ... 6140 LET S9$=W1$(19),S9=W[0]-W[1],S8=-1
rem wgh ... 6150 GOSUB 5700

rem wgh ... 5700 REM " --- Commit/Uncommit Inventory "
rem wgh ... 5701 DIM PARAMS[0],PARAMS$[4],ITEMS$[3],REFS$[11],REFS[5],IVFILES[44]
rem wgh ... 5702 LET PARAMS$[0]=F0$(7,3),PARAMS$[1]=F0$(4,3),PARAMS$[2]=P2$
rem wgh ... 5703 LET PARAMS$[3]=P3$,PARAMS$[4]=P4$
rem wgh ... 5704 LET IVFILES[0]=SYS01_DEV,IVFILES[1]=IVM01_DEV,IVFILES[2]=IVM02_DEV
rem wgh ... 5705 IF IVM07_DEV THEN LET IVFILES[7]=IVM07_DEV,IVFILES[17]=IVM17_DEV
rem wgh ... 5710 IF S8=1 THEN LET ACTION$="CO"
rem wgh ... 5720 IF S8=-1 THEN LET ACTION$="UC"
rem wgh ... 5730 LET REFS[0]=S9,ITEMS$[0]=N0$,ITEMS$[1]=S9$(1,2),ITEMS$[2]=S9$(3,20)
rem wgh ... 5740 CALL "IVC.UA",ACTION$,IVFILES[ALL],PARAMS[ALL],PARAMS$[ALL],ITEMS$[ALL],REFS$[ALL],REFS[ALL],STATUS
rem wgh ... 5760 RETURN 

rem wgh ... 6160 READ (WOE23_DEV,KEY=W0$(1,11)+W1$(7,3),DOM=6190)IOL=WOE23A
rem wgh ... 6170 LET R[0]=0
rem wgh ... 6180 WRITE (WOE23_DEV,KEY=W0$(1,11)+W1$(7,3))IOL=WOE23A
rem wgh ... 6190 RETURN 

rem wgh ... 3770 REMOVE (WOE25_DEV,KEY=W0$(1,14),DOM=3780)
rem wgh ... 3780 PRINT @(0,L),'LD','LD'
rem wgh ... 3785 LET I0=0,O0=0
rem wgh ... 3790 GOTO 1010
[[SFE_WOMATISD.AUDE]]
rem wgh ... stopped
rem wgh ... ??? undelete ???
[[SFE_WOMATISD.ITEM_ID.AVAL]]
rem --- Item ID is disabled except for a new row, so can init entire new row here.
	item_id$=callpoint!.getUserInput()

	rem --- Get Warehouse ID and Issued Date from header
	warehouse_id$=callpoint!.getDevObject("warehouse_id")
	required_date$=callpoint!.getDevObject("issued_date")

	rem -- Get Unit of Measure and Unit Cost for this item
	ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
	ivm_itemwhse_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm_itemwhse$:fnget_tpl$("IVM_ITEMWHSE")
	findrecord(ivm_itemmast_dev,key=firm_id$+item_id$,dom=*next)ivm_itemmast$
	findrecord(ivm_itemwhse_dev,key=firm_id$+warehouse_id$+item_id$,dom=*next)ivm_itemwhse$
	unit_measure$=ivm_itemmast.unit_of_sale$
	unit_cost=ivm_itemwhse.unit_cost
	issue_cost=ivm_itemwhse.unit_cost

	rem --- Check item for commitments
	sfe_womatdtl_dev=fnget_dev("SFE_WOMATDTL")
	dim sfe_womatdtl$:fnget_tpl$("SFE_WOMATDTL")
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	read(sfe_womatdtl_dev,key=sfe_womatish_key$,dom=*next)
	while 1
		sfe_womatdtl_key$=key(sfe_womatdtl_dev,end=*break)
		if pos(sfe_womatish_key$=sfe_womatdtl_key$)<>1 then break
		readrecord(sfe_womatdtl_dev)sfe_womatdtl$
		rem --- Looking for matching warehouse and item
		if sfe_womatdtl.warehouse_id$+sfe_womatdtl.item_id$=warehouse_id$+item_id$ then
			unit_measure$=sfe_womatdtl.unit_measure$
			womatdtl_seq_ref$=sfe_womatdtl.womatdtl_seq_no$
			warehouse_id$=sfe_womatdtl.warehouse_id$
			item_id$=sfe_womatdtl.item_id$
			require_date$=sfe_womatdtl.require_date$
			qty_ordered=sfe_womatdtl.qty_ordered
			tot_qty_iss=sfe_womatdtl.tot_qty_iss
			unit_cost=iff(sfe_womatdtl.unit_cost=0,ivm_itemwhse.unit_cost,sfe_womatdtl.unit_cost)
			qty_issued=sfe_womatdtl.qty_issued
			issue_cost=sfe_womatdtl.issue_cost
			break; rem --- found the one we were looking for
		endif
	wend

	rem --- Set and display data for new row
	callpoint!.setColumnData("SFE_WOMATISD.UNIT_MEASURE",unit_measure$,1)
	callpoint!.setColumnData("SFE_WOMATISD.WOMATDTL_SEQ_REF",womatdtl_seq_ref$,0)
	callpoint!.setColumnData("SFE_WOMATISD.WAREHOUSE_ID",warehouse_id$,0)
	callpoint!.setColumnData("SFE_WOMATISD.ITEM_ID",item_id$,0)
	callpoint!.setColumnData("SFE_WOMATISD.REQUIRE_DATE",required_date$,1)
	callpoint!.setColumnData("SFE_WOMATISD.QTY_ORDERED",str(qty_ordered),1)
	callpoint!.setColumnData("SFE_WOMATISD.TOT_QTY_ISS",str(tot_qty_iss),0)
	callpoint!.setColumnData("SFE_WOMATISD.UNIT_COST",str(unit_cost),0)
	callpoint!.setColumnData("SFE_WOMATISD.QTY_ISSUED",str(qty_issued),1)
	callpoint!.setColumnData("SFE_WOMATISD.ISSUE_COST",str(issue_cost),1)
	gosub init_display_cols; rem --- Init DISPLAY columns
[[SFE_WOMATISD.QTY_ISSUED.AVAL]]
rem --- Init DISPLAY columns
	qty_issued=num(callpoint!.getUserInput())
	issue_cost=num(callpoint!.getColumnData("SFE_WOMATISD.ISSUE_COST"))
	callpoint!.setColumnData("<<DISPLAY>>.VALUE",str(qty_issued*issue_cost),1)

rem --- Init quantity ordered when no existing commitment. but don't display until record is written.
	if num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))=0 then
 		callpoint!.setColumnData("SFE_WOMATISD.QTY_ORDERED",str(qty_issued),0)
	endif
[[SFE_WOMATISD.<CUSTOM>]]
init_display_cols: rem --- Init DISPLAY columns
	qty_ordered=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))
	tot_qty_iss=num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS"))
	callpoint!.setColumnData("<<DISPLAY>>.QTY_REMAIN",str(qty_ordered-tot_qty_iss),1)

	qty_issued=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ISSUED"))
	issue_cost=num(callpoint!.getColumnData("SFE_WOMATISD.ISSUE_COST"))
	callpoint!.setColumnData("<<DISPLAY>>.VALUE",str(qty_issued*issue_cost),1)
	return
[[SFE_WOMATISD.AGRE]]
rem --- Init DISPLAY columns
	gosub init_display_cols
[[SFE_WOMATISD.AGDR]]
rem --- Init DISPLAY columns
	gosub init_display_cols
[[SFE_WOMATISD.BGDR]]
rem --- Init DISPLAY columns

	qty_ordered=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))
	tot_qty_iss=num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS"))
	callpoint!.setColumnData("<<DISPLAY>>.QTY_REMAIN",str(qty_ordered-tot_qty_iss),1)

	qty_issued=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ISSUED"))
	issue_cost=num(callpoint!.getColumnData("SFE_WOMATISD.ISSUE_COST"))
	callpoint!.setColumnData("<<DISPLAY>>.VALUE",str(qty_issued*issue_cost),1)
[[SFE_WOMATISD.AGRN]]
rem --- Init DISPLAY columns
	gosub init_display_cols
[[SFE_WOMATISD.ADGE]]
rem --- Set precision
	precision num(callpoint!.getDevObject("precision"))
[[SFE_WOMATISD.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::grid_entry"
