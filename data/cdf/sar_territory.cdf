[[SAR_TERRITORY.PRIOR.AVAL]]
if callpoint!.getColumnData("SAR_TERRITORY.PRIOR") = "Y" 
	if callpoint!.getColumnData("SAR_TERRITORY.MTD") <> "Y" and
:	   callpoint!.getColumnData("SAR_TERRITORY.YTD") <> "Y"
		MSG_ID$="SA_PRIOR_INVALID"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[SAR_TERRITORY.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_TERRITORY.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_TERRITORY.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
[[SAR_TERRITORY.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_TERRITRY",open_opts$[1]="OTA"
gosub open_tables
[[SAR_TERRITORY.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_TERRITORY.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_TERRITORY.MTD","Y")
	callpoint!.setColumnData("SAR_TERRITORY.YTD","Y")
	callpoint!.setColumnData("SAR_TERRITORY.PRIOR","Y")
	callpoint!.setColumnData("SAR_TERRITORY.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_TERRITORY.MTD","N")
	callpoint!.setColumnData("SAR_TERRITORY.YTD","N")
	callpoint!.setColumnData("SAR_TERRITORY.PRIOR","N")
	callpoint!.setColumnData("SAR_TERRITORY.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
