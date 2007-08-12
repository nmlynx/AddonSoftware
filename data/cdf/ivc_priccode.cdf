[[IVC_PRICCODE.BWRI]]
escape; rem "before write
rem "need to flesh out this routine...
rem "should make sure no intervening 0's
rem "should also make sure each qty > previous one
ok$="Y"
for x=2 to 10
wkvar$="BREAK_QTY_"+str(x:"00")
wkvar1$="BREAK_QTY_"+str(x-1:"00")

if num(field(rec_data$,wkvar$))<=num(field(rec_data$,wkvar1$))
	ok$="N"
endif
next x

if ok$="N"
	msg_id$="IV_QTYERR"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_10.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_09.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_08.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_07.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_06.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_05.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_04.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_03.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_02.AVAL]]
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif
[[IVC_PRICCODE.BREAK_PCT_01.AVAL]]
escape; REM 
gosub validate_margin
if ok$="N"
	callpoint!.setStatus("ABORT")
endif

	
[[IVC_PRICCODE.<CUSTOM>]]
validate_margin:
	ok$="Y"
	if callpoint!.getColumnData("IVC_PRICCODE.IV_PRICE_MTH")="M"
		if num(callpoint!.getUserInput())>=100
			msg_id$="IV_BADMARGIN"
			gosub disp_message
			ok$="N"
		endif
	endif
return

#include std_missing_params.src
[[IVC_PRICCODE.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]


rem --- Retrieve miscellaneous templates

	files=1,begfile=1,endfile=files
	dim ids$[files],templates$[files]
	ids$[1]="ivs-01A"

	call dir_pgm$+"bac_template.bbj",begfile,endfile,ids$[all],templates$[all],status
	if status goto std_exit

rem --- Dimension miscellaneous string templates

	dim ars01a$:ars_params_tpl$,ivs01a$:templates$[1]


	ars01a_key$=firm_id$+"AR00"
	ivs01a_key$=firm_id$+"IV00"
	find record (ars_params_chn,key=ars01a_key$,err=std_missing_params) ars01a$
	find record (ars_params_chn,key=ivs01a_key$,err=std_missing_params) ivs01a$

	precision num(ivs01a.precision$)
