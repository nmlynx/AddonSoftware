[[BMM_BILLMAT.OP_INT_SEQ_REF.AINP]]
	ops_lines!=SysGUI!.makeVector()
	ops_items!=SysGUI!.makeVector()
	ops_list!=SysGUI!.makeVector()

	ops_lines!=callpoint!.getDevObject("ops_lines")
	ops_items!=callpoint!.getDevObject("ops_items")
	ops_list!=callpoint!.getDevObject("ops_list")
[[BMM_BILLMAT.OBSOLT_DATE.AVAL]]
rem --- Check for valid dates

	eff_date$=callpoint!.getColumnData("BMM_BILLMAT.EFFECT_DATE")
	obs_date$=callpoint!.getUserInput()
	gosub check_dates
[[BMM_BILLMAT.EFFECT_DATE.AVAL]]
rem --- Check for valid dates

	eff_date$=callpoint!.getUserInput()
	obs_date$=callpoint!.getColumnData("BMM_BILLMAT.OBSOLT_DATE")
	gosub check_dates
[[BMM_BILLMAT.AGRE]]
rem --- Display Net Quantity

	qty_req=num(callpoint!.getColumnData("BMM_BILLMAT.QTY_REQUIRED"))
	alt_fact=num(callpoint!.getColumnData("BMM_BILLMAT.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLMAT.DIVISOR"))
	scrap_fact=num(callpoint!.getColumnData("BMM_BILLMAT.SCRAP_FACTOR"))
	gosub calc_net
	item$=callpoint!.getColumnData("BMM_BILLMAT.ITEM_ID")
	gosub check_sub
[[BMM_BILLMAT.BGDR]]
rem --- Display Net Quantity

	qty_req=num(callpoint!.getColumnData("BMM_BILLMAT.QTY_REQUIRED"))
	alt_fact=num(callpoint!.getColumnData("BMM_BILLMAT.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLMAT.DIVISOR"))
	scrap_fact=num(callpoint!.getColumnData("BMM_BILLMAT.SCRAP_FACTOR"))
	gosub calc_net
	item$=callpoint!.getColumnData("BMM_BILLMAT.ITEM_ID")
	gosub check_sub
[[BMM_BILLMAT.ITEM_ID.AVAL]]
rem --- Component must not be the same as the Master Bill

	item$=callpoint!.getUserInput()
	if item$ = callpoint!.getColumnData("BMM_BILLMAT.BILL_NO")
		msg_id$="BM_BAD_COMP_ITEM"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Check to see if item is a Sub Bill

	gosub check_sub

rem --- Set defaults for new record

	if callpoint!.getGridRowNewStatus(callpoint!.getValidationRow())="Y"
		callpoint!.setColumnData("BMM_BILLMAT.ALT_FACTOR","1")
		callpoint!.setColumnData("BMM_BILLMAT.DIVISOR","1")
		item_dev=fnget_dev("IVM_ITEMMAST")
		dim item_tpl$:fnget_tpl$("IVM_ITEMMAST")
		readrecord(item_dev,key=firm_id$+item$)item_tpl$
		callpoint!.setColumnData("BMM_BILLMAT.UNIT_MEASURE",item_tpl.unit_of_sale$)
		callpoint!.setStatus("REFRESH")
	endif
[[BMM_BILLMAT.SCRAP_FACTOR.AVAL]]
rem --- Display Net Quantity

	qty_req=num(callpoint!.getColumnData("BMM_BILLMAT.QTY_REQUIRED"))
	alt_fact=num(callpoint!.getColumnData("BMM_BILLMAT.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLMAT.DIVISOR"))
	scrap_fact=num(callpoint!.getUserInput())
	gosub calc_net
[[BMM_BILLMAT.DIVISOR.AVAL]]
rem --- Display Net Quantity

	qty_req=num(callpoint!.getColumnData("BMM_BILLMAT.QTY_REQUIRED"))
	alt_fact=num(callpoint!.getColumnData("BMM_BILLMAT.ALT_FACTOR"))
	divisor=num(callpoint!.getUserInput())
	scrap_fact=num(callpoint!.getColumnData("BMM_BILLMAT.SCRAP_FACTOR"))
	gosub calc_net
[[BMM_BILLMAT.ALT_FACTOR.AVAL]]
rem --- Display Net Quantity

	qty_req=num(callpoint!.getColumnData("BMM_BILLMAT.QTY_REQUIRED"))
	alt_fact=num(callpoint!.getUserInput())
	divisor=num(callpoint!.getColumnData("BMM_BILLMAT.DIVISOR"))
	scrap_fact=num(callpoint!.getColumnData("BMM_BILLMAT.SCRAP_FACTOR"))
	gosub calc_net
[[BMM_BILLMAT.QTY_REQUIRED.AVAL]]
rem --- Display Net Quantity

	qty_req=num(callpoint!.getUserInput())
	alt_fact=num(callpoint!.getColumnData("BMM_BILLMAT.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLMAT.DIVISOR"))
	scrap_fact=num(callpoint!.getColumnData("BMM_BILLMAT.SCRAP_FACTOR"))
	gosub calc_net
[[BMM_BILLMAT.<CUSTOM>]]
rem ===================================================================
calc_net:
rem --- qty_req:		input
rem --- alt_fact:			input
rem --- divisor:			input
rem --- scrap_fact:		input
rem ===================================================================

	yield_pct=callpoint!.getDevObject("yield")
	net_qty=BmUtils.netQuantityRequired(qty_req,alt_fact,divisor,yield_pct,scrap_fact)
	callpoint!.setColumnData("<<DISPLAY>>.NET_REQD",str(net_qty))
	return

rem ===================================================================
check_sub:
rem --- item$:			input
rem ===================================================================

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="BMM_BILLMAST",open_opts$[1]="OTAN[2_]"
	gosub open_tables
	sub_bill$=""
	while 1
		find (num(open_chans$[1]),key=firm_id$+item$,dom=*break)
		sub_bill$="*"
		break
	wend
	open_opts$[1]="CX[2_]"
	gosub open_tables
	callpoint!.setColumnData("<<DISPLAY>>.SUB_BILL",sub_bill$,1)

	return

rem ===================================================================
check_dates:
rem eff_date$	input
rem obs_date$	input
rem ===================================================================

	if cvs(obs_date$,3)<>""
		if obs_date$<=eff_date$
			msg_id$="BM_EFF_OBS"
			gosub disp_message
			callpoint!.setStatus("ABORT")
		endif
	endif

	return
[[BMM_BILLMAT.BSHO]]
rem --- Setup java class for Derived Data Element

	use ::bmo_BmUtils.aon::BmUtils
	declare BmUtils bmUtils!

rem --- Open files for later use

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVM_ITEMMAST",open_opts$[1]="OTAN[2_]"
	gosub open_tables

rem --- fill listbox for use with Op Sequence

	bmm03_dev=fnget_dev("BMM_BILLOPER")
	dim bmm03a$:fnget_tpl$("BMM_BILLOPER")
	bmm08_dev=fnget_dev("BMC_OPCODES")
	dim bmm08a$:fnget_tpl$("BMC_OPCODES")
	bill_no$=callpoint!.getDevObject("master_bill")

	ops_lines!=SysGUI!.makeVector()
	ops_items!=SysGUI!.makeVector()
	ops_list!=SysGUI!.makeVector()
rem	ops_lines!.addItem("")
rem	ops_items!.addItem("")
rem	ops_list!.addItem("")

	read(bmm03_dev,key=firm_id$+bill_no$,dom=*next)
	while 1
		read record (bmm03_dev,end=*break) bmm03a$
		if pos(firm_id$+bill_no$=bmm03a$)<>1 break
		if bmm03a.line_type$<>"S" continue
		dim bmm08a$:fattr(bmm08a$)
		read record (bmm08_dev,key=firm_id$+bmm03a.op_code$,dom=*next)bmm08a$
		ops_lines!.addItem(bmm03a.internal_seq_no$)
		ops_items!.addItem(bmm03a.op_code$)
		ops_list!.addItem(bmm03a.op_code$+" - "+bmm08a.code_desc$)
	wend

	if ops_lines!.size()>0
		ldat$=""
		for x=0 to ops_lines!.size()-1
			ldat$=ldat$+ops_items!.getItem(x)+"~"+ops_lines!.getItem(x)+";"
		next x
	endif

	callpoint!.setTableColumnAttribute("BMM_BILLMAT.OP_INT_SEQ_REF","LDAT",ldat$)
	my_grid!=Form!.getControl(5000)
	ListColumn=5
	my_control!=my_grid!.getColumnListControl(ListColumn)
	my_control!.removeAllItems()
	my_control!.insertItems(0,ops_list!)
	my_grid!.setColumnListControl(ListColumn,my_control!)

	callpoint!.setDevObject("ops_lines",ops_lines!)
	callpoint!.setDevObject("ops_items",ops_items!)
	callpoint!.setDevObject("ops_list",ops_list!)
[[BMM_BILLMAT.ITEM_ID.AINV]]
rem --- Check for item synonyms

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::option_entry"
