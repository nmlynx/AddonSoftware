[[OPE_INVSTATION.BSHO]]
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
		callpoint!.setTableColumnAttribute("OPE_INVSTATION.DEF_STATION", "DFLT", userdefault_rec.default_station$)
	endif
[[OPE_INVSTATION.BEND]]
rem --- Set value into an STBL so calling program can access it

	ignore$ = stbl("OPE_DEF_STATION", callpoint!.getColumnData("OPE_ORDDATES.DEF_STATION") )
	release
