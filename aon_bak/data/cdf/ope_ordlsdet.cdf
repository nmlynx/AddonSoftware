[[OPE_ORDLSDET.AGRE]]
rem --- Check if Serial and validate quantity

	qty_shipped = num(callpoint!.getColumnData("OPE_ORDLSDET.QTY_SHIPPED"))
	qty_ordered = num(callpoint!.getColumnData("OPE_ORDLSDET.QTY_ORDERED"))

	gosub valid_quantities
	if aborted then break; rem --- exit callpoint

rem --- Now check for Sales Line quantity

	line_qty = num(callpoint!.getDevObject("ord_qty"))
	lot_qty  = qty_ordered

	gosub check_avail
[[OPE_ORDLSDET.BEND]]
rem --- Check total quantity from all lines against ordered quantity

	lot_qty=0
	dim gridrec$:fattr(rec_data$)
	numrecs=GridVect!.size()

	if numrecs>0 then 
		for reccnt=0 to numrecs-1
			gridrec$=GridVect!.getItem(reccnt)

			if cvs(gridrec$,3) <> "" and callpoint!.getGridRowDeleteStatus(reccnt) <> "Y" then 
				lot_qty = lot_qty + gridrec.qty_ordered
			endif
		next reccnt
	endif

rem --- Warn that selected lot/serial#'s does not match order qty

	if lot_qty <> num(callpoint!.getDevObject("ord_qty")) then 
		msg_id$ = "OP_LOT_QTY_UNEQUAL"
		dim msg_tokens$[3]
		msg_tokens$[1] = str(lot_qty)

		if callpoint!.getDevObject("lotser_flag") = "L" then 
			msg_tokens$[2] = "Lot numbers"
		else
			msg_tokens$[2] = "Serial numbers"
		endif

		msg_tokens$[3] = str(callpoint!.getDevObject("ord_qty"))
		gosub disp_message
		if msg_opt$ = "N" then callpoint!.setStatus("ABORT")
	endif
[[OPE_ORDLSDET.<CUSTOM>]]
rem ==========================================================================
check_avail: rem --- Check for available quantity
             rem      IN: line_qty 
	          rem          lot_qty 
rem ==========================================================================

	wh$     = callpoint!.getDevObject("wh")
	item$   = callpoint!.getDevObject("item")
	ls_no$  = callpoint!.getColumnData("OPE_ORDLSDET.LOTSER_NO")

	lsmast_dev = num(callpoint!.getDevObject("lsmast_dev"))
	dim lsmast_tpl$:callpoint!.getDevObject("lsmast_tpl")
	start_block = 1

	if start_block then
		read record(lsmast_dev, key=firm_id$+wh$+item$+ls_no$, dom=*endif) lsmast_tpl$

		if lot_qty >= 0 and lot_qty > lsmast_tpl.qty_on_hand - lsmast_tpl.qty_commit
			dim msg_tokens$[1]
			msg_tokens$[1] = str(lsmast_tpl.qty_on_hand - lsmast_tpl.qty_commit)
			msg_id$ = "IV_QTY_OVER_AVAIL"
			gosub disp_message
			callpoint!.setStatus("ABORT")
		endif
	endif

return

rem ==========================================================================
valid_quantities: rem --- Validate Quantities
                  rem       IN: qty_shipped
                  rem           qty_ordered
                  rem      OUT: aborted - true/false
rem ==========================================================================

	aborted = 0

rem --- Serial numbers can only have a quantity of 1 or -1

	if callpoint!.getDevObject("lotser_flag") = "S" and abs(qty_shipped) <> 1 then 
		msg_id$ = "IV_SERIAL_ONE"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		aborted = 1
	else

	rem --- Ship Qty must be <= Order Qty

		if abs(qty_ordered) < abs(qty_shipped) then 
			msg_id$ = "SHIP_EXCEEDS_ORD"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			aborted = 1
		endif

	endif

return
[[OPE_ORDLSDET.BSHO]]
rem --- Set Lot/Serial button up properly

	switch pos(callpoint!.getDevObject("lotser_flag")="LS")
		case 1; callpoint!.setOptionText("LLOK","Lot Lookup"); break
		case 2; callpoint!.setOptionText("LLOK","Serial Lookup"); break
		case default; callpoint!.setOptionEnabled("LLOK",0); break
	swend
[[OPE_ORDLSDET.AOPT-LLOK]]
	rem jpb grid! = Form!.getChildWindow(1109).getControl(5900)

rem --- Set data for the lookup form

	wh$ = callpoint!.getDevObject("wh")
	item$ = callpoint!.getDevObject("item")
	lsmast_dev = num(callpoint!.getDevObject("lsmast_dev"))
	dim lsmast_tpl$:callpoint!.getDevObject("lsmast_tpl")

rem --- See if there are any open lots

	read (lsmast_dev, key=firm_id$+wh$+item$+" ", knum=4, dom=*next)
	lsmast_key$=key(lsmast_dev, end=*next)

	if pos(firm_id$+wh$+item$+" " = lsmast_key$) = 1 then 
		dim dflt_data$[3,1]
		dflt_data$[1,0] = "ITEM_ID"
		dflt_data$[1,1] = item$
		dflt_data$[2,0] = "WAREHOUSE_ID"
		dflt_data$[2,1] = wh$
		dflt_data$[3,0] = "LOTS_TO_DISP"
		dflt_data$[3,1] = "O"; rem --- default to open lots

	rem --- Call the lookup form
	rem      IN: call/enter list
	rem     OUT: DevObject("selected_lot"): The lot/serial# selected for this item
	rem          DevObject("selected_lot_avail"): The amount select for this lot, or 1 for serial#

		call stbl("+DIR_SYP")+"bam_run_prog.bbj","IVC_LOTLOOKUP",stbl("+USER_ID"),"","",table_chans$[all],"",dflt_data$[all]

	rem --- Set the detail grid to the data selected in the lookup

		if callpoint!.getDevObject("selected_lot") <> null() then 
			callpoint!.setColumnData( "OPE_ORDLSDET.LOTSER_NO", str(callpoint!.getDevObject("selected_lot")) )
			lot_avail = num(callpoint!.getDevObject("selected_lot_avail"))
			callpoint!.setColumnData("OPE_ORDLSDET.QTY_ORDERED", str(lot_avail))
			callpoint!.setStatus("MODIFIED;REFRESH")
		endif

	else
		msg_id$="IV_NO_OPENLOTS"
		gosub disp_message
	endif
[[OPE_ORDLSDET.LOTSER_NO.AVAL]]
rem --- Validate open lot number

	wh$    = callpoint!.getDevObject("wh")
	item$  = callpoint!.getDevObject("item")
   ls_no$ = callpoint!.getUserInput()

	lsmast_dev = num(callpoint!.getDevObject("lsmast_dev"))
	dim lsmast_tpl$:callpoint!.getDevObject("lsmast_tpl")

	got_rec$ = "N"
	start_block = 1

	if start_block then
		read record (lsmast_dev, key=firm_id$+wh$+item$+ls_no$, dom=*endif) lsmast_tpl$
		got_rec$ = "Y"
	endif

	if got_rec$ = "N" then
		msg_id$ = "IV_LOT_MUST_EXIST"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	else
		if lsmast_tpl.closed_flag$ = "C" then
			msg_id$ = "IV_SERLOT_CLOSED"
			gosub disp_message
			callpoint!.setStatus("ABORT")
		else
	endif
[[OPE_ORDLSDET.LOTSER_NO.AINQ]]
escape; rem ainq
