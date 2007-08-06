[[SAR_WAREHSE.PRIOR.AVAL]]
if callpoint!.getColumnData("SAR_CUSTOMER.PRIOR") = "Y" 
	if callpoint!.getColumnData("SAR_WAREHSE.MTD") <> "Y" and
:	   callpoint!.getColumnData("SAR_WAREHSE.YTD") <> "Y"
		MSG_ID$="SA_PRIOR_INVALID"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[SAR_WAREHSE.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_WAREHSE.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_WAREHSE.MTD","Y")
	callpoint!.setColumnData("SAR_WAREHSE.YTD","Y")
	callpoint!.setColumnData("SAR_WAREHSE.PRIOR","Y")
	callpoint!.setColumnData("SAR_WAREHSE.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_WAREHSE.MTD","N")
	callpoint!.setColumnData("SAR_WAREHSE.YTD","N")
	callpoint!.setColumnData("SAR_WAREHSE.PRIOR","N")
	callpoint!.setColumnData("SAR_WAREHSE.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_WAREHSE.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_WAREHSE.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_WAREHSE.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
[[SAR_WAREHSE.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_WAREHSE",open_opts$[1]="OTA"
gosub open_tables
