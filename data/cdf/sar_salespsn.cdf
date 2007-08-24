[[SAR_SALESPSN.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_SALESPSN.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_SALESPSN.CURRENT_YEAR",ars_params.current_year$)
[[SAR_SALESPSN.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_SALESPSN",open_opts$[1]="OTA"
gosub open_tables
[[SAR_SALESPSN.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_SALESPSN.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_SALESPSN.MTD","Y")
	callpoint!.setColumnData("SAR_SALESPSN.YTD","Y")
	callpoint!.setColumnData("SAR_SALESPSN.PRIOR","Y")
	callpoint!.setColumnData("SAR_SALESPSN.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_SALESPSN.MTD","N")
	callpoint!.setColumnData("SAR_SALESPSN.YTD","N")
	callpoint!.setColumnData("SAR_SALESPSN.PRIOR","N")
	callpoint!.setColumnData("SAR_SALESPSN.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
