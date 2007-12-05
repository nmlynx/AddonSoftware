[[SAS_PARAMS.BWRI]]
rem --- Check for valid data

	bad_data$="N"
	if callpoint!.getColumnData("SAS_PARAMS.BY_CUSTOMER") <> "N"
		if callpoint!.getColumnData("SAS_PARAMS.CUSTOMER_LEV") = " "
			bad_data$="Y"
		endif
	endif

	if bad_data$="Y"
		msg_id$="SA_PARAM_ERR"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
