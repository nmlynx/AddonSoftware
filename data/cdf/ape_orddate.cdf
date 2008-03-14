[[APE_ORDDATE.ARAR]]
rem --- Setup default dates

	acctdate$=date(0:"%Y%Mz%Dz")
	callpoint!.setColumnData("APE_ORDDATE.DEF_ACCT_DATE",acctdate$)
	callpoint!.setStatus("REFRESH")
	temp_stbl$=stbl("DEF_ACCT_DATE",acctdate$)
