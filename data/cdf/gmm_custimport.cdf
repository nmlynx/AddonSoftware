[[GMM_CUSTIMPORT.AWIN]]
rem --- Add grid to show customers/contacts in CSV file
	use ::ado_util.src::util
	nxt_ctlID = util.getNextControlID()
	gridInvoices! = Form!.addGrid(nxt_ctlID,5,60,800,300); rem --- ID, x, y, width, height

rem wgh --- stopped here
[[GMM_CUSTIMPORT.CSV_FILE.AVAL]]
rem --- Verify CSV file exists
	csvFile$=callpoint!.getUserInput()
	testChan=unt
	success=0
	open(testChan,err=*next)csvFile$; success=1
	if success then
rem wgh ... stopped here
		close(testChan)
	else
		msg_id$="AD_FILE_NOT_FOUND"
		dim msg_tokens$[1]
		msg_tokens$[1]=csvFile$
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif 
[[GMM_CUSTIMPORT.AREC]]
rem --- Initialize firm to current firm
	callpoint!.setColumnData("GMM_CUSTIMPORT.FIRM_ID",firm_id$,1)
