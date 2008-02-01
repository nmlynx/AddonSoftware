[[OPE_ORDHDR.ASHO]]
call stbl("+DIR_SYP")+"bam_run_prog.bbj","OPE_ORDDATES",stbl("+USER_ID"),"MNT","",table_chans$[all]
[[OPE_ORDHDR.INVOICE_TYPE.AVAL]]
rem --- enable/disable expire date based on value
	dim dctl$[8]
	dctl$[1]="OPE_ORDHDR.EXPIRE_DATE"
	if callpoint!.getColumnData("OPE_ORDHDR.INVOICE_TYPE")<>"P"
		dmap$="I"
	else
		dmap$=""
	endif
	gosub disable_ctls
[[OPE_ORDHDR.AREC]]
rem --- reset expiration date to enabled
	callpoint!.setColumnData("OPE_ORDHDR.ORD_TAKEN_BY",sysinfo.user_id$)
	dim dctl$[8]
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
	
	if callpoint!.getColumnData("OPE_ORDHDR.SHIPTO_NO")<>"000099"
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
[[OPE_ORDHDR.SHIPTO_NO.AVAL]]
rem --- See which way to deal with ship to's
	callpoint!.setColumnData("<<DISPLAY>>.SNAME","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD1","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD2","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD3","")
	callpoint!.setColumnData("<<DISPLAY>>.SADD4","")
	callpoint!.setColumnData("<<DISPLAY>>.SCITY","")
	callpoint!.setColumnData("<<DISPLAY>>.SSTATE","")
	callpoint!.setColumnData("<<DISPLAY>>.SZIP","")
	dim dctl$[8]
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
	if callpoint!.getColumnData("OPE_ORDHDR.SHIPTO_NO")="000099"
		dmap$=""
	else
		dmap$="I"
	endif
	gosub disable_ctls
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
:				custdet_tpl.aging_cur+
:				custdet_tpl.aging_30+
:				custdet_tpl.aging_60+
:				custdet_tpl.aging_90+
:				custdet_tpl.aging_120
	callpoint!.setColumnData("<<DISPLAY>>.AGING_120",custdet_tpl.aging_120$)
	callpoint!.setColumnData("<<DISPLAY>>.AGING_30",custdet_tpl.aging_30$)
	callpoint!.setColumnData("<<DISPLAY>>.AGING_60",custdet_tpl.aging_60$)
	callpoint!.setColumnData("<<DISPLAY>>.AGING_90",custdet_tpl.aging_90$)
	callpoint!.setColumnData("<<DISPLAY>>.AGING_CUR",custdet_tpl.aging_cur$)
	callpoint!.setColumnData("<<DISPLAY>>.AGING_FUTURE",custdet_tpl.aging_future$)
	callpoint!.setColumnData("<<DISPLAY>>.TOT_AGING",ar_balance$)
	callpoint!.setStatus("REFRESH")
return

ship_to_info: rem --- get and display Bill To Information

	ordship_dev=fnget_dev("OPE_ORDSHIP")
	if ship_to_no$<>"000099"
		if num(ship_to_no$)<>0
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

for dctl=1 to 8
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
[[OPE_ORDHDR.ARAR]]
rem --- Populate address fields

	cust_id$=rec_data.customer_id$
	gosub bill_to_info
	ship_to_no$=rec_data.shipto_no$
	ord_no$=rec_data.order_no$
	gosub ship_to_info
	dim dctl$[8]
	dctl$[1]="<<DISPLAY>>.SNAME"
	dctl$[2]="<<DISPLAY>>.SADD1"
	dctl$[3]="<<DISPLAY>>.SADD2"
	dctl$[4]="<<DISPLAY>>.SADD3"
	dctl$[5]="<<DISPLAY>>.SADD4"
	dctl$[6]="<<DISPLAY>>.SCITY"
	dctl$[7]="<<DISPLAY>>.SSTATE"
	dctl$[8]="<<DISPLAY>>.SZIP"
	if rec_data.shipto_no$="000099"
		dmap$=""
	else
		dmap$="I"
	endif
	gosub disable_ctls
	dim dctl$[8]
	dctl$[1]="OPE_ORDHDR.EXPIRE_DATE"
	if rec_data.invoice_type$<>"P"
		dmap$="I"
	else
		dmap$=""
	endif
	gosub disable_ctls
[[OPE_ORDHDR.BSHO]]
rem --- open needed files
	num_files=5
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARM_CUSTMAST",open_opts$[1]="OTA"
	open_tables$[2]="ARM_CUSTSHIP",open_opts$[2]="OTA"
	open_tables$[3]="OPE_ORDSHIP",open_opts$[3]="OTA"
	open_tables$[4]="ARS_PARAMS",open_opts$[4]="OTA"
	open_tables$[5]="ARM_CUSTDET",open_opts$[5]="OTA"
	gosub open_tables

rem --- get Parameters
	dim ars01a$:open_tpls$[4]
	read record (num(open_chans$[4]),key=firm_id$+"AR00") ars01a$

rem --- disable display fields

	dim dctl$[8]
	dmap$="I"
	dctl$[1]="<<DISPLAY>>.BADD1"
	dctl$[2]="<<DISPLAY>>.BADD2"
	dctl$[3]="<<DISPLAY>>.BADD3"
	dctl$[4]="<<DISPLAY>>.BADD4"
	dctl$[5]="<<DISPLAY>>.BCITY"
	dctl$[6]="<<DISPLAY>>.BSTATE"
	dctl$[7]="<<DISPLAY>>.BZIP"
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
