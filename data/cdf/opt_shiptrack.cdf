[[<<DISPLAY>>.VOID.AVAL]]
rem --- Update VOID_FLAG
	if callpoint!.getUserInput()="Y" then
		callpoint!.setColumnData("OPT_SHIPTRACK.VOID_FLAG","Y",1)
	else
		callpoint!.setColumnData("OPT_SHIPTRACK.VOID_FLAG"," ",1)
	endif
[[OPT_SHIPTRACK.AREC]]
rem --- Initialize SHIP_SEQ_NO
	callpoint!.setColumnData("OPT_SHIPTRACK.SHIP_SEQ_NO","000")
[[OPT_SHIPTRACK.ARNF]]
rem --- Initialize ship date
	sysinfo$=stbl("+SYSINFO")
	callpoint!.setColumnData("OPT_SHIPTRACK.CREATE_DATE",sysinfo.system_date$,1)

	callpoint!.setStatus("MODIFIED")
[[OPT_SHIPTRACK.ADIS]]
rem --- Enable non-key fields if order has NOT been invoiced and updated (when the SHIP_SEQ_NO is not blank)
	if num(callpoint!.getColumnData("OPT_SHIPTRACK.SHIP_SEQ_NO"))=0 then
		rem --- Enable all non-key fields
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.SCAC_CODE",1)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.CARRIER_CODE",1)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.CREATE_DATE",1)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.WEIGHT",1)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.ACT_FREIGHT_AMT",1)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.CUST_FREIGHT_AMT",1)
	else
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.SCAC_CODE",0)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.CARRIER_CODE",0)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.CREATE_DATE",0)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.WEIGHT",0)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.ACT_FREIGHT_AMT",0)
		callpoint!.setColumnEnabled("OPT_SHIPTRACK.CUST_FREIGHT_AMT",0)
	endif

rem --- Initialize VOID CheckBox
	if callpoint!.getColumnData("OPT_SHIPTRACK.VOID_FLAG")="Y" then callpoint!.setColumnData("<<DISPLAY>>.VOID","Y",1)
[[OPT_SHIPTRACK.ORDER_NO.AVAL]]
rem --- Does order exist?
	order_no$=callpoint!.getUserInput()
	optInvHdr_dev = fnget_dev("OPT_INVHDR")
	ar_type$ = callpoint!.getColumnData("OPT_SHIPTRACK.AR_TYPE")
	customer_id$ = callpoint!.getColumnData("OPT_SHIPTRACK.CUSTOMER_ID")
	optInvHdr_trip$=firm_id$+ar_type$+customer_id$+order_no$
	read(optInvHdr_dev, key=optInvHdr_trip$, dom=*next)
	optInvHdr_key$=key(optInvHdr_dev,end=*next)
	if pos(optInvHdr_trip$=optInvHdr_key$)<>1 then
		rem --- Order not found
		msg_id$="INVALID_ENTRY"
		dim msg_tokens$[1]
		msg_tokens$[1]=Translate!.getTranslation("AON_ORDER")+" "+order_no$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif
[[OPT_SHIPTRACK.BSHO]]
rem --- Open files
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="OPT_INVHDR",open_opts$[1]="OTA"

	gosub open_tables
[[OPT_SHIPTRACK.ACT_FREIGHT_AMT.AVAL]]
rem --- Initialize CUST_FREIGHT_AMT to ACT_FREIGHT_AMT for new records
	if callpoint!.getRecordMode()="A" and num(callpoint!.getColumnData("OPT_SHIPTRACK.CUST_FREIGHT_AMT"))=0 then
		callpoint!.setColumnData("OPT_SHIPTRACK.CUST_FREIGHT_AMT",callpoint!.getUserInput(),1)
	endif
