rem ' ****************************************************
rem ' * SPROC to drive customer statements
rem ' ****************************************************
rem ' program name: custStatements.prc

rem ' ****************************************************
rem ' * declares
rem ' ****************************************************
declare BBjStoredProcedureData sp!
declare BBjRecordSet rs!
declare BBjRecordData data!

sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem ' ****************************************************
rem ' * get SPROC parameters
rem ' ****************************************************


rem ' looks like '01' or '02'
firm_id$ = sp!.getParameter("FIRM_ID")

rem ' in the form of YYYYMMDD
statement_date$ = sp!.getParameter("STATEMENT_DATE")

rem ' customer numbers maybe any length up to 6
customer$ = sp!.getParameter("CUSTOMER_ID")
while len(customer$) < 6
	customer$ = "0" + customer$
wend

barista_wd$ = sp!.getParameter("BARISTA_WD")
chdir barista_wd$

rem ' ****************************************************
rem ' * create the in memory recordset for return
rem ' ****************************************************
dataTemplate$ = "firm_id:C(2),statement_date:C(10),customer_nbr:C(6),cust_name:C(30),address1:C(30),address2:C(30),"
dataTemplate$ = dataTemplate$ + "address3:C(30),address4:C(30),address5:C(30), address6:C(30),"
dataTemplate$ = dataTemplate$ + "invoice_date:C(10),ar_inv_nbr:C(7),inv_type:C(11),currency:C(3),invoice_amt:N(10),trans_amt:N(10),"
dataTemplate$ = DataTemplate$ + "invBalance:N(10),aging_cur:N(10),aging_30:N(10),aging_60:N(10),aging_90:N(10),aging_120:N(10)"

rs! = BBJAPI().createMemoryRecordSet(dataTemplate$)


rem ' ****************************************************
rem ' * open files
rem ' ****************************************************

    files=4,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]
    files$[1]="arm-01",ids$[1]="ARM_CUSTMAST"
    files$[2]="arm-02",ids$[2]="ARM_CUSTDET"
    files$[3]="art-01",ids$[3]="ART_INVHDR"
    files$[4]="art-11",ids$[4]="ART_INVDET"

    call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],ids$[all],templates$[all],channels[all],batch,status
    if status goto std_exit

    arm01=channels[1]
    arm02=channels[2]
    art01=channels[3]
    art11=channels[4]
    
    rem --- Dimension string templates

	dim arm01$:templates$[1]
	dim arm02$:templates$[2]
    dim art01$:templates$[3]
    dim art11$:templates$[4]
    
rem ' ****************************************************
rem ' * init
rem ' ****************************************************    

gosub build_list_of_aging_dates
gosub determine_customer_aging
gosub format_address_block

rem ' ****************************************************
rem ' * postion file pointer
rem ' ****************************************************

read record(art01, key = firm_id$ + "  " + customer$, dom=*next)

rem ' ****************************************************
rem ' * main loop
rem ' ****************************************************
while 1
	
	read record(art01,end=*break)art01$

	if art01.firm_id$ <> firm_id$ then break
	if art01.customer_id$ <> customer$ then break
	
	if art01.invoice_date$ > statement_date$ then continue
	
	rem ' ****************************************************
	rem ' * calc invoice balance
	rem ' ****************************************************
	read record(art11, key=art01.firm_id$ + art01.ar_type$ + art01.customer_id$ + art01.ar_inv_no$, dom=*next)art11$
	trans_amt = 0
	while 1
		read record(art11,end=*break)art11$
		if art01.firm_id$ + art01.ar_type$ + art01.customer_id$ + art01.ar_inv_no$ <> art11.firm_id$ + art11.ar_type$ + art11.customer_id$ + art11.ar_inv_no$ then break
		if art11.trans_date$ <= statement_date$ then trans_amt = trans_amt + art11.trans_amt + art11.adjdisc_amt
	wend
	
    inv_type$="Invoice"
    if art01.invoice_type$="F" then inv_type$="Fin. Charge"
	
	invBalance = art01.invoice_amt + trans_amt

	if invBalance = 0 then continue	

	rem ' ****************************************************
	rem ' * output data
	rem ' ****************************************************
	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("FIRM_ID",firm_id$)
	data!.setFieldValue("STATEMENT_DATE",statement_date$(5,2) + "/" + statement_date$(7,2) + "/" + statement_date$(1,4))
	data!.setFieldValue("CUSTOMER_NBR",customer$)
	data!.setFieldValue("CUST_NAME",arm01.customer_name$)
	data!.setFieldValue("ADDRESS1", address$(31,30))
	data!.setFieldValue("ADDRESS2", address$(61,30))
	data!.setFieldValue("ADDRESS3", address$(91,30))
	data!.setFieldValue("ADDRESS4", address$(121,30))
	data!.setFieldValue("ADDRESS5", address$(151,30))
rem	data!.setFieldValue("ADDRESS6", address$(151,30))
	invoice_date$ = art01.invoice_date$(5,2) + "/" + art01.invoice_date$(7,2) + "/" + art01.invoice_date$(1,4)
	data!.setFieldValue("INVOICE_DATE",invoice_date$)
	data!.setFieldValue("AR_INV_NBR",art01.ar_inv_no$)
	data!.setFieldValue("INV_TYPE",inv_type$)
	data!.setFieldValue("CURRENCY",currency$)
	data!.setFieldValue("INVOICE_AMT",str(art01.invoice_amt))
	data!.setFieldValue("TRANS_AMT",str(trans_amt))
	data!.setFieldValue("INVBALANCE",str(invBalance))
	data!.setFieldValue("AGING_CUR",str(arm02.aging_cur))
	data!.setFieldValue("AGING_30",str(arm02.aging_30))
	data!.setFieldValue("AGING_60",str(arm02.aging_60))
	data!.setFieldValue("AGING_90",str(arm02.aging_90))
	data!.setFieldValue("AGING_120",str(arm02.aging_120))
	rs!.insert(data!)
wend

rem ' close files

close(arm01)
close(arm02)
close(art01)
close(art11)

sp!.setRecordSet(rs!)
end

rem ' ****************************************************
rem ' * format address block
rem ' ****************************************************
format_address_block:

    address$=""
	read record(arm01,key=firm_id$ + customer$)arm01$
    address$=arm01.addr_line_1$+arm01.addr_line_2$+arm01.addr_line_3$+arm01.addr_line_4$+arm01.city$+arm01.state_code$+arm01.zip_code$
    call pgmdir$+"adc_address.aon",address$,24,5,9,30
    
return

rem ' ****************************************************
rem ' * determine customer aging
rem ' ****************************************************
determine_customer_aging:

	rem ' read the customer aging record
	read record(arm02,key=firm_id$ + customer$ + "  ")arm02$

	dim c[5]
	
	read record(art01, key = firm_id$ + "  " + customer$, dom=*next)
	
	
	rem ' --- Invoice Records
	while 1
		read record(art01, end = *break)art01$

		if art01.firm_id$ <> firm_id$ then break
		if art01.customer_id$ <> customer$ then break

		rem ' the date to use for aging
		check_date$=art01.invoice_date$
		if check_date$ > statement_date$ then continue

		rem ' loop Payment/Adjustment Records		
		trans_amt = 0
		read (art11, key = art01.firm_id$ + art01.ar_type$ + art01.customer_id$ + art01.ar_inv_no$, dom=*next)
		while 1

			read record(art11, end = *break)art11$
			
			if art11.ar_inv_no$ <> art01.ar_inv_no$ then break
			if art11.trans_date$ <= statement_date$ then trans_amt = trans_amt + art11.trans_amt + art11.adjdisc_amt
		wend

		bal = art01.invoice_amt + trans_amt
		
		if bal = 0 then continue
		
		rem ' Age
		let period = pos(check_date$ > aging_dates$,8)
		if period = 0 then 
			period = 5 
		else 
			period = int(period / 8)
		endif
		c[period] = c[period] + bal

	wend

	rem ' put aging buckets back into arm02
	arm02.aging_future = c[0]
	arm02.aging_cur = c[1]
	arm02.aging_30 = c[2]
	arm02.aging_60 = c[3]
	arm02.aging_90 = c[4]
	arm02.aging_120 = c[5]

return

rem ' ****************************************************
rem ' * build list of aging dates
rem ' ****************************************************
build_list_of_aging_dates:

	aging_dates$ = ""
	
	statement_date = jul(num(statement_date$(1,4)), num(statement_date$(5,2)), num(statement_date$(7,2)))
	
	for x = -5 TO 0
		aging_date = statement_date + (x *30)
		aging_dates$ = date(aging_date:"%Y%Mz%Dz") + aging_dates$ 
	next x

return

std_exit:
end


