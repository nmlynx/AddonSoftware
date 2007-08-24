[[SAR_PRODITMCST.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_PRODITMCST.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_PRODITMCST.MTD","Y")
	callpoint!.setColumnData("SAR_PRODITMCST.YTD","Y")
	callpoint!.setColumnData("SAR_PRODITMCST.PRIOR","Y")
	callpoint!.setColumnData("SAR_PRODITMCST.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_PRODITMCST.MTD","N")
	callpoint!.setColumnData("SAR_PRODITMCST.YTD","N")
	callpoint!.setColumnData("SAR_PRODITMCST.PRIOR","N")
	callpoint!.setColumnData("SAR_PRODITMCST.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_PRODITMCST.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_PRODITMCST.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_PRODITMCST.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
[[SAR_PRODITMCST.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_CUSTOMER",open_opts$[1]="OTA"
gosub open_tables
