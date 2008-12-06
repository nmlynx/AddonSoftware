[[OPE_ORDLSDET.LOTSER_NO.BINP]]
rem --- call the lot lookup window and set default lot, lot location, lot comment and qty
rem --- save current row/column so we'll know where to set focus when we return from lot lookup

rem jpb grid! = Form!.getChildWindow(1109).getControl(5900)
rem jpb return_to_row = grid!.getSelectedRow()
rem jpb return_to_col = grid!.getSelectedColumn()

rem --- Set data for the lookup form
wh$=callpoint!.getDevObject("wh")
item$=callpoint!.getDevObject("item")
lsdet_dev=num(callpoint!.getDevObject("lsdet_dev"))
dim lsdet_tpl$:callpoint!.getDevObject("lsdet_tpl")

dim dflt_data$[3,1]
dflt_data$[1,0] = "ITEM_ID"
dflt_data$[1,1] = item$
dflt_data$[2,0] = "WAREHOUSE_ID"
dflt_data$[2,1] = wh$
dflt_data$[3,0] = "LOTS_TO_DISP"
dflt_data$[3,1] = "O"; rem --- default to open lots

rem --- Call the lookup form
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "IVC_LOTLOOKUP",
:                       stbl("+USER_ID"),
:                       "",
:                       "",
:                       table_chans$[all],
:                       "",
:                       dflt_data$[all]

rem --- Set the detail grid to the data selected in the lookup
if callpoint!.getDevObject("selected_lot")<>null()
	callpoint!.setColumnData( "OPE_ORDLSDET.LOTSER_NO",   str(callpoint!.getDevObject("selected_lot")) )
	user_tpl.lot_avail = num( callpoint!.getDevObject("selected_lot_avail") )
	callpoint!.setColumnData( "IVE_TRANSDET.TRANS_QTY", str(user_tpl.lot_avail) )
	callpoint!.setStatus("REFGRID")
endif
[[OPE_ORDLSDET.LOTSER_NO.AVAL]]
rem --- validate open lot number
escape
	wh$=callpoint!.getDevObject("wh")
	item$=callpoint!.getDevObject("item")
	lsdet_dev=num(callpoint!.getDevObject("lsdet_dev"))
	dim lsdet_tpl$:callpoint!.getDevObject("lsdet_tpl")
escape;rem aval
	readrecord(lsdet_dev,key=firm_id$+wh$+item$+callpoint!.getUserInput(),knum=3)lsdet_tpl$
	if lsdet_tpl.closed_flag$<>"Y"
		escape
	endif
[[OPE_ORDLSDET.LOTSER_NO.AINQ]]
escape; rem ainq
