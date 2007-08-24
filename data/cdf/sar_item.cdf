[[SAR_ITEM.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_ITEM.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_ITEM.MTD","Y")
	callpoint!.setColumnData("SAR_ITEM.YTD","Y")
	callpoint!.setColumnData("SAR_ITEM.PRIOR","Y")
	callpoint!.setColumnData("SAR_ITEM.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_ITEM.MTD","N")
	callpoint!.setColumnData("SAR_ITEM.YTD","N")
	callpoint!.setColumnData("SAR_ITEM.PRIOR","N")
	callpoint!.setColumnData("SAR_ITEM.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_ITEM.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_ITEM.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_ITEM.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
[[SAR_ITEM.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_ITEM",open_opts$[1]="OTA"
gosub open_tables
