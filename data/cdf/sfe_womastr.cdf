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

	callpoint!.setDevObject("wo_no",callpoint!.getColumnData("SFE_WOMASTR.WO_NO"))
	callpoint!.setDevObject("wo_status",callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS"))
	callpoint!.setDevObject("closed_date",callpoint!.getColumnData("SFE_WOMASTR.CLOSED_DATE"))

	run stbl("+DIR_PGM")+"sfe_jobstat.aon"
[[SFE_WOMASTR.AOPT-RELS]]
rem --- Schedule the Work Order

	callpoint!.setDevObject("wo_no",callpoint!.getColumnData("SFE_WOMASTR.WO_NO"))

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

	callpoint!.setDevObject("wo_no",callpoint!.getColumnData("SFE_WOMASTR.WO_NO"))
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
	callpoint!.setColumnData("SFE_WOMASTR.ESTSTT_DATE",start_date$,1)
	callpoint!.setColumnData("SFE_WOMASTR.ESTCMP_DATE",comp_date$,1)
[[SFE_WOMASTR.ORDER_NO.AVAL]]
rem --- Validate Open Sales Order

	if callpoint!.getUserInput()<>callpoint!.getColumnData("SFE_WOMASTR.ORDER_NO")
		callpoint!.setColumnData("SFE_WOMASTR.OP_INT_SEQ_REF","",1)
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
			callpoint!.setColumnEnabled("SFE_WOMASTR.LINE_NO",0)
			callpoint!.setColumnData("SFE_WOMASTR.ORDER_NO","",1)
			callpoint!.setColumnData("SFE_WOMASTR.LINE_NO","",1)
		else
			callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",1)
			callpoint!.setColumnEnabled("SFE_WOMASTR.LINE_NO",1)
		endif

		if callpoint!.getUserInput()<>callpoint!.getColumnData("SFE_WOMASTR.CUSTOMER_ID")
			callpoint!.setColumnData("SFE_WOMASTR.ORDER_NO","",1)
			callpoint!.setColumnData("SFE_WOMASTR.OP_INT_SEQ_REF","",1)
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
	endif
	if typecode.wo_category$<>"I"
		callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",0)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",0)
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

	ctlSeqRef!=callpoint!.getControl("SFE_WOMASTR.OP_INT_SEQ_REF")
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
	callpoint!.setTableColumnAttribute("SFE_WOMASTR.OP_INT_SEQ_REF","LDAT",ldat$)
	callpoint!.setStatus("REFRESH")

	return

#include std_missing_params.src
[[SFE_WOMASTR.ARAR]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","N")
	callpoint!.setDevObject("wo_status",callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS"))

rem --- Disable fields not allowed to be changed

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
		callpoint!.setColumnEnabled("SFE_WOMASTR.LINE_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.OP_INT_SEQ_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.PRIORITY",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.SCH_PROD_QTY",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.UNIT_MEASURE",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WAREHOUSE_ID",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_TYPE",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",0)
	else
		callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.BILL_REV",1)
		if callpoint!.getDevObject("op")="Y"
			callpoint!.setColumnEnabled("SFE_WOMASTR.CUSTOMER_ID",1)
		endif
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_NO",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_REV",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.EST_YIELD",1)
		callpoint!.setColumnEnabled("SFE_WOMASTR.FORECAST",1)
		if callpoint!.getDevObject("op")="Y"
			callpoint!.setColumnEnabled("SFE_WOMASTR.LINE_NO",1)
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

rem --- See if any transactions exist - disable WO Type if there are

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

rem --- Disable WO Status if Open or Closed"

	status$=callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")
	if pos(status$="OC")=0
		callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",1)
	endif

rem --- Validate Open Sales Order

	order$=callpoint!.getColumnData("SFE_WOMASTR.ORDER_NO")
	cust$=callpoint!.getColumnData("SFE_WOMASTR.CUSTOMER_ID")
	dim ope_ordhdr$:fnget_tpl$("OPE_ORDHDR")
	gosub build_ord_line
[[SFE_WOMASTR.AREC]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")
	callpoint!.setDevObject("wo_status","")

rem --- Disable Additional Options

	callpoint!.setOptionEnabled("SCHD",0)
	callpoint!.setOptionEnabled("RELS",0)

rem --- set defaults

	ivs01_dev=fnget_dev("IVS_PARAMS")
	dim ivs01$:fnget_tpl$("IVS_PARAMS")
	read record (ivs01_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs01$
	callpoint!.setColumnData("SFE_WOMASTR.WAREHOUSE_ID",ivs01.warehouse_id$)
	callpoint!.setColumnData("SFE_WOMASTR.OPENED_DATE",stbl("+SYSTEM_DATE"))
	callpoint!.setColumnData("SFE_WOMASTR.ESTSTT_DATE",stbl("+SYSTEM_DATE"))

rem --- enable all enterable fields

	callpoint!.setColumnEnabled("SFE_WOMASTR.ITEM_ID",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.BILL_REV",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.CUSTOMER_ID",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_01",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DESCRIPTION_02",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_NO",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.DRAWING_REV",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.EST_YIELD",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.FORECAST",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.LINE_NO",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.PRIORITY",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.SCH_PROD_QTY",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.UNIT_MEASURE",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.WAREHOUSE_ID",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.WO_TYPE",1)
	callpoint!.setColumnEnabled("SFE_WOMASTR.WO_STATUS",1)
[[SFE_WOMASTR.BSHO]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")

rem --- Open tables

	num_files=17
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

	if op$<>"Y"
		call stbl("+DIR_PGM")+"adc_application.aon","AR",info$[all]
		op$=info$[20]
	endif
	callpoint!.setDevObject("op",op$)

	if po$<>"Y"
		call stbl("+DIR_PGM")+"adc_application.aon","PO",info$[all]
		po$=info$[20]
	endif
	callpoint!.setDevObject("po",po$)

	if pr$<>"Y"
		call stbl("+DIR_PGM")+"adc_application.aon","PR",info$[all]
		pr$=info$[20]
	endif
	callpoint!.setDevObject("pr",pr$)
	x$=stbl("pr",pr$)

	call stbl("+DIR_PGM")+"adc_application.aon","MP",info$[all]
	callpoint!.setDevObject("mp",info$[20])

rem --- Disable Customer info if AR not installed

	if op$<>"Y"
		callpoint!.setColumnEnabled("SFE_WOMASTR.CUSTOMER_ID",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.ORDER_NO",0)
		callpoint!.setColumnEnabled("SFE_WOMASTR.LINE_NO",0)
	endif
[[SFE_WOMASTR.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::option_entry"
