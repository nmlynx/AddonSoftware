[[BMM_BILLSUB.ALT_FACTOR.AVAL]]
rem --- Display Net Qty and Total Cost

	qty_req=num(callpoint!.getColumnData("BMM_BILLSUB.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getUserInput())
	divisor=num(callpoint!.getColumnData("BMM_BILLSUB.DIVISOR"))
	unit_cost=num(callpoint!.getColumnData("BMM_BILLSUB.UNIT_COST"))
	gosub calc_display
[[BMM_BILLSUB.UNIT_COST.AVAL]]
rem --- Display Net Qty and Total Cost

	qty_req=num(callpoint!.getColumnData("BMM_BILLSUB.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("BMM_BILLSUB.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLSUB.DIVISOR"))
	unit_cost=num(callpoint!.getUserInput())
	gosub calc_display
[[BMM_BILLSUB.QTY_REQUIRED.AVAL]]
rem --- Display Net Qty and Total Cost

	qty_req=num(callpoint!.getUserInput())
	alt_factor=num(callpoint!.getColumnData("BMM_BILLSUB.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLSUB.DIVISOR"))
	unit_cost=num(callpoint!.getColumnData("BMM_BILLSUB.UNIT_COST"))
	gosub calc_display
[[BMM_BILLSUB.DIVISOR.AVAL]]
rem --- Display Net Qty and Total Cost

	qty_req=num(callpoint!.getColumnData("BMM_BILLSUB.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("BMM_BILLSUB.ALT_FACTOR"))
	divisor=num(callpoint!.getUserInput())
	unit_cost=num(callpoint!.getColumnData("BMM_BILLSUB.UNIT_COST"))
	gosub calc_display
[[BMM_BILLSUB.<CUSTOM>]]
rem ===================================================================
calc_display:
rem --- qty_req:		input
rem --- alt_factor:		input
rem --- divisor:			input
rem --- unit_cost:		input
rem ===================================================================

	net_qty=BmUtils.netSubQtyReq(qty_req,alt_factor,divisor)
	total_cost=net_qty*unit_cost

	callpoint!.setColumnData("<<DISPLAY>>.NET_QTY",str(net_qty))
	callpoint!.setColumnData("<<DISPLAY>>.TOTAL_COST",str(total_cost))

	return
[[BMM_BILLSUB.BGDR]]
rem --- Display Net Qty and Total Cost

	qty_req=num(callpoint!.getColumnData("BMM_BILLSUB.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("BMM_BILLSUB.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("BMM_BILLSUB.DIVISOR"))
	unit_cost=num(callpoint!.getColumnData("BMM_BILLSUB.UNIT_COST"))
	gosub calc_display
[[BMM_BILLSUB.BSHO]]
	use ::bmo_BmUtils.aon::BmUtils
	declare BmUtils bmUtils!

rem --- Only show form if A/P is installed

	if callpoint!.getDevObject("ap_installed") <> "Y"
		callpoint!.setMessage("AP_NOT_INST")
		callpoint!.setStatus("EXIT")
	endif
