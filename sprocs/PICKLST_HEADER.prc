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
store_master_id$ = sp!.getParameter("STORE_MASTER_ID")
html_path$ = sp!.getParameter("HTML_PATH")

rem Create a memory record set to hold results.
rem Columns for the record set are defined using a string template
rs! = BBJAPI().createMemoryRecordSet("LOGO:C(128), COMP_LINE_01:C(30), COMP_LINE_02:C(30), COMP_LINE_03:C(30), COMP_LINE_04:C(30), COMP_LINE_05:C(30), COMP_LINE_06:C(30),
:                                     COMP_LINE_07:C(30), COMP_LINE_08:C(30), COMP_LINE_09:C(30), COMP_LINE_10:C(30), COMP_LINE_11:C(30), COMP_LINE_12:C(30),
:                                     COMP_LINE_13:C(30), COMP_LINE_14:C(30), COMP_LINE_15:C(30), COMP_LINE_16:C(30), COMP_LINE_17:C(30), COMP_LINE_18:C(30),
:                                     BILL_ADDR_LINE_1:C(30), BILL_ADDR_LINE_2:C(30), BILL_ADDR_LINE_3:C(30), BILL_ADDR_LINE_4:C(30), BILL_ADDR_LINE_5:C(30),
:                                     SHIP_ADDR_LINE_1:C(30), SHIP_ADDR_LINE_2:C(30), SHIP_ADDR_LINE_3:C(30), SHIP_ADDR_LINE_4:C(30), SHIP_ADDR_LINE_5:C(30)")

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

sql$="SELECT INVOICE_DATE, AR_INV_NO, ORDER_DATE, SLSPSN_CODE, CUSTOMER_PO_NO, AR_SHIP_VIA, SHIPMNT_DATE, TERMS_CODE, DISCOUNT_AMT, TAX_AMOUNT, FREIGHT_AMT, SHIPTO_TYPE, SHIPTO_NO, MESSAGE_CODE FROM OPE_ORDHDR WHERE FIRM_ID='" + firm_id$ + "' AND CUSTOMER_ID='" + customer_id$ + "' AND ORDER_NO='" + order_no$ + "'"
sqlRs! = BBJAPI().createSQLRecordSet(url$,mode$,sql$)
sqlRd! = sqlRs!.getCurrentRecordData()

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

rs!.insert(data!)

rem Tell the stored procedure to return the result set.
sp!.setRecordSet(rs!)

