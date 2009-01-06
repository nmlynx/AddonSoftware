[[IVE_TRANSFER.ADIS]]
print "in ADIS (After Record Display)"; rem debug

rem --- Display purchase UM

	item$ = callpoint!.getColumnData("IVE_TRANSFER.ITEM_ID")
	print "Item: ", item$; rem debug
	gosub get_item
[[IVE_TRANSFER.ADEL]]
print "in ADEL (After Delete)"; rem debug

rem --- Uncommit inventory

	qty = num( callpoint!.getColumnData("IVE_TRANSFER.TRANS_QTY") )

	if qty then 

		print "need to uncommit qty..."; rem debug
	
		rem --- Initialize
		status = 999
		call user_tpl.pgmdir$ + "ivc_itemupdt.aon::init",
:			err=*next,
:			chan[all],
:			ivs01a$,
:			items$[all],
:			refs$[all],
:			refs[all],
:			table_chans$[all],
:			status
		if status then goto std_exit

		rem --- Uncommit qty
		action$ = "UC"
		if qty then gosub item_update

	endif
[[IVE_TRANSFER.AREC]]
print "in AREC (After New Record)"; rem debug

rem --- Do record inits here

	util.disableField(callpoint!, "IVE_TRANSFER.LOTSER_NO")

	user_tpl.avail = 0
	user_tpl.this_item_is_lot_ser% = 0
	user_tpl.item_is_serial% = 0
[[IVE_TRANSFER.TRANS_QTY.BINP]]
print "in TRANS_QTY.BINP"; rem debug
[[IVE_TRANSFER.INV_XFER_NO.BINP]]
print "in INV_XREF_NO.BINP"; rem debug
[[IVE_TRANSFER.TRANS_QTY.AVAL]]
print "in TRANS_QTY.AVAL"; rem debug

rem --- Is qty valid?

	qty = num( callpoint!.getUserInput() )
	gosub check_qty
	if !(failed) then gosub display_ext
[[IVE_TRANSFER.LOTSER_NO.AVAL]]
print "in LOTSRE_NO.AVAL"; rem debug

rem --- Validate entered lot/serial#

	whse$  = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	item$  = callpoint!.getColumnData("IVE_TRANSFER.ITEM_ID")
	ls_no$ = callpoint!.getUserInput()

	gosub valid_ls

	if !(failed) then 
		callpoint!.setColumnData("IVE_TRANSFER.UNIT_COST", str(ls_rec.unit_cost:user_tpl.cost_mask$))
		callpoint!.setStatus("MODIFIED-REFRESH:IVE_TRANSFER.UNIT_COST")

		qty = num( callpoint!.getColumnData("IVE_TRANSFER.TRANS_QTY") )
		gosub display_ext
	endif
[[IVE_TRANSFER.LOTSER_NO.BINP]]
print "in LOTSRE_NO.BINP"; rem debug

rem --- Call the lot lookup window and set default lot

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
	endif

	rem --- Bring focus back to this field
	thisControl! = fnget_control!("IVE_TRANSFER.LOTSER_NO")
	thisControl!.focus()

lotser_no_binp_exit:
[[IVE_TRANSFER.ITEM_ID.AVAL]]
print "in ITEM_ID.AVAL"; rem debug

rem --- Get item data

	item$ = callpoint!.getUserInput()
	gosub get_item

rem --- Check item against both warehouses, if entered

	from_whse$ = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	to_whse$   = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID_TO")

	if to_whse$ <> "" then
		whse$ = to_whse$
		gosub check_item_whse
		if failed then 
			callpoint!.setStatus("ABORT")
			goto item_id_aval_end
		endif
	endif

	rem --- We check "from whse" second so that ivm02a$ is set correctly
	if from_whse$ <> "" then
		whse$ = from_whse$
		gosub check_item_whse
		if failed then 
			callpoint!.setStatus("ABORT")
			goto item_id_aval_end
		endif
	endif

rem --- Is this item lotted or serialised?
rem --- To be thorough we would check both warehouse/item records, but version 7 only checks from_whse

	user_tpl.this_item_is_lot_ser% = (user_tpl.ls$="Y" and ivm01a.lotser_item$="Y" and ivm01a.inventoried$="Y")
	user_tpl.item_is_serial% = (user_tpl.serialized% and ivm01a.lotser_item$="Y" and ivm01a.inventoried$="Y")

	print "Lot/Serial item? (from IVM_ITEMWHSE): ", ivm01a.lotser_item$; rem debug
	print "Inventoried? ", ivm01a.inventoried$; rem debug

	if user_tpl.this_item_is_lot_ser% then
		util.enableField(callpoint!, "IVE_TRANSFER.LOTSER_NO")
	else

		rem --- Not lotted or serialized
		callpoint!.setColumnData("IVE_TRANSFER.LOTSER_NO", "")
		callpoint!.setColumnData("IVE_TRANSFER.UNIT_COST", str(ivm02a.unit_cost:user_tpl.cost_mask$))

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
	endif
[[IVE_TRANSFER.BWRI]]
print "in BWRI (Before Write)"; rem debug

rem --- Do all data validation here

rem --- Warehouses can't match

	from_whse$ = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	to_whse$   = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID_TO")

	if from_whse$ = to_whse$ then
		callpoint!.setMessage("IV_FROM_TO_WHSE_MTCH")
		callpoint!.setStatus("ABORT")
		goto bwri_end
	endif

rem --- Check item against both warehouses

	item$ = callpoint!.getColumnData("IVE_TRANSFER.ITEM_ID") 
	whse$ = from_whse$
	gosub check_item_whse

	if failed then 
		callpoint!.setStatus("ABORT")
		goto bwri_end
	else
		whse$ = to_whse$
		gosub check_item_whse
		if failed then 
			callpoint!.setStatus("ABORT")
			goto bwri_end
		endif
	endif

rem --- Check trans qty against available

	qty = num( callpoint!.getColumnData("IVE_TRANSFER.TRANS_QTY") )
	gosub check_qty
	if failed then 
		callpoint!.setStatus("ABORT")
		goto bwri_end
	endif

rem --- Validate entered lot/serial#

	if user_tpl.this_item_is_lot_ser% then

		whse$  = from_whse$
		ls_no$ = callpoint!.getColumnData("IVE_TRANSFER.LOTSER_NO")

		gosub valid_ls
		if failed then
			callpoint!.setStatus("ABORT")
			goto bwri_end
		endif

	endif

rem --- Commit inventory

	prev_qty = num( callpoint!.getColumnDiskData("IVE_TRANSFER.TRANS_QTY") )
	curr_qty = num( callpoint!.getColumnData("IVE_TRANSFER.TRANS_QTY") )

	print "Previous qty (from disk):", prev_qty; rem debug
	print "Current qty             :", curr_qty; rem debug

	if prev_qty <> curr_qty then 

		print "need to commit qty..."; rem debug
	
		rem --- Initialize
		status = 999
		call user_tpl.pgmdir$ + "ivc_itemupdt.aon::init",
:			err=*next,
:			chan[all],
:			ivs01a$,
:			items$[all],
:			refs$[all],
:			refs[all],
:			table_chans$[all],
:			status
		if status then goto std_exit

		print "just initialised ivc_itemupdate..."; rem debug

		rem --- From warehouse: uncommit previous qty, if any
		action$ = "UC"
		qty = prev_qty
		if qty then gosub item_update

		rem --- Commit current qty
		action$ = "CO"
		qty = curr_qty
		gosub item_update

	endif

bwri_end:
[[IVE_TRANSFER.WAREHOUSE_ID_TO.AVAL]]
rem --- If both warehouses are entered, they can't match

	from_whse$ = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	to_whse$   = callpoint!.getUserInput()

	if from_whse$ <> "" and to_whse$ <> "" and from_whse$ = to_whse$ then
		msg_id$ = "IV_FROM_TO_WHSE_MTCH"
		gosub disp_message
	endif
[[IVE_TRANSFER.BSHO]]
print 'show',"in BSHO"; rem debug

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
		callpoint!.setMessage("IV_NOT_MULTI_WHSE")
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

	print "Lots/Serial#? (from params): ", ivs01a.lotser_flag$

	if ivs01a.lotser_flag$ = "S" then user_tpl.serialized% = 1

	rem This should happen in AREC
	rem util.disableField(callpoint!, "IVE_TRANSFER.LOTSER_NO")

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
                 rem          ivm02a$ (item/whse record)
rem ===========================================================================

	whse_file$ = "IVM_ITEMWHSE"
	dim ivm02a$:fnget_tpl$(whse_file$)

	failed = 1
	find record (fnget_dev(whse_file$),key=firm_id$+whse$+item$,dom=check_item_whse_missing) ivm02a$
	failed = 0

	goto check_item_whse_done

check_item_whse_missing:

	callpoint!.setMessage("IV_ITEM_WHSE_INVALID:" + whse$ )

check_item_whse_done:

return

rem ===========================================================================
get_item: rem --- Get item master record 
          rem      IN: item$
          rem     OUT: ivm01a$ (item mast record)
rem ===========================================================================

	print "in get_item()"; rem debug
	item_file$ = "IVM_ITEMMAST"
	dim ivm01a$:fnget_tpl$(item_file$)
	find record (fnget_dev(item_file$), key=firm_id$+item$) ivm01a$
	callpoint!.setColumnData("<<DISPLAY>>.PURCHASE_UM",ivm01a.purchase_um$)
	callpoint!.setStatus("REFRESH")

return

rem ===========================================================================
display_ext: rem --- Display total cost 
             rem      IN: qty
             rem     OUT: ext_cost calculated and displayed
rem ===========================================================================

	cost = num( callpoint!.getColumnData("IVE_TRANSFER.UNIT_COST") )
	callpoint!.setColumnData("IVE_TRANSFER.EXT_COST", str( cost*qty:user_tpl.cost_mask$ ))
	callpoint!.setStatus("MODIFIED-REFRESH")

return

rem ===========================================================================
check_qty: rem --- Is qty valid?
           rem      IN: qty
           rem     OUT: failed = true/false
rem ===========================================================================

	failed = 0

	rem --- Quantity can't be negative or zero
	if qty <= 0 then
		callpoint!.setMessage("IV_QTY_GT_ZERO")
		failed = 1
		goto check_qty_end
	endif

	rem --- Quantity can only be 1 for serial#'s
	if qty > 1 and user_tpl.item_is_serial% then
		callpoint!.setMessage("IV_SER_JUST_ONE")
		failed = 1
		goto check_qty_end
	endif

	rem --- Qty can't be more than available
	if qty > user_tpl.avail then
		callpoint!.setMessage("IV_QTY_OVER_AVAIL:" + str(user_tpl.avail))
		failed = 1
		goto check_qty_end
	endif

check_qty_end:
return

rem ===========================================================================
valid_ls: rem --- Validate entered lot/serial#
          rem      IN: whse$  = warehouse
          rem          item$  = inventory item
          rem          ls_no$ = lot/serial#
          rem     OUT: failed (true/false)
          rem          ls_rec$ = lot/serial# record
          rem          user_tpl.avail
rem ===========================================================================

	failed = 0
	ls_file$ = "IVM_LSMASTER"
	dim ls_rec$:fnget_tpl$(ls_file$)

	find record(fnget_dev(ls_file$), key=firm_id$ + whse$ + item$ + ls_no$, dom=valid_ls_not_found) ls_rec$

	user_tpl.avail = ls_rec.qty_on_hand - ls_rec.qty_commit

	if user_tpl.avail = 0 then
		callpoint!.setMessage("IV_LOT_NO_AVAIL")
		failed = 1
		goto valid_ls_end
	endif

	goto valid_ls_end

valid_ls_not_found:
	callpoint!.setMessage("IV_LOT_MUST_EXIST")
	failed = 1

valid_ls_end:
return

rem ===========================================================================
item_update: rem --- Commit or uncommit inventory
             rem      IN: action$ = "CO" (commit), "UC" (uncommit)
             rem          qty = quantity to commit
rem ===========================================================================

	items$[1] = callpoint!.getColumnData("IVE_TRANSFER.WAREHOUSE_ID")
	items$[2] = callpoint!.getColumnData("IVE_TRANSFER.ITEM_ID")
	refs[0]   = qty

	if user_tpl.ls$ = "Y" then
		items$[3] = callpoint!.getColumnData("IVE_TRANSFER.LOTSER_NO")
	endif

	if items$[1] <> "" and items$[2] <> "" and refs[0] then
		print "entering ivc_itemupdt.aon..."; rem debug
		call user_tpl.pgmdir$ + "ivc_itemupdt.aon",
:			action$,	
:			chan[all],
:			ivs01a$,
:			items$[all],
:			refs$[all],
:			refs[all],
:			table_chans$[all],
:			status
		if status then goto std_exit
	endif

	items$[1] = ""
	items$[2] = ""
	items$[3] = ""
	refs[0] = 0

return

rem ===========================================================================
rem #include fnget_control.src
rem ===========================================================================

def fnget_control!(ctl_name$)

	ctlContext = num( callpoint!.getTableColumnAttribute(ctl_name$,"CTLC") )
	ctlID      = num( callpoint!.getTableColumnAttribute(ctl_name$,"CTLI") )

	return SysGUI!.getWindow(ctlContext).getControl(ctlID)

fnend

rem #endinclude fnget_control.src

rem ===========================================================================
#include std_missing_params.src
rem ===========================================================================
[[IVE_TRANSFER.TRANS_DATE.AVAL]]
rem --- Is date within range of GL period?

	if user_tpl.gl$="Y" then 
		call user_tpl.pgmdir$+"glc_datecheck.aon",callpoint!.getUserInput(),"Y",period$,year$,status
		if status>99 then callpoint!.setStatus("ABORT")
	endif
