[[OPS_SLSTAXSVCDET.SVC_CONFIG_VALUE.AVAL]]
rem --- Skip if value not changed
	value$=cvs(callpoint!.getUserInput(),2)
	encryptor!=callpoint!.getDevObject("encryptor")
	priorValue$=encryptor!.decryptData(cvs(callpoint!.getColumnData("OPS_SLSTAXSVCDET.SVC_CONFIG_VALUE"),3))

	if value$=priorValue$ then break

rem --- Validate values entered for the attributes
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
				gosub validateAttrValueChange
			endif
			break
		case attr$ = "loggingStartDate"
		case attr$ = "loggingEndDate"
			rem --- Date format must be YYYY-MM-DD, or blank
			if value$<>"" then
				thisJul=-1
				thisJul = jul(value$,"%Yd-%Mz-%Dz",err=*next)
				if thisJul<0 then
					msg_id$="OP_LOG_DATE_FORMAT"
					gosub disp_message

					callpoint!.setStatus("ABORT")
					break
				endif
			endif
			break
		case attr$ = "server"
		case attr$ = "userCompanyID"
		case attr$ = "companyCode"
			rem --- Cannot change the value if there are open orders or open invoices
			gosub validateAttrValueChange
			break
	swend
	if abort then break

[[OPS_SLSTAXSVCDET.<CUSTOM>]]
rem =========================================================
validateAttrValueChange: rem --- Cannot change attribute's value if there are open orders or open invoices
	rem --- input: attr$
	rem --- input: priorValue$
	rem --- output: abort
rem =========================================================
	abort=0

	sql$ = "SELECT COUNT(*) AS COUNT "
	sql$ = sql$ + "FROM OPT_INVHDR "
	sql$ = sql$ + "WHERE FIRM_ID = '" + firm_id$ + "' and TRANS_STATUS IN ('E','R') and INVOICE_TYPE<>'V'"

	sql_chan=sqlunt
	sqlopen(sql_chan)stbl("+DBNAME")
	sqlprep(sql_chan)sql$
	dim read_tpl$:sqltmpl(sql_chan)
	sqlexec(sql_chan)

	read_tpl$ = sqlfetch(sql_chan,err=*continue)
	count=read_tpl$.count
	sqlclose(sql_chan)

	if count then
		msg_id$="OP_CANNOT_CHG_STS"
		dim msg_tokens$[2]
		msg_tokens$[1]=attr$
		msg_tokens$[2]=str(count)
		gosub disp_message

		callpoint!.setUserInput(priorValue$)
		callpoint!.setStatus("ABORT")
		abort=1
	endif

	return



