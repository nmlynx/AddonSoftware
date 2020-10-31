[[ARR_STATEMENTS.ADIS]]
rem --- enable/disable
rem --- (this callpoint is fired if clicking one of the saved selection options)

	seq$=callpoint!.getColumnData("ARR_STATEMENTS.REPORT_SEQUENCE")
	option$=callpoint!.getColumnData("ARR_STATEMENTS.REPORT_OPTION")

	gosub enable_disable_fields

[[ARR_STATEMENTS.ARAR]]
rem --- Set default value
	dim sysinfo$:stbl("+SYSINFO_TPL")
	sysinfo$=stbl("+SYSINFO")
	callpoint!.setColumnData("ARR_STATEMENTS.CURSTM_DATE",sysinfo.system_date$,1)
	callpoint!.setColumnEnabled("ARR_STATEMENTS.CUSTOMER_ID",0)
	callpoint!.setColumnEnabled("ARR_STATEMENTS.ALT_SEQUENCE",0)
	callpoint!.setColumnEnabled("ARR_STATEMENTS.REPORT_SEQUENCE",1)

[[ARR_STATEMENTS.REPORT_OPTION.AVAL]]
rem --- enable/disable

	seq$=callpoint!.getColumnData("ARR_STATEMENTS.REPORT_SEQUENCE")
	option$=callpoint!.getUserInput()

	gosub enable_disable_fields

[[ARR_STATEMENTS.REPORT_SEQUENCE.AVAL]]
rem --- enable/disable

	option$=callpoint!.getColumnData("ARR_STATEMENTS.REPORT_OPTION")
	seq$=callpoint!.getUserInput()

	gosub enable_disable_fields

[[ARR_STATEMENTS.<CUSTOM>]]
rem ====================================================
enable_disable_fields:
rem --- enable/disable fields based on selected option (All, Restart, Single)
rem --- and selected sequence (Customer, Alt seq)
rem --- incoming: seq$ and option$
rem ====================================================
	if option$="R"
		if seq$="C"
			callpoint!.setColumnEnabled("ARR_STATEMENTS.CUSTOMER_ID",1)
			callpoint!.setColumnEnabled("ARR_STATEMENTS.ALT_SEQUENCE",0)	
		else
			callpoint!.setColumnEnabled("ARR_STATEMENTS.CUSTOMER_ID",0)
			callpoint!.setColumnEnabled("ARR_STATEMENTS.ALT_SEQUENCE",1)	
		endif
		callpoint!.setColumnEnabled("ARR_STATEMENTS.REPORT_SEQUENCE",1)	
	endif
	if cvs(option$,2)=""
		callpoint!.setColumnEnabled("ARR_STATEMENTS.CUSTOMER_ID",0)
		callpoint!.setColumnEnabled("ARR_STATEMENTS.ALT_SEQUENCE",0)	
		callpoint!.setColumnEnabled("ARR_STATEMENTS.REPORT_SEQUENCE",1)
	endif
	if option$="S"
		callpoint!.setColumnEnabled("ARR_STATEMENTS.CUSTOMER_ID",1)
		callpoint!.setColumnEnabled("ARR_STATEMENTS.ALT_SEQUENCE",0)	
		callpoint!.setColumnEnabled("ARR_STATEMENTS.REPORT_SEQUENCE",0)
		callpoint!.setColumnData("ARR_STATEMENTS.REPORT_SEQUENCE","C",1)
	endif

	return



