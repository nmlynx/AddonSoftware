[[ARC_SALECODE.BDEL]]
rem --- Check if code is used as a default code

	num_files = 1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARS_CUSTDFLT", open_opts$[1]="OTA"
	gosub open_tables
	ars_custdflt_dev = num(open_chans$[1])
	dim ars_rec$:open_tpls$[1]

	find record(ars_custdflt_dev,key=firm_id$+"D",dom=*next)ars_rec$
	if ars_rec.slspsn_code$ = callpoint!.getColumnData("ARC_SALECODE.SLSPSN_CODE") then
		callpoint!.setMessage("AR_SALESPSN_IN_DFLT")
		callpoint!.setStatus("ABORT")
	endif
