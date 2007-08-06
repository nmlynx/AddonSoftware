[[SAR_CUSTTERR.BSHO]]
rem num_files=1
rem dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
rem open_tables$[1]="SAM_CUSTTERR",open_opts$[1]="OTA"
rem gosub open_tables
[[SAR_CUSTTERR.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_CUSTTERR.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_CUSTTERR.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
[[SAR_CUSTTERR.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_CUSTTERR.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_CUSTTERR.MTD","Y")
	callpoint!.setColumnData("SAR_CUSTTERR.YTD","Y")
	callpoint!.setColumnData("SAR_CUSTTERR.PRIOR","Y")
	callpoint!.setColumnData("SAR_CUSTTERR.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_CUSTTERR.MTD","N")
	callpoint!.setColumnData("SAR_CUSTTERR.YTD","N")
	callpoint!.setColumnData("SAR_CUSTTERR.PRIOR","N")
	callpoint!.setColumnData("SAR_CUSTTERR.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_CUSTTERR.PRIOR.AVAL]]
if callpoint!.getColumnData("SAR_CUSTTERR.PRIOR") = "Y" 
	if callpoint!.getColumnData("SAR_CUSTTERR.MTD") <> "Y" and
:	   callpoint!.getColumnData("SAR_CUSTTERR.YTD") <> "Y"
		MSG_ID$="SA_PRIOR_INVALID"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
