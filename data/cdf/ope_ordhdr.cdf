[[OPE_ORDHDR.AOPT-CINV]]
escape
[[OPE_ORDHDR.AOPT-DINV]]
rem --- Duplicate Historical Invoice
	if cvs(callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID"),2)="" or
:	   cvs(callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO"),2)<>""
		msg_id$="OP_NO_HIST"
		gosub disp_message
	else
		key_pfx$=firm_id$+
:			callpoint!.getColumnData("OPE_ORDHDR.AR_TYPE")+
:			callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")

		call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:			gui_dev,
:			Form!,
:			"OPT_ORDHDR",
:			"LOOKUP",
:			table_chans$[all],
:			key_pfx$,
:			"PRIMARY",
:			rd_key$
		if cvs(rd_key$,2)<>""
			opt01a$=fnget_tpl$("OPT_ORDHDR")
			opt01_dev=fnget_dev("OPT_ORDHDR")
			dim opt01a$:opt01a$
			readrecord(opt01_dev,key=rd_key$)opt01a$
			sign=1
			gosub copy_order
		endif
	endif
[[OPE_ORDHDR.SHIPTO_NO.AVAL]]
rem --- Display Ship to information
	ship_to_type$=callpoint!.getColumnData("OPE_ORDHDR.SHIPTO_TYPE")
	ship_to_no$=callpoint!.getColumnData("OPE_ORDHDR.SHIPTO_NO")
	cust_id$=callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")
	ord_no$=callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO")
	gosub ship_to_info
[[OPE_ORDHDR.ADEL]]
rem --- Remove extra records
	ordship_dev=fnget_dev("OPE_ORDSHIP")
	remove (ordship_dev,key=firm_id$+
:		callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")+
:		callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO"),dom=*next)
	cashrct_dev=fnget_dev("OPE_INVCASH")
	remove (cashrct_dev,key=firm_id$+
:		callpoint!.getColumnData("OPE_ORDHDR.AR_TYPE")+
:		callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")+
:		callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO"),err=*next)
[[OPE_ORDHDR.ORDER_NO.AVAL]]
rem --- set default values
	ope01_dev=fnget_dev("OPE_ORDHDR")
	ope01a$=fnget_tpl$("OPE_ORDHDR")
	dim ope01a$:ope01a$
	find record(ope01_dev,key=firm_id$+
:		callpoint!.getColumnData("OPE_ORDHDR.AR_TYPE")+
:		callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")+
:		callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO"),dom=*next)ope01a$;goto rec_exist
	user_tpl.new_rec$="Y"

rec_exist:

rem --- new record
	if user_tpl.new_rec$="Y"
		callpoint!.setColumnData("OPE_ORDHDR.INVOICE_TYPE","S")
		arm02_dev=fnget_dev("ARM_CUSTDET")
		arm02a$=fnget_tpl$("ARM_CUSTDET")
		dim arm02a$:arm02a$
		read record (arm02_dev,key=firm_id$+
:			callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")+"  ",dom=*next)arm02a$
		arm01_dev=fnget_dev("ARM_CUSTMAST")
		arm01a$=fnget_tpl$("ARM_CUSTMAST")
		dim arm01a$:arm01a$
		read record (arm01_dev,key=firm_id$+
:			callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID"),dom=*next)arm01a$
		callpoint!.setColumnData("OPE_ORDHDR.SHIPMNT_DATE",user_tpl.def_ship$)
		callpoint!.setColumnData("OPE_ORDHDR.INVOICE_TYPE","S")
		callpoint!.setColumnData("OPE_ORDHDR.ORDINV_FLAG","O")
		callpoint!.setColumnData("OPE_ORDHDR.INVOICE_DATE",sysinfo.system_date$)
		callpoint!.setColumnData("OPE_ORDHDR.AR_SHIP_VIA",arm01a.ar_ship_via$)
		callpoint!.setColumnData("OPE_ORDHDR.SLSPSN_CODE",arm02a.slspsn_code$)
		callpoint!.setColumnData("OPE_ORDHDR.TERMS_CODE",arm02a.ar_terms_code$)
		callpoint!.setColumnData("OPE_ORDHDR.DISC_CODE",arm02a.disc_code$)
		callpoint!.setColumnData("OPE_ORDHDR.DIST_CODE",arm02a.ar_dist_code$)
		callpoint!.setColumnData("OPE_ORDHDR.PRINT_STATUS","N")
		callpoint!.setColumnData("OPE_ORDHDR.MESSAGE_CODE",arm02a.message_code$)
		callpoint!.setColumnData("OPE_ORDHDR.TERRITORY",arm02a.territory$)
		callpoint!.setColumnData("OPE_ORDHDR.ORDER_DATE",sysinfo.system_date$)
		callpoint!.setColumnData("OPE_ORDHDR.TAX_CODE",arm02a.tax_code$)
		callpoint!.setColumnData("OPE_ORDHDR.PRICING_CODE",arm02a.pricing_code$)
		callpoint!.setColumnData("OPE_ORDHDR.CASH_SALE","N")
		gosub get_op_params
		if callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")=ars01a.customer_id$
			callpoint!.setColumnData("OPE_ORDHDR.CASH_SALE","Y")
		endif
		callpoint!.setColumnData("OPE_ORDHDR.LOCK_STATUS","Y")
	endif
	user_tpl.new_rec$="N"
[[OPE_ORDHDR.SHIPTO_TYPE.AVAL]]
rem -- Deal with which Ship To type
	callpoint!.setColumnData("<<DISPLAY>>.SNAME","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD1","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD2","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD3","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD4","")
	callpoint!.setColumnData("<<DISPLAY>>.SCITY","")
	callpoint!.setColumnData("<<DISPLAY>>.SSTATE","")
	callpoint!.setColumnData("<<DISPLAY>>.SZIP","")
	dim dctl$[9]
	ship_to_type$=callpoint!.getColumnData("OPE_ORDHDR.SHIPTO_TYPE")
	ship_to_no$=callpoint!.getColumnData("OPE_ORDHDR.SHIPTO_NO")
	cust_id$=callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")
	ord_no$=callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO")
	gosub ship_to_info
	dctl$[1]="<<DISPLAY>>.SNAME"
	dctl$[2]="<<DISPLAY>>.SADD1"
	dctl$[3]="<<DISPLAY>>.SADD2"
	dctl$[4]="<<DISPLAY>>.SADD3"
	dctl$[5]="<<DISPLAY>>.SADD4"
	dctl$[6]="<<DISPLAY>>.SCITY"
	dctl$[7]="<<DISPLAY>>.SSTATE"
	dctl$[8]="<<DISPLAY>>.SZIP"
	if ship_to_type$="M"
		dmap$=""
	else
		dmap$="I"
	endif
	gosub disable_ctls
[[OPE_ORDHDR.ASHO]]
call stbl("+DIR_SYP")+"bam_run_prog.bbj","OPE_ORDDATES",stbl("+USER_ID"),"MNT","",table_chans$[all]
[[OPE_ORDHDR.INVOICE_TYPE.AVAL]]
rem --- enable/disable expire date based on value
	dim dctl$[9]
	dctl$[1]="OPE_ORDHDR.EXPIRE_DATE"
	if callpoint!.getColumnData("OPE_ORDHDR.INVOICE_TYPE")<>"P"
		dmap$="I"
	else
		dmap$=""
	endif
	gosub disable_ctls

	if rec_data.invoice_type$="S"
		if callpoint!.getColumnData("OPE_ORDHDR.INVOICE_TYPE")="P"
			msg_id$="OP_NO_CONVERT"
			gosub  disp_message
			callpoint!.setStatus("ABORT-REFRESH")
		endif
	endif
[[OPE_ORDHDR.AREC]]
rem --- reset expiration date to enabled
	callpoint!.setColumnData("<<DISPLAY>>.ORDER_TOT","")
	callpoint!.setColumnData("OPE_ORDHDR.ORD_TAKEN_BY",sysinfo.user_id$)
	dim dctl$[9]
	dctl$[1]="OPE_ORDHDR.EXPIRE_DATE"
	dmap$=""
	gosub disable_ctls
[[OPE_ORDHDR.CUSTOMER_ID.AINP]]
rem --- If cash customer, get correct customer number
	gosub get_op_params
	if ars01a.cash_sale$="Y" and cvs(callpoint!.getUserInput(),1+2+4)="C" 
		callpoint!.setColumnData("OPE_ORDHDR.CUSTOMER_ID",ars01a.customer_id$)
		callpoint!.setColumnData("OPE_ORDHDR.CASH_SALE","Y")
		callpoint!.setStatus("REFRESH")
	endif
[[OPE_ORDHDR.CUSTOMER_ID.AVAL]]
rem --- Show customer data

	cust_id$=callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")
	gosub bill_to_info
[[OPE_ORDHDR.AWRI]]
rem --- Write/Remove manual ship to file

	cust_id$=callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")
	ord_no$=callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO")
	ordship_dev=fnget_dev("OPE_ORDSHIP")
	
	if callpoint!.getColumnData("OPE_ORDHDR.SHIPTO_TYPE")<>"M"
		remove (ordship_dev,key=firm_id$+cust_id$+ord_no$,dom=*next)
	else
		ordship_tpl$=fnget_tpl$("OPE_ORDSHIP")
		dim ordship_tpl$:ordship_tpl$
		read record (ordship_dev,key=firm_id$+cust_id$+ord_no$,dom=*next) ordship_tpl$
		ordship_tpl.firm_id$=firm_id$
		ordship_tpl.customer_id$=cust_id$
		ordship_tpl.order_no$=ord_no$
		ordship_tpl.name$=callpoint!.getColumnData("<<DISPLAY>>.SNAME")
		ordship_tpl.addr_line_1$=callpoint!.getColumnData("<<DISPLAY>>.SADD1")
		ordship_tpl.addr_line_2$=callpoint!.getColumnData("<<DISPLAY>>.SADD2")
		ordship_tpl.addr_line_3$=callpoint!.getColumnData("<<DISPLAY>>.SADD3")
		ordship_tpl.addr_line_4$=callpoint!.getColumnData("<<DISPLAY>>.SADD4")
		ordship_tpl.city$=callpoint!.getColumnData("<<DISPLAY>>.SCITY")
		ordship_tpl.state_code$=callpoint!.getColumnData("<<DISPLAY>>.SSTATE")
		ordship_tpl.zip_code$=callpoint!.getColumnData("<<DISPLAY>>.SZIP")
		write record (ordship_dev,key=firm_id$+cust_id$+ord_no$) ordship_tpl$
	endif
[[OPE_ORDHDR.<CUSTOM>]]
bill_to_info: rem --- get and display Bill To Information
	custmast_dev=fnget_dev("ARM_CUSTMAST")
	custmast_tpl$=fnget_tpl$("ARM_CUSTMAST")
	dim custmast_tpl$:custmast_tpl$
	read record (custmast_dev,key=firm_id$+cust_id$,dom=*next) custmast_tpl$
	callpoint!.setColumnData("<<DISPLAY>>.BADD1",custmast_tpl.addr_line_1$)
	callpoint!.setColumnData("<<DISPLAY>>.BADD2",custmast_tpl.addr_line_2$)
	callpoint!.setColumnData("<<DISPLAY>>.BADD3",custmast_tpl.addr_line_3$)
	callpoint!.setColumnData("<<DISPLAY>>.BADD4",custmast_tpl.addr_line_4$)
	callpoint!.setColumnData("<<DISPLAY>>.BCITY",custmast_tpl.city$)
	callpoint!.setColumnData("<<DISPLAY>>.BSTATE",custmast_tpl.state_code$)
	callpoint!.setColumnData("<<DISPLAY>>.BZIP",custmast_tpl.zip_code$)
	custdet_dev=fnget_dev("ARM_CUSTDET")
	custdet_tpl$=fnget_tpl$("ARM_CUSTDET")
	dim custdet_tpl$:custdet_tpl$
	read record(custdet_dev,key=firm_id$+cust_id$+"  ",dom=*next) custdet_tpl$
	ar_balance=custdet_tpl.aging_future+
:		custdet_tpl.aging_cur+
:		custdet_tpl.aging_30+
:		custdet_tpl.aging_60+
:		custdet_tpl.aging_90+
:		custdet_tpl.aging_120
	if user_tpl.credit_installed$="Y" and user_tpl.display_bal$="A"
		callpoint!.setColumnData("<<DISPLAY>>.AGING_120",custdet_tpl.aging_120$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_30",custdet_tpl.aging_30$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_60",custdet_tpl.aging_60$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_90",custdet_tpl.aging_90$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_CUR",custdet_tpl.aging_cur$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_FUTURE",custdet_tpl.aging_future$)
		callpoint!.setColumnData("<<DISPLAY>>.TOT_AGING",str(ar_balance))
	else
		callpoint!.setColumnData("<<DISPLAY>>.AGING_120","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_30","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_60","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_90","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_CUR","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_FUTURE","")
		callpoint!.setColumnData("<<DISPLAY>>.TOT_AGING","")
	endif
	callpoint!.setStatus("REFRESH")
return

ship_to_info: rem --- get and display Bill To Information

	ordship_dev=fnget_dev("OPE_ORDSHIP")
	if ship_to_type$<>"M"
		if ship_to_type$="S"
			custship_dev=fnget_dev("ARM_CUSTSHIP")
			custship_tpl$=fnget_tpl$("ARM_CUSTSHIP")
			dim custship_tpl$:custship_tpl$
			read record (custship_dev,key=firm_id$+cust_id$+ship_to_no$,dom=*next) custship_tpl$
			callpoint!.setColumnData("<<DISPLAY>>.SNAME",custship_tpl.name$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD1",custship_tpl.addr_line_1$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD2",custship_tpl.addr_line_2$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD3",custship_tpl.addr_line_3$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD4",custship_tpl.addr_line_4$)
			callpoint!.setColumnData("<<DISPLAY>>.SCITY",custship_tpl.city$)
			callpoint!.setColumnData("<<DISPLAY>>.SSTATE",custship_tpl.state_code$)
			callpoint!.setColumnData("<<DISPLAY>>.SZIP",custship_tpl.zip_code$)
		else
			callpoint!.setColumnData("<<DISPLAY>>.SNAME","Same")
			callpoint!.setColumnData("<<DISPLAY>>.SADD1","")
			callpoint!.setColumnData("<<DISPLAY>>.SADD2","")
			callpoint!.setColumnData("<<DISPLAY>>.SADD3","")
			callpoint!.setColumnData("<<DISPLAY>>.SADD4","")
			callpoint!.setColumnData("<<DISPLAY>>.SCITY","")
			callpoint!.setColumnData("<<DISPLAY>>.SSTATE","")
			callpoint!.setColumnData("<<DISPLAY>>.SZIP","")
		endif
	else
		ordship_tpl$=fnget_tpl$("OPE_ORDSHIP")
		dim ordship_tpl$:ordship_tpl$
		read record (ordship_dev,key=firm_id$+cust_id$+ord_no$,dom=*next) ordship_tpl$
		callpoint!.setColumnData("<<DISPLAY>>.SNAME",ordship_tpl.name$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD1",ordship_tpl.addr_line_1$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD2",ordship_tpl.addr_line_2$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD3",ordship_tpl.addr_line_3$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD4",ordship_tpl.addr_line_4$)
		callpoint!.setColumnData("<<DISPLAY>>.SCITY",ordship_tpl.city$)
		callpoint!.setColumnData("<<DISPLAY>>.SSTATE",ordship_tpl.state_code$)
		callpoint!.setColumnData("<<DISPLAY>>.SZIP",ordship_tpl.zip_code$)
	endif

	callpoint!.setStatus("REFRESH")
return

disable_ctls: rem --- disable selected control

for dctl=1 to 9
	dctl$=dctl$[dctl]
	if cvs(dctl$,2)<>""
		wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
		wmap$=callpoint!.getAbleMap()
		wpos=pos(wctl$=wmap$,8)
		wmap$(wpos+6,1)=dmap$
		callpoint!.setAbleMap(wmap$)
		callpoint!.setStatus("ABLEMAP-REFRESH")
	endif
next dctl
return

get_op_params:
	ars01_dev=fnget_dev("ARS_PARAMS")
	ars01a$=fnget_tpl$("ARS_PARAMS")
	dim ars01a$:ars01a$
	read record (ars01_dev,key=firm_id$+"AR00") ars01a$
return

disp_ord_tot:
	user_tpl.ord_tot=0
	ope11_dev=fnget_dev("OPE_ORDDET")
	dim ope11a$:fnget_tpl$("OPE_ORDDET")
	opc_linecode_dev=fnget_dev("OPC_LINECODE")
	dim opc_linecode$:fnget_tpl$("OPC_LINECODE")
	read record(ope11_dev,key=firm_id$+callpoint!.getColumnData("OPE_ORDHDR.AR_TYPE")+
:		callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")+
:		callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO"),dom=*next)
	while 1
		read record(ope11_dev,end=*break)ope11a$
		if ope11a.firm_id$+ope11a.ar_type$+ope11a.customer_id$+ope11a.order_no$<>
:			firm_id$+callpoint!.getColumnData("OPE_ORDHDR.AR_TYPE")+
:			callpoint!.getColumnData("OPE_ORDHDR.CUSTOMER_ID")+
:			callpoint!.getColumnData("OPE_ORDHDR.ORDER_NO") break
		dim opc_linecode$:fattr(opc_linecode$)
		read record(opc_linecode_dev,key=firm_id$+ope11a.line_code$,dom=*next)opc_linecode$
		if pos(opc_linecode.line_type$="SNP") user_tpl.ord_tot=user_tpl.ord_tot+(ope11a.unit_price*ope11a.qty_ordered)
		if opc_linecode.line_type$="O" user_tpl.ord_tot=user_tpl.ord_tot+ope11a.ext_price
rem 0860 FIND (IVM01_DEV,KEY=N0$+W0$(33,20),DOM=0870)IOL=IVM01A
rem 0865 IF D2$(8,1)="Y" AND Y0$(26,1)="Y" THEN LET W[7]=W[6]
rem 0870 LET U[0]=U[0]+W[6],U[1]=U[1]+W[7],U[2]=U[2]+W[0]*W[4]
		endif
	wend
	callpoint!.setColumnData("<<DISPLAY>>.ORDER_TOT",str(user_tpl.ord_tot))
return

copy_order: rem --- Duplicate or Credit Historical Invoice
	if sign=0 sign=1
	call stbl("+DIR_PGM")+"adc_copyfile.aon",opt01a$,rec_data$,status
	callpoint!.setColumnData("OPE_ORDHDR.AR_INV_NO","")
	callpoint!.setColumnData("OPE_ORDHDR.AR_SHIP_VIA",opt01a.ar_ship_via$)
	callpoint!.setColumnData("OPE_ORDHDR.AR_TYPE",opt01a.ar_type$)
	callpoint!.setColumnData("OPE_ORDHDR.BACKORD_FLAG","")
	callpoint!.setColumnData("OPE_ORDHDR.CASH_SALE",opt01a.cash_sale$)
	callpoint!.setColumnData("OPE_ORDHDR.COMM_AMT",str(opt01a.comm_amt*sign))
	callpoint!.setColumnData("OPE_ORDHDR.COMM_PERCENT",opt01a.comm_pct$)
	callpoint!.setColumnData("OPE_ORDHDR.CREDIT_FLAG",opt01a.credit_flag$)
	callpoint!.setColumnData("OPE_ORDHDR.CUSTOMER_PO_NO","")
	callpoint!.setColumnData("OPE_ORDHDR.CUSTOMER_REL_NO",opt01a.customer_rel_no$)
	callpoint!.setColumnData("OPE_ORDHDR.DISCOUNT_AMT",str(opt01a.discount_amt*sign))
	callpoint!.setColumnData("OPE_ORDHDR.DISC_CODE",opt01a.disc_code$)
	callpoint!.setColumnData("OPE_ORDHDR.DIST_CODE",opt01a.dist_code$)
	callpoint!.setColumnData("OPE_ORDHDR.EXPIRE_DATE","")
	callpoint!.setColumnData("OPE_ORDHDR.FREIGHT_AMT",str(opt01a.freight_amt*sign))
	callpoint!.setColumnData("OPE_ORDHDR.INVOICE_DATE",user_tpl.def_ship$)
	callpoint!.setColumnData("OPE_ORDHDR.INVOICE_TYPE","S")
	callpoint!.setColumnData("OPE_ORDHDR.JOB_NO",opt01a.job_no$)
	callpoint!.setColumnData("OPE_ORDHDR.LOCK_STATUS",opt01a.lock_status$)
	callpoint!.setColumnData("OPE_ORDHDR.MESSAGE_CODE",opt01a.message_code$)
	callpoint!.setColumnData("OPE_ORDHDR.MISC_NO",opt01a.misc_no$)
	callpoint!.setColumnData("OPE_ORDHDR.ORDER_DATE",opt01a.order_date$)
	callpoint!.setColumnData("OPE_ORDHDR.ORDER_NO",opt01a.order_no$)
	callpoint!.setColumnData("OPE_ORDHDR.ORDINV_FLAG","O")
	callpoint!.setColumnData("OPE_ORDHDR.ORD_TAKEN_BY",opt01a.taken_by$)
	callpoint!.setColumnData("OPE_ORDHDR.PRICE_CODE",opt01a.price_code$)
	callpoint!.setColumnData("OPE_ORDHDR.PRICING_CODE",opt01a.pricing_code$)
	callpoint!.setColumnData("OPE_ORDHDR.PRINT_STATUS","N")
	callpoint!.setColumnData("OPE_ORDHDR.REPRINT_FLAG",opt01a.reprint_flag$)
	callpoint!.setColumnData("OPE_ORDHDR.SHIPMNT_DATE",user_tpl.def_ship$)
	callpoint!.setColumnData("OPE_ORDHDR.SHIPTO_NO",opt01a.shipto_no$)
	callpoint!.setColumnData("OPE_ORDHDR.SHIPTO_TYPE",opt01a.shipto_type$)
	callpoint!.setColumnData("OPE_ORDHDR.SLSPSN_CODE",opt01a.slspsn_code$)
	callpoint!.setColumnData("OPE_ORDHDR.TAXABLE_AMT",str(opt01a.taxable_amt*sign))
	callpoint!.setColumnData("OPE_ORDHDR.TAX_AMOUNT",opt01a.tax_amount$)
	callpoint!.setColumnData("OPE_ORDHDR.TAX_CODE",opt01a.tax_code$)
	callpoint!.setColumnData("OPE_ORDHDR.TERMS_CODE",opt01a.terms_code$)
	callpoint!.setColumnData("OPE_ORDHDR.TERRITORY",opt01a.territory$)
	callpoint!.setColumnData("OPE_ORDHDR.TOTAL_COST",opt01a.total_cost$)
	callpoint!.setColumnData("OPE_ORDHDR.TOTAL_SALES",opt01a.total_sales$)

rem --- copy Manual Ship To if any
	if opt01a.shipto_type$="M"
		dim ope31a$:fnget_tpl$("OPE_ORDSHIP")
		ope31_dev=fnget_dev("OPE_ORDSHIP")
		dim opt31a$:fnget_tpl$("OPT_INVSHIP")
		opt31_dev=fnget_dev("OPT_INVSHIP")
		readrecord(opt31_dev,key=firm_id$+opt01a.customer_id$+opt01a.ar_inv_no$,dom=*next)opt31a$
		call stbl("+DIR_PGM")+"adc_copyfile.aon",opt31a$,ope31a$,status
		ope31a.order_no$=rec_data.order_no$
		writerecord(ope31_dev,key=firm_id$+ope31a.customer_id$+ope31a.order_no$)ope31a$
	endif

rem --- copy detail lines
	dim opt11a$:fnget_tpl$("OPT_ORDDET")
	opt11_dev=fnget_dev("OPT_ORDDET")
	dim ope11a$:fnget_tpl$("OPE_ORDDET")
	ope11_dev=fnget_dev("OPE_ORDDET")
	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm01a$:fnget_tpl$("IVM_ITEMMAST")
	read(opt11_dev,key=firm_id$+opt01a.ar_type$+opt01a.customer_id$+opt01a.ar_inv_no$,dom=*next)
	opc_linecode_dev=fnget_dev("OPC_LINECODE")
	dim opc_linecode$:fnget_tpl$("OPC_LINECODE")
	while 1
		read record(opt11_dev,end=*break) opt11a$
		if firm_id$+opt01a.ar_type$+opt01a.customer_id$+opt01a.ar_inv_no$<>
:			opt11a.firm_id$+opt11a.ar_type$+opt11a.customer_id$+opt11a.ar_inv_no$ break
		call stbl("+DIR_PGM")+"adc_copyfile.aon",opt11a$,ope11a$,status		
		if cvs(opt11a.line_code$,2)<>""
			read record (opc_linecode_dev,key=firm_id$+opt11a.line_code$,dom=*next)opc_linecode$
		endif
		if opc_linecode.line_type$<>"M"
			if opc_linecode.line_type$="O" and ope11a.commit_flag$="N"
				ope11a.ext_price=ope11a.unit_price
				ope11a.unit_price=0			
			endif
			if sign<0
				ope11a.qty_ordered=-ope11a.qty_shipped
				ope11a.ext_price=-ope11a.ext_price
			endif
			if opc_linecode.line_type$<>"O"
				ope11a.qty_shipped=ope11a.qty_ordered
				ope11a.qty_backord=0
				ope11a.taxable_amt=0
				ope11a.ext_price=round(ope11a.unit_price*ope11a.qty_shipped,2)
			endif
			if pos(opc_linecode.line_type$="SP")=0
				if opc_linecode.taxable_flag$="Y"
					ope11a.taxable_amt=ope11a.ext_price
				endif
			else
				read record (ivm01_dev,key=firm_id$+ope11a.item_id$,dom=*next)ivm01a$
				if opc_linecode.taxable_flag$="Y" and ivm01a.taxable_flag$="Y"
					ope11a.taxable_amt=ope11a.ext_price
				endif
			endif
		endif
		ope11a.order_no$=rec_data.order_no$
		ope11a.est_shp_date$=rec_data$.shipmnt_date$
		ope11a.commit_flag$="Y"
		ope11a.pick_flag$="N"
		if ope11a.est_shp_date$>user_tpl.def_commit$
			ope11a.commit_flag$="N"
		endif
escape;rem what about line 775 in ope_dd.bbx?
		writerecord(ope11_dev,key=firm_id$+ope11a.ar_type$+ope11a.customer_id$+ope11a.order_no$+ope11a.line_no$)ope11a$
escape;rem what about lines 785 and 790 in ope_dd.bbx
	wend
escape;rem lines 800 to 895 here
return
[[OPE_ORDHDR.ARAR]]
rem --- display order total
	gosub disp_ord_tot

rem --- Populate address fields

	cust_id$=rec_data.customer_id$
	gosub bill_to_info
	ship_to_type$=rec_data.shipto_type$
	ship_to_no$=rec_data.shipto_no$
	ord_no$=rec_data.order_no$
	gosub ship_to_info
	dim dctl$[9]
	dctl$[1]="<<DISPLAY>>.SNAME"
	dctl$[2]="<<DISPLAY>>.SADD1"
	dctl$[3]="<<DISPLAY>>.SADD2"
	dctl$[4]="<<DISPLAY>>.SADD3"
	dctl$[5]="<<DISPLAY>>.SADD4"
	dctl$[6]="<<DISPLAY>>.SCITY"
	dctl$[7]="<<DISPLAY>>.SSTATE"
	dctl$[8]="<<DISPLAY>>.SZIP"
	if rec_data.shipto_type$="M"
		dmap$=""
	else
		dmap$="I"
	endif
	gosub disable_ctls
	dim dctl$[9]
	dctl$[1]="OPE_ORDHDR.EXPIRE_DATE"
	if rec_data.invoice_type$<>"P"
		dmap$="I"
	else
		dmap$=""
	endif
	gosub disable_ctls
[[OPE_ORDHDR.BSHO]]
rem --- open needed files
	num_files=26
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARM_CUSTMAST",open_opts$[1]="OTA"
	open_tables$[2]="ARM_CUSTSHIP",open_opts$[2]="OTA"
	open_tables$[3]="OPE_ORDSHIP",open_opts$[3]="OTA"
	open_tables$[4]="ARS_PARAMS",open_opts$[4]="OTA"
	open_tables$[5]="ARM_CUSTDET",open_opts$[5]="OTA"
	open_tables$[6]="OPE_INVCASH",open_opts$[6]="OTA"
	open_tables$[7]="ARS_CREDIT",open_opts$[7]="OTA"
	open_tables$[8]="OPC_LINECODE",open_opts$[8]="OTA"
	open_tables$[9]="GLS_PARAMS",open_opts$[9]="OTA"
	open_tables$[10]="GLS_PARAMS",open_opts$[10]="OTA"
	open_tables$[11]="IVM_LSMASTER",open_opts$[11]="OTA"
rem	open_tables$[12]="IVX_LSCUST",open_opts$[12]="OTA"
	open_tables$[13]="IVM_ITEMMAST",open_opts$[13]="OTA"
rem	open_tables$[14]="IVS_LSXREF",open_opts$[14]="OTA"
rem	open_tables$[15]="IVX_LSVEND",open_opts$[15]="OTA"
	open_tables$[16]="IVM_ITEMWHSE",open_opts$[16]="OTA"
	open_tables$[17]="IVM_ITEMACT",open_opts$[17]="OTA"
	open_tables$[18]="IVT_ITEMTRAN",open_opts$[18]="OTA"
	open_tables$[19]="IVM_ITEMTIER",open_opts$[19]="OTA"
	open_tables$[20]="IVM_ITEMACT",open_opts$[20]="OTA"
	open_tables$[21]="IVM_ITEMVEND",open_opts$[21]="OTA"
	open_tables$[22]="IVT_LSTRANS",open_opts$[22]="OTA"
	open_tables$[23]="OPT_ORDHDR",open_opts$[23]="OTA"
	open_tables$[24]="OPT_ORDDET",open_opts$[24]="OTA"
	open_tables$[25]="OPE_ORDDET",open_opts$[25]="OTA"
	open_tables$[26]="OPT_INVSHIP",open_opts$[26]="OTA"
	gosub open_tables

rem --- get AR Params
	dim ars01a$:open_tpls$[4]
	read record(num(open_chans$[4]),key=firm_id$+"AR00")ars01a$

rem --- disable display fields

	dim dctl$[9]
	dmap$="I"
	dctl$[1]="<<DISPLAY>>.BADD1"
	dctl$[2]="<<DISPLAY>>.BADD2"
	dctl$[3]="<<DISPLAY>>.BADD3"
	dctl$[4]="<<DISPLAY>>.BADD4"
	dctl$[5]="<<DISPLAY>>.BCITY"
	dctl$[6]="<<DISPLAY>>.BSTATE"
	dctl$[7]="<<DISPLAY>>.BZIP"
	dctl$[8]="<<DISPLAY>>.ORDER_TOT"
	if ars01a.job_nos$<>"Y" dctl$[9]="OPE_ORDHDR.JOB_NO"
	gosub disable_ctls
	dmap$="I"
	dctl$[1]="<<DISPLAY>>.SNAME"
	dctl$[2]="<<DISPLAY>>.SADD1"
	dctl$[3]="<<DISPLAY>>.SADD2"
	dctl$[4]="<<DISPLAY>>.SADD3"
	dctl$[5]="<<DISPLAY>>.SADD4"
	dctl$[6]="<<DISPLAY>>.SCITY"
	dctl$[7]="<<DISPLAY>>.SSTATE"
	dctl$[8]="<<DISPLAY>>.SZIP"
	gosub disable_ctls
	dctl$[1]="<<DISPLAY>>.AGING_FUTURE"
	dctl$[2]="<<DISPLAY>>.AGING_CUR"
	dctl$[3]="<<DISPLAY>>.AGING_30"
	dctl$[4]="<<DISPLAY>>.AGING_60"
	dctl$[5]="<<DISPLAY>>.AGING_90"
	dctl$[6]="<<DISPLAY>>.AGING_120"
	dctl$[7]="<<DISPLAY>>.TOT_AGING"
	gosub disable_ctls

rem --- set up UserObj! as vector
	UserObj!=SysGUI!.makeVector()
	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.ORDER_TOT","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.ORDER_TOT","CTLI"))
	tamt!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
	UserObj!.addItem(tamt!)

rem --- Setup user_tpl$
	ars_credit_dev=num(open_chans$[7])
	dim ars_credit$:open_tpls$[7]
	read record (ars_credit_dev,key=firm_id$+"AR01")ars_credit$
	user_tpl$="new_rec:c(1),credit_installed:c(1),display_bal:c(1),ord_tot:n(15),"
	user_tpl$=user_tpl$+"line_boqty:n(15),line_shipqty:n(15),def_ship:c(8),def_commit:c(8)"
	dim user_tpl$:user_tpl$
	user_tpl.credit_installed$=ars_credit.sys_install$
	user_tpl.display_bal$=ars_credit.display_bal$
	user_tpl.def_ship$=stbl("OPE_DEF_SHIP")
	user_tpl.def_commit$=stbl("OPE_DEF_COMMIT")
