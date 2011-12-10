[[SFE_WOMASTR.ORDER_NO.AVAL]]
rem --- Validate Open Sales Order

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
		ops_list!.addItem(ope11a.item_id$+" - "+ivm01a.item_desc$)
	wend

	if ops_lines!.size()>0
		ldat$=""
		for x=0 to ops_lines!.size()-1
			ldat$=ldat$+ops_items!.getItem(x)+"~"+ops_lines!.getItem(x)+";"
		next x
	endif

	callpoint!.setTableColumnAttribute("SFE_WOMASTR.OP_INT_SEQ_REF","LDAT",ldat$)

rem	my_grid!=Form!.getControl(5000)
rem	ListColumn=5
rem	my_control!=my_grid!.getColumnListControl(ListColumn)
rem	my_control!.removeAllItems()
rem	my_control!.insertItems(0,ops_list!)
rem	my_grid!.setColumnListControl(ListColumn,my_control!)
[[SFE_WOMASTR.CUSTOMER_ID.AVAL]]
rem --- Disable Order info if Customer not entered

	dim dctl$[2],dmap$[2]
	dctl$[1]="SFE_WOMASTR.ORDER_NO"
	dctl$[2]="SFE_WOMASTR.LINE_NO"
	looper=2
	for x=1 to 2
		if cvs(callpoint!.getUserInput(),3)=""
			dmap$[x]="I"
		else
			dmap$[x]=""
		endif
	next x
	gosub disable_ctls
	if cvs(callpoint!.getUserInput(),3)=""
		callpoint!.setColumnData("SFE_WOMASTR.ORDER_NO","",1)
		callpoint!.setColumnData("SFE_WOMASTR.LINE_NO","",1)
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
		dim dctl$[1],dmap$[1]
		dctl$[1]="SFE_WOMASTR.ITEM_ID"
		looper=1
		for x=1 to looper
			dmap$[x]="I"
		next x
		gosub disable_ctls
	else
		dim dctl$[2],dmap$[2]
		dctl$[1]="SFE_WOMASTR.DESCRIPTION_01"
		dctl$[2]="SFE_WOMASTR.DESCRIPTION_02"
		looper=2
		for x=1 to looper
			dmap$[x]="I"
		next x
		gosub disable_ctls
	endif

rem --- Disable Drawing and Revision Number if Recurring type

	if typecode.wo_category$="R"
		dim dctl$[2],dmap$[2]
		dctl$[1]="SFE_WOMASTR.DRAWING_NO"
		dctl$[2]="SFE_WOMASTR.DRAWING_REV"
		looper=2
		dmap$[1]="I"
		dmap$[2]="I"
		gosub disable_ctls
	endif
[[SFE_WOMASTR.AWRI]]
rem --- Set new_rec to N

	callpoint!.setDevObject("new_rec","N")
[[SFE_WOMASTR.<CUSTOM>]]
disable_ctls:rem --- disable selected control
	for dctl=1 to looper
		dctl$=dctl$[dctl]
		if dctl$<>""
			wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
			wmap$=callpoint!.getAbleMap()
			wpos=pos(wctl$=wmap$,8)
			wmap$(wpos+6,1)=dmap$[dctl]
			callpoint!.setAbleMap(wmap$)
			callpoint!.setStatus("ABLEMAP")
		endif
	next dctl

	return

#include std_missing_params.src
[[SFE_WOMASTR.ARAR]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","N")
	callpoint!.setDevObject("wo_status",callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS"))

rem --- Disable fields not allowed to be changed

	dim dctl$[18],dmap$[18]
	dctl$[1]="SFE_WOMASTR.ITEM_ID"
	dctl$[2]="SFE_WOMASTR.BILL_REV"
	if callpoint!.getDevObject("op")="Y"
		dctl$[3]="SFE_WOMASTR.CUSTOMER_ID"
	endif
	dctl$[4]="SFE_WOMASTR.DESCRIPTION_01"
	dctl$[5]="SFE_WOMASTR.DESCRIPTION_02"
	dctl$[6]="SFE_WOMASTR.DRAWING_NO"
	dctl$[7]="SFE_WOMASTR.DRAWING_REV"
	dctl$[8]="SFE_WOMASTR.EST_YIELD"
	dctl$[9]="SFE_WOMASTR.FORECAST"
	if callpoint!.getDevObject("op")="Y"
		dctl$[10]="SFE_WOMASTR.LINE_NO"
		dctl$[11]="SFE_WOMASTR.ORDER_NO"
	endif
	dctl$[12]="SFE_WOMASTR.PRIORITY"
	dctl$[13]="SFE_WOMASTR.SCH_PROD_QTY"
	dctl$[14]="SFE_WOMASTR.UNIT_MEASURE"
	dctl$[15]="SFE_WOMASTR.WAREHOUSE_ID"
	dctl$[16]="SFE_WOMASTR.WO_NO"
	dctl$[17]="SFE_WOMASTR.WO_TYPE"
	dctl$[18]="SFE_WOMASTR.WO_STATUS"
	looper=18
	for x=1 to looper
		if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")="C"
			dmap$[x]="I"
		else
			dmap$[x]=""
		endif
	next x
	gosub disable_ctls

rem --- Always disable these fields for an existing record

	dim dctl$[3],dmap$[3]
	dctl$[1]="SFE_WOMASTR.ITEM_ID"
	dctl$[2]="SFE_WOMASTR.DESCRIPTION_01"
	dctl$[3]="SFE_WOMASTR.DESCRIPTION_02"
	looper=3
	for x=1 to looper
		dmap$[x]="I"
	next x
	gosub disable_ctls

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
		dim dctl$[1],dmap$[1]
		dctl$[1]="SFE_WOMASTR.WO_TYPE"
		looper=1
		dmap$[1]="I"
		gosub disable_ctls
	endif

rem --- Disable WO Status if Open or Closed"

	status$=callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")
	if pos(status$="OC")=0
		dim dctl$[1],dmap$[1]
		dctl$[1]="SFE_WOMASTR.WO_STATUS"
		looper=1
		dmap$[1]=""
		gosub disable_ctls
	endif
[[SFE_WOMASTR.AREC]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")
	callpoint!.setDevObject("wo_status","")

rem --- set defaults

	ivs01_dev=fnget_dev("IVS_PARAMS")
	dim ivs01$:fnget_tpl$("IVS_PARAMS")
	read record (ivs01_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs01$
	callpoint!.setColumnData("SFE_WOMASTR.WAREHOUSE_ID",ivs01.warehouse_id$)
	callpoint!.setColumnData("SFE_WOMASTR.OPENED_DATE",stbl("+SYSTEM_DATE"))
	callpoint!.setColumnData("SFE_WOMASTR.ESTSTT_DATE",stbl("+SYSTEM_DATE"))

rem --- enable all enterable fields

	dim dctl$[18],dmap$[18]
	dctl$[1]="SFE_WOMASTR.ITEM_ID"
	dctl$[2]="SFE_WOMASTR.BILL_REV"
	dctl$[3]="SFE_WOMASTR.CUSTOMER_ID"
	dctl$[4]="SFE_WOMASTR.DESCRIPTION_01"
	dctl$[5]="SFE_WOMASTR.DESCRIPTION_02"
	dctl$[6]="SFE_WOMASTR.DRAWING_NO"
	dctl$[7]="SFE_WOMASTR.DRAWING_REV"
	dctl$[8]="SFE_WOMASTR.EST_YIELD"
	dctl$[9]="SFE_WOMASTR.FORECAST"
	dctl$[10]="SFE_WOMASTR.LINE_NO"
	dctl$[11]="SFE_WOMASTR.ORDER_NO"
	dctl$[12]="SFE_WOMASTR.PRIORITY"
	dctl$[13]="SFE_WOMASTR.SCH_PROD_QTY"
	dctl$[14]="SFE_WOMASTR.UNIT_MEASURE"
	dctl$[15]="SFE_WOMASTR.WAREHOUSE_ID"
	dctl$[16]="SFE_WOMASTR.WO_NO"
	dctl$[17]="SFE_WOMASTR.WO_TYPE"
	dctl$[18]="SFE_WOMASTR.WO_STATUS"
	looper=18
	gosub disable_ctls
[[SFE_WOMASTR.BSHO]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")

rem --- Open tables

	num_files=11
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
	gosub open_tables

	sfs_params=num(open_chans$[2])
	dim sfs_params$:open_tpls$[2]
	read record (sfs_params,key=firm_id$+"SF00",dom=std_missing_params) sfs_params$

	bm$=sfs_params.bm_interface$
	op$=sfs_params.ar_interface$
	po$=sfs_params.po_interface$
	pr$=sfs_params.pr_interface$

	if bm$<>"Y"
		call stbl("+DIR_PGM")+"adc_application.aon","BM",info$[all]
		bm$=info$[20]
	endif
	callpoint!.setDevObject("bm",bm$)

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

	call stbl("+DIR_PGM")+"adc_application.aon","MP",info$[all]
	callpoint!.setDevObject("mp",info$[20])

rem --- Disable Customer info if AR not installed

	if op$<>"Y"
		dim dctl$[3],dmap$[3]
		dctl$[1]="SFE_WOMASTR.CUSTOMER_ID"
		dctl$[2]="SFE_WOMASTR.ORDER_NO"
		dctl$[3]="SFE_WOMASTR.LINE_NO"
		looper=3
		for x=1 to 3
			dmap$[x]="I"
		next x
		gosub disable_ctls
	endif
[[SFE_WOMASTR.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::option_entry"
