[[BMM_BILLMAT.AREC]]
rem --- Default Line Number to something

rem escape
[[BMM_BILLMAT.ITEM_ID.AVAL]]
rem --- Component must not be the same as the Master Bill

	if callpoint!.getUserInput() = callpoint!.getColumnData("BMM_BILLMAT.BILL_NO")
		msg_id$="BM_BAD_COMP_ITEM"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
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

	mask$=callpoint!.getDevObject("unit_mask")
	yield_pct=callpoint!.getDevObject("yield")
	net_qty=BmUtils.netQuantityRequired(qty_req,alt_fact,divisor,yield_pct,scrap_fact)
	callpoint!.setColumnData("BMM_BILLMAT.NET_REQUIRED",str(net_qty:mask$))
	callpoint!.setStatus("REFRESH-SAVE")

	return
[[BMM_BILLMAT.BSHO]]
rem --- Setup java class for Derived Data Element

	use ::bmo_BmUtils.aon::BmUtils
	declare BmUtils bmUtils!

rem --- Set DevObject for Net Quantity mask

	pgmdir$=stbl("+DIR_PGM",err=*next)
	call pgmdir$+"adc_getmask.aon","","IV","U","",m2$,0,m2
	callpoint!.setDevObject("unit_mask",m2$)
[[BMM_BILLMAT.ITEM_ID.AINV]]
rem --- Check for item synonyms

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::option_entry"
