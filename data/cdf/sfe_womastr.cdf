[[SFE_WOMASTR.BDEL]]
rem --- cascade delete will take care of removing requirements (sfe_wooprtn, sfe_womatl, sfe_wosubcnt) and comments (sfe_wocomnt)
rem --- otherwise, need code to:
rem --- 1. remove sfe_womathdr/sfe_womatdtl (sfe-13/23) recs and uncommit inventory
rem --- 2. **remove lot/serial recs from sfe_wolotser (sfe-06) if doing LS param is set
rem --- 3. remove sfe_womatish/sfe_womatisd (sfe-15/25) recs
rem --- 4. **remove sfe_closedwo, sfe_openedwo, sfe_wocommit, sfe_wotrans (the old sfe-04 A/B/C/D recs)
rem --- 5. **remove sft_clsoprtr, sft_clsmattr, sft_clssubtr (sft-03/23/33) recs
rem --- 6. **remove sfe_woschdl (sfm-05) recs
rem --- 7. reduce on-order if it's an inventory-category work order that's not planned/quoted, and isn't new

rem --- ** set SFE_WOMASTR as primary table for these files so they can be handled via cascade delete
rem --- what about removing sft_clslstrn (sft-12) along w/ other sft_cls* files? v6/7 didn't.


[[SFE_WOMASTR.BDEQ]]
rem --- prior to deleting a work order, need to check for open transactions; if any exist, can't delete

	wo_loc$=callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION")
	wo_no$=callpoint!.getColumnData("SFE_WOMASTR.WO_NO")
	can_delete$="YES"

	for files=1 to 3
		if files=1
			wotran_dev=fnget_dev("SFT_OPNOPRTR")
			dim wotran$:fnget_tpl$("SFT_OPNOPRTR")
		endif
		if files=2
			wotran_dev=fnget_dev("SFT_OPNMATTR")
			dim wotran$:fnget_tpl$("SFT_OPNMATTR")
		endif
		if files=3
			wotran_dev=fnget_dev("SFT_OPNSUBTR")
			dim wotran$:fnget_tpl$("SFT_OPNSUBTR")
		endif
		read(wotran_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)

		while 1
			wotran_key$=key(wotran_dev,end=*break)
			if pos(firm_id$+wo_loc$+wo_no$=wotran_key$)=1 then can_delete$="NO"
			break
		wend
	next files

	if can_delete$="NO"
		callpoint!.setMessage("SF_OPEN_TRANS")
		callpoint!.setStatus("ABORT")
	endif
	
[[SFE_WOMASTR.AFMC]]
rem --- The type of code seen below is often done in BSHO, but the code at the end that changes the prompt for the Bill/Item control
rem --- won't work there (too late).

rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")

rem --- Open tables

	num_files=20
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="SFS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="SFC_WOTYPECD",open_opts$[3]="OTA"
	open_tables$[4]="SFT_OPNMATTR",open_opts$[4]="OTA"
	open_tables$[5]="SFT_OPNOPRTR",open_opts$[5]="OTA"
	open_tables$[6]="SFT_OPNSUBTR",open_opts$[6]="OTA"
	open_tables$[7]="BMM_BILLMAST",open_opts$[7]="OTA"
	open_tables$[8]="OPE_ORDHDR",open_opts$[8]="OTA"
	open_tables$[9]="OPE_ORDDET",open_opts$[9]="OTA"
	open_tables$[10]="IVM_ITEMMAST",open_opts$[10]="OTA"
	open_tables$[11]="OPC_LINECODE",open_opts$[11]="OTA"
	open_tables$[12]="GLS_PARAMS",open_opts$[12]="OTA"
	open_tables$[13]="SFT_CLSMATTR",open_opts$[13]="OTA"
	open_tables$[14]="SFT_CLSOPRTR",open_opts$[14]="OTA"
	open_tables$[15]="SFT_CLSSUBTR",open_opts$[15]="OTA"
	open_tables$[16]="SFT_CLSLSTRN",open_opts$[16]="OTA"
	open_tables$[17]="SFT_OPNLSTRN",open_opts$[17]="OTA"
	open_tables$[18]="IVM_ITEMWHSE",open_opts$[18]="OTA"
	open_tables$[19]="SFE_WOSCHDL",open_opts$[19]="OTA"
	open_tables$[20]="SFE_WOMATDTL",open_opts$[20]="OTA"

	gosub open_tables

	sfs_params=num(open_chans$[2])
	dim sfs_params$:open_tpls$[2]
	read record (sfs_params,key=firm_id$+"SF00",dom=std_missing_params) sfs_params$

	gls_params=num(open_chans$[12])
	call stbl("+DIR_PGM")+"adc_perioddates.aon",gls_params,num(sfs_params.current_per$),num(sfs_params.current_year$),beg_date$,end_date$,status
	callpoint!.setDevObject("gl_end_date",end_date$)

	bm$=sfs_params.bm_interface$
	op$=sfs_params.ar_interface$
	po$=sfs_params.po_interface$
	pr$=sfs_params.pr_interface$

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	if bm$<>"Y"
		call stbl("+DIR_PGM")+"adc_application.aon","BM",info$[all]
		bm$=info$[20]
		open_tables$[1]="SFC_OPRTNCOD",open_opts$[1]="OTA"
	else
		open_tables$[1]="BMC_OPCODES",open_opts$[1]="OTA"
	endif
	callpoint!.setDevObject("bm",bm$)
	x$=stbl("bm",bm$)

	gosub open_tables

	callpoint!.setDevObject("opcode_chan",num(open_chans$[1]))
	callpoint!.setDevObject("opcode_tpl",open_tpls$[1])

	open_tables$[1]="IVS_PARAMS",open_opts$[1]="OTA"

	if op$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","AR",info$[all]
		ar$=info$[20]
		call stbl("+DIR_PGM")+"adc_application.aon","OP",info$[all]
		op$=info$[20]
	endif
	callpoint!.setDevObject("ar",ar$)
	callpoint!.setDevObject("op",op$)

	if po$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","PO",info$[all]
		po$=info$[20]
	endif
	callpoint!.setDevObject("po",po$)
	x$=stbl("po",po$)

	if pr$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","PR",info$[all]
		pr$=info$[20]
	endif
	callpoint!.setDevObject("pr",pr$)
	x$=stbl("pr",pr$)

	call stbl("+DIR_PGM")+"adc_application.aon","MP",info$[all]
	callpoint!.setDevObject("mp",info$[20])
	mp$=info$[20]

rem --- alter control label and prompt for Bill No vs. Item ID depending on whether or not bm$=Y
	
	wctl!=callpoint!.getControl("ITEM_ID")
	wctl_id=wctl!.getID()-1000
	wcontext=num(callpoint!.getTableColumnAttribute("SFE_WOMASTR.ITEM_ID","CTLC"))
	lbl_ctl!=SysGUI!.getWindow(wcontext).getControl(wctl_id)
	if bm$="Y"
		lbl_ctl!.setText(Translate!.getTranslation("AON_BILL_NUMBER:","Bill Number:",1))
		callpoint!.setTableColumnAttribute("SFE_WOMASTR.ITEM_ID","PROM",Translate!.getTranslation("AON_ENTER_BILL_NUMBER","Enter a valid Bill of Materials number",1))
	else
		lbl_ctl!.setText(Translate!.getTranslation("AON_INVENTORY_ITEM_ID:","Inventory Item ID:",1))
		callpoint!.setTableColumnAttribute("SFE_WOMASTR.ITEM_ID","PROM",Translate!.getTranslation("AON_ENTER_INVENTORY_ITEM_ID","Enter a valid Inventory Item ID",1))
	endif
[[SFE_WOMASTR.WO_NO.AVAL]]
rem --- put WO number and loc in DevObject

	callpoint!.setDevObject("wo_no",callpoint!.getUserInput())
	callpoint!.setDevObject("wo_loc",callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION"))
[[SFE_WOMASTR.OPENED_DATE.AVAL]]
rem --- need to see if date has been changed; if so, prompt to change in sfe-02/22/23 as well

	prev_dt$=cvs(callpoint!.getColumnUndoData("SFE_WOMASTR.OPENED_DATE"),3)
	new_dt$=callpoint!.getUserInput()
	if prev_dt$<>"" and prev_dt$<>new_dt$
		msg_id$="SF_CHANGE_DTS"
		gosub disp_message

		if msg_opt$="Y"
			sfe02_dev=fnget_dev("SFE_WOOPRTN")
			sfe22_dev=fnget_dev("SFE_WOMATL")
			sfe23_dev=fnget_dev("SFE_WOMATDTL")

			dim sfe_wooprtn$:fnget_tpl$("SFE_WOOPRTN")
			dim sfe_womatl$:fnget_tpl$("SFE_WOMATL")
			dim sfe_womatdtl$:fnget_tpl$("SFE_WOMATDTL")

			wo_loc$=callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION")
			wo_no$=callpoint!.getColumnData("SFE_WOMASTR.WO_NO")

			rem --- operations requirements - 6500 in sfe_ab
			read (sfe02_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
			while 1
				k$=key(sfe02_dev,end=*break)
				readrecord(sfe02_dev)sfe_wooprtn$
				if sfe_wooprtn.firm_id$+sfe_wooprtn.wo_location$+sfe_wooprtn.wo_no$<>firm_id$+wo_loc$+wo_no$ then break
				sfe_wooprtn.require_date$=new_dt$
				sfe_wooprtn$=field(sfe_wooprtn$)
				writerecord(sfe02_dev)sfe_wooprtn$
			wend
	
			rem --- materials requirements - 6600 in sfe_ab
			read (sfe22_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
			while 1
				k$=key(sfe22_dev,end=*break)
				readrecord(sfe22_dev)sfe_womatl$
				if sfe_womatl.firm_id$+sfe_womatl.wo_location$+sfe_womatl.wo_no$<>firm_id$+wo_loc$+wo_no$ then break
				sfe_womatl.require_date$=new_dt$
				sfe_womatl$=field(sfe_womatl$)
				writerecord(sfe22_dev)sfe_womatl$
			wend

			rem --- materials commitments - 6800 in sfe_ab
			read (sfe23_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
			while 1
				k$=key(sfe23_dev,end=*break)
				readrecord(sfe23_dev)sfe_womatdtl$
				if sfe_womatdtl.firm_id$+sfe_womatdtl.wo_location$+sfe_womatdtl.wo_no$<>firm_id$+wo_loc$+wo_no$ then break
				sfe_womatdtl.require_date$=new_dt$
				sfe_womatdtl$=field(sfe_womatdtl$)
				writerecord(sfe23_dev)sfe_womatdtl$
			wend

		endif
	endif
[[SFE_WOMASTR.ADIS]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","N")
	callpoint!.setDevObject("wo_status",callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS"))
	callpoint!.setDevObject("wo_category",callpoint!.getColumnData("SFE_WOMASTR.WO_CATEGORY"))
	callpoint!.setDevObject("wo_no",callpoint!.getColumnData("SFE_WOMASTR.WO_NO"))
	callpoint!.setDevObject("wo_loc",callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION"))

rem --- Disable/enable based on status of closed/open

	if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")="C"
		callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.BILL_REV",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.CUSTOMER_ID",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_REV",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.EST_YIELD",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.FORECAST",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.OP_INT_SEQ_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.OPENED_DATE",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.PRIORITY",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.SCH_PROD_QTY",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.UNIT_MEASURE",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WAREHOUSE_ID",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_TYPE",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",0)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.BILL_REV",1)
		if callpoint!.getDevObject("ar")="Y"
			callpoint!.setColumnEnabled("SFE_WOMASTR.CUSTOMER_ID",1)
		endif
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_NO",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_REV",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.EST_YIELD",1)
		if callpoint!.getDevObject("mp")="Y"
			callpoint!.setColumnEnabled("SFE_WOMASTR.FORECAST",1)
		endif
		callpoint!.setColumnEnabled("SFE_WOMASTR.OPENED_DATE",1)
		if callpoint!.getDevObject("op")="Y"			
			callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",1)
			callpoint!.setColumnEnabled("SFE_WOMASTR.OP_INT_SEQ_NO",1)
		endif
		callpoint!.setColumnEnabled("SFE_WOMASTR.PRIORITY",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.SCH_PROD_QTY",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.UNIT_MEASURE",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WAREHOUSE_ID",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_TYPE",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",1)
	endif

rem --- Disable Options (buttons) for a Closed Work Order

	if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")="C"
		callpoint!.setOptionEnabled("SCHD",0)
		callpoint!.setOptionEnabled("RELS",0)
	else
		callpoint!.setOptionEnabled("SCHD",1)
		callpoint!.setOptionEnabled("RELS",1)
	endif

rem --- Always disable these fields for an existing record

	callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",0)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",0)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",0)
	callpoint!.setOptionEnabled("COPY",0)

rem --- See if any transactions exist - disable WO Type if so

	loc$=callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION")
	wo_no$=callpoint!.getColumnData("SFE_WOMASTR.WO_NO")
	trans$="N"
	chan_dev=fnget_dev("SFT_OPNMATTR")
	dim chan_rec$:fnget_tpl$("SFT_OPNMATTR")
	read (chan_dev,key=firm_id$+loc$+wo_no$,dom=*next)
	while 1
		read record (chan_dev,end=*break) chan_rec$
		if chan_rec.firm_id$<>firm_id$ or
:			chan_rec.wo_location$<>loc$ or
:			chan_rec.wo_no$<>wo_no$ break
		tran$="Y"
		break
	wend

	if tran$="N"
		chan_dev=fnget_dev("SFT_OPNOPRTR")
		dim chan_rec$:fnget_tpl$("SFT_OPNOPRTR")
		read (chan_dev,key=firm_id$+loc$+wo_no$,dom=*next)
		while 1
			read record (chan_dev,end=*break) chan_rec$
			if chan_rec.firm_id$<>firm_id$ or
:				chan_rec.wo_location$<>loc$ or
:				chan_rec.wo_no$<>wo_no$ break
			tran$="Y"
			break
		wend
	endif

	if tran$="N"
		chan_dev=fnget_dev("SFT_OPNSUBTR")
		dim chan_rec$:fnget_tpl$("SFT_OPNSUBTR")
		read (chan_dev,key=firm_id$+loc$+wo_no$,dom=*next)
		while 1
			read record (chan_dev,end=*break) chan_rec$
			if chan_rec.firm_id$<>firm_id$ or
:				chan_rec.wo_location$<>loc$ or
:				chan_rec.wo_no$<>wo_no$ break
			tran$="Y"
			break
		wend
	endif

	if tran$="Y"
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_TYPE",0)
	endif

rem --- Disable WO Status if Open or Closed

	status$=callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")
	if pos(status$="OC")=0
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",1)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",0)
	endif

rem --- Validate Open Sales Order

	order$=callpoint!.getColumnData("SFE_WOMASTR.ORDER_NO")
	cust$=callpoint!.getColumnData("SFE_WOMASTR.CUSTOMER_ID")
	dim ope_ordhdr$:fnget_tpl$("OPE_ORDHDR")
	gosub build_ord_line

rem --- Disable qty/yield if data exists in sfe_womatl (sfe-22)

	if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")<>"C" and callpoint!.getColumnData("SFE_WOMASTR.WO_CATEGORY")="I"

		sfe_womatl_dev=fnget_dev("SFE_WOMATL")
		dim sfe_womatl$:fnget_tpl$("SFE_WOMATL")

		read (sfe_womatl_dev,key=firm_id$+loc$+wo_no$,dom=*next)
		while 1
			read record (sfe_womatl_dev,end=*break)sfe_womatl$
			if sfe_womatl$.firm_id$+sfe_womatl.wo_location$+sfe_womatl.wo_no$=firm_id$+loc$+wo_no$
				callpoint!.setColumnEnabled("SFE_WOMASTR.SCH_PROD_QTY",0)
				callpoint!.setColumnEnabled("SFE_WOMASTR.EST_YIELD",0)
				rem - this gets to be annoying - callpoint!.setMessage("SF_MATS_EXIST")
			endif
			break
		wend
	endif

rem --- set DevObjects

	callpoint!.setDevObject("prod_qty",callpoint!.getColumnData("SFE_WOMASTR.SCH_PROD_QTY"))
	callpoint!.setDevObject("wo_est_yield",callpoint!.getColumnData("SFE_WOMASTR.EST_YIELD"))
[[SFE_WOMASTR.EST_YIELD.AVAL]]
rem --- Set DevObject

	callpoint!.setDevObject("wo_est_yield",callpoint!.getUserInput())

rem --- Informational warning for category N WO's - requirements may need to be adjusted if qty/yield is changed

	if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")<>"C" and callpoint!.getColumnData("SFE_WOMASTR.WO_CATEGORY")="N"
		if callpoint!.getRecordMode()="C" and callpoint!.getColumnUndoData("SFE_WOMASTR.EST_YIELD")<>callpoint!.getUserInput()
			callpoint!.setMessage("SF_ADJ_REQS")
		endif
	endif
[[SFE_WOMASTR.AOPT-COPY]]
rem --- Copy from other Work Order

rem --- Check to make sure there aren't existing requirements

	woe02_dev=fnget_dev("SFE_WOOPRTN")
	woe22_dev=fnget_dev("SFE_WOMATL")
	woe32_dev=fnget_dev("SFE_WOSUBCNT")

	wo_loc$=callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION")
	wo_no$=callpoint!.getColumnData("SFE_WOMASTR.WO_NO")

	found_reqs=0

	read(woe02_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
	while 1
		k$=key(woe02_dev,end=*break)
		if pos(firm_id$+wo_loc$+wo_no$=k$)=0 break
		found_reqs=1
		break
	wend

	read(woe22_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
	while 1
		k$=key(woe22_dev,end=*break)
		if pos(firm_id$+wo_loc$+wo_no$=k$)=0 break
		found_reqs=1
		break
	wend

	read(woe32_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
	while 1
		k$=key(woe32_dev,end=*break)
		if pos(firm_id$+wo_loc$+wo_no$=k$)=0 break
		found_reqs=1
		break
	wend

	if found_reqs=1
		msg_id$="REQS_EXIST"
		gosub disp_message
		break
	endif

rem --- Check for mandatory data

	if callpoint!.getDevObject("wo_category")<>"N" or
:		num(callpoint!.getColumnData("SFE_WOMASTR.EST_YIELD"))=0 or
:		cvs(callpoint!.getColumnData("SFE_WOMASTR.OPENED_DATE"),3)="" or
:		num(callpoint!.getColumnData("SFE_WOMASTR.SCH_PROD_QTY"))=0 or
:		cvs(callpoint!.getColumnData("SFE_WOMASTR.UNIT_MEASURE"),3)="" or
:		cvs(callpoint!.getColumnData("SFE_WOMASTR.WAREHOUSE_ID"),3)="" or
:		pos(callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")="QP")=0 
		
		msg_id$="SF_MISSING_INFO"
		gosub disp_message
		break
	endif
	
rem --- Copy the Work Order

	callpoint!.setDevObject("category",callpoint!.getColumnData("SFE_WOMASTR.WO_CATEGORY"))
	callpoint!.setDevObject("wo_loc",callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION"))
	callpoint!.setDevObject("wo_no",callpoint!.getColumnData("SFE_WOMASTR.WO_NO"))

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"SFE_WOCOPY",
:		stbl("+USER_ID"),
:		"MNT",
:		"",
:		table_chans$[all],
:		"",
:		dflt_data$[all]

	callpoint!.setStatus("SAVE")
[[SFE_WOMASTR.SCH_PROD_QTY.AVAL]]
rem --- Verify minimum quantity > 0

	if num(callpoint!.getUserInput())<=0
		msg_id$="IV_QTY_GT_ZERO"
		gosub disp_message
		callpoint!.setColumnData("SFE_WOMASTR.SCH_PROD_QTY",callpoint!.getColumnData("SFE_WOMASTR.SCH_PROD_QTY"),1)
		callpoint!.setStatus("ABORT")
	endif

rem --- Enable Copy Button

	if callpoint!.getColumnData("SFE_WOMASTR.WO_CATEGORY")="N" and num(callpoint!.getUserInput())>0
		callpoint!.setOptionEnabled("COPY",1)
	endif

	callpoint!.setDevObject("prod_qty",callpoint!.getUserInput())

rem --- Informational warning for category N WO's - requirements may need to be adjusted if qty/yield is changed

	if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")<>"C" and callpoint!.getColumnData("SFE_WOMASTR.WO_CATEGORY")="N"
		if callpoint!.getRecordMode()="C" and callpoint!.getColumnUndoData("SFE_WOMASTR.SCH_PROD_QTY")<>callpoint!.getUserInput()
			callpoint!.setMessage("SF_ADJ_REQS")
		endif
	endif
[[SFE_WOMASTR.AOPT-CSTS]]
rem --- Display Cost Summary

	callpoint!.setDevObject("wo_status",callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS"))
	callpoint!.setDevObject("closed_date",callpoint!.getColumnData("SFE_WOMASTR.CLOSED_DATE"))

	run stbl("+DIR_PGM")+"sfe_costsumm.aon"
[[SFE_WOMASTR.AOPT-TRNS]]
rem --- Work Order Transaction History report

	callpoint!.setDevObject("closed_date",callpoint!.getColumnData("SFE_WOMASTR.CLOSED_DATE"))

	dim dflt_data$[5,1]
	dflt_data$[1,0]="WO_NO"
	dflt_data$[1,1]=callpoint!.getColumnData("SFE_WOMASTR.WO_NO")
	dflt_data$[2,0]="WO_STATUS"
	dflt_data$[2,1]=callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")
	dflt_data$[3,0]="CLOSED_DATE"
	dflt_data$[3,1]=callpoint!.getColumnData("SFE_WOMASTR.CLOSED_DATE")
	dflt_data$[4,0]="GL_END_DATE"
	dflt_data$[4,1]=callpoint!.getDevObject("gl_end_date")
	dflt_data$[5,0]="WO_LOCATION"
	dflt_data$[5,1]=callpoint!.getColumnData("SFE_WOMASTR.WO_LOCATION")

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"SFE_TRANSHIST",
:		stbl("+USER_ID"),
:		"MNT",
:		"",
:		table_chans$[all],
:		"",
:		dflt_data$[all]
[[SFE_WOMASTR.AOPT-JOBS]]
rem --- Display Job Status

	callpoint!.setDevObject("wo_status",callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS"))
	callpoint!.setDevObject("closed_date",callpoint!.getColumnData("SFE_WOMASTR.CLOSED_DATE"))

	run stbl("+DIR_PGM")+"sfe_jobstat.aon"
[[SFE_WOMASTR.AOPT-RELS]]
rem --- Schedule the Work Order

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"SFE_RELEASEWO",
:		stbl("+USER_ID"),
:		"MNT",
:		"",
:		table_chans$[all],
:		"",
:		dflt_data$[all]
[[SFE_WOMASTR.AOPT-SCHD]]
rem --- Schedule the Work Order

	callpoint!.setDevObject("order_no",callpoint!.getColumnData("SFE_WOMASTR.ORDER_NO"))

	dim dflt_data$[3,1]
	dflt_data$[1,0]="SCHED_FLAG"
	dflt_data$[1,1]=callpoint!.getColumnData("SFE_WOMASTR.SCHED_FLAG")
	dflt_data$[2,0]="ESTSTT_DATE"
	dflt_data$[2,1]=callpoint!.getColumnData("SFE_WOMASTR.ESTSTT_DATE")
	dflt_data$[3,0]="ESTCMP_DATE"
	dflt_data$[3,1]=callpoint!.getColumnData("SFE_WOMASTR.ESTCMP_DATE")
	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"SFR_SCHEDWO",
:		stbl("+USER_ID"),
:		"MNT",
:		"",
:		table_chans$[all],
:		"",
:		dflt_data$[all]

	start_date$=callpoint!.getDevObject("start_date")
	comp_date$=callpoint!.getDevObject("comp_date")
	sched_method$=callpoint!.getDevObject("sched_method")
	callpoint!.setColumnData("SFE_WOMASTR.ESTSTT_DATE",start_date$,1)
	callpoint!.setColumnData("SFE_WOMASTR.ESTCMP_DATE",comp_date$,1)
	callpoint!.setColumnData("SFE_WOMASTR.SCHED_FLAG",sched_method$,1)
	callpoint!.setStatus("MODIFIED")
[[SFE_WOMASTR.ORDER_NO.AVAL]]
rem --- Validate Open Sales Order

	if callpoint!.getUserInput()<>callpoint!.getColumnData("SFE_WOMASTR.ORDER_NO")
		callpoint!.setColumnData("SFE_WOMASTR.SLS_ORD_SEQ_REF","",1)
	endif

	ope_ordhdr=fnget_dev("OPE_ORDHDR")
	dim ope_ordhdr$:fnget_tpl$("OPE_ORDHDR")
	cust$=callpoint!.getColumnData("SFE_WOMASTR.CUSTOMER_ID")
	order$=callpoint!.getUserInput()
	found_ord$="N"
	while 1
		read (ope_ordhdr,key=firm_id$+ope_ordhdr.ar_type$+cust$+order$,dom=*break)
		found_ord$="Y"
		break
	wend

	if found_ord$="N"
		msg_id$="SF_INVALID_SO_ORD"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

	gosub build_ord_line
[[SFE_WOMASTR.CUSTOMER_ID.AVAL]]
rem --- Disable Order info if Customer not entered

	if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")<>"C"
		if cvs(callpoint!.getUserInput(),3)=""
			callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",0)
			callpoint!.setColumnEnabled("SFE_WOMASTR.SLS_ORD_SEQ_REF",0)
			callpoint!.setColumnData("SFE_WOMASTR.ORDER_NO","",1)
			callpoint!.setColumnData("SFE_WOMASTR.SLS_ORD_SEQ_REF","",1)
		else
			callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",1)
			callpoint!.setColumnEnabled("SFE_WOMASTR.SLS_ORD_SEQ_REF",1)
		endif

		if callpoint!.getUserInput()<>callpoint!.getColumnData("SFE_WOMASTR.CUSTOMER_ID")
			callpoint!.setColumnData("SFE_WOMASTR.ORDER_NO","",1)
			callpoint!.setColumnData("SFE_WOMASTR.SLS_ORD_SEQ_REF","",1)
		endif
	endif
[[SFE_WOMASTR.ITEM_ID.AVAL]]
rem --- Set default values

	if callpoint!.getDevObject("bm")="Y"
		bmm_billmast=fnget_dev("BMM_BILLMAST")
		dim bmm_billmast$:fnget_tpl$("BMM_BILLMAST")
		while 1
			found_bill$="N"
			read record (bmm_billmast,key=firm_id$+callpoint!.getUserInput(),dom=*break) bmm_billmast$
			found_bill$="Y"
			break
		wend
		if found_bill$="N"
			msg_id$="SF_NO_BILL"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
		callpoint!.setColumnData("SFE_WOMASTR.DRAWING_NO",bmm_billmast.drawing_no$,1)
		callpoint!.setColumnData("SFE_WOMASTR.DRAWING_REV",bmm_billmast.drawing_rev$,1)
		callpoint!.setColumnData("SFE_WOMASTR.EST_YIELD",bmm_billmast.est_yield$,1)
		callpoint!.setColumnData("SFE_WOMASTR.SCH_PROD_QTY",bmm_billmast.std_lot_size$,1)
		callpoint!.setColumnData("SFE_WOMASTR.UNIT_MEASURE",bmm_billmast.unit_measure$,1)
		callpoint!.setColumnData("SFE_WOMASTR.BILL_REV",bmm_billmast.bill_rev$,1)
	endif
[[SFE_WOMASTR.WO_STATUS.AVAL]]
rem --- Only allow changes to status if P or Q

	status$=callpoint!.getUserInput()
	old_status$=callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")
	if pos(status$="PQ")=0
		callpoint!.setUserInput(old_status$)
	endif
[[SFE_WOMASTR.WO_TYPE.AVAL]]
rem --- Only allow change to Type if it's the same Category

	typecode_dev=fnget_dev("SFC_WOTYPECD")
	dim typecode$:fnget_tpl$("SFC_WOTYPECD")

	cat$=callpoint!.getColumnData("SFE_WOMASTR.WO_CATEGORY")
	new_type$=callpoint!.getUserInput()
	readrecord(typecode_dev,key=firm_id$+"A"+new_type$)typecode$
	if callpoint!.getDevObject("new_rec")="N"
		if cvs(cat$,3)<>"" and cat$<>typecode.wo_category$
			msg_id$="WO_NO_CAT_CHG"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
	endif

rem --- If new order, check for type of Work Order and disable Item or Descriptions

	if callpoint!.getDevObject("new_rec")="Y"
		callpoint!.setColumnData("SFE_WOMASTR.WO_CATEGORY",typecode.wo_category$,1)
		callpoint!.setDevObject("wo_category",typecode.wo_category$)
	endif

	if typecode.wo_category$<>"I"
		callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",0)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",0)
	endif

rem --- Enable Copy Button

	if typecode.wo_category$="N" and num(callpoint!.getColumnData("SFE_WOMASTR.SCH_PROD_QTY"))>0
		callpoint!.setOptionEnabled("COPY",1)
	else
		callpoint!.setOptionEnabled("COPY",0)
	endif

rem --- Disable Drawing and Revision Number if Recurring type

	if typecode.wo_category$="R"
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_REV",0)
	endif
[[SFE_WOMASTR.AWRI]]
rem --- Set new_rec to N

	callpoint!.setDevObject("new_rec","N")
[[SFE_WOMASTR.<CUSTOM>]]
rem =========================================================
build_ord_line:
rem 	cust$		input
rem	order_no$	input
rem	validate_ord$	input
rem =========================================================

rem --- Build Sequence list button

	ope11_dev=fnget_dev("OPE_ORDDET")
	dim ope11a$:fnget_tpl$("OPE_ORDDET")
	opc_linecode=fnget_dev("OPC_LINECODE")
	dim opc_linecode$:fnget_tpl$("OPC_LINECODE")
	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm01a$:fnget_tpl$("IVM_ITEMMAST")

	ops_lines!=SysGUI!.makeVector()
	ops_items!=SysGUI!.makeVector()
	ops_list!=SysGUI!.makeVector()
	ops_lines!.addItem("000000000000")
	ops_items!.addItem("")
	ops_list!.addItem("")

	ctlSeqRef!=callpoint!.getControl("SFE_WOMASTR.SLS_ORD_SEQ_REF")
	ctlSeqRef!.removeAllItems()

	read(ope11_dev,key=firm_id$+ope_ordhdr.ar_type$+cust$+order$,dom=*next)
	while 1
		read record (ope11_dev,end=*break) ope11a$
		if pos(firm_id$+ope_ordhdr.ar_type$+cust$+order$=ope11a$)<>1 break
		dim opc_linecode$:fattr(opc_linecode$)
		read record (opc_linecode,key=firm_id$+ope11a.line_code$,dom=*next)opc_linecode$
		if pos(opc_linecode.line_type$="SP")=0 continue
		dim ivm01a$:fattr(ivm01a$)
		read record (ivm01_dev,key=firm_id$+ope11a.item_id$,dom=*next)ivm01a$
		ops_lines!.addItem(ope11a.internal_seq_no$)
		ops_items!.addItem(ope11a.item_id$)
		ops_list!.addItem(cvs(ope11a.item_id$,3)+" - "+ivm01a.item_desc$)
	wend

	if ops_lines!.size()>0
		ldat$=""
		for x=0 to ops_lines!.size()-1
			ldat$=ldat$+ops_items!.getItem(x)+"~"+ops_lines!.getItem(x)+";"
		next x
	endif

	ctlSeqRef!.insertItems(0,ops_list!)
	callpoint!.setTableColumnAttribute("SFE_WOMASTR.SLS_ORD_SEQ_REF","LDAT",ldat$)
	callpoint!.setStatus("REFRESH")

	return

#include std_missing_params.src
[[SFE_WOMASTR.AREC]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")
	callpoint!.setDevObject("wo_status","")
	callpoint!.setDevObject("wo_no","")
	callpoint!.setDevObject("wo_loc","")

rem --- Disable Additional Options

	callpoint!.setOptionEnabled("SCHD",0)
	callpoint!.setOptionEnabled("RELS",0)
	callpoint!.setOptionEnabled("COPY",0)

rem --- set defaults

	ivs01_dev=fnget_dev("IVS_PARAMS")
	dim ivs01$:fnget_tpl$("IVS_PARAMS")
	read record (ivs01_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs01$
	callpoint!.setDevObject("default_wh",ivs01.warehouse_id$)
	callpoint!.setColumnData("SFE_WOMASTR.WAREHOUSE_ID",ivs01.warehouse_id$)
	callpoint!.setColumnData("SFE_WOMASTR.OPENED_DATE",stbl("+SYSTEM_DATE"))
	callpoint!.setColumnData("SFE_WOMASTR.ESTSTT_DATE",stbl("+SYSTEM_DATE"))
	callpoint!.setDevObject("prod_qty","0")
	callpoint!.setDevObject("wo_est_yield","0")

rem --- enable all enterable fields

	callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.BILL_REV",1)
	if callpoint!.getDevObject("ar")="Y"
		callpoint!.setColumnEnabled("SFE_WOMASTR.CUSTOMER_ID",1)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.CUSTOMER_ID",0)
	endif
	callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_NO",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_REV",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.EST_YIELD",1)
	if callpoint!.getDevObject("mp")="Y"
		callpoint!.setColumnEnabled("SFE_WOMASTR.FORECAST",1)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.FORECAST",0)
	endif
	if callpoint!.getDevObject("op")="Y"
		callpoint!.setColumnEnabled("SFE_WOMASTR.SLS_ORD_SEQ_REF",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",1)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.SLS_ORD_SEQ_REF",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",0)
	endif
	callpoint!.setColumnEnabled("SFE_WOMASTR.OPENED_DATE",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.PRIORITY",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.SCH_PROD_QTY",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.UNIT_MEASURE",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.WAREHOUSE_ID",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.WO_TYPE",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",1)
[[SFE_WOMASTR.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::option_entry"
