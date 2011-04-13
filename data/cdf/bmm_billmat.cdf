[[BMM_BILLMAT.AGRN]]
rem --- Display Net Quantity

	qty_req=num(callpoint!.getColumnData("BMM_BILLMAT.QTY_REQUIRED"))
	alt_fact=num(callpoint!.getColumnData("BMM_BILLMAT.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLMAT.DIVISOR"))
	scrap_fact=num(callpoint!.getColumnData("BMM_BILLMAT.SCRAP_FACTOR"))
	gosub calc_net
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
	callpoint!.setColumnData("BMM_BILLMAT.NET_REQUIRED",str(net_qty))
	callpoint!.setStatus("REFRESH")

	return
[[BMM_BILLMAT.BSHO]]
rem --- Setup java class for Derived Data Element

use ::bmo_BmUtils.aon::BmUtils
declare BmUtils bmUtils!
[[BMM_BILLMAT.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::grid_entry"
