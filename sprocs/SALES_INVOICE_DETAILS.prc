rem ' Return invoice detial by invoice number
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
inv_nbr$ = sp!.getParameter("AR_INV_NBR")


rem ' set up the sql query
sql$ = "SELECT SUBSTRING(t1.ORDDET_SEQ_REF, 10, 3) as line_number, t1.line_code, t1.item_id as item_number, t1.order_memo, t1.qty_shipped, t1.unit_price, t1.ext_price "
sql$ = sql$ + "FROM OPT_INVDET t1 " 
sql$ = sql$ + "WHERE firm_id = '" + firm_id$ + "' AND CUSTOMER_ID = '" + customer_nbr$ + "' AND AR_INV_NO = '" + inv_nbr$ + "' "
sql$ = sql$ + "ORDER BY t1.ORDDET_SEQ_REF"

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
