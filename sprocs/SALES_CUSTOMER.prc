rem ' Return invoices by customer for a given month period
rem ' SETERR ERROR_ROUTINE

rem ' Declare some variables ahead of time
declare BBjStoredProcedureData sp!
declare BBjRecordSet rs!
declare BBjRecordData data!

rem ' Get the infomation object for the Stored Procedure
sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem ' Get the IN and IN/OUT parameters used by the procedure
firm_id$=sp!.getParameter("FIRM_ID")
customer_nbr$=sp!.getParameter("CUSTOMER_NBR")
month$ = sp!.getParameter("MONTH")
year$ = sp!.getParameter("YEAR")

rem ' set up the sql query
sql$ = "SELECT t1.ar_inv_no as ar_inv_nbr, "
sql$ = sql$ + "CONCAT(CONCAT(CONCAT(CONCAT(SUBSTRING(t1.invoice_date, 5, 2), '/'), SUBSTRING(t1.invoice_date, 7, 2)), '/'), SUBSTRING(t1.invoice_date, 1, 4)) AS invoice_date, "
sql$ = sql$ + "t1.invoice_amt FROM ART_INVHDR t1 "
sql$ = sql$ + "WHERE firm_id = '" + firm_id$ + "' AND CUSTOMER_ID = '" + customer_nbr$ + "' AND SUBSTRING(t1.INVOICE_DATE, 5, 2) = '" + month$ + "' and SUBSTRING(t1.INVOICE_DATE, 1, 4) = '" +year$ + "' "
sql$ = sql$ + "ORDER BY t1.ar_inv_no"

connectStr$="AddonSoftware"
mode$="mode=PROCEDURE"

rs! = BBJAPI().createSQLRecordSet(connectStr$,mode$,sql$)

sp!.setRecordSet(rs!)

end

rem ' Error routine
ERROR_ROUTINE:
    SETERR DONE
    msg$ = "Error #" + str(err) + " occured in " + pgm(-1) + " at line " + str(tcb(5))
    if err = 77 then msg$ = msg$ + $0d0a$ + "SQL Err: " + sqlerr(chan)
    java.lang.System.out.println(msg$)
    if tcb(13) then exit else end


