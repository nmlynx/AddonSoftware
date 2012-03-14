[[SFE_WOMATL.SCRAP_FACTOR.AVAL]]
rem --- Calc Totals

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getUserInput())
	gosub calculate_totals
[[SFE_WOMATL.ALT_FACTOR.AVAL]]
rem --- Calc Totals

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getUserInput())
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.QTY_REQUIRED.AVAL]]
rem --- Verify minimum quantity > 0

	if num(callpoint!.getUserInput())<=0
		msg_id$="IV_QTY_GT_ZERO"
		gosub disp_message
		callpoint!.setColumnData("SFE_WOMATL.QTY_REQUIRED",callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"),1)
		callpoint!.setStatus("ABORT")
	endif

rem --- Calc Totals

	qty_required=num(callpoint!.getUserInput())
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.DIVISOR.AVAL]]
rem --- Calc Totals

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getUserInput())
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.<CUSTOM>]]
rem ========================================================
calculate_totals:
rem ========================================================

	wo_est_yield=num(callpoint!.getDevObject("wo_est_yield"))	
	prod_qty=num(callpoint!.getDevObject("prod_qty"))

	units=SfUtils.matQtyWorkOrd(qty_required,alt_factor,divisor,scrap_factor,wo_est_yield)

	callpoint!.setColumnData("SFE_WOMATL.UNITS",str(units),1)
	callpoint!.setColumnData("SFE_WOMATL.UNIT_COST",str(units*scrap_factor),1)
	callpoint!.setColumnData("SFE_WOMATL.TOTAL_UNITS",str(prod_qty*units),1)
	callpoint!.setColumnData("SFE_WOMATL.TOTAL_COST",str(prod_qty*units*scrap_factor),1)
rem	precision 2
rem	callpoint!.setColumnData("SFE_WOMATL.TOTAL_COST",str(W[3]*1; rem jpb callpoint!.setColumnData("SFE_WOMATL.TOTAL_COST" is w(3)
rem	precision IVS01_PRECISION

	return
[[SFE_WOMATL.ITEM_ID.AVAL]]
rem --- Set default Unit Cost

	ivm02_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm02a$:fnget_tpl$("IVM_ITEMWHSE")
	whse_id$=callpoint!.getDevObject("default_wh")

	read record (ivm02_dev,key=firm_id$+whse_id$+callpoint!.getUserInput()) ivm02a$

	callpoint!.setColumnData("SFE_WOMATL.UNIT_COST",str(ivm02a.unit_cost))

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.BSHO]]
use ::sfo_SfUtils.aon::SfUtils
declare SfUtils sfUtils!

rem --- Disable grid if Closed Work Order or Recurring
	
	if callpoint!.getDevObject("wo_status")="C" or 
:		callpoint!.getDevObject("wo_category")="R" or
:		(callpoint!.getDevObject("wo_category")="I" and callpoint!.getDevObject("bm")="Y")
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
	op_code=callpoint!.getDevObject("opcode_chan")
	dim op_code$:callpoint!.getDevObject("opcode_tpl")
	wo_no$=callpoint!.getDevObject("wo_no")
	wo_loc$=callpoint!.getDevObject("wo_loc")

	ops_lines!=SysGUI!.makeVector()
	ops_items!=SysGUI!.makeVector()
	ops_list!=SysGUI!.makeVector()
	ops_lines!.addItem("000000000000")
	ops_items!.addItem("")
	ops_list!.addItem("")

	read(sfe02_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
	while 1
		read record (sfe02_dev,end=*break) sfe02a$
		if pos(firm_id$+wo_loc$+wo_no$=sfe02a$)<>1 break
		if sfe02a.line_type$<>"S" continue
		dim op_code$:fattr(op_code$)
		read record (op_code,key=firm_id$+sfe02a.op_code$,dom=*next)op_code$
		ops_lines!.addItem(sfe02a.internal_seq_no$)
		ops_items!.addItem(sfe02a.op_code$)
		ops_list!.addItem(sfe02a.op_code$+" - "+op_code.code_desc$)
	wend

	if ops_lines!.size()>0
		ldat$=""
		for x=0 to ops_lines!.size()-1
			ldat$=ldat$+ops_items!.getItem(x)+"~"+ops_lines!.getItem(x)+";"
		next x
	endif

	callpoint!.setTableColumnAttribute("SFE_WOMATL.OPER_SEQ_REF","LDAT",ldat$)
	col_hdr$=callpoint!.getTableColumnAttribute("SFE_WOMATL.OPER_SEQ_REF","LABS")
	my_grid!=Form!.getControl(5000)
	num_grid_cols=my_grid!.getNumColumns()
	ListColumn=-1
	for xwk=0 to num_grid_cols-1
		if my_grid!.getColumnHeaderCellText(xwk)=col_hdr$ then ListColumn=xwk
	next xwk
	if ListColumn>=0
		my_control!=my_grid!.getColumnListControl(ListColumn)
		my_control!.removeAllItems()
		my_control!.insertItems(0,ops_list!)
		my_grid!.setColumnListControl(ListColumn,my_control!)
	endif
[[SFE_WOMATL.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::grid_entry"
