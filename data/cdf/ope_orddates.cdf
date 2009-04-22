[[OPE_ORDDATES.BSHO]]
rem --- Open File(s)
	
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ADM_USERDEFAULTS", open_opts$[1]="OTA"

	gosub open_tables

	userdefault_dev = num(open_chans$[1])
	dim userdefault_rec$:open_tpls$[1]

    
rem --- Set this user's default POS station

	start_block = 1
	
	if start_block then
		user$ = stbl("+USER_ID",err=*endif)
		find record (userdefault_dev, key=firm_id$+pad(user$, 16), dom=*endif) userdefault_rec$
		callpoint!.setTableColumnAttribute("OPE_ORDDATES.DEF_STATION", "DFLT", userdefault_rec.default_station$)
	endif
[[OPE_ORDDATES.BEND]]
rem --- Set values into STBLs

	ignore$ = stbl("OPE_DEF_SHIP",    callpoint!.getColumnData("OPE_ORDDATES.DEF_SHIP") )
	ignore$ = stbl("OPE_DEF_COMMIT",  callpoint!.getColumnData("OPE_ORDDATES.DEF_COMMIT") )
	ignore$ = stbl("OPE_DEF_STATION", callpoint!.getColumnData("OPE_ORDDATES.DEF_STATION") )

	release
[[OPE_ORDDATES.ARAR]]
rem --- Setup default dates

	ars01_dev=fnget_dev("ARS_PARAMS")
	ars01a$=fnget_tpl$("ARS_PARAMS")

	dim ars01a$:ars01a$
	read record (ars01_dev,key=firm_id$+"AR00") ars01a$

	orddate$=date(0:"%Y%Mz%Dz")
	comdate$=orddate$
	shpdate$=orddate$

	comdays=num(ars01a.commit_days$)
	shpdays=num(ars01a.def_shp_days$)

	if comdays then call stbl("+DIR_PGM")+"adc_daydates.aon",orddate$,comdate$,comdays
	if shpdays then call stbl("+DIR_PGM")+"adc_daydates.aon",orddate$,shpdate$,shpdays

	callpoint!.setColumnData("OPE_ORDDATES.DEF_COMMIT",comdate$)
	callpoint!.setColumnData("OPE_ORDDATES.DEF_SHIP",shpdate$)
	callpoint!.setStatus("REFRESH")

	temp_stbl$=stbl("OPE_DEF_SHIP",shpdate$)
	temp_stbl$=stbl("OPE_DEF_COMMIT",comdate$)
