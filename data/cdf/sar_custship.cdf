[[SAR_CUSTSHIP.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_CUSTSHIP",open_opts$[1]="OTA"
gosub open_tables
[[SAR_CUSTSHIP.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_CUSTSHIP.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_CUSTSHIP.MTD","Y")
	callpoint!.setColumnData("SAR_CUSTSHIP.YTD","Y")
	callpoint!.setColumnData("SAR_CUSTSHIP.PRIOR","Y")
	callpoint!.setColumnData("SAR_CUSTSHIP.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_CUSTSHIP.MTD","N")
	callpoint!.setColumnData("SAR_CUSTSHIP.YTD","N")
	callpoint!.setColumnData("SAR_CUSTSHIP.PRIOR","N")
	callpoint!.setColumnData("SAR_CUSTSHIP.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_CUSTSHIP.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_CUSTSHIP.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_CUSTSHIP.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
