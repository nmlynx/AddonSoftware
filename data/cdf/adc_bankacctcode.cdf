[[ADC_BANKACCTCODE.BNK_ACCT_NO.AVAL]]
rem --- Bank account number required for Checking and Savings accounts
	aba_no$=callpoint!.getUserInput()
	bnk_acct_type$=callpoint!.getColumnData("ADC_BANKACCTCODE.BNK_ACCT_TYPE")
	if pos(bnk_acct_type$="CS") and cvs(aba_no$,2)="" then
		msg_id$="AD_BNKACCT_REQ"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[ADC_BANKACCTCODE.ABA_NO.AVAL]]
rem --- Bank routing number required for Checking and Savings accounts
	aba_no$=callpoint!.getUserInput()
	bnk_acct_type$=callpoint!.getColumnData("ADC_BANKACCTCODE.BNK_ACCT_TYPE")
	if pos(bnk_acct_type$="CS") and cvs(aba_no$,2)="" then
		msg_id$="AD_ABANO_REQ"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
