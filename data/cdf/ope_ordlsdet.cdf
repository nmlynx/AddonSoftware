[[OPE_ORDLSDET.AOPT-LLOK]]
rem jpb grid! = Form!.getChildWindow(1109).getControl(5900)

rem --- Set data for the lookup form

wh$=callpoint!.getDevObject("wh")
item$=callpoint!.getDevObject("item")
lsmast_dev=num(callpoint!.getDevObject("lsmast_dev"))
dim lsmast_tpl$:callpoint!.getDevObject("lsmast_tpl")

rem --- See if there are any open lots

read(lsmast_dev,key=firm_id$+wh$+item$+" ",knum=4,dom=*next)
lsmast_key$=key(lsmast_dev,end=*next)
if pos(firm_id$+wh$+item$+" "=lsmast_key$)=1
	dim dflt_data$[3,1]
	dflt_data$[1,0] = "ITEM_ID"
	dflt_data$[1,1] = item$
	dflt_data$[2,0] = "WAREHOUSE_ID"
	dflt_data$[2,1] = wh$
	dflt_data$[3,0] = "LOTS_TO_DISP"
	dflt_data$[3,1] = "O"; rem --- default to open lots

rem --- Call the lookup form
	call stbl("+DIR_SYP")+"bam_run_prog.bbj","IVC_LOTLOOKUP",stbl("+USER_ID"),"","",table_chans$[all],"",dflt_data$[all]

rem --- Set the detail grid to the data selected in the lookup
	if callpoint!.getDevObject("selected_lot")<>null()
		callpoint!.setColumnData( "OPE_ORDLSDET.LOTSER_NO",str(callpoint!.getDevObject("selected_lot")))
		lot_avail = num(callpoint!.getDevObject("selected_lot_avail"))
		callpoint!.setColumnData("OPE_ORDLSDET.QTY_ORDERED",str(lot_avail))
		callpoint!.setStatus("MODIFIED-REFRESH")
	endif
else
	msg_id$="IV_NO_OPENLOTS"
	gosub disp_message
endif
[[OPE_ORDLSDET.QTY_SHIPPED.AVAL]]
rem --- Check if Serial and validate quantity
if callpoint!.getDevObject("lotser_flag")="S"
	if abs(num(callpoint!.getUserInput()))<>1
		msg_id$="IV_SERIAL_ONE"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
endif

rem --- Ship Qty must be <= Order Qty
if abs(num(callpoint!.getColumnData("OPE_ORDLSDET.QTY_ORDERED")))<abs(num(callpoint!.getUserInput()))
	msg_id$="SHIP_EXCEEDS_ORD"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
[[OPE_ORDLSDET.QTY_ORDERED.AVAL]]
rem --- Check if Serial and validate quantity
if callpoint!.getDevObject("lotser_flag")="S"
	if abs(num(callpoint!.getUserInput()))<>1
		msg_id$="IV_SERIAL_ONE"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
endif

rem --- Signs must be the same
if sgn(num(callpoint!.getColumnData("OPE_ORDLSDET.QTY_SHIPPED")))<>sgn(num(callpoint!.getUserInput()))
	msg_id$=""
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif

rem --- Ship Qty must be <= Order Qty
if abs(num(callpoint!.getColumnData("OPE_ORDLSDET.QTY_SHIPPED")))>abs(num(callpoint!.getUserInput()))
	msg_id$="SHIP_EXCEEDS_ORD"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
[[OPE_ORDLSDET.<CUSTOM>]]
rem --- Calculate total quantities and compare to order line
[[OPE_ORDLSDET.LOTSER_NO.BINP]]
rem --- call the lot lookup window and set default lot, lot location, lot comment and qty
rem --- save current row/column so we'll know where to set focus when we return from lot lookup

myrow=callpoint!.getValidationRow()
callpoint!.setDevObject("return_to_row",str(myrow))
[[OPE_ORDLSDET.LOTSER_NO.AVAL]]
rem --- validate open lot number
	wh$=callpoint!.getDevObject("wh")
	item$=callpoint!.getDevObject("item")
	lsmast_dev=num(callpoint!.getDevObject("lsmast_dev"))
	dim lsmast_tpl$:callpoint!.getDevObject("lsmast_tpl")

	readrecord(lsmast_dev,key=firm_id$+wh$+item$+callpoint!.getUserInput())lsmast_tpl$
	if lsmast_tpl.closed_flag$="C"
		msg_id$="IV_SERLOT_CLOSED"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[OPE_ORDLSDET.LOTSER_NO.AINQ]]
escape; rem ainq
