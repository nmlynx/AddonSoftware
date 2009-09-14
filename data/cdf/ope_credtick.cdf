[[OPE_CREDTICK.CUSTOMER_ID.AVAL]]
rem --- set customer for return to master
	callpoint!.setDevObject("customer_id",callpoint!.getUserInput())
[[OPE_CREDTICK.TICKLER_DATE.AVAL]]
rem --- set date for return to master
	callpoint!.setDevObject("tick_date",callpoint!.getUserInput())
[[OPE_CREDTICK.BEND]]
rem --- validate it's truly a new record

	arm01_dev=fnget_dev("ARM_CUSTMAST")
	dim arm01a$:fnget_tpl$("ARM_CUSTMAST")
	while 1
		findrecord(arm01_dev,key=firm_id$+callpoint!.getColumnData("OPE_CREDTICK.CUSTOMER_ID"),dom=*break)
		callpoint!.setStatus("ABORT")
	wend
[[OPE_CREDTICK.BSHO]]
rem --- open files
	num_files=2
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="OPE_CREDDATE",open_opts$[1]="OTA"
	open_tables$[2]="ARM_CUSTMAST",open_opts$[2]="OTA"
	gosub open_tables
	opm03_dev=num(open_chans$[1]),ope03a$=open_tpls$[1]
	arm01_dev=num(open_chans$[2]),arm01a$=open_tpls$[2]
