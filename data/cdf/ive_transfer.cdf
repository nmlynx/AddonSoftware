[[IVE_TRANSFER.TRANS_QTY.AVAL]]
rem --- Quantity can only be 1 for serial#'s

	qty = num( callpoint!.getUserInput() )

	if qty > 1 and user_tpl.item_is_serial% then
		callpoint!.setMessage("IV_SER_JUST_ONE")
		callpoint!.setStatus("ABORT")
		goto trans_qty_aval_end
	endif

rem --- Qty can't be more than available

	if qty > user_tpl.avail then
		dim msg_tokens$[0]
		msg_id$ = "IV_QTY_OVER_AVAIL"
		msg_tokens$[0] = str(user_tpl.avail)
		gosub disp_message
		callpoint!.setStatus("ABORT")
		goto trans_qty_aval_end
	endif

rem --- Display extended cost

	gosub display_ext

trans_qty_aval_end:
[[IVE_TRANSFER.AREC]]
rem --- Set defaults

	callpoint!.setColumnData("IVE_TRANSFER.TRANS_QTY","1")
	callpoint!.setStatus("REFRESH:IVE_TRANSFER.TRANS_QTY")
[[IVE_TRANSFER.LOTSER_NO.AVAL]]
rem --- Validate entered lot

	whse$  = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	item$  = callpoint!.getColumnData("IVE_TRANSFER.ITEM_ID")
	ls_no$ = callpoint!.getUserInput()

	ls_file$ = "IVM_LSMASTER"
	dim ls_rec$:fnget_tpl$(ls_file$)

	find record(fnget_dev(ls_file$), key=firm_id$ + whse$ + item$ + ls_no$, dom=lotser_no_aval_not_found) ls_rec$

	callpoint!.setColumnData("IVE_TRANSFER.UNIT_COST", str(ls_rec.unit_cost:user_tpl.cost_mask$))
	callpoint!.setStatus("REFRESH:IVM_ITEMWHSE.UNIT_COST")

	qty = num( callpoint!.getColumnData("IVE_TRANSFER.TRANS_QTY") )
	gosub display_ext

	user_tpl.avail = ls_rec.qty_on_hand - ls_rec.qty_commit

	if user_tpl.avail = 0 then
		callpoint!.setMessage("IV_LOT_NO_AVAIL"); rem IV_NO_AVAIL_ITEM
		callpoint!.setStatus("ABORT")
	endif

	goto lotser_no_aval_exit

lotser_no_aval_not_found:
	callpoint!.setMessage("IV_LOT_MUST_EXIST")
	callpoint!.setStatus("ABORT")

lotser_no_aval_exit:
[[IVE_TRANSFER.LOTSER_NO.BINP]]
rem --- call the lot lookup window and set default lot, lot location, lot comment and qty

	rem --- save current row/column so we'll know where to set focus when we return from lot lookup
	declare BBjStandardGrid grid!
	grid! = util.getGrid(Form!)
	return_to_row = grid!.getSelectedRow()
	return_to_col = grid!.getSelectedColumn()

	rem --- Set data for the lookup form
	item$ = callpoint!.getColumnData("IVE_TRANSFER.ITEM_ID")
	whse$ = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")

	if item$ = "" or whse$ = "" then 
		callpoint!.setMessage("IV_NO_ITEM_WHSE")
		callpoint!.setStatus("ABORT")
		goto lotser_no_binp_exit
	endif

	dim dflt_data$[3,1]
	dflt_data$[1,0] = "ITEM_ID"
	dflt_data$[1,1] = item$
	dflt_data$[2,0] = "WAREHOUSE_ID"
	dflt_data$[2,1] = whse$
	dflt_data$[3,0] = "LOTS_TO_DISP"
	dflt_data$[3,1] = "O"; rem --- Open lots only

	rem --- Call the lookup form

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:	                       "IVC_LOTLOOKUP",
:	                       stbl("+USER_ID"),
:	                       "",
:	                       "",
:	                       table_chans$[all],
:	                       "",
:	                       dflt_data$[all]

	rem --- Set the detail grid to the data selected in the lookup

	if callpoint!.getDevObject("selected_lot") <> null() then
		callpoint!.setColumnData( "IVE_TRANSFER.LOTSER_NO", str(callpoint!.getDevObject("selected_lot"))  )
		user_tpl.avail = num( callpoint!.getDevObject("selected_lot_avail") )
		callpoint!.setStatus("MODIFIED-REFRESH")
		rem callpoint!.setStatus("REFGRID")
	endif

	rem --- return focus to where we were (lot number)
	util.forceEdit(Form!, return_to_row, return_to_col)

lotser_no_binp_exit:
[[IVE_TRANSFER.ITEM_ID.AVAL]]
rem --- Check item against both warehouses, if entered

	from_whse$ = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	to_whse$   = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID_TO")
	item$      = callpoint!.getUserInput()

	if from_whse$ <> "" then
		whse$ = from_whse$
		gosub check_item_whse
		if failed then 
			callpoint!.setStatus("ABORT")
			goto item_id_aval_end
		endif
	endif

	if to_whse$ <> "" then
		whse$ = to_whse$
		gosub check_item_whse
		if failed then 
			callpoint!.setStatus("ABORT")
			goto item_id_aval_end
		endif
	endif

rem --- Is this item lotted or serialised?

	user_tpl.this_item_is_lot_ser% = (user_tpl.ls$="Y" and ivm01a.lotser_item$="Y" and ivm01a.inventoried$="Y")
	user_tpl.item_is_serial% = user_tpl.serialized% and ivm01a.lotser_item$="Y" and ivm01a.inventoried$="Y"

	if user_tpl.this_item_is_lot_ser% then
		util.enableField(callpoint!, "IVE_TRANSFER.LOTSER_NO")
	else
		util.disableField(callpoint!, "IVE_TRANSFER.LOTSER_NO")
		callpoint!.setColumnData("IVE_TRANSFER.LOTSER_NO", "")
		callpoint!.setColumnData("IVM_ITEMMAST.PURCHASE_UM", ivm01a.purchase_um$)
		callpoint!.setColumnData("IVE_TRANSFER.UNIT_COST", str(ivm02a.unit_cost:user_tpl.cost_mask$))
		callpoint!.setStatus("REFRESH")

		qty = num( callpoint!.getColumnData("IVE_TRANSFER.TRANS_QTY") )
		gosub display_ext

		user_tpl.avail = ivm02a.qty_on_hand - ivm02a.qty_commit

		if user_tpl.avail = 0 then
			callpoint!.setMessage("IV_NO_AVAIL_ITEM")
			callpoint!.setStatus("ABORT")
		endif
	endif

item_id_aval_end:
[[IVE_TRANSFER.WAREHOUSE_ID.AVAL]]
rem --- If both warehouses are entered, they can't match

	from_whse$ = callpoint!.getUserInput()
	to_whse$   = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID_TO")

	if from_whse$ <> "" and to_whse$ <> "" and from_whse$ = to_whse$ then
		msg_id$ = "IV_FROM_TO_WHSE_MTCH"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[IVE_TRANSFER.BWRI]]
rem --- Do all data validation here

rem --- Warehouses can't match

	from_whse$ = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	to_whse$   = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID_TO")

	if from_whse$ = to_whse$ then
		msg_id$ = "IV_FROM_TO_WHSE_MTCH"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		goto bwri_end
	endif

rem --- Check item against both warehouses

	item$ = callpoint!.getColumnData("IVE_TRANSFER.ITEM_ID") 

	whse$ = from_whse$
	gosub check_item_whse

	if failed then 
		callpoint!.setStatus("ABORT")
	else
		whse$ = to_whse$
		gosub check_item_whse
		if failed then callpoint!.setStatus("ABORT")
	endif

bwri_end:
[[IVE_TRANSFER.WAREHOUSE_ID_TO.AVAL]]
rem --- If both warehouses are entered, they can't match

	from_whse$ = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	to_whse$   = callpoint!.getUserInput()

	if from_whse$ <> "" and to_whse$ <> "" and from_whse$ = to_whse$ then
		msg_id$ = "IV_FROM_TO_WHSE_MTCH"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[IVE_TRANSFER.BSHO]]
rem --- Inits

	use ::ado_util.src::util

rem --- Open files

	num_files=4
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS",   open_opts$[1]="OTA"
	open_tables$[2]="IVM_ITEMMAST", open_opts$[2]="OTA"
	open_tables$[3]="IVM_ITEMWHSE", open_opts$[3]="OTA"
	open_tables$[4]="IVM_LSMASTER", open_opts$[4]="OTA"	

	gosub open_tables

	ivs01_dev=num(open_chans$[1])
	dim ivs01a$:open_tpls$[1]

rem --- Get parameter records

	find record(ivs01_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs01a$

rem --- Exit if not multi-warehouse

	if ivs01a.multi_whse$ <> "Y" then
		msg_id$ = "IV_NOT_MULTI_WHSE"
		gosub disp_message
		callpoint!.setStatus("EXIT")
		goto bsho_exit
	endif

rem --- Setup user template 

	user_tpl_str$ = "ls:c(1),lf:c(1),gl:c(1),pgmdir:c(1*),cost_mask:c(1*),amount_mask:c(1*),avail:n(1*),"
	user_tpl_str$ = user_tpl_str$ + "this_item_is_lot_ser:u(1),serialized:u(1),item_is_serial:u(1)"
	dim user_tpl$:user_tpl_str$

	user_tpl.pgmdir$      = stbl("+DIR_PGM",err=*next)
	user_tpl.cost_mask$   = ivs01a.cost_mask$
	user_tpl.amount_mask$ = ivs01a.amount_mask$

rem --- Set IV flags

	user_tpl.ls$ = iff( pos(ivs01a.lotser_flag$ = "LS"), "Y", "N" )
	user_tpl.lf$ = iff( pos(ivs01a.lifofifo$    = "LF"), "Y", "N" )

	if ivs01a.lotser_flag$="S" then user_tpl.serialized%=1

	util.disableField(callpoint!, "IVE_TRANSFER.LOTSER_NO")

rem --- Is the GL module installed?

	user_tpl.gl$="N"
	call user_tpl.pgmdir$+"adc_application.aon","GL",info$[all]
	
	if info$[20]="Y" then 
		call user_tpl.pgmdir$+"adc_application.aon","IV",info$[all]
		
		rem --- Does IV post to GL?
		user_tpl.gl$=info$[9]
	endif

rem --- Final inits

	precision num(ivs01a.precision$)

bsho_exit:
[[IVE_TRANSFER.<CUSTOM>]]
rem ===========================================================================
check_item_whse: rem --- Check that a warehouse record exists for this item
                 rem      IN: whse$
                 rem          item$
                 rem     OUT: failed  (true/false)
                 rem          ivm01a$ (item mast record)
                 rem          ivm02a$ (item/whse record)
rem ===========================================================================

	item_file$ = "IVM_ITEMMAST"
	whse_file$ = "IVM_ITEMWHSE"

	dim ivm01a$:fnget_tpl$(item_file$)
	dim ivm02a$:fnget_tpl$(whse_file$)

	failed = 1
	find record (fnget_dev(item_file$),key=firm_id$+item$) ivm01a$
	find record (fnget_dev(whse_file$),key=firm_id$+whse$+item$,dom=check_item_whse_missing) ivm02a$
	failed = 0

	goto check_item_whse_done

check_item_whse_missing:

	dim msg_tokens$[0]
	msg_id$ = "IV_ITEM_WHSE_INVALID"
	msg_tokens$[0] = whse$
	gosub disp_message

check_item_whse_done:

return

rem ===========================================================================
display_ext: rem --- Display total cost 
             rem      IN: qty
             rem     OUT: ext_cost calculated and displayed
rem ===========================================================================

	cost = num( callpoint!.getColumnData("IVE_TRANSFER.UNIT_COST") )
	callpoint!.setColumnData("IVE_TRANSFER.EXT_COST", str( cost*qty:user_tpl.cost_mask$ ))
	callpoint!.setStatus("REFRESH:IVE_TRANSFER.EXT_COST")

return

rem ===========================================================================
#include std_missing_params.src
rem ===========================================================================
[[IVE_TRANSFER.TRANS_DATE.AVAL]]
rem --- Is date within range of GL period?

	if user_tpl.gl$="Y" then 
		call user_tpl.pgmdir$+"glc_datecheck.aon",callpoint!.getUserInput(),"Y",period$,year$,status
		if status>99 then callpoint!.setStatus("ABORT")
	endif
