rem ' Return sales totals by customer by customer type for a given month period
rem ' SETERR ERROR_ROUTINE

rem ' Declare some variables ahead of time
declare BBjStoredProcedureData sp!
declare BBjRecordSet rs!
declare BBjRecordData data!

rem ' Get the infomation object for the Stored Procedure
sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem ' Get the IN and IN/OUT parameters used by the procedure
firm_id$=sp!.getParameter("FIRM_ID")
cust_type$=sp!.getParameter("CUST_TYPE")
month$ = sp!.getParameter("MONTH")
year$ = sp!.getParameter("YEAR")

rem ' set up the sql query
sql$ = "SELECT SUM(t1.invoice_amt) AS total_sales, t1.customer_id, t3.customer_name, t3.contact_name FROM ART_INVHDR t1 "
sql$ = sql$ + "INNER JOIN ARM_CUSTDET t2 ON t1.firm_id = t2.firm_id AND t1.customer_id = t2.customer_id "
sql$ = sql$ + "INNER JOIN ARM_CUSTMAST t3 on t2.firm_id = t3.firm_id AND t2.customer_id = t3.customer_id "
sql$ = sql$ + "WHERE t1.firm_id = '" + firm_id$ + "' AND t2.customer_type = '" + cust_type$ + "' AND SUBSTRING(t1.INVOICE_DATE, 5, 2) = '" + month$ + "' and SUBSTRING(t1.INVOICE_DATE, 1, 4) = '" + year$ + "' "
sql$ = sql$ + "GROUP BY t1.customer_id, t3.customer_name, t3.contact_name "
sql$ = sql$ + "ORDER BY total_sales DESC "

chan = sqlunt
sqlopen(chan)"AddonSoftware"
sqlprep(chan)sql$
dim irec$:sqltmpl(chan)
sqlexec(chan)

rs! = BBJAPI().createMemoryRecordSet("FIRM_ID:C(2),CUSTOMER_NBR:C(6),CUST_NAME:C(30),CONTACT_NAME:C(20),TOTAL_SALES:N(15)")

while 1
    irec$ = sqlfetch(chan,err=*break)
    data! = rs!.getEmptyRecordData()    
    data!.setFieldValue("FIRM_ID",firm_id$)
    data!.setFieldValue("CUSTOMER_NBR",irec.customer_id$)
    data!.setFieldValue("TOTAL_SALES",str(irec.total_sales))
    data!.setFieldValue("CUST_NAME",irec.customer_name$)
    data!.setFieldValue("CONTACT_NAME",irec.contact_name$)
    rs!.insert(data!)
wend

rem ' Close the sql channel and set the stored procedure's result set to the record set that 
rem ' was created and populated in the code above
done:
sqlclose (chan)
sp!.setRecordSet(rs!)
end

rem ' Error routine
ERROR_ROUTINE:
    SETERR DONE
    msg$ = "Error #" + str(err) + " occured in " + pgm(-1) + " at line " + str(tcb(5))
    if err = 77 then msg$ = msg$ + $0d0a$ + "SQL Err: " + sqlerr(chan)
    java.lang.System.out.println(msg$)
    if tcb(13) then exit else end


