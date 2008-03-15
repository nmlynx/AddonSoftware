[[APE_ORDDATE.ASVA]]
rem --- validate Accounting Date
rem	call stbl("+DIR_PGM")+"glc_datecheck.aon",
rem :		callpoint!.getColumnData("APE_ORDDATE.DEF_ACCT_DATE"),
rem :		"Y",per$,yr$,status
rem 	if status<>0 or user_tpl.status$="Y"
rem 		callpoint!.setStatus("ABORT")
rem 	endif
[[APE_ORDDATE.BEND]]
rem --- validate Accounting Date
rem	call stbl("+DIR_PGM")+"glc_datecheck.aon",
rem :		callpoint!.getColumnData("APE_ORDDATE.DEF_ACCT_DATE"),
rem :		"Y",per$,yr$,status
rem	if status<>0
rem		callpoint!.setStatus("ABORT")
rem	endif
[[APE_ORDDATE.ARAR]]
rem --- Setup default dates

	acctdate$=date(0:"%Y%Mz%Dz")
	callpoint!.setColumnData("APE_ORDDATE.DEF_ACCT_DATE",acctdate$)
	callpoint!.setStatus("REFRESH")
	temp_stbl$=stbl("DEF_ACCT_DATE",acctdate$)
