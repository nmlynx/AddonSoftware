[[ART_CASHTRANS.AGCL]]
callpoint!.setColumnEnabled(-1,"<<DISPLAY>>.AR_INVOICE_NO",1)
[[ART_CASHTRANS.AR_TRANS_TYPE.AVAL]]

	ar_trans_type$=callpoint!.getUserInput()
	callpoint!.setColumnData("ART_CASHTRANS.AR_TRANS_TYPE",ar_trans_type$)
	callpoint!.setStatus("REFRESH")
 
[[ART_CASHTRANS.AR_TRANS_TYPE.BINP]]
rem --- coming from Invoice # (derived element ) - need to test the get inv logic here for now 

check_invoice:
	REM << gosub validate_invoice
[[ART_CASHTRANS.BWRI]]
	
	file$="ART_CASHTRANS"
	dim cashtrans$:fnget_tpl$(file$)	

	if cvs(CASHTRANS.TRANS_DATE$,3)="" 
		callpoint!.setColumnData("ART_CASHTRANS.TRANS_DATE",sysinfo.system_date$)
	endif
[[ART_CASHTRANS.<CUSTOM>]]
rem ====================================================
Validate_invoice: 
rem ====================================================
ESCAPE;REM << TRACE INVOICE VALIDATION >>
	file$="ART_INVHEADER"
	invheader_dev=fnget_dev(file$)
	dim invheader$:fnget_tpl$(file$)
	

	firm_id$=callpoint!.getHeaderColumnData("ART_CASHHEADER.FIRM_ID")
	customer_id$=callpoint!.getHeaderColumnData("ART_CASHHEADER.CUSTOMER_ID")
	ar_type$="  "
	invno$=callpoint!.getUserInput()
	callpoint!.setStatus("REFRESH") 
	
	altkey$=firm_id$+ar_type$+customer_id$+invoice_no$
	read record (invheader_dev,key=altkey$,dom=*next)
	invhdr_key$=key(invhdr_dev)
	if pos(altkey$=invhdr_key$)<>1 
		escape
	endif

	read record (invheader_dev,key=altkey$)invheader$
	if ART_INVHEADER.CUSTOMER_ID$<>CUSTOMER_ID$ ESCAPE
	IF ART_INVHEADER.INVOICE_NO$<>INVNO$ ESCAPE

	invoice_amt=art_invheader.invoice_amt
	invoice_date$=art_invheader.invoice_date$
	
	callpoint!.setColumnData("<<DISPLAY>>.INVOICE_AMT",INVOICE_AMT)
	callpoint!.setColumnData("<<DISPLAY>>.INVOICE_DATE",INVOICE_DATE)

return
