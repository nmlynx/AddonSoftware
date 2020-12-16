[[OPS_SLSTAXSVCDET.SVC_CONFIG_VALUE.AVAL]]
rem --- Validate values entered for the attributes
	value$=cvs(callpoint!.getUserInput(),2)
	attr$=cvs(callpoint!.getColumnData("OPS_SLSTAXSVCDET.SVC_CONFIG_ATTR"),2)
	switch (BBjAPI().TRUE)
		case attr$ = "testMode"
			rem --- Value for testMode must be either “true” or “false”
			testMode$=cvs(value$,8)
			callpoint!.setUserInput(testMode$)
			if testMode$<>"true" and testMode$<>"false" then
				msg_id$="OP_TESTMODE_VALUE"
				gosub disp_message

				callpoint!.setUserInput(value$)
				callpoint!.setStatus("ABORT")
				break
			else
				rem --- Cannot change the value if there are open orders or open invoices
rem wgh ... 9806 ... stopped here
			endif
			break
		case attr$ = "loggingStartDate"
		case attr$ = "loggingEndDate"
			rem --- Date format must be YYYY-MM-DD, or blank
			if value$<>"" and len(value$)<>8 then
escape; rem wgh ... 9806 ... stopped here ... YYYY-MM-DD
			endif
			break
		case attr$ = "server"
		case attr$ = "userCompanyID"
			rem --- Cannot change the value if there are open orders or open invoices
rem wgh ... 9806 ... stopped here
			break
	swend



