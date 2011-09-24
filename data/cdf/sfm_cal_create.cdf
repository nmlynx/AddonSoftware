[[SFM_CAL_CREATE.BFMC]]
rem --- See if BOM is being used

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFS_PARAMS",open_opts$[1]="OTA"
	gosub open_tables

	sfs_params=num(open_chans$[1])
	dim sfs_params$:open_tpls$[1]

	read record(sfs_params,key=firm_id$+"SF00",dom=std_missing_params) sfs_params$

	if sfs_params.bm_interface$<>"Y"
		callpoint!.setTableColumnAttribute("SFM_CAL_CREATE.OP_CODE","DTAB","SFC_OPRTNCOD")
	endif
[[SFM_CAL_CREATE.<CUSTOM>]]
rem ===============================================
write_rec:
rem ===============================================

rem	6010 LET A0$=N0$+OPCODE$+OLD_DATE$(1,2)+OLD_DATE$(3,2)
rem	6020 LET A[0]=32
rem	6030 LET A[0]=A[0]-1
rem	6040 LET X=JUL(1900+FNYY_YEAR(X9$(1,2)),NUM(X9$(3,2)),A[0],ERR=6030)
rem	6050 WRITE (WOM04_DEV,KEY=A0$(1,K9))IOL=WOM04A
rem	6060 DIM A[31]
rem	6065 FOR X9=1 TO 31
rem	6066 LET A[X9]=-1
rem	6067 NEXT X9
rem	6070 LET OLD_DATE$=first_date$
rem	gosub get_rec

	return

rem ===============================================
get_rec:
rem ===============================================

	dim wom04a$:fattr(wom04a$)
	wom04a.firm_id$=firm_id$	
	wom04a.op_code$=callpoint!.getColumnData("SFM_CAL_CREATE.OP_CODE")
	wom04a.year$=first_date$(1,4)
	wom04a.month$=first_date$(5,2)
	for x9=1 to 31
		field wom04a$,"hrs_per_day_"+str(x9:"00")=-1
	next x9
	read record (wom04_dev,key=firm_id$+wom04a.op_code$+wom04a.year$+wom04a.month$,dom=*next) wom04a$

	return

#include std_missing_params.src
[[SFM_CAL_CREATE.ASVA]]
rem  --- Write records

	wom04_dev=fnget_dev("SFM_OPCALNDR")
	dim wom04a$:fnget_tpl$("SFM_OPCALNDR")
	first_date$=callpoint!.getColumnData("SFM_CAL_CREATE.FIRST_SCHED_DT")
	old_date$=first_date$
	gosub get_rec
	for week_count=1 to R0
		for day_count=1 TO 7
rem			4230 CALL "SYC.CB",first_date$,X0$,X0
rem			if first_date$(1,6)<>old_date$(1,6) THEN gosub write_rec
rem			4250 IF POS(X0$=R3$,3)>0 THEN LET A[NUM(first_date$(7,2))]=0; GOTO 4270
rem			4260 LET A[NUM(first_date$(7,2))]=R1
rem			4270 LET X9$=first_date$
rem			4285 LET X0$=""
rem			4290 CALL "SYC.CA",first_date$,X0$,1
rem			4295 LET first_date$=X0$
		next day_count
	next week_count

	gosub write_rec
[[SFM_CAL_CREATE.OP_CODE.AVAL]]
rem --- Calc Last Date Defined for this Op Code

	op_code$=callpoint!.getUserInput()
	last_date$="        "
	sfm_cal=fnget_dev("SFM_OPCALNDR")
	dim sfm_cal$:fnget_tpl$("SFM_OPCALNDR")

	read (sfm_cal,key=firm_id$+op_code$,dom=*next)
	while 1
		read record (sfm_cal,end=*break) sfm_cal$
		if pos(firm_id$+op_code$=sfm_cal$)<>1 break
		for x=sfm_cal.days_in_mth to 1 step -1
			if nfield(sfm_cal$,"hrs_per_day_"+str(x:"00"))>=0 
				x$=str(x:"00")
				break
			endif
		next x
		last_date$=sfm_cal.year$+sfm_cal.month$+x$
	wend

	callpoint!.setColumnData("<<DISPLAY>>.LAST_SCHED_DT",last_date$,1)
[[SFM_CAL_CREATE.BSHO]]
rem --- Open files

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFM_OPCALNDR",open_opts$[1]="OTA"
	gosub open_tables
