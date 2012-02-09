[[SFE_WOSUBCNT.AREC]]
rem --- Check for PO Installed

	if callpoint!.getDevObject("po")<>"Y"
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_LINE_NO",-1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_NO",-1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.LEAD_TIME",-1)
	endif
[[SFE_WOSUBCNT.BGDR]]
rem --- Check for PO Installed

	if callpoint!.getDevObject("po")<>"Y"
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_LINE_NO",-1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_NO",-1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.LEAD_TIME",-1)
	endif
[[SFE_WOSUBCNT.UNITS.AVAL]]
rem --- Calc numbers

	units=num(callpoint!.getUserInput())
	rate=num(callpoint!.getColumnData("SFE_WOSUBCNT.RATE"))
	gosub calc_totals
[[SFE_WOSUBCNT.RATE.AVAL]]
rem --- Calc numbers

	units=num(callpoint!.getColumnData("SFE_WOSUBCNT.UNITS"))
	rate=num(callpoint!.getUserInput())
	gosub calc_totals
[[SFE_WOSUBCNT.<CUSTOM>]]
rem ========================================================
calc_totals:
rem rate:		input
rem units:	input
rem ========================================================

	prod_qty=num(callpoint!.getDevObject("prod_qty"))
	
	callpoint!.setColumnData("SFE_WOSUBCNT.UNIT_COST",str(units*rate),1)
	callpoint!.setColumnData("SFE_WOSUBCNT.TOTAL_UNITS",str(units*prod_qty),1)
	callpoint!.setColumnData("SFE_WOSUBCNT.TOTAL_COST",str(units*rate*prod_qty),1)

	return
[[SFE_WOSUBCNT.BSHO]]
rem --- Disable grid if Closed Work Order or Recurring

	if callpoint!.getDevObject("wo_status")="C" or callpoint!.getDevObject("wo_category")="R"
		opts$=callpoint!.getTableAttribute("OPTS")
		callpoint!.setTableAttribute("OPTS",opts$+"BID")

		x$=callpoint!.getTableColumns()
		for x=1 to len(x$) step 40
			opts$=callpoint!.getTableColumnAttribute(cvs(x$(x,40),2),"OPTS")
			callpoint!.setTableColumnAttribute(cvs(x$(x,40),2),"OPTS",o$+"C"); rem - makes cells read only
		next x
	endif

rem --- fill listbox for use with Op Sequence

	sfe02_dev=fnget_dev("SFE_WOOPRTN")
	dim sfe02a$:fnget_tpl$("SFE_WOOPRTN")
	bmm08_dev=fnget_dev("BMC_OPCODES")
	dim bmm08a$:fnget_tpl$("BMC_OPCODES")
	bill_no$=callpoint!.getDevObject("master_bill")

	ops_lines!=SysGUI!.makeVector()
	ops_items!=SysGUI!.makeVector()
	ops_list!=SysGUI!.makeVector()
	ops_lines!.addItem("000000000000")
	ops_items!.addItem("")
	ops_list!.addItem("")

	read(sfe02_dev,key=firm_id$+bill_no$,dom=*next)
	while 1
		read record (sfe02_dev,end=*break) sfe02a$
		if pos(firm_id$+bill_no$=sfe02a$)<>1 break
		if sfe02a.line_type$<>"S" continue
		dim bmm08a$:fattr(bmm08a$)
		read record (bmm08_dev,key=firm_id$+sfe02a.op_code$,dom=*next)bmm08a$
		ops_lines!.addItem(sfe02a.internal_seq_no$)
		ops_items!.addItem(sfe02a.op_code$)
		ops_list!.addItem(sfe02a.op_code$+" - "+bmm08a.code_desc$)
	wend

	if ops_lines!.size()>0
		ldat$=""
		for x=0 to ops_lines!.size()-1
			ldat$=ldat$+ops_items!.getItem(x)+"~"+ops_lines!.getItem(x)+";"
		next x
	endif

	callpoint!.setTableColumnAttribute("SFE_WOSUBCNT.OP_INT_SEQ_REF","LDAT",ldat$)
	my_grid!=Form!.getControl(5000)
	ListColumn=5
	my_control!=my_grid!.getColumnListControl(ListColumn)
	my_control!.removeAllItems()
	my_control!.insertItems(0,ops_list!)
	my_grid!.setColumnListControl(ListColumn,my_control!)
