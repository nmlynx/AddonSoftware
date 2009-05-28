[[POE_PODET.AWRI]]
rem --- debug stuff=========================================================

	print "AWRI stats:"
	print "column: ",callpoint!.getColumnData("POE_PODET.ITEM_ID"),callpoint!.getColumnData("POE_PODET.QTY_ORDERED")
	print "undo: ", callpoint!.getColumnUndoData("POE_PODET.ITEM_ID"),callpoint!.getColumnUndoData("POE_PODET.QTY_ORDERED")
	print "disk: ",callpoint!.getColumnDiskData("POE_PODET.ITEM_ID"),callpoint!.getColumnDiskData("POE_PODET.QTY_ORDERED")

	if callpoint!.getColumnData("POE_PODET.ITEM_ID")<>callpoint!.getColumnUndoData("POE_PODET.ITEM_ID") or
:		callpoint!.getColumnData("POE_PODET.QTY_ORDERED")<>callpoint!.getColumnUndoData("POE_PODET.QTY_ORDERED")
		print "need to call atamo..."
		print "will uncommit: ",callpoint!.getColumnUndoData("POE_PODET.ITEM_ID")," for ",callpoint!.getColumnUndoData("POE_PODET.QTY_ORDERED")
		print "and commit: ",callpoint!.getColumnData("POE_PODET.ITEM_ID")," for ",callpoint!.getColumnData("POE_PODET.QTY_ORDERED")
	endif
rem --- end debug stuff=======================================================

rem need to updt ivm-05 (old poc.ua, now poc_itemvend) if on a new row -- still need this logic

rem --- Commit inventory

rem --- Get current and prior values

	curr_whse$ = callpoint!.getColumnData("POE_PODET.WAREHOUSE_ID")
	curr_item$ = callpoint!.getColumnData("POE_PODET.ITEM_ID")
	curr_qty   = num(callpoint!.getColumnData("POE_PODET.QTY_ORDERED")) * num(callpoint!.getColumnData("POE_PODET.CONV_FACTOR"))

	prior_whse$ = callpoint!.getColumnUndoData("POE_PODET.WAREHOUSE_ID")
	prior_item$ = callpoint!.getColumnUndoData("POE_PODET.ITEM_ID")
	prior_qty   = num(callpoint!.getColumnUndoData("POE_PODET.QTY_ORDERED")) * num(callpoint!.getColumnUndoData("POE_PODET.CONV_FACTOR"))

rem --- Has there been any change?

	if curr_whse$ <> prior_whse$ or 
:		curr_item$ <> prior_item$ or 
:		curr_qty   <> prior_qty 
:	then

rem --- Initialize inventory item update

		status=999
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
		if status then exitto std_exit

rem --- Items or warehouses are different: uncommit previous

		if (prior_whse$<>"" and prior_whse$<>curr_whse$) or 
:		   (prior_item$<>"" and prior_item$<>curr_item$)
:		then

rem --- Uncommit prior item and warehouse

			if prior_whse$<>"" and prior_item$<>"" and prior_qty<>0 then
				items$[1] = prior_whse$
				items$[2] = prior_item$
				refs[0]   = -prior_qty

				print "---Uncommit: item = ", cvs(items$[2], 2), ", WH: ", items$[1], ", qty =", refs[0]; rem debug
				
				call stbl("+DIR_PGM")+"ivc_itemupdt.aon","OO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
				if status then exitto std_exit
			endif

rem --- Commit quantity for current item and warehouse

			if curr_whse$<>"" and curr_item$<>"" and curr_qty<>0 then
				items$[1] = curr_whse$
				items$[2] = curr_item$
				refs[0]   = curr_qty 

				print "-----Commit: item = ", cvs(items$[2], 2), ", WH: ", items$[1], ", qty =", refs[0]; rem debug

				call stbl("+DIR_PGM")+"ivc_itemupdt.aon","OO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
				if status then exitto std_exit
			endif

		endif

rem --- New record or item and warehouse haven't changed: commit difference

		if	(prior_whse$="" or prior_whse$=curr_whse$) and 
:			(prior_item$="" or prior_item$=curr_item$) 
:		then

rem --- Commit quantity for current item and warehouse

			if curr_whse$<>"" and curr_item$<>"" and curr_qty - prior_qty <> 0
				items$[1] = curr_whse$
				items$[2] = curr_item$
				refs[0]   = curr_qty - prior_qty

				print "-----Commit: item = ", cvs(items$[2], 2), ", WH: ", items$[1], ", qty =", refs[0]; rem debug

				call stbl("+DIR_PGM")+"ivc_itemupdt.aon","OO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
				if status then exitto std_exit
			endif

		endif

	endif
[[POE_PODET.BDEL]]
rem before delete, uncommit inventory (columnData or columnUndoData?) - don't uncommit qty already rec'd
	print "BDEL:"
	print "column: ",callpoint!.getColumnData("POE_PODET.ITEM_ID"),callpoint!.getColumnData("POE_PODET.QTY_ORDERED")
[[POE_PODET.QTY_ORDERED.AVAL]]
rem --- call poc_itemvend.aon (poc.ua) to retrieve unit cost from ivm-05
rem --- send in: R/W for retrieve or write
rem                   R for req, P for PO, Q for QA recpt, C for PO recpt
rem                   vendor_id and ord_date from header rec
rem                   item_id,conv factor, unit cost, req qty or ordered qty from detail record
rem                   IV precision from iv params rec
rem 			status

rem don't allow ordered qty < qty rec'd -- need that logic still...

vendor_id$=callpoint!.getHeaderColumnData("POE_POHDR.VENDOR_ID")
ord_date$=callpoint!.getHeaderColumnData("POE_POHDR.ORD_DATE")
item_id$=callpoint!.getColumnData("POE_PODET.ITEM_ID")
conv_factor=num(callpoint!.getColumnData("POE_PODET.CONV_FACTOR"))
unit_cost=num(callpoint!.getColumnData("POE_PODET.UNIT_COST"))
qty_ordered=num(callpoint!.getUserInput())
status=0

call stbl("+DIR_PGM")+"poc_itemvend.aon","R","R",vendor_id$,ord_date$,item_id$,conv_factor,unit_cost,qty_ordered,callpoint!.getDevObject("iv_prec"),status

callpoint!.setColumnData("POE_PODET.UNIT_COST",str(unit_cost))

gosub update_header_tots
callpoint!.setDevObject("qty_this_row",num(callpoint!.getUserInput()))
callpoint!.setDevObject("cost_this_row",unit_cost);rem setting both qty and cost because cost may have changed based on qty break
[[POE_PODET.AGCL]]
print 'show';rem debug

use ::ado_util.src::util

rem --- set default line code based on param file
callpoint!.setTableColumnAttribute("POE_PODET.PO_LINE_CODE","DFLT",str(callpoint!.getDevObject("dflt_po_line_code")))
[[POE_PODET.ITEM_ID.AINV]]
rem --- remember row/column we're on so we can force focus when we return from synonym lookup

declare BBjStandardGrid grid!
grid! = util.getGrid(Form!)
return_to_row = grid!.getSelectedRow()
return_to_col = grid!.getSelectedColumn()

rem --- see if they entered a synonym, if so, display (if only one of them), if no match, or more than one match, launch bam_inquiry on synonym file

ivm_itemsyn_dev=fnget_dev("IVM_ITEMSYN")
dim ivm_itemsyn$:fnget_tpl$("IVM_ITEMSYN")

read (ivm_itemsyn_dev,key=firm_id$+callpoint!.getUserInput(),dom=*next)
read_count=0
found_count=0
found_item$=""

while read_count<2
	read record (ivm_itemsyn_dev,end=*break)ivm_itemsyn$
	if ivm_itemsyn.firm_id$=firm_id$ and ivm_itemsyn.item_synonym$=callpoint!.getUserInput()
		found_count=found_count+1
		found_item$=ivm_itemsyn.item_id$
	endif
	read_count=read_count+1
wend

if found_count=1
	callpoint!.setUserInput(found_item$)
	callpoint!.setStatus("")
else
	call stbl("+DIR_SYP")+"bac_key_template.bbj","IVM_ITEMSYN","PRIMARY",key_tpl$,table_chans$[all],rd_stat$
	dim return_key$:key_tpl$

	dim search_defs$[2]
	search_defs$[0]="IVM_ITEMSYN.ITEM_SYNONYM"
	search_defs$[1]=callpoint!.getRawUserInput()
	search_defs$[2]="A"

	call stbl("+DIR_SYP")+"bam_inquiry.bbj",gui_dev,Form!,"IVM_ITEMSYN","LOOKUP",
:		table_chans$[all],firm_id$,"PRIMARY",return_key$,filter_defs$[all],search_defs$[all]
	if cvs(return_key$,3)<>""
		callpoint!.setUserInput(return_key.item_id$)	
		callpoint!.setStatus("")
	else
		callpoint!.setStatus("ABORT")
	endif
	util.forceEdit(Form!, return_to_row, return_to_col)
endif
[[POE_PODET.AGRE]]

rem --- check data to see if o.k. to leave row (only if the row isn't marked as deleted)

if callpoint!.getGridRowDeleteStatus(num(callpoint!.getValidationRow()))<>"Y"

	ok_to_write$="Y"

	if cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),3)="" or 
:		cvs(callpoint!.getColumnData("POE_PODET.WAREHOUSE_ID"),3)="" then ok_to_write$="N"

	if pos(cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),3)="SD")<>0 
		if cvs(callpoint!.getColumnData("POE_PODET.ITEM_ID"),3)="" or
:		num(callpoint!.getColumnData("POE_PODET.CONV_FACTOR"))<=0 or
:		num(callpoint!.getColumnData("POE_PODET.UNIT_COST"))<0 or
:		num(callpoint!.getColumnData("POE_PODET.QTY_ORDERED"))<=0 or
:		cvs(callpoint!.getColumnData("POE_PODET.REQD_DATE"),3)="" 
			ok_to_write$="N"
		endif
	endif

	if cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),3)="N" 
		if cvs(callpoint!.getColumnData("POE_PODET.NS_ITEM_ID"),3)="" or
:		num(callpoint!.getColumnData("POE_PODET.UNIT_COST"))<0 or
:		num(callpoint!.getColumnData("POE_PODET.QTY_ORDERED"))<=0 or
:		cvs(callpoint!.getColumnData("POE_PODET.REQD_DATE"),3)="" 	
			ok_to_write$="N"
		endif
	endif

	if cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),3)="O" 
		if num(callpoint!.getColumnData("POE_PODET.UNIT_COST"))<0 or
:		cvs(callpoint!.getColumnData("POE_PODET.REQD_DATE"),3)="" 	
			ok_to_write$="N"
		endif
	endif

	if pos(cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),3)="MNOV")<>0 then
:		if cvs(callpoint!.getColumnData("POE_PODET.ORDER_MEMO"),3)="" then ok_to_write$="N"

	if callpoint!.getHeaderColumnData("POE_POHDR.DROPSHIP")="Y" and callpoint!.getDevObject("OP_installed")="Y"
		if pos(cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),3)="DSNO")<>0
			if cvs(callpoint!.getColumnData("POE_PODET.SO_INT_SEQ_REF"),3)="" then ok_to_write$="N"
		endif
	endif

	if ok_to_write$<>"Y"
		msg_id$="PO_REQD_DET"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
	
	rem -- now loop thru entire gridVect to make sure SO line reference, if used, isn't used >1 time

	dtl!=gridVect!.getItem(0)
	so_lines_referenced$=""
	dup_so_lines$=""

	if dtl!.size()
		dim rec$:dtlg_param$[1,3]
		for x=0 to dtl!.size()-1
			if callpoint!.getGridRowDeleteStatus(x)<>"Y"
				rec$=dtl!.getItem(x)
				if cvs(rec.so_int_seq_ref$,3)<>""
					if pos(rec.so_int_seq_ref$+"^"=so_lines_referenced$)<>0 
						dup_so_lines$="Y"
					else
						so_lines_referenced$=so_lines_referenced$+rec.so_int_seq_ref$+"^"
					endif
				endif
			endif
		next x
	endif

	if dup_so_lines$="Y"
		msg_id$="PO_DUP_SO_LINE"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
	

endif
[[POE_PODET.AGRN]]
rem --- save current qty/price this row

callpoint!.setDevObject("qty_this_row",callpoint!.getColumnData("POE_PODET.QTY_ORDERED"))
callpoint!.setDevObject("cost_this_row",callpoint!.getColumnData("POE_PODET.UNIT_COST"))

rem print "AGRN "
rem print "qty this row: ",callpoint!.getDevObject("qty_this_row")
rem print "cost this row: ",callpoint!.getDevObject("cost_this_row")
[[POE_PODET.UNIT_COST.AVAL]]
gosub update_header_tots
callpoint!.setDevObject("cost_this_row",num(callpoint!.getUserInput()))
[[POE_PODET.AUDE]]
	print "AUDE:"
	print "column: ",callpoint!.getColumnData("POE_PODET.ITEM_ID"),callpoint!.getColumnData("POE_PODET.QTY_ORDERED")

gosub update_header_tots

rem also re-commit IV, but again, not counting qty already rec'd
[[POE_PODET.ADEL]]
	print "ADEL:"
	print "column: ",callpoint!.getColumnData("POE_PODET.ITEM_ID"),callpoint!.getColumnData("POE_PODET.QTY_ORDERED")

gosub update_header_tots
[[POE_PODET.ADGE]]
rem --- if there are order lines to display/access in the sales order line item listbutton, set the LDAT and list display
rem --- get the detail grid, then get the listbutton within the grid; set the list on the listbutton, and put the listbutton back in the grid

order_lines!=callpoint!.getDevObject("so_lines_list")
ldat$=callpoint!.getDevObject("so_ldat")

if ldat$<>""
	callpoint!.setColumnEnabled(-1,"POE_PODET.SO_INT_SEQ_REF",1)
	callpoint!.setTableColumnAttribute("POE_PODET.SO_INT_SEQ_REF","LDAT",ldat$)
	g!=callpoint!.getDevObject("dtl_grid")
	c!=g!.getColumnListControl(num(callpoint!.getDevObject("so_seq_ref_col")))
	c!.removeAllItems()
	c!.insertItems(0,order_lines!)
	g!.setColumnListControl(num(callpoint!.getDevObject("so_seq_ref_col")),c!)	
else
	callpoint!.setColumnEnabled(-1,"POE_PODET.SO_INT_SEQ_REF",0)
endif 
[[POE_PODET.BDGX]]
rem -- loop thru gridVect; if there are any lines not marked deleted, set the callpoint!.setDevObject("dtl_posted") to Y

dtl!=gridVect!.getItem(0)
callpoint!.setDevObject("dtl_posted","")
if dtl!.size()
	for x=0 to dtl!.size()-1
		if callpoint!.getGridRowDeleteStatus(x)<>"Y" then callpoint!.setDevObject("dtl_posted","Y")
	next x
endif
[[POE_PODET.AREC]]
callpoint!.setDevObject("qty_this_row",0)
callpoint!.setDevObject("cost_this_row",0)
[[POE_PODET.WAREHOUSE_ID.AVAL]]
rem --- Warehouse ID - After Validataion
rem --- this code was already here... is it right?
if callpoint!.getHeaderColumnData("POE_POHDR.WAREHOUSE_ID")<>pad(callpoint!.getUserInput(),2) then
	msg_id$="PO_WHSE_NOT_MATCH"
	gosub disp_message
endif

gosub validate_whse_item
[[POE_PODET.AGDR]]
rem --- After Grid Display Row

po_line_code$=callpoint!.getColumnData("POE_PODET.PO_LINE_CODE")
if cvs(po_line_code$,2)<>"" then  
    gosub update_line_type_info
endif


total_amt=num(callpoint!.getDevObject("total_amt"))
total_amt=total_amt+round(num(callpoint!.getColumnData("POE_PODET.QTY_ORDERED"))*num(callpoint!.getColumnData("POE_PODET.UNIT_COST")),2)
callpoint!.setDevObject("total_amt",str(total_amt))
[[POE_PODET.PO_LINE_CODE.AVAL]]
rem --- Line Code - After Validataion
rem print 'show',;rem debug
rem print callpoint!.getUserInput();rem debug
rem print callpoint!.getColumnData("POE_PODET.PO_LINE_CODE");rem debug
rem print callpoint!.getColumnUndoData("POE_PODET.PO_LINE_CODE");rem debug
rem print "validation row:", callpoint!.getValidationRow()
rem print "new status:",callpoint!.getGridRowNewStatus(num(callpoint!.getValidationRow()))
rem print "modify status:",callpoint!.getGridRowModifyStatus(num(callpoint!.getValidationRow()))

rem I think if line type changes on existing row, need to uncommit whatever's on this line (assuming old line code was a stock type)

gosub update_line_type_info

if callpoint!.getGridRowNewStatus(num(callpoint!.getValidationRow()))="Y" or cvs(callpoint!.getUserInput(),2)<>cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),2) then
rem if cvs(callpoint!.getColumnData("POE_PODET.WAREHOUSE_ID"),3)="" or cvs(callpoint!.getUserInput(),2)<>cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),2) then
		callpoint!.setColumnData("POE_PODET.CONV_FACTOR","")
		callpoint!.setColumnData("POE_PODET.FORECAST","")
		callpoint!.setColumnData("POE_PODET.ITEM_ID","")
		callpoint!.setColumnData("POE_PODET.LEAD_TIM_FLG","")
		callpoint!.setColumnData("POE_PODET.LOCATION","")
		callpoint!.setColumnData("POE_PODET.NOT_B4_DATE",callpoint!.getHeaderColumnData("POE_POHDR.NOT_B4_DATE"))
		callpoint!.setColumnData("POE_PODET.NS_ITEM_ID","")
		callpoint!.setColumnData("POE_PODET.ORDER_MEMO","")
		callpoint!.setColumnData("POE_PODET.PO_MSG_CODE",callpoint!.getHeaderColumnData("POE_POHDR.PO_MSG_CODE"))
		callpoint!.setColumnData("POE_PODET.PROMISE_DATE",callpoint!.getHeaderColumnData("POE_POHDR.PROMISE_DATE"))
		callpoint!.setColumnData("POE_PODET.REQD_DATE",callpoint!.getHeaderColumnData("POE_POHDR.REQD_DATE"))
		callpoint!.setColumnData("POE_PODET.REQ_QTY","")
		callpoint!.setColumnData("POE_PODET.SO_INT_SEQ_REF","")
		callpoint!.setColumnData("POE_PODET.SOURCE_CODE","")
		callpoint!.setColumnData("POE_PODET.UNIT_COST","")
		callpoint!.setColumnData("POE_PODET.UNIT_MEASURE","")
		callpoint!.setColumnData("POE_PODET.WAREHOUSE_ID",callpoint!.getHeaderColumnData("POE_POHDR.WAREHOUSE_ID"))
		callpoint!.setColumnData("POE_PODET.WO_NO","")
		callpoint!.setColumnData("POE_PODET.WO_SEQ_REF","")

endif
[[POE_PODET.ITEM_ID.AVAL]]
rem --- Item ID - After Column Validataion

gosub validate_whse_item
[[POE_PODET.<CUSTOM>]]
update_line_type_info:

	poc_linecode_dev=fnget_dev("POC_LINECODE")
	dim poc_linecode$:fnget_tpl$("POC_LINECODE")
	if callpoint!.getVariableName()="POE_PODET.PO_LINE_CODE" then
		po_line_code$=callpoint!.getUserInput()
	else
		po_line_code$=callpoint!.getColumnData("POE_PODET.PO_LINE_CODE")
	endif
	read record(poc_linecode_dev,key=firm_id$+po_line_code$,dom=*next)poc_linecode$
	callpoint!.setStatus("ENABLE:"+poc_linecode.line_type$)

return

validate_whse_item:
	ivm_itemwhse_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm_itemwhse$:fnget_tpl$("IVM_ITEMWHSE")
	change_flag=0
	if callpoint!.getVariableName()="POE_PODET.ITEM_ID" then
		item_id$=callpoint!.getUserInput()
		if item_id$<>callpoint!.getColumnData("POE_PODET.ITEM_ID") then 
			change_flag=1
		 endif
	else
		item_id$=callpoint!.getColumnData("POE_PODET.ITEM_ID")
	endif
	if callpoint!.getVariableName()="POE_PODET.WAREHOUSE_ID" then
		whse$=callpoint!.getUserInput()
		if whse$<>callpoint!.getColumnData("POE_PODET.WAREHOUSE_ID") then
			change_flag=1
		endif
	else
		whse$=callpoint!.getColumnData("POE_PODET.WAREHOUSE_ID")
	endif
		
	if change_flag and cvs(item_id$,2)<>"" then
		read record (ivm_itemwhse_dev,key=firm_id$+whse$+item_id$,dom=missing_warehouse) ivm_itemwhse$
		ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
		dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
		read record(ivm_itemmast_dev,key=firm_id$+item_id$)ivm_itemmast$
		callpoint!.setColumnData("POE_PODET.UNIT_MEASURE",ivm_itemmast.purchase_um$)
		callpoint!.setColumnData("POE_PODET.CONV_FACTOR",str(ivm_itemmast.conv_factor))
		if num(callpoint!.getColumnData("POE_PODET.CONV_FACTOR"))=0 then callpoint!.setColumnData("POE_PODET.CONV_FACTOR",str(1))
		if cvs(callpoint!.getColumnData("POE_PODET.LOCATION"),2)="" then callpoint!.setColumnData("POE_PODET.LOCATION","STOCK")
		callpoint!.setColumnData("POE_PODET.UNIT_COST",str(num(callpoint!.getColumnData("POE_PODET.CONV_FACTOR"))*ivm_itemwhse.unit_cost))
	endif
return
	
missing_warehouse:
	callpoint!.setStatus("ABORT")

return

update_header_tots:

if pos(".AVAL"=callpoint!.getCallpointEvent())
	if callpoint!.getVariableName()="POE_PODET.QTY_ORDERED"
		new_qty=num(callpoint!.getUserInput())
		new_cost=num(callpoint!.getColumnData("POE_PODET.UNIT_COST"))
	else
		new_qty=num(callpoint!.getColumnData("POE_PODET.QTY_ORDERED"))
		new_cost=num(callpoint!.getUserInput())
	endif
	gosub calculate_header_tots
endif

if pos(".ADEL"=callpoint!.getCallpointEvent())
	new_qty=0
	new_cost=0
	gosub calculate_header_tots
	callpoint!.setDevObject("qty_this_row",0)
	callpoint!.setDevObject("cost_this_row",0)
endif

if pos(".AUDE"=callpoint!.getCallpointEvent())
	new_cost=num(callpoint!.getColumnData("POE_PODET.UNIT_COST"))
	new_qty=num(callpoint!.getColumnData("POE_PODET.QTY_ORDERED"))
	callpoint!.setDevObject("qty_this_row",0)
	callpoint!.setDevObject("cost_this_row",0)
	gosub calculate_header_tots
	callpoint!.setDevObject("qty_this_row",new_cost)
	callpoint!.setDevObject("cost_this_row",new_qty)
endif

return

calculate_header_tots:

total_amt=num(callpoint!.getDevObject("total_amt"))
old_price=round(num(callpoint!.getDevObject("qty_this_row"))*num(callpoint!.getDevObject("cost_this_row")),2) 
new_price=round(new_qty*new_cost,2)
new_total=total_amt-old_price+new_price
callpoint!.setDevObject("total_amt",new_total)
tamt!=callpoint!.getDevObject("tamt")
tamt!.setValue(new_total)
callpoint!.setHeaderColumnData("<<DISPLAY>>.ORDER_TOTAL",str(new_total))

rem print "amts:"
rem print "total_amt: ",total_amt
rem print "old_price: ",old_price
rem print "new_price: ",new_price
rem print "new_total: ",new_total

return
