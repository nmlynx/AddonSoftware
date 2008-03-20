[[APE_ORDDATE.ASVA]]
rem --- validate Accounting Date
	call stbl("+DIR_PGM")+"glc_datecheck.aon",
:		callpoint!.getColumnData("APE_ORDDATE.DEF_ACCT_DATE"),
:		"Y",per$,yr$,status
	if status<>0
		callpoint!.setStatus("ABORT")
	else
		temp_stbl$=stbl("DEF_ACCT_DATE",callpoint!.getColumnData("APE_ORDDATE.DEF_ACCT_DATE"))
	endif
[[APE_ORDDATE.BEND]]
rem --- validate Accounting Date
	call stbl("+DIR_PGM")+"glc_datecheck.aon",
:		callpoint!.getColumnData("APE_ORDDATE.DEF_ACCT_DATE"),
:		"Y",per$,yr$,status
	if status<>0
		callpoint!.setStatus("ABORT")
	else
		temp_stbl$=stbl("DEF_ACCT_DATE",callpoint!.getColumnData("APE_ORDDATE.DEF_ACCT_DATE"))
	endif
[[APE_ORDDATE.ARAR]]
rem --- Setup default dates

	acctdate$=date(0:"%Y%Mz%Dz")
	callpoint!.setColumnData("APE_ORDDATE.DEF_ACCT_DATE",acctdate$)
	callpoint!.setStatus("REFRESH")
	temp_stbl$=stbl("DEF_ACCT_DATE",acctdate$)
