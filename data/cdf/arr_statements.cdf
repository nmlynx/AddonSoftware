[[ARR_STATEMENTS.CURSTM_DATE.AVAL]]
rem --- Validate Date entry
	if cvs(callpoint!.getColumnData("ARR_STATEMENTS.CURSTM_DATE"),2)=""
		callpoint!.setMessage("ENTRY_ERR_DATE")
		callpoint!.setColumnData("ARR_STATEMENTS.CURSTM_DATE",date(0:"%Yd%Mz%Dz"))
		callpoint!.setStatus("ABORT-REFRESH")
	endif
[[ARR_STATEMENTS.ARAR]]
rem --- Set default value
	callpoint!.setColumnData("ARR_STATEMENTS.CURSTM_DATE",date(0:"%Yd%Mz%Dz"))
	callpoint!.setStatus("REFRESH")
