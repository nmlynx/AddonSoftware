[[IVE_TRANSFER.<CUSTOM>]]
#include std_missing_params.src
[[IVE_TRANSFER.AWIN]]
rem --- Open files

	num_files=7
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS",   open_opts$[1]="OTA"
	open_tables$[2]="GLS_PARAMS",   open_opts$[2]="OTA"
	rem open_tables$[3]="IVC_TRANCODE", open_opts$[3]="OTA"
	rem open_tables$[4]="IVE_TRANSDET", open_opts$[4]="OTA"
	rem open_tables$[5]="IVM_ITEMMAST", open_opts$[5]="OTA"
	rem open_tables$[6]="IVM_ITEMWHSE", open_opts$[6]="OTA"
	rem open_tables$[7]="IVM_LSMASTER", open_opts$[7]="OTA"

	gosub open_tables

	ivs01_dev=num(open_chans$[1])
	gls01_dev=num(open_chans$[2])
	dim ivs01a$:open_tpls$[1]
	dim gls01a$:open_tpls$[2]

rem --- Get parameter records

	find record(ivs01_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs01a$

rem --- Exit if not multi-warehouse

	if ivs01a.multi_whse$ <> "Y" then
		msg_id$ = "IV_NOT_MULTI_WHSE"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break; rem --- exit callpoint
	endif

[[IVE_TRANSFER.TRANS_DATE.AVAL]]
rem --- Old code for reference
rem 1260 IF GL$="Y" THEN CALL "glc_ea.bbx",V$,"Y",PERIOD$,YEAR$,STATUS
rem 1270 IF STATUS>99 THEN GOTO 1200
