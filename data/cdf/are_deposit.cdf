[[ARE_DEPOSIT.AWRI]]
rem --- Exit form
	callpoint!.setStatus("EXIT")
[[ARE_DEPOSIT.BWRI]]
rem --- Initialize RTP modified fields for modified existing records
	if callpoint!.getRecordMode()="C" then
		rec_data.mod_user$=sysinfo.user_id$
		rec_data.mod_date$=date(0:"%Yd%Mz%Dz")
		rec_data.mod_time$=date(0:"%Hz%mz")
		callpoint!.setDevObject("initial_rec_data$",rec_data$)
	endif
[[ARE_DEPOSIT.AREC]]
rem --- Initialize RTP trans_status and created fields
	rem --- TRANS_STATUS set to "E" via form Preset Value
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_USER",sysinfo.user_id$)
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_DATE",date(0:"%Yd%Mz%Dz"))
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_TIME",date(0:"%Hz%mz"))
	callpoint!.setColumnData("ARE_DEPOSIT.AUDIT_NUMBER","0")
