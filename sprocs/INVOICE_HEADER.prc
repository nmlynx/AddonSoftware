rem ----------------------------------------------------------------------------
rem Program: INVOICE_HEADER.prc
rem Description: Stored Procedure to get the header and footer informations to print on the invoices
rem
rem Author(s): S. Birster
rem Revised: 02.23.2011
rem ----------------------------------------------------------------------------

rem Set of utility methods
use ::ado_func.src::func

rem Declare some variables ahead of time
declare BBjStoredProcedureData sp!
declare BBjRecordSet rs!
declare BBjRecordData data!

rem Get the infomation object for the Stored Procedure
sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem Get the IN parameters used by the procedure
firm_id$ = sp!.getParameter("FIRM_ID")
customer_id$ = sp!.getParameter("CUSTOMER_ID")
order_no$ = sp!.getParameter("ORDER_NO")
invoice_no$ = sp!.getParameter("INVOICE_NO")
store_master_id$ = sp!.getParameter("STORE_MASTER_ID")
vat_01$ = sp!.getParameter("VAT_01")
vat_02$ = sp!.getParameter("VAT_02")
html_path$ = sp!.getParameter("HTML_PATH")

rem Create a memory record set to hold results.
rem Columns for the record set are defined using a string template
rs! = BBJAPI().createMemoryRecordSet("LOGO:C(128), COMP_LINE_01:C(30), COMP_LINE_02:C(30), COMP_LINE_03:C(30), COMP_LINE_04:C(30), COMP_LINE_05:C(30), COMP_LINE_06:C(30),
:                                     COMP_LINE_07:C(30), COMP_LINE_08:C(30), COMP_LINE_09:C(30), COMP_LINE_10:C(30), COMP_LINE_11:C(30), COMP_LINE_12:C(30),
:                                     COMP_LINE_13:C(30), COMP_LINE_14:C(30), COMP_LINE_15:C(30), COMP_LINE_16:C(30), COMP_LINE_17:C(30), COMP_LINE_18:C(30),
:                                     BILL_ADDR_LINE_1:C(30), BILL_ADDR_LINE_2:C(30), BILL_ADDR_LINE_3:C(30), BILL_ADDR_LINE_4:C(30), BILL_ADDR_LINE_5:C(30),
:                                     SHIP_ADDR_LINE_1:C(30), SHIP_ADDR_LINE_2:C(30), SHIP_ADDR_LINE_3:C(30), SHIP_ADDR_LINE_4:C(30), SHIP_ADDR_LINE_5:C(30),
:                                     INVOICE_NO:C(7), SUB_TOTAL:N(7), VAT_01:N(7), VAT_02:N(7), DISCOUNT:N(7), FREIGHT:N(7), EXPRESS:N(7), INTERNATIONAL:N(7), TOTAL:N(7), MESSAGE:C(40*)")

line_width = 30

dbserver$=stbl("+DBSERVER",err=*next)
dbsqlport$=":"+stbl("+DBSQLPORT",err=*next)
dbssl=num(stbl("+DBSSL",err=*next))
dbtimeout$="&socket_timeout="+stbl("+DBTIMEOUT",err=*next)

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

line_width = 30

rem url$="jdbc:basis:localhost?DATABASE=S1000&SSL=false&USER=admin&PASSWORD=admin123"

data! = rs!.getEmptyRecordData()

data!.setFieldValue("LOGO",html_path$+"own\images\emaillogo.jpg")

sql$ = "SELECT SHPMETH_COSTS FROM STO_ORDHDR WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "' AND ORDER_NO='" + order_no$ + "'"
sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
sqlRd! = sqlRs!.getCurrentRecordData()
express = num(sqlRd!.getFieldValue("SHPMETH_COSTS"))
data!.setFieldValue("EXPRESS", str(express))

sub_total=0
vat! = new java.util.HashMap()

sql$ = "SELECT UNIT_PRICE,QTY_SHIPPED FROM OPE_ORDDET WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "' AND ORDER_NO='" + order_no$ + "'"
sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
sql$ = "SELECT QTY_CHARGED,VAT_AMOUNT,VAT_PERCENT FROM STO_ORDDET WHERE FIRM_ID='" + firm_id$ + "' AND ORDER_NO='" + order_no$ + "'"
sqlRs2! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)

vat_percent$=""
if !(sqlRs!.isEmpty()) then
    while 1
        sqlRd! = sqlRs!.getCurrentRecordData()
        sqlRd2! = sqlRs2!.getCurrentRecordData()
        sub_total = sub_total + (num(sqlRd!.getFieldValue("UNIT_PRICE"))*(num(sqlRd!.getFieldValue("QTY_SHIPPED"))-num(sqlRd2!.getFieldValue("QTY_CHARGED"))))
        vat_percent$=cvs(sqlRd2!.getFieldValue("VAT_PERCENT"),3)
        if !(vat!.containsKey(vat_percent$)) then
            vat!.put(vat_percent$,0)
        endif
        vat!.put(vat_percent$,vat!.get(vat_percent$)+(num(sqlRd2!.getFieldValue("VAT_AMOUNT"))*(num(sqlRd!.getFieldValue("QTY_SHIPPED"))-num(sqlRd2!.getFieldValue("QTY_CHARGED")))))

        sqlRs!.next(err=*break)
        sqlRs2!.next(err=*break)
    wend
endif

data!.setFieldValue("SUB_TOTAL", str(sub_total))
data!.setFieldValue("VAT_01", str(0))
data!.setFieldValue("VAT_02", str(0))

if vat!<>null() and !(vat!.isEmpty()) then
    keySet! = vat!.keySet()
    it! = keySet!.iterator()

    i=1
    while it!.hasNext()
        vat_percent$ = it!.next()
        if vat_percent$=vat_01$ then
            data!.setFieldValue("VAT_01", str(vat!.get(vat_percent$)))
        endif
        if vat_percent$=vat_02$ then
            data!.setFieldValue("VAT_02", str(vat!.get(vat_percent$)))
        endif
        i=i+1
    wend
endif



sql$="SELECT INVOICE_DATE, AR_INV_NO, ORDER_DATE, SLSPSN_CODE, CUSTOMER_PO_NO, AR_SHIP_VIA, SHIPMNT_DATE, TERMS_CODE, DISCOUNT_AMT, TAX_AMOUNT, FREIGHT_AMT, SHIPTO_TYPE, SHIPTO_NO, MESSAGE_CODE FROM OPE_ORDHDR WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "' AND ORDER_NO='" + order_no$ + "'"
sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
sqlRd! = sqlRs!.getCurrentRecordData()

rem data!.setFieldValue("INVOICE_NO", sqlRd!.getFieldValue("AR_INV_NO"))
data!.setFieldValue("INVOICE_NO", invoice_no$)
data!.setFieldValue("DISCOUNT", "-"+sqlRd!.getFieldValue("DISCOUNT_AMT"))
data!.setFieldValue("FREIGHT", sqlRd!.getFieldValue("FREIGHT_AMT"))
shipto_type$=sqlRd!.getFieldValue("SHIPTO_TYPE")
shipto_no$=sqlRd!.getFieldValue("SHIPTO_NO")
message_code$=sqlRd!.getFieldValue("MESSAGE_CODE")
slspsn_code$=sqlRd!.getFieldValue("SLSPSN_CODE")
terms_code$=sqlRd!.getFieldValue("TERMS_CODE")

url2$="jdbc:basis:localhost?DATABASE=storeadmin&SSL=false&USER=admin&PASSWORD=admin123"

sql$="SELECT NAME, ADDR_LINE_1, ADDR_LINE_2, ZIP_CODE, CITY, PHONE, FAX, EMAIL, WEBSITE, CNTRY_ID FROM STA_STOREMASTER WHERE MASTER_ID='"+store_master_id$+"'"
sqlRs! = BBJAPI().createSQLRecordSet(url2$,mode$,sql$)
if !(sqlRs!.isEmpty()) then
    sqlRd! = sqlRs!.getCurrentRecordData()

    i=1
    data!.setFieldValue("COMP_LINE_"+str(i:"00"), cvs(sqlRd!.getFieldValue("NAME"),3))
    i=i+1
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_1"),3)<>"" then
        data!.setFieldValue("COMP_LINE_"+str(i:"00"), cvs(sqlRd!.getFieldValue("ADDR_LINE_1"),3))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_2"),3)<>"" then
        data!.setFieldValue("COMP_LINE_"+str(i:"00"), cvs(sqlRd!.getFieldValue("ADDR_LINE_2"),3))
        i=i+1
    endif
    data!.setFieldValue("COMP_LINE_"+str(i:"00"), cvs(sqlRd!.getFieldValue("ZIP_CODE"),3)+" "+cvs(sqlRd!.getFieldValue("CITY"),3))
    i=i+2

    if cvs(sqlRd!.getFieldValue("PHONE"),3)<>"" then
        data!.setFieldValue("COMP_LINE_"+str(i:"00"), "Tel.: "+cvs(sqlRd!.getFieldValue("PHONE"),3))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("FAX"),3)<>"" then
        data!.setFieldValue("COMP_LINE_"+str(i:"00"), "Fax: "+cvs(sqlRd!.getFieldValue("FAX"),3))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("WEBSITE"),3)<>"" then
        data!.setFieldValue("COMP_LINE_"+str(i:"00"), "http://"+cvs(sqlRd!.getFieldValue("WEBSITE"),3))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("EMAIL"),3)<>"" then
        data!.setFieldValue("COMP_LINE_"+str(i:"00"), "email: "+cvs(sqlRd!.getFieldValue("EMAIL"),3))
        i=i+1
    endif
    storeCountryId$=cvs(sqlRd!.getFieldValue("CNTRY_ID"),3)
endif

rem url$="jdbc:basis:localhost?DATABASE=S1000&SSL=false&USER=admin&PASSWORD=admin123"
sql$="SELECT CUSTOMER_ID, CUSTOMER_NAME, ADDR_LINE_1, ADDR_LINE_2, ADDR_LINE_3, CITY, ZIP_CODE, COUNTRY FROM ARM_CUSTMAST WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "'"
sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
sqlRd! = sqlRs!.getCurrentRecordData()

i=1
if cvs(sqlRd!.getFieldValue("CUSTOMER_NAME"),3)<>"" then
    data!.setFieldValue("BILL_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("CUSTOMER_NAME"))
    i=i+1
endif
if cvs(sqlRd!.getFieldValue("ADDR_LINE_1"),3)<>"" then
    data!.setFieldValue("BILL_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_1"))
    i=i+1
endif
if cvs(sqlRd!.getFieldValue("ADDR_LINE_2"),3)<>"" then
    data!.setFieldValue("BILL_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_2"))
    i=i+1
endif
if cvs(sqlRd!.getFieldValue("ADDR_LINE_3"),3)<>"" then
    data!.setFieldValue("BILL_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_3"))
    i=i+1
endif
data!.setFieldValue("BILL_ADDR_LINE_"+str(i), cvs(sqlRd!.getFieldValue("ZIP_CODE"),3)+" "+cvs(sqlRd!.getFieldValue("CITY"),3))

i=1
if cvs(sqlRd!.getFieldValue("CUSTOMER_NAME"),3)<>"" then
    data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("CUSTOMER_NAME"))
    i=i+1
endif
if cvs(sqlRd!.getFieldValue("ADDR_LINE_1"),3)<>"" then
    data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_1"))
    i=i+1
endif
if cvs(sqlRd!.getFieldValue("ADDR_LINE_2"),3)<>"" then
    data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_2"))
    i=i+1
endif
if cvs(sqlRd!.getFieldValue("ADDR_LINE_3"),3)<>"" then
    data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_3"))
    i=i+1
endif
data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), cvs(sqlRd!.getFieldValue("ZIP_CODE"),3)+" "+cvs(sqlRd!.getFieldValue("CITY"),3))
countryId$ = cvs(sqlRd!.getFieldValue("COUNTRY"),3)

rem Get Ship To address from Manual Ship To table
if shipto_type$="M" then
    sql$="SELECT CUSTOMER_ID, CUSTOMER_NAME, ADDR_LINE_1, ADDR_LINE_2, ADDR_LINE_3, CITY, ZIP_CODE, CNTRY_ID FROM OPE_ORDSHIP WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "' AND ORDER_NO'"+ order_no$ +"'"
    sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
    sqlRd! = sqlRs!.getCurrentRecordData()

    i=1
    if cvs(sqlRd!.getFieldValue("CUSTOMER_NAME"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("CUSTOMER_NAME"))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_1"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_1"))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_2"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_2"))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_3"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_3"))
        i=i+1
    endif
    data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), cvs(sqlRd!.getFieldValue("ZIP_CODE"),3)+" "+cvs(sqlRd!.getFieldValue("CITY"),3))
    countryId$ = cvs(sqlRd!.getFieldValue("CNTRY_ID"),3)
endif

rem Get Ship To address from Customer Ship To table
if shipto_type$="S" then
    sql$="SELECT CUSTOMER_ID, CUSTOMER_NAME, ADDR_LINE_1, ADDR_LINE_2, ADDR_LINE_3, CITY, STATE_CODE, ZIP_CODE, CNTRY_ID FROM ARM_CUSTSHIP WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "' AND SHIPTO_NO='"+ shipto_no$ +"'"
    sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
    sqlRd! = sqlRs!.getCurrentRecordData()

    i=1
    if cvs(sqlRd!.getFieldValue("CUSTOMER_NAME"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("CUSTOMER_NAME"))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_1"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_1"))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_2"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_2"))
        i=i+1
    endif
    if cvs(sqlRd!.getFieldValue("ADDR_LINE_3"),3)<>"" then
        data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), sqlRd!.getFieldValue("ADDR_LINE_3"))
        i=i+1
    endif
    data!.setFieldValue("SHIP_ADDR_LINE_"+str(i), cvs(sqlRd!.getFieldValue("ZIP_CODE"),3)+" "+cvs(sqlRd!.getFieldValue("CITY"),3))
    countryId$ = cvs(sqlRd!.getFieldValue("CNTRY_ID"),3)
endif

international=0
if countryId$<>storeCountryId$ then
    sql$="SELECT SHIPCOSTS FROM STO_COUNTRY WHERE LANGUAGE_ID='" + storeCountryId$ + "' AND COUNTRY_ID='" + countryId$ + "'"
    sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
    sqlRd! = sqlRs!.getCurrentRecordData()
    international=num(sqlRd!.getFieldValue("SHIPCOSTS"))
endif
data!.setFieldValue("INTERNATIONAL", str(international))

rem Calculates Total Due
total = sub_total + num(data!.getFieldValue("VAT_01")) + num(data!.getFieldValue("VAT_02")) - num(data!.getFieldValue("DISCOUNT")) + num(data!.getFieldValue("FREIGHT")) + express + international

data!.setFieldValue("TOTAL", str(total))

sql$="SELECT MESSAGE_TEXT FROM OPC_MSG_DET WHERE FIRM_ID='" + firm_id$ + "' AND MESSAGE_CODE='" + message_code$ + "'"
sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)

message$ = ""
if !(sqlRs!.isEmpty()) then
    num_line = sqlRs!.getRecordCount()
    for i=1 to num_line-1
        sqlRd! = sqlRs!.getCurrentRecordData()
        message$ = message$ + sqlRd!.getFieldValue("MESSAGE_TEXT") + $0D$
        sqlRs!.next()
    next i
    sqlRd! = sqlRs!.getCurrentRecordData()
    message$ = message$ + sqlRd!.getFieldValue("MESSAGE_TEXT") + $0D$
endif
data!.setFieldValue("MESSAGE", message$)

rs!.insert(data!)

rem Tell the stored procedure to return the result set.
sp!.setRecordSet(rs!)

