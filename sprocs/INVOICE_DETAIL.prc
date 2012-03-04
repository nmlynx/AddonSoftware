rem INVOICE_DETAIL.prc
rem 
rem AddonSoftware
rem Copyright BASIS International Ltd.
rem ----------------------------------------------------------------------------

rem Declare some variables ahead of time
declare BBjStoredProcedureData sp!
declare BBjRecordSet rs!
declare BBjRecordData data!
 
 
rem Get the infomation object for the Stored Procedure
sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem Get the IN and IN/OUT parameters used by the procedure
firm_id$ = sp!.getParameter("FIRM_ID")
customer_id$ = sp!.getParameter("CUSTOMER_ID")
order_no$ = sp!.getParameter("ORDER_NO")
store_master_id$ = sp!.getParameter("STORE_MASTER_ID")
complete_bill = num(sp!.getParameter("COMPLETE_BILL"))

rem Create a memory record set to hold sample results.
rem Columns for the record set are defined using a string template
rs! = BBJAPI().createMemoryRecordSet("POSITION:C(7), ITEM_ID:C(40), ITEM_DESC:C(60), AMOUNT:C(7), VAT:C(7), SINGLE_PRICE:N(7), SUB_TOTAL:N(7)")

dbserver$=stbl("+DBSERVER",err=*next)
dbsqlport$=":"+stbl("+DBSQLPORT",err=*next)
dbssl=num(stbl("+DBSSL",err=*next))
dbtimeout$="&socket_timeout="+stbl("+DBTIMEOUT")

if dbssl
	dbssl$="&ssl=true"
else
	dbssl$="&ssl=false"
endif

url_user$="&user=guest"
if stbl("!DSUDDB",err=*endif)<>"" then
	url_user$=""
endif

dbname$ = stbl("+DBNAME",err=*next)
dbname_api$ = stbl("+DBNAME_API",err=*next)
if pos("jdbc:apache"=cvs(dbname$,8))=1 then
	url$ = dbname$
else
	if pos("jdbc:"=cvs(dbname$,8))=1 then			
		url$=dbname$+url_user$
	else
		url$ = "jdbc:basis:"+dbserver$+dbsqlport$+"?database="+dbname_api$+url_user$+dbssl$+dbtimeout$
	endif
endif
mode$="mode=PROCEDURE"


rem sql$ = "SELECT ITEM_ID, QTY_ORDERED, QTY_SHIPPED, LINE_CODE, ORDER_MEMO, INTERNAL_SEQ_NO, UNIT_PRICE, EXT_PRICE FROM OPE_ORDDET WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "' AND ORDER_NO='" + order_no$ + "'"
if complete_bill = 1 then
    sql$ = "SELECT OOD.INTERNAL_SEQ_NO, OOD.ITEM_ID, SOD.ITEM_DESC_MAN, OOD.QTY_ORDERED, OOD.QTY_SHIPPED, SOD.QTY_CHARGED, OOD.LINE_CODE, OOD.ORDER_MEMO, OOD.UNIT_PRICE, SOD.VAT_PERCENT, ROUND(OOD.UNIT_PRICE * (1 + SOD.VAT_PERCENT/100),2) AS BRUTO_PRICE, ROUND(ROUND(OOD.UNIT_PRICE * (1 + SOD.VAT_PERCENT/100),2) * OOD.QTY_ORDERED,2) AS ROW_PRICE FROM OPE_ORDDET OOD INNER JOIN STO_ORDDET SOD ON OOD.FIRM_ID = SOD.FIRM_ID AND OOD.ORDER_NO = SOD.ORDER_NO AND OOD.LINE_NO = SOD.LINE_NO WHERE OOD.FIRM_ID='"+firm_id$+"' AND OOD.CUSTOMER_ID='"+customer_id$+"' AND OOD.ORDER_NO='"+order_no$+"'"
else
    sql$ = "SELECT OOD.INTERNAL_SEQ_NO, OOD.ITEM_ID, SOD.ITEM_DESC_MAN, OOD.QTY_ORDERED, OOD.QTY_SHIPPED, SOD.QTY_CHARGED, OOD.LINE_CODE, OOD.ORDER_MEMO, OOD.UNIT_PRICE, SOD.VAT_PERCENT, ROUND(OOD.UNIT_PRICE * (1 + SOD.VAT_PERCENT/100),2) AS BRUTO_PRICE, ROUND(ROUND(OOD.UNIT_PRICE * (1 + SOD.VAT_PERCENT/100),2) * (OOD.QTY_SHIPPED-SOD.QTY_CHARGED),2) AS ROW_PRICE FROM OPE_ORDDET OOD INNER JOIN STO_ORDDET SOD ON OOD.FIRM_ID = SOD.FIRM_ID AND OOD.ORDER_NO = SOD.ORDER_NO AND OOD.LINE_NO = SOD.LINE_NO WHERE OOD.FIRM_ID='"+firm_id$+"' AND OOD.CUSTOMER_ID='"+customer_id$+"' AND OOD.ORDER_NO='"+order_no$+"' AND OOD.QTY_SHIPPED-SOD.QTY_CHARGED > 0"
endif

sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)

if sqlRs!.isEmpty() then
    goto sp_end
endif

i=1
while 1
    data! = rs!.getEmptyRecordData()
    sqlRd! = sqlRs!.getCurrentRecordData()

    item_id$ = sqlRd!.getFieldValue("ITEM_ID")
    qty_ordered = num(sqlRd!.getFieldValue("QTY_ORDERED"))
    qty_shipped = num(sqlRd!.getFieldValue("QTY_SHIPPED"))
    qty_charged = num(sqlRd!.getFieldValue("QTY_CHARGED"))
    vat = num(sqlRd!.getFieldValue("VAT_PERCENT"))
    line_code$ = sqlRd!.getFieldValue("LINE_CODE")
    order_memo$ = sqlRd!.getFieldValue("ORDER_MEMO")
    internal_seq_no$ = sqlRd!.getFieldValue("INTERNAL_SEQ_NO")
    unit_price = num(sqlRd!.getFieldValue("UNIT_PRICE"))


    data!.setFieldValue("POSITION",str(i:"000"))
    if complete_bill then
        data!.setFieldValue("AMOUNT", str(qty_ordered))
    else
        data!.setFieldValue("AMOUNT", str(qty_shipped-qty_charged))
    endif
    data!.setFieldValue("ITEM_ID", sqlRd!.getFieldValue("ITEM_ID"))
    data!.setFieldValue("ITEM_DESC", sqlRd!.getFieldValue("ITEM_DESC_MAN"))
    data!.setFieldValue("SINGLE_PRICE", str(num(sqlRd!.getFieldValue("BRUTO_PRICE")):"#,##0.00"))
    data!.setFieldValue("SUB_TOTAL", str(num(sqlRd!.getFieldValue("ROW_PRICE")):"#,##0.00"))

    data!.setFieldValue("VAT",str(vat))

goto skip2
    if pos(sqlRd2!.getFieldValue("LINE_TYPE")=" SRDNP") then
        data!.setFieldValue("SINGLE_PRICE", str(unit_price))
    endif

    data!.setFieldValue("SUB_TOTAL", str(unit_price*(qty_shipped-qty_charged)))
skip2:

    rs!.insert(data!)

    sqlRs!.next(err=*break)

    i=i+1
wend

sp_end:
rem Tell the stored procedure to return the result set.
sp!.setRecordSet(rs!)