[[GLS_PARAMS.ASVA]]
rem --- If detail flag set to off, turn off all flags in G/L Account Master records

	if callpoint!.getColumnData("GLS_PARAMS.DETAIL_FLAG")<>"Y"
		sql_chan=sqlunt
		sqlopen(sql_chan)stbl("+DBNAME")
		sqlprep(sql_chan)"update glm_acct set detail_flag = 'N' where firm_id = '"+firm_id$+"'"
		sqlexec(sql_chan)
		sqlclose(sql_chan)
	endif
[[GLS_PARAMS.AREC]]
rem --- Init new record

	callpoint!.setColumnData("GLS_PARAMS.POST_TO_GL","Y")
