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

rem --- Disable grid if Closed Work Order

	if callpoint!.getDevObject("wo_status")="C"
		opts$=callpoint!.getTableAttribute("OPTS")
		callpoint!.setTableAttribute("OPTS",opts$+"BID")

		x$=callpoint!.getTableColumns()
		for x=1 to len(x$) step 40
			opts$=callpoint!.getTableColumnAttribute(cvs(x$(x,40),2),"OPTS")
			callpoint!.setTableColumnAttribute(cvs(x$(x,40),2),"OPTS",o$+"C"); rem - makes cells read only
		next x
	endif
[[SFE_WOMATL.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::grid_entry"
