[[SAR_VENDOR.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_VENDOR.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_VENDOR.MTD","Y")
	callpoint!.setColumnData("SAR_VENDOR.YTD","Y")
	callpoint!.setColumnData("SAR_VENDOR.PRIOR","Y")
	callpoint!.setColumnData("SAR_VENDOR.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_VENDOR.MTD","N")
	callpoint!.setColumnData("SAR_VENDOR.YTD","N")
	callpoint!.setColumnData("SAR_VENDOR.PRIOR","N")
	callpoint!.setColumnData("SAR_VENDOR.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_VENDOR.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_VENDOR.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_VENDOR.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
[[SAR_VENDOR.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_VENDOR",open_opts$[1]="OTA"
gosub open_tables
