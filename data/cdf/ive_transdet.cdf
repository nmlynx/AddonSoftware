[[IVE_TRANSDET.LOTSER_NO.BINP]]
print "in LOTSER_NO.BINP"; rem debug

rem --- Should user enter a lot of look it up?

	rem --- Receipts and negatice Adjustments require new lot entry
	trans_qty = num( callpoint!.getColumnData("IVE_TRANSDET.TRANS_QTY") )
	rem old code for reference
	rem IF TYPE$="R" OR (TYPE$="A" AND W[0]>0)
	if user_tpl.trans_type$ = "R" or (user_tpl.trans_type$ = "A" and trans_qty > 0 ) then break; rem exit callpoint

rem --- call the lot lookup window and set default lot, lot location, lot comment and qty

	rem --- save current row/column so we'll know where to set focus when we return from lot lookup
	grid! = Form!.getChildWindow(1109).getControl(5900)
	return_to_row = grid!.getSelectedRow()
	return_to_col = grid!.getSelectedColumn()

	rem --- Set data for the lookup form
	curr_item$ = callpoint!.getColumnData("IVE_TRANSDET.ITEM_ID")
	curr_whse$ = callpoint!.getColumnData("IVE_TRANSDET.WAREHOUSE_ID")

	dim dflt_data$[3,1]
	dflt_data$[1,0] = "ITEM_ID"
	dflt_data$[1,1] = curr_item$
	dflt_data$[2,0] = "WAREHOUSE_ID"
	dflt_data$[2,1] = curr_whse$
	dflt_data$[3,0] = "LOTS_TO_DISP"
	dflt_data$[3,1] = "O"; rem --- default to open lots

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
	if callpoint!.getDevObject("selected_lot")<>null()
		callpoint!.setColumnData( "IVE_TRANSDET.LOTSER_NO",   str(callpoint!.getDevObject("selected_lot")) )
		callpoint!.setColumnData( "IVE_TRANSDET.LS_LOCATION", str(callpoint!.getDevObject("selected_lot_loc")) )
		callpoint!.setColumnData( "IVE_TRANSDET.LS_COMMENTS", str(callpoint!.getDevObject("selected_lot_cmt")) )
		user_tpl.lot_avail = num( callpoint!.getDevObject("selected_lot_avail") )
		if trans_qty = 0 then
			callpoint!.setColumnData( "IVE_TRANSDET.TRANS_QTY", str(user_tpl.lot_avail) )
		endif
		callpoint!.setStatus("REFGRID")
	endif

	rem --- return focus to where we were (lot number)
	grid!.focus()
	grid!.accept(1,err=*next)
	grid!.startEdit(return_to_row,return_to_col)
	
[[IVE_TRANSDET.BWRI]]
print "before record write (BWRI)"; rem debug
[[IVE_TRANSDET.BUDE]]
print "before record undelete (BUDE)"; rem debug

rem --- Re-commit quantity

	status = 999
	call pgmdir$+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	if status then goto std_exit

	curr_whse$   = callpoint!.getColumnData("IVE_TRANSDET.WAREHOUSE_ID")
	curr_item$   = callpoint!.getColumnData("IVE_TRANSDET.ITEM_ID")
	curr_qty     = num( callpoint!.getColumnData("IVE_TRANSDET.TRANS_QTY") )
	curr_lotser$ = callpoint!.getColumnData("IVE_TRANSDET.LOTSER_NO")

	print "re-committing item ", curr_item$, ", amount", curr_qty; rem debug

	if curr_whse$ <> "" and curr_item$ <>"" then 

		rem --- Adjustments reverse the commitment
		if user_tpl.trans_type$ = "A" then 
			refs[0] = -curr_qty 
		else 
			refs[0] = curr_qty
		endif

		items$[1] = curr_whse$
		items$[2] = curr_item$
		items$[3] = curr_lotser$
		call pgmdir$+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	endif
[[IVE_TRANSDET.BDEL]]
print "before record delete (BDEL)"; rem debug

rem --- Uncommit quantity

	status = 999
	call pgmdir$+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	if status then goto std_exit

	curr_whse$   = callpoint!.getColumnData("IVE_TRANSDET.WAREHOUSE_ID")
	curr_item$   = callpoint!.getColumnData("IVE_TRANSDET.ITEM_ID")
	curr_qty     = num( callpoint!.getColumnData("IVE_TRANSDET.TRANS_QTY") )
	curr_lotser$ = callpoint!.getColumnData("IVE_TRANSDET.LOTSER_NO")

	print "uncommitting item ", curr_item$, ", amount", curr_qty; rem debug

	if curr_whse$ <> "" and curr_item$ <>"" then 

		rem --- Adjustments reverse the commitment
		if user_tpl.trans_type$ = "A" then 
			refs[0] = -curr_qty 
		else 
			refs[0] = curr_qty
		endif

		items$[1] = curr_whse$
		items$[2] = curr_item$
		items$[3] = curr_lotser$
		call pgmdir$+"ivc_itemupdt.aon","UC",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	endif
[[IVE_TRANSDET.AREC]]
print "after new record (AREC)"; rem debug

rem --- If this is not multi-warehouse, display the default

	if user_tpl.multi_whse$ <> "Y" then
		callpoint!.setColumnData("IVE_TRANSDET.WAREHOUSE_ID",user_tpl.warehouse_id$)
	endif
[[IVE_TRANSDET.ARAR]]
print "after array transfer (ARAR)"; rem debug
[[IVE_TRANSDET.AGDR]]
print "after grid display row (AGDR)"; rem debug

rem --- Set item/warehouse defaults

	item$ = callpoint!.getColumnData("IVE_TRANSDET.ITEM_ID")
	whse$ = callpoint!.getColumnData("IVE_TRANSDET.WAREHOUSE_ID")
	gosub get_whse_item
[[IVE_TRANSDET.AGDS]]
print "after grid display (AGDS)"; rem debug
[[IVE_TRANSDET.AGCL]]
print "after grid clear (AGCL)"; rem debug

	rem --- Does it matter where we put the "use"?
	use ::ado_util.src::util
[[IVE_TRANSDET.TRANS_QTY.AINP]]
rem --- Serialized receipt or issue must be 1

	if user_tpl.trans_type$ = "I" or user_tpl.trans_type$ = "R" then
		if user_tpl.this_item_lot_or_ser and user_tpl.serialized then
			if callpoint!.getUserInput() <> "1" then
				callpoint!.setStatus("ABORT")
			endif
		endif
	endif
[[IVE_TRANSDET.TRANS_QTY.BINP]]
rem --- Serialized receipt or issue must be 1

	if user_tpl.trans_type$ = "I" or user_tpl.trans_type$ = "R" then
		if user_tpl.this_item_lot_or_ser and user_tpl.serialized then
			callpoint!.setColumnData("IVE_TRANSDET.TRANS_QTY","1")
			callpoint!.setStatus("REFRESH:IVE_TRANSDET.TRANS_QTY")
		endif
	endif
[[IVE_TRANSDET.WAREHOUSE_ID.AVAL]]
rem --- Set item/warehouse defaults

	item$ = callpoint!.getColumnData("IVE_TRANSDET.ITEM_ID")
	whse$ = callpoint!.getUserInput()
	gosub get_whse_item
[[IVE_TRANSDET.UNIT_COST.AVAL]]
rem --- Calculate and display extended cost

	unit_cost = num( callpoint!.getUserInput() )
	trans_qty = num( callpoint!.getColumnData("IVE_TRANSDET.TRANS_QTY") )
	gosub calc_ext_cost
[[IVE_TRANSDET.<CUSTOM>]]
calc_ext_cost: rem --- Calculate and display extended cost
               rem  IN: unit_cost
               rem    : trans_qty
               rem OUT: Extended cost calculated and displayed

	callpoint!.setColumnData("IVE_TRANSDET.TOTAL_COST", str(unit_cost * trans_qty) )
	rem callpoint!.setStatus("MODIFIED-REFRESH")
	callpoint!.setStatus("REFGRID")

return

get_whse_item: rem --- Get warehouse and item records and display
               rem  IN: item$ = the current item ID
               rem    : whse$ = the current warehouse
               rem OUT: default values set and displayed

	print "in get_whse_item: item$ = """, item$, """, whse$: """, whse$, """"

	rem --- Are both columns set?

	if item$ <> "" and whse$ <> "" then

		rem --- Get records

		ivm01_dev   = fnget_dev("IVM_ITEMMAST")
		ivm01a_tpl$ = fnget_tpl$("IVM_ITEMMAST")
		dim ivm01a$:ivm01a_tpl$
		find record(ivm01_dev,key=firm_id$+item$) ivm01a$

		ivm02_dev   = fnget_dev("IVM_ITEMWHSE")
		ivm02a_tpl$ = fnget_tpl$("IVM_ITEMWHSE")
		dim ivm02a$:ivm02a_tpl$
		find record(ivm02_dev,key=firm_id$+whse$+item$,dom=no_whse_rec) ivm02a$

		rem --- Display Lot/Serial if needed

		user_tpl.this_item_lot_or_ser% = ( user_tpl.ls$="Y" and ivm01a.lotser_item$="Y" and ivm01a.inventoried$="Y" )
	
		if !(user_tpl.this_item_lot_or_ser%) then
			cols! = BBjAPI().makeVector()
			cols!.addItem(7)
			cols!.addItem(8)
			cols!.addItem(9)
			util.disableGridCells(Form!, cols!)
		endif

		rem debug
		print "this_item_lot_or_ser: ", iff(user_tpl.this_item_lot_or_ser%, "Y", "N")
		print "lot/serial okay: ", user_tpl.ls$
		print "lot/serial item: ", ivm01a.lotser_item$
		print "inventoried    : ", ivm01a.inventoried$

		rem --- Set cost and extension
		
		orig_item$ = callpoint!.getColumnDiskData("IVE_TRANSDET.ITEM_ID")
		orig_whse$ = callpoint!.getColumnDiskData("IVE_TRANSDET.WAREHOUSE_ID")
		new_record = ( cvs(orig_whse$,3) = "" or cvs(orig_item$,3) = "" )

		if new_record or orig_whse$ <> whse$ or orig_item$ <> item$ then
			callpoint!.setColumnData("IVE_TRANSDET.UNIT_COST", ivm02a.unit_cost$)
			unit_cost = num( ivm02a.unit_cost$ )
			trans_qty = num( callpoint!.getColumnData("IVE_TRANSDET.TRANS_QTY") )
			gosub calc_ext_cost

			rem --- Set header display values

			location!    = UserObj!.getItem( user_tpl.location_obj )
			qty_on_hand! = UserObj!.getItem( user_tpl.qoh_obj )
			qty_commit!  = UserObj!.getItem( user_tpl.commit_obj )
			qty_avail!   = UserObj!.getItem( user_tpl.avail_obj )

			rem --- Header values
			m9$     = user_tpl.m9$
			loc$    = ivm02a.location$
			qoh     = num( ivm02a.qty_on_hand$ )
			qoh$    = str( qoh:m9$ )
			commit  = num( ivm02a.qty_commit$ )
			commit$ = str( commit:m9$ )
			avail$  = str( (qoh - commit):m9$ )

			rem --- Display
			location!.setText( loc$ )
			qty_on_hand!.setText( qoh$ )
			qty_commit!.setText( commit$ )
			qty_avail!.setText( avail$ )

			rem --- Sets the values for Barista internally
			callpoint!.setHeaderColumnData("<<DISPLAY>>.LOCATION", loc$)
			callpoint!.setHeaderColumnData("<<DISPLAY>>.QTY_ON_HAND", qoh$)
			callpoint!.setHeaderColumnData("<<DISPLAY>>.QTY_COMMIT", commit$)
			callpoint!.setHeaderColumnData("<<DISPLAY>>.QTY_AVAIL", avail$)

		endif

	endif

	goto whse_item_done

	rem No Warehouse Record error

	no_whse_rec:
	call stbl("+DIR_SYP")+"bac_message.bbj","IV_NO_WHSE_ITEM",msg_tokens$[all],msg_opt$,table_chans$[all]
	rem callpoint!.setStatus("ABORT")

	whse_item_done:

return
[[IVE_TRANSDET.TRANS_QTY.AVAL]]
print "in TRANS_QTY.AVAL"; rem debug

rem --- Calculate and display extended cost

	trans_qty = num( callpoint!.getUserInput() )
	unit_cost = num( callpoint!.getColumnData("IVE_TRANSDET.UNIT_COST") )
	gosub calc_ext_cost

rem --- Enter cost only for receipts and adjusting up (that is, incoming)

	rem old code for reference
	rem IF TYPE$<>"R" AND (TYPE$<>"A" OR W[0]<0) THEN GOTO 2780

	rem debug and below
	print "Trans type: ", user_tpl.trans_type$
	print " Trans Qty:", trans_qty

	if user_tpl.trans_type$ <> "R" and (user_tpl.trans_type$ <> "A" or trans_qty < 0) then
		print "calling the disable method..."
		util.disableGridCell(Form!, 10)
	endif

rem old code for reference

rem 6100 QTY_TESTS: REM " --- Quantity tests and error messages
rem 6110 LET FAILED=0
rem 6120 IF V=0 THEN LET MSG$[0]="Quantity can not equal zero",FAILED=1; GOTO 6180
rem 6130 IF POS(TYPE$="IR") AND V<0 THEN LET MSG$[0]="Issues and Receipts must have quantites greater than zero",FAILED=1; GOTO 6180
rem 6140 IF THIS_ITEM_LOT_OR_SER AND SERIALIZED AND POS(TYPE$="AC") AND V<>1 AND V<>-1 THEN LET MSG$[0]="Serialized items can only have a quantity of 1 or -1",FAILED=1; GOTO 6180
rem 6145 IF THIS_ITEM_LOT_OR_SER THEN GOTO 6190; REM Have to wait to enter Lot/Serial before testing available (but we need to know if qty is negative or positive before Lot/Serial)
rem 6150 IF (TYPE$="I" OR (TYPE$="A" AND V<0) OR (TYPE$="C" AND V>0)) AND ABS(V)>AVAIL THEN LET MSG$[0]="Quantity can't be more than available ("+STR(AVAIL)+")",FAILED=1; GOTO 6180
rem 6160 IF TYPE$="C" AND V<0 AND V+L[2]<0 THEN LET MSG$[0]="Can't decrease committed less than zero ("+STR(L[2])+")",FAILED=1; GOTO 6180
rem 6170 GOTO 6190
rem 6180 CALL "syc_xa.bbx",2,MSG$[ALL],1,-1,-1,IGNORE$,IGNORE
rem 6190 RETURN 
[[IVE_TRANSDET.AGRE]]
print "after grid row exit"; rem debug

rem --- Commit inventory

	rem --- Receipts do not commit
	if user_tpl.trans_type$ = "R" then break; rem exit callpoint

	rem --- Has this row changed?
	this_row = callpoint!.getValidationRow()

	if callpoint!.getGridRowModifyStatus(this_row)<>"Y"
		print "row ",this_row," not modified"
	else
		print "row ",this_row," modified..."

		rem --- Get current and prior values
		curVect!  = gridVect!.getItem(0)
		undoVect! = gridVect!.getItem(1)

		dim cur_rec$:dtlg_param$[1,3]
		dim undo_rec$:dtlg_param$[1,3]

		cur_rec$  = curVect!.getItem(this_row)
		undo_rec$ = undoVect!.getItem(this_row)

		curr_whse$   = cur_rec.warehouse_id$
		curr_item$   = cur_rec.item_id$
		curr_qty     = num( cur_rec.trans_qty$ )
		curr_lotser$ = cur_rec.lotser_no$

		if undo_rec$ <> "" then
			prior_whse$   = undo_rec.warehouse_id$
			prior_item$   = undo_rec.item_id$
			prior_qty     = num( undo_rec.trans_qty$ )
			prior_lotser$ = undo_rec.lotser_no$
		else
			prior_whse$   = ""
			prior_item$   = ""
			prior_qty     = 0
			prior_lotser$ = ""
		endif

		rem debug to end
		if (curr_whse$<>prior_whse$) then
			print "Warehouses don't match or new"
		else
			print "Warehouses match"
		endif

		if (curr_item$<>prior_item$) then
			print "Items don't match or new"
		else
			print "Items match"
		endif

		print "Change in quantity:", curr_qty - prior_qty
		rem end debug

		rem --- Has there been any change?

		if	curr_whse$   <> prior_whse$ or 
:			curr_item$   <> prior_item$ or 
:			curr_qty     <> prior_qty   or
:        curr_lotser$ <> prior_lotser$
:		then

			rem --- Initialize inventory item update

			print "initializing ATAMO..."
			status = 999
			call pgmdir$+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
			if status then goto std_exit

			rem --- Items or warehouses are different: uncommit previous

			if (prior_whse$   <> "" and prior_whse$   <> curr_whse$) or 
:			   (prior_item$   <> "" and prior_item$   <> curr_item$) or
:				(prior_lotser$ <> "" and prior_lotser$ <> curr_lotser$)
:			then

				rem --- Uncommit prior item and warehouse

				if prior_whse$ <> "" and prior_item$ <> "" then
				
					print "uncomtting old item or warehouse..."; rem debug
					items$[1] = prior_whse$
					items$[2] = prior_item$
					items$[3] = prior_lotser$
					
					rem --- Adjustments reverse the commitment
					if user_tpl.trans_type$ = "A" then
						refs[0] = -prior_qty
					else
						refs[0] = prior_qty
					endif
					
					call pgmdir$+"ivc_itemupdt.aon","UC",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
					if status then escape; rem problem uncommitting previous qty

				endif

				rem --- Commit quantity for current item and warehouse

				print "committing current item and warehouse..."; rem debug
				items$[1] = curr_whse$
				items$[2] = curr_item$
				items$[3] = curr_lotser$
				refs[0]   = curr_qty 

				call pgmdir$+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
				if status then escape; rem problem committing 

			endif

			rem --- New record or item and warehouse haven't changed: commit difference

			if (prior_whse$   = "" or prior_whse$   = curr_whse$) and 
:			   (prior_item$   = "" or prior_item$   = curr_item$) and
:				(prior_lotser$ = "" or prior_lotser$ = curr_lotser$)
:			then

				rem --- Commit quantity for current item and warehouse

				print "committing new or current item and warehouse..."; rem debug
				items$[1] = curr_whse$
				items$[2] = curr_item$
				items$[3] = curr_lotser$
				refs[0]   = curr_qty - prior_qty

				call pgmdir$+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
				if status then escape; rem problem committing 

			endif

			print "done committing"; rem debug

		endif

	endif
[[IVE_TRANSDET.BGDR]]
print "before grid display row (BGDR)"; rem debug

rem --- If this is not multi-warehouse, display the default

	if user_tpl.multi_whse$ <> "Y" then
		callpoint!.setColumnData("IVE_TRANSDET.WAREHOUSE_ID",user_tpl.warehouse_id$)
	endif
[[IVE_TRANSDET.ITEM_ID.AVAL]]
rem --- Old code for reference
rem 2245 FIND (IVM01_DEV,KEY=D0$,DOM=2220)IOL=IVM01A; rem D0$(1),D1$(1),D2$(1),D3$,D4$,D5$,D6$,D[ALL]
rem 2250 LET L0$(1)=N0$+W1$,AVAIL=0
rem 2255 FIND (IVM02_DEV,KEY=L0$,DOM=2220)IOL=IVM02A; rem L0$(1),L1$,L2$,L[ALL]
rem 2260 LET AVAIL=L[0]-L[2]
rem 2265 IF VALIDATE OR W1$=PREV_WH_ITEM$ THEN GOTO 2390
rem 2270 DIM W[2]
rem 2275 LET W2$(1)="",W[1]=L[11]

rem --- Set and display default values

	item$ = callpoint!.getUserInput()
	whse$ = callpoint!.getColumnData("IVE_TRANSDET.WAREHOUSE_ID")
	gosub get_whse_item
