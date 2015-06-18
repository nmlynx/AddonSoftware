[[GMS_PARAMS.DB_USER.AVAL]]
rem --- Must test connection if connection configuration changed
	if callpoint!.getUserInput()<>callpoint!.getColumnData("GMS_PARAMS.DB_USER") then
		callpoint!.setDevObject("testDbConn","yes")
	endif
[[GMS_PARAMS.DB_PASSWORD.AVAL]]
rem --- Must test connection if connection configuration changed
	if callpoint!.getUserInput()<>callpoint!.getColumnData("GMS_PARAMS.DB_PASSWORD") then
		callpoint!.setDevObject("testDbConn","yes")
	endif
[[GMS_PARAMS.DB_URL.AVAL]]
rem --- Must test connection if connection configuration changed
	if callpoint!.getUserInput()<>callpoint!.getColumnData("GMS_PARAMS.DB_URL") then
		callpoint!.setDevObject("testDbConn","yes")
	endif
[[GMS_PARAMS.BSHO]]
rem --- Initialize dev objects
	callpoint!.setDevObject("testDbConn","no")
[[GMS_PARAMS.BWRI]]
rem --- Must test connection before saving any changes to the connection configuration
	if callpoint!.getDevObject("testDbConn")="yes" then
		msg_id$="GM_TEST_DB_CONN"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[GMS_PARAMS.AOPT-TCON]]
rem --- Test database connection
	callpoint!.setDevObject("testDbConn","no")

	db_url$=callpoint!.getColumnData("GMS_PARAMS.DB_URL")
	db_alias$=callpoint!.getColumnData("GMS_PARAMS.DB_ALIAS")
	db_user$=callpoint!.getColumnData("GMS_PARAMS.DB_USER")
	db_password$=callpoint!.getColumnData("GMS_PARAMS.DB_PASSWORD")

	java.lang.Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver")
	connURL$=db_url$+";"
	connURL$=connURL$+"databaseName="+db_alias$+";"
	connURL$=connURL$+"user="+db_user$+";"
	connURL$=connURL$+"password="+db_password$+";"
	chan=sqlunt
	sqlopen(chan,err=connect_nok)connURL$

	msg_id$="SQL_DB_CONN_OK"
	dim msg_tokens$[1]
	msg_tokens$[1]="GoldMine database."
	gosub disp_message
	goto connection_test_end

connect_nok:
	msg_id$="SQL_DB_CONN_NOK"
	dim msg_tokens$[1]
	msg_tokens$[1]=errmes(-1)
	gosub disp_message

connection_test_end:
	sqlclose(chan,err=*next)
[[GMS_PARAMS.AREC]]
rem --- Default wait time to 60 seconds
	callpoint!.setColumnData("GMS_PARAMS.WAIT_TIME","60")
