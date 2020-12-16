[[OPS_SLSTAXSVCHDR.ARNF]]
rem --- Initialize new records using the ZZ records
	ops_slstaxsvchdr_dev = fnget_dev("OPS_SLSTAXSVCHDR")
	dim ops_slstaxsvchdr$:fnget_tpl$("OPS_SLSTAXSVCHDR")
	ops_slstaxsvcdet_dev = fnget_dev("OPS_SLSTAXSVCDET")
	dim ops_slstaxsvcdet$:fnget_tpl$("OPS_SLSTAXSVCDET")

	rem --- Initialize ops_slstaxsvchdr record
	sls_tax_intrface$=callpoint!.getColumnData("OPS_SLSTAXSVCHDR.SLS_TAX_INTRFACE")
	readrecord(ops_slstaxsvchdr_dev,key="ZZ"+sls_tax_intrface$,dom=*next)ops_slstaxsvchdr$
	ops_slstaxsvchdr.firm_id$=firm_id$
	writerecord(ops_slstaxsvchdr_dev)ops_slstaxsvchdr$

	rem --- Initialize ops_slstaxsvcdet records
	read(ops_slstaxsvcdet_dev,key="ZZ"+sls_tax_intrface$,dom=*next)
	while 1
		nextDetKey$=key(ops_slstaxsvcdet_dev,end=*break)
		if pos("ZZ"+sls_tax_intrface$=nextDetKey$)<>1 then break
		readrecord(ops_slstaxsvcdet_dev)ops_slstaxsvcdet$
		ops_slstaxsvcdet.firm_id$=firm_id$
		writerecord(ops_slstaxsvcdet_dev)ops_slstaxsvcdet$
		read(ops_slstaxsvcdet_dev,key=nextDetKey$,dom=*next)
	wend

	rem --- Load new records into the form
	callpoint!.setStatus("RECORD:["+firm_id$+sls_tax_intrface$+"]")

[[OPS_SLSTAXSVCHDR.WAIT_TIME.AVAL]]
rem --- Verify wait_time is greater than zero
	wait_time=num(callpoint!.getUserInput())
	if wait_time<=0 then
		msg_id$="OP_MIN_WAIT_TIME"
		gosub disp_message

		callpoint!.setStatus("ABORT")
		break
	endif



