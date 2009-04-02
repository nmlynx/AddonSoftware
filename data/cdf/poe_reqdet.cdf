[[POE_REQDET.AGRN]]
rem print 'show',;rem debug
rem print "AGRN";rem debug
rem print "getValidationRow: ",callpoint!.getValidationRow();rem debug
rem print "getGridRowNewStatus: ",callpoint!.getGridRowNewStatus(num(callpoint!.getValidationRow()));rem debug
rem print "getGridRowModifyStatus: ",callpoint!.getGridRowModifyStatus(num(callpoint!.getValidationRow()));rem debug

find_item$=callpoint!.getColumnData("POE_REQDET.ITEM_ID")
if cvs(find_item$,3)<>"" then gosub get_item_desc
[[POE_REQDET.AGCL]]
use ::ado_util.src::util
[[POE_REQDET.BGDR]]
find_item$=callpoint!.getColumnData("POE_REQDET.ITEM_ID")
gosub get_item_desc
[[POE_REQDET.PO_LINE_CODE.AVAL]]
rem --- Line Code - After Validataion
rem print callpoint!.getUserInput();rem debug
rem print callpoint!.getColumnData("POE_REQDET.PO_LINE_CODE");rem debug
rem print "validation row:", callpoint!.getValidationRow()
rem print "new status:",callpoint!.getGridRowNewStatus(num(callpoint!.getValidationRow()))
rem print "modify status:",callpoint!.getGridRowModifyStatus(num(callpoint!.getValidationRow()))


gosub update_line_type_info

         if cvs(callpoint!.getUserInput(),2)<>cvs(callpoint!.getColumnData("POE_REQDET.PO_LINE_CODE"),2) then

		callpoint!.setColumnData("POE_REQDET.CONV_FACTOR","")
		callpoint!.setColumnData("POE_REQDET.FORECAST","")
		callpoint!.setColumnData("POE_REQDET.ITEM_ID","")
		callpoint!.setColumnData("POE_REQDET.LEAD_TIM_FLG","")
		callpoint!.setColumnData("POE_REQDET.LOCATION","")
		callpoint!.setColumnData("POE_REQDET.NOT_B4_DATE",callpoint!.getHeaderColumnData("POE_REQHDR.NOT_B4_DATE"))
		callpoint!.setColumnData("POE_REQDET.NS_ITEM_ID","")
		callpoint!.setColumnData("POE_REQDET.ORDER_MEMO","")
		callpoint!.setColumnData("POE_REQDET.PO_MSG_CODE",callpoint!.getHeaderColumnData("POE_REQHDR.PO_MSG_CODE"))
		callpoint!.setColumnData("POE_REQDET.PROMISE_DATE",callpoint!.getHeaderColumnData("POE_REQHDR.PROMISE_DATE"))
		callpoint!.setColumnData("POE_REQDET.REQD_DATE",callpoint!.getHeaderColumnData("POE_REQHDR.REQD_DATE"))
		callpoint!.setColumnData("POE_REQDET.REQ_QTY","")
		callpoint!.setColumnData("POE_REQDET.SO_INT_SEQ_REF","")
		callpoint!.setColumnData("POE_REQDET.SOURCE_CODE","")
		callpoint!.setColumnData("POE_REQDET.UNIT_COST","")
		callpoint!.setColumnData("POE_REQDET.UNIT_MEASURE","")
		callpoint!.setColumnData("POE_REQDET.WAREHOUSE_ID",callpoint!.getHeaderColumnData("POE_REQHDR.WAREHOUSE_ID"))
		callpoint!.setColumnData("POE_REQDET.WO_NO","")
		callpoint!.setColumnData("POE_REQDET.WO_SEQ_REF","")


 	endif
[[POE_REQDET.REQ_QTY.AVAL]]
rem --- call poc.ua to retrieve unit cost from ivm-05, at least that's what v6 did here
rem --- send in: R/W for retrieve or write
rem                   R for req, P for PO, Q for QA recpt, C for PO recpt
rem                   vendor_id and ord_date from header rec
rem                   item_id,conv factor, unit cost, req qty or ordered qty from detail record
rem                   IV precision from iv params rec
rem 			status

vendor_id$=callpoint!.getHeaderColumnData("POE_REQHDR.VENDOR_ID")
ord_date$=callpoint!.getHeaderColumnData("POE_REQHDR.ORD_DATE")
item_id$=callpoint!.getColumnData("POE_REQDET.ITEM_ID")
conv_factor=num(callpoint!.getColumnData("POE_REQDET.CONV_FACTOR"))
unit_cost=num(callpoint!.getColumnData("POE_REQDET.UNIT_COST"))
req_qty=num(callpoint!.getUserInput())
status=0

call stbl("+DIR_PGM")+"poc_itemvend.aon","R","R",vendor_id$,ord_date$,item_id$,conv_factor,unit_cost,req_qty,callpoint!.getDevObject("iv_prec"),status

callpoint!.setColumnData("POE_REQDET.UNIT_COST",str(unit_cost))

[[POE_REQDET.AREC]]
rem -- was trying to set the default line code to "S" in here, but it caused problems... grid row confusion, and no aval firing if you just tab out of the
rem --	default on 2nd/subsequent rows... turns out cleaner to just let it default to (none) and have user select each time.  So all that's currently
rem --	happening in here is initialization of the item description stbl

rem -- set default line code 

rem callpoint!.setColumnData("POE_REQDET.PO_LINE_CODE",str(callpoint!.getDevObject("dflt_po_line_code")))
rem gosub update_line_type_info

x$=stbl("+POE_REQDET_ITEM_DESC","")

rem if callpoint!.getDevObject("so_ldat")<>null()
rem	callpoint!.setTableColumnAttribute("POE_REQDET.SO_INT_SEQ_REF","LDAT",str(callpoint!.getDevObject("so_ldat")))
rem endif

rem util.forceFocus(callpoint!,"PO_LINE_CODE")
rem util.forceEdit(Form!,num(callpoint!.getValidationRow()),0)
rem callpoint!.setStatus("MODIFIED-REFRESH")
[[POE_REQDET.WAREHOUSE_ID.AVAL]]
rem --- Warehouse ID - After Validataion
	gosub validate_whse_item
[[POE_REQDET.AGDR]]
rem --- After Grid Display Row
	po_line_code$=callpoint!.getColumnData("POE_REQDET.PO_LINE_CODE")
	if cvs(po_line_code$,2)<>"" then  
	    gosub update_line_type_info
	endif
[[POE_REQDET.ITEM_ID.AVAL]]
rem --- did user enter item#, or are we trying to do synonym lookup, or ? for custom lookup

find_item$=callpoint!.getUserInput()
found_item=0
ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")

rem --- Save current row/column so we'll know where to set focus when we return from lot lookup

declare BBjStandardGrid grid!
grid! = util.getGrid(Form!)
return_to_row = grid!.getSelectedRow()
return_to_col = grid!.getSelectedColumn()
	
rem --- if userInput() is a "?", call custom inquiry

	if cvs(callpoint!.getUserInput(),3)="?"
		call stbl("+DIR_SYP")+"bam_run_prog.bbj","IVC_ITEMLOOKUP",stbl("+USER_ID"),"MNT","",table_chans$[all]
		util.forceEdit(Form!, return_to_row, return_to_col)
		find_item$=callpoint!.getDevObject("find_item")
		read record (ivm_itemmast_dev,key=firm_id$+find_item$,dom=*endif)ivm_itemmast$
		callpoint!.setUserInput(find_item$)
		x$=stbl("+POE_REQDET_ITEM_DESC",cvs(ivm_itemmast.item_desc$,3))
		gosub validate_whse_item
	else
		read record (ivm_itemmast_dev,key=firm_id$+find_item$,dom=*next)ivm_itemmast$;found_item=1
			if found_item=1
				x$=stbl("+POE_REQDET_ITEM_DESC",cvs(ivm_itemmast.item_desc$,3))
				gosub validate_whse_item
			else
				rem --- otherwise, try synonym lookup
				call stbl("+DIR_SYP")+"bac_key_template.bbj","IVM_ITEMSYN","PRIMARY",key_tpl$,table_chans$[all],rd_stat$
				dim return_key$:key_tpl$

				call stbl("+DIR_SYP")+"bam_inquiry.bbj",gui_dev,Form!,"IVM_ITEMSYN","LOOKUP",
:					table_chans$[all],firm_id$,"PRIMARY",return_key$

				util.forceEdit(Form!, return_to_row, return_to_col)

				if cvs(return_key$,3)<>""
					find_item$=return_key.item_id$
					read record (ivm_itemmast_dev,key=firm_id$+find_item$,dom=*next)ivm_itemmast$
					x$=stbl("+POE_REQDET_ITEM_DESC",cvs(ivm_itemmast.item_desc$,3))
					callpoint!.setUserInput(ivm_itemmast.item_id$)
					gosub validate_whse_item
				endif
			endif
	endif
		







	
[[POE_REQDET.<CUSTOM>]]
update_line_type_info:
	poc_linecode_dev=fnget_dev("POC_LINECODE")
	dim poc_linecode$:fnget_tpl$("POC_LINECODE")

	if callpoint!.getVariableName()="POE_REQDET.PO_LINE_CODE" then
		po_line_code$=callpoint!.getUserInput()
	else
		po_line_code$=callpoint!.getColumnData("POE_REQDET.PO_LINE_CODE")
	endif
	read record(poc_linecode_dev,key=firm_id$+po_line_code$,dom=*next)poc_linecode$
	callpoint!.setStatus("ENABLE:"+poc_linecode.line_type$)

return

validate_whse_item:
	ivm_itemwhse_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm_itemwhse$:fnget_tpl$("IVM_ITEMWHSE")
	change_flag=0

	if callpoint!.getVariableName()="POE_REQDET.ITEM_ID" then
		item_id$=callpoint!.getUserInput()
		if item_id$<>callpoint!.getColumnData("POE_REQDET.ITEM_ID") then 
			change_flag=1
		 endif
	else
		item_id$=callpoint!.getColumnData("POE_REQDET.ITEM_ID")
	endif
	if callpoint!.getVariableName()="POE_REQDET.WAREHOUSE_ID" then
		whse$=callpoint!.getUserInput()
		if whse$<>callpoint!.getColumnData("POE_REQDET.WAREHOUSE_ID") then
			change_flag=1
		endif
	else
		whse$=callpoint!.getColumnData("POE_REQDET.WAREHOUSE_ID")
	endif
	
	if change_flag and cvs(item_id$,2)<>"" then
rem	if cvs(item_id$,2)<>"" then
		read record (ivm_itemwhse_dev,key=firm_id$+whse$+item_id$,knum=0,dom=missing_warehouse) ivm_itemwhse$
		ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
		dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
		read record(ivm_itemmast_dev,key=firm_id$+item_id$)ivm_itemmast$
		callpoint!.setColumnData("POE_REQDET.UNIT_MEASURE",ivm_itemmast.purchase_um$)
		callpoint!.setColumnData("POE_REQDET.CONV_FACTOR",str(ivm_itemmast.conv_factor))
		if num(callpoint!.getColumnData("POE_REQDET.CONV_FACTOR"))=0 then callpoint!.setColumnData("POE_REQDET.CONV_FACTOR",str(1))
		if cvs(callpoint!.getColumnData("POE_REQDET.LOCATION"),2)="" then callpoint!.setColumnData("POE_REQDET.LOCATION","STOCK")
		callpoint!.setColumnData("POE_REQDET.UNIT_COST",str(num(callpoint!.getColumnData("POE_REQDET.CONV_FACTOR"))*ivm_itemwhse.unit_cost))
	endif
return
		
missing_warehouse:
	msg_id$="IV_ITEM_WHSE_INVALID"
	dim msg_tokens$[1]
	msg_tokens$[1]=whse$
	gosub disp_message
	callpoint!.setStatus("ABORT")

return

get_item_desc:

	ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")

	read record (ivm_itemmast_dev,key=firm_id$+find_item$,dom=*next)ivm_itemmast$
	x$=stbl("+POE_REQDET_ITEM_DESC",cvs(ivm_itemmast.item_desc$,3))

return

rem #include fnget_control.src

def fnget_control!(ctl_name$)

ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
get_control!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
return get_control!

fnend

rem #endinclude fnget_control.src
		
