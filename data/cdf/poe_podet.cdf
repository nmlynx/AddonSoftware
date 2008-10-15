[[POE_PODET.WAREHOUSE_ID.AVAL]]
if callpoint!.getHeaderColumnData("POE_REQHDR.WAREHOUSE_ID")<>pad(callpoint!.getUserInput(),2) then
	msg_id$="PO_WHSE_NOT_MATCH"
	gosub disp_message
endif
[[POE_PODET.AGDR]]
po_line_code$=rec_data.po_line_code$
if cvs(po_line_code$,2)<>"" then  
    gosub update_line_type_info
endif
[[POE_PODET.ITEM_ID.AINP]]
if cvs(callpoint!.getUserInput(),2)=cvs(callpoint!.getColumnData("POE_PODET.ITEM_ID"),2) then
	user_tpl.change_flag=0
else
	user_tpl.change_flag=1
endif
[[POE_PODET.PO_LINE_CODE.AINP]]
if cvs(callpoint!.getUserInput(),2)=cvs(callpoint!.getColumnData("POE_PODET.PO_LINE_CODE"),2) then
	user_tpl.change_flag=0
else
	user_tpl.change_flag=1
endif
[[POE_PODET.PO_LINE_CODE.AVAL]]
gosub update_line_type_info

if user_tpl.change_flag then
	callpoint!.setColumnData("POE_PODET.CONV_FACTOR","")
	callpoint!.setColumnData("POE_PODET.CUSTOMER_ID","")
	callpoint!.setColumnData("POE_PODET.FORECAST","")
	callpoint!.setColumnData("POE_PODET.ITEM_ID","")
	callpoint!.setColumnData("POE_PODET.LEAD_TIM_FLG","")
	callpoint!.setColumnData("POE_PODET.LINE_NO","")
	callpoint!.setColumnData("POE_PODET.LOCATION","")
	callpoint!.setColumnData("POE_PODET.NOT_B4_DATE",callpoint!.getHeaderColumnData("POE_REQHDR.NOT_B4_DATE"))
	callpoint!.setColumnData("POE_PODET.NS_ITEM_ID","")
	callpoint!.setColumnData("POE_PODET.ORDER_MEMO","")
	callpoint!.setColumnData("POE_PODET.PO_MSG_CODE",callpoint!.getHeaderColumnData("POE_REQHDR.PO_MSG_CODE"))
	callpoint!.setColumnData("POE_PODET.PROMISE_DATE",callpoint!.getHeaderColumnData("POE_REQHDR.PROMISE_DATE"))
	callpoint!.setColumnData("POE_PODET.REQD_DATE",callpoint!.getHeaderColumnData("POE_REQHDR.REQD_DATE") )
	callpoint!.setColumnData("POE_PODET.REQ_QTY","")
	callpoint!.setColumnData("POE_PODET.SEQUENCE_NO","")
	callpoint!.setColumnData("POE_PODET.SHIPTO_NO","")
	callpoint!.setColumnData("POE_PODET.SOURCE_CODE","")
	callpoint!.setColumnData("POE_PODET.UNIT_COST","")
	callpoint!.setColumnData("POE_PODET.UNIT_MEASURE","")
	callpoint!.setColumnData("POE_PODET.WAREHOUSE_ID",callpoint!.getHeaderColumnData("POE_REQHDR.WAREHOUSE_ID"))
	callpoint!.setColumnData("POE_PODET.WO_NO","")
	
endif
[[POE_PODET.ITEM_ID.AVAL]]
ivm_itemwhse_dev=fnget_dev("IVM_ITEMWHSE")
dim ivm_itemwhse$:fnget_tpl$("IVM_ITEMWHSE")

whse$=rec_data.warehouse_id$
item_no$=callpoint!.getUserInput()

read record(ivm_itemwhse_dev,key=firm_id$+whse$+item_no$,dom=missing_warehouse)ivm_itemwhse$
goto not_missing_warehouse
missing_warehouse:
	callpoint!.setStatus("ABORT")
not_missing_warehouse:

if user_tpl.change_flag then
	ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
	read record(ivm_itemmast_dev,key=firm_id$+item_no$)ivm_itemmast$
	callpoint!.setColumnData("POE_PODET.UNIT_MEASURE",ivm_itemmast.purchase_um$)
	callpoint!.setColumnData("POE_PODET.CONV_FACTOR",str(ivm_itemmast.conv_factor))
	if num(callpoint!.getColumnData("POE_PODET.CONV_FACTOR"))=0 then callpoint!.setColumnData("POE_PODET.CONV_FACTOR",str(1))
	if cvs(callpoint!.getColumnData("POE_PODET.LOCATION"),2)="" then callpoint!.setColumnData("POE_PODET.LOCATION","STOCK")
	callpoint!.setColumnData("POE_PODET.UNIT_COST",str(num(callpoint!.getColumnData("POE_PODET.CONV_FACTOR"))*ivm_itemwhse.unit_cost))
endif
[[POE_PODET.ARAR]]
if cvs(rec_data.po_line_code$,2)="" then
	wgrid!=form!.getChildWindow(1109).getControl(5900)
	wrow=wgrid!.getSelectedRow()
	wgrid!.setSelectedCell(wrow,0)
endif

gosub update_line_type_info
[[POE_PODET.<CUSTOM>]]
update_line_type_info:

	poc_linecode_dev=fnget_dev("POC_LINECODE")
	dim poc_linecode$:fnget_tpl$("POC_LINECODE")
	po_line_code$=rec_data.po_line_code$
	read record(poc_linecode_dev,key=firm_id$+po_line_code$,dom=*next)poc_linecode$
	callpoint!.setStatus("ENABLE:"+poc_linecode.line_type$)

return


