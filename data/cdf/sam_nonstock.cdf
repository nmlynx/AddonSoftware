[[SAM_NONSTOCK.NONSTOCK_NO.AVAL]]
rem --- Enable/Disable Summary button
	prod_type$=callpoint!.getColumnData("SAM_NONSTOCK.PRODUCT_TYPE")
	item_no$=callpoint!.getUserInput()
	gosub summ_button
[[SAM_NONSTOCK.PRODUCT_TYPE.AVAL]]
rem --- Enable/Disable Summary button
	prod_type$=callpoint!.getUserInput()
	item_no$=callpoint!.getColumnData("SAM_NONSTOCK.NONSTOCK_NO")
	gosub summ_button
[[SAM_NONSTOCK.AOPT-SUMM]]
rem --- Calculate and display summary info
	tcst=0
	tqty=0
	tsls=0
	trip_key$=firm_id$+callpoint!.getColumnData("SAM_NONSTOCK.YEAR")+callpoint!.getColumnData("SAM_NONSTOCK.PRODUCT_TYPE")
	item_no$=callpoint!.getColumnData("SAM_NONSTOCK.NONSTOCK_NO")
	callpoint!.setColumnData("SAM_NONSTOCK.NONSTOCK_NO","** Summary **")

rem --- Start progress meter
	task_id$=info(3,0)
	Window_Name$="Summarizing"
	Progress! = bbjapi().getGroupNamespace()
	Progress!.setValue("+process_task",task_id$+"^C^"+Window_Name$+"^CNC-IND^"+str(n)+"^")

	sam_dev=	fnget_dev("SAM_NONSTOCK")
	dim sam_tpl$:fnget_tpl$("SAM_NONSTOCK")
	dim qty[13],cost[13],sales[13]
	read(sam_dev,key=trip_key$,dom=*next)
	while 1
		read record(sam_dev,end=*break)sam_tpl$

		Progress!.getValue("+process_task_"+task_id$,err=*next);break

		if pos(trip_key$=sam_tpl$)<>1 break
		for x=1 to 13
			qty[x]=qty[x]+nfield(sam_tpl$,"qty_shipped_"+str(x:"00"))
			cost[x]=cost[x]+nfield(sam_tpl$,"total_cost_"+str(x:"00"))
			sales[x]=sales[x]+nfield(sam_tpl$,"total_sales_"+str(x:"00"))
		next x
	wend
	For x=1 to 13
		tcst=tcst+cost[x]
		tqty=tqty+qty[x]
		tsls=tsls+sales[x]
	next x

Progress!.setValue("+process_task",task_id$+"^D^")

rem --- Now display all of these things and disable key fields
	for x=1 to 13
		callpoint!.setColumnData("SAM_NONSTOCK.TOTAL_SALES_"+str(x:"00"),str(sales[x]))
		callpoint!.setColumnData("SAM_NONSTOCK.TOTAL_COST_"+str(x:"00"),str(cost[x]))
		callpoint!.setColumnData("SAM_NONSTOCK.QTY_SHIPPED_"+str(x:"00"),str(qty[x]))
	next x
	callpoint!.setColumnData("<<DISPLAY>>.TCST",str(tcst))
	callpoint!.setColumnData("<<DISPLAY>>.TQTY",str(tqty))
	callpoint!.setColumnData("<<DISPLAY>>.TSLS",str(tsls))

	callpoint!.setColumnEnabled("SAM_NONSTOCK.YEAR",0)
	callpoint!.setColumnEnabled("SAM_NONSTOCK.PRODUCT_TYPE",0)
	callpoint!.setColumnEnabled("SAM_NONSTOCK.NONSTOCK_NO",0)
	callpoint!.setOptionEnabled("SUMM",0)
	callpoint!.setStatus("REFRESH-CLEAR")
[[SAM_NONSTOCK.ARAR]]
rem --- Create totals

	gosub calc_totals
[[SAM_NONSTOCK.AREC]]
rem --- Enable key fields
	ctl_name$="SAM_NONSTOCK.YEAR"
	ctl_stat$=""
	gosub disable_fields
	ctl_name$="SAM_NONSTOCK.PRODUCT_TYPE"
	ctl_stat$=""
	gosub disable_fields
	ctl_name$="SAM_NONSTOCK.NONSTOCK_NO"
	ctl_stat$=""
	gosub disable_fields
	callpoint!.setColumnData("<<DISPLAY>>.TCST","0")
	callpoint!.setColumnData("<<DISPLAY>>.TQTY","0")
	callpoint!.setColumnData("<<DISPLAY>>.TSLS","0")
	callpoint!.setStatus("REFRESH")
[[SAM_NONSTOCK.BSHO]]
rem --- Check for parameter record
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SAS_PARAMS",open_opts$[1]="OTA"
	gosub open_tables
	sas01_dev=num(open_chans$[1]),sas01a$=open_tpls$[1]

	dim sas01a$:sas01a$
	read record (sas01_dev,key=firm_id$+"SA00")sas01a$
	if sas01a.by_nonstock$<>"Y"
		msg_id$="INVALID_SA"
		dim msg_tokens$[1]
		msg_tokens$[1]="Non-Stock"
		gosub disp_message
		bbjAPI!=bbjAPI()
		rdFuncSpace!=bbjAPI!.getGroupNamespace()
		rdFuncSpace!.setValue("+build_task","OFF")
		release
	endif

rem --- disable total elements
	ctl_name$="<<DISPLAY>>.TQTY"
	ctl_stat$="I"
	gosub disable_fields
	ctl_name$="<<DISPLAY>>.TCST"
	ctl_stat$="I"
	gosub disable_fields
	ctl_name$="<<DISPLAY>>.TSLS"
	ctl_stat$="I"
	gosub disable_fields
	callpoint!.setStatus("ABLEMAP-ACTIVATE-REFRESH")

rem --- Disable Summary Button
	callpoint!.setOptionEnabled("SUMM",0)
[[SAM_NONSTOCK.<CUSTOM>]]
disable_fields:
rem --- used to disable/enable controls depending on parameter settings
rem --- send in control to toggle (format "ALIAS.CONTROL_NAME"), and D or space to disable/enable

	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)

	return

calc_totals:
	
	tcst=0
	tqty=0
	tsls=0
	For x=1 to 13
		tcst=tcst+num(callpoint!.getColumnData("SAM_NONSTOCK.TOTAL_COST_"+str(x:"00")))
		tqty=tqty+num(callpoint!.getColumnData("SAM_NONSTOCK.QTY_SHIPPED_"+str(x:"00")))
		tsls=tsls+num(callpoint!.getColumnData("SAM_NONSTOCK.TOTAL_SALES_"+str(x:"00")))
	next x
	callpoint!.setColumnData("<<DISPLAY>>.TCST",str(tcst))
	callpoint!.setColumnData("<<DISPLAY>>.TQTY",str(tqty))
	callpoint!.setColumnData("<<DISPLAY>>.TSLS",str(tsls))
	callpoint!.setStatus("REFRESH")

	return

rem --- Enable/Disable Summary Button
summ_button:
	callpoint!.setOptionEnabled("SUMM",1)
	if cvs(prod_type$,2)=""
		if cvs(item_no$,2)<>""
			callpoint!.setOptionEnabled("SUMM",0)
		endif
	else
		if cvs(item_no$,2)<>""
			callpoint!.setOptionEnabled("SUMM",0)
		endif
	endif
	return
[[SAM_NONSTOCK.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records

syspgmdir$=stbl("+DIR_SYP",err=*next)

key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_NONSTOCK.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_NONSTOCK.YEAR")
	if cvs(callpoint!.getColumnData("SAM_NONSTOCK.PRODUCT_TYPE"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_NONSTOCK.PRODUCT_TYPE")
		if cvs(callpoint!.getColumnData("SAM_NONSTOCK.NONSTOCK_NO"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_NONSTOCK.NONSTOCK_NO")
		endif
	endif
endif

call syspgmdir$+"bac_key_template.bbj","SAM_NONSTOCK","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call syspgmdir$+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_NONSTOCK",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

rem --- get record and redisplay

sam_tpl$=fnget_tpl$("SAM_NONSTOCK")
dim sam_tpl$:sam_tpl$
while 1
	readrecord(fnget_dev("SAM_NONSTOCK"),key=rd_key$,dom=*break)sam_tpl$
	callpoint!.setColumnData("SAM_NONSTOCK.YEAR",rd_key.year$)
	callpoint!.setColumnData("SAM_NONSTOCK.PRODUCT_TYPE",rd_key.product_type$)
	callpoint!.setColumnData("SAM_NONSTOCK.NONSTOCK_NO",rd_key.nonstock_no$)
	For x=1 to 13
		callpoint!.setColumnData("SAM_NONSTOCK.QTY_SHIPPED_"+str(x:"00"),FIELD(sam_tpl$,"qty_shipped_"+str(x:"00")))
		callpoint!.setColumnData("SAM_NONSTOCK.TOTAL_COST_"+str(x:"00"),FIELD(sam_tpl$,"total_cost_"+str(x:"00")))
		callpoint!.setColumnData("SAM_NONSTOCK.TOTAL_SALES_"+str(x:"00"),FIELD(sam_tpl$,"total_sales_"+str(x:"00")))
	next x
	gosub calc_totals
	ctl_name$="SAM_NONSTOCK.YEAR"
	ctl_stat$="D"
	gosub disable_fields
	ctl_name$="SAM_NONSTOCK.PRODUCT_TYPE"
	ctl_stat$="D"
	gosub disable_fields
	ctl_name$="SAM_NONSTOCK.NONSTOCK_NO"
	ctl_stat$="D"
	gosub disable_fields
	callpoint!.setRecordStatus("CLEAR")
	callpoint!.setStatus("ABLEMAP-ACTIVATE-REFRESH-CLEAR")
	break
wend
