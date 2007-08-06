[[SAR_CUSTTYPE.PRIOR.AVAL]]
if callpoint!.getColumnData("SAR_CUSTTYPE.PRIOR") = "Y" 
	if callpoint!.getColumnData("SAR_CUSTTYPE.MTD") <> "Y" and
:	   callpoint!.getColumnData("SAR_CUSTTYPE.YTD") <> "Y"
		MSG_ID$="SA_PRIOR_INVALID"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[SAR_CUSTTYPE.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_CUSTTYPE",open_opts$[1]="OTA"
gosub open_tables
[[SAR_CUSTTYPE.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_CUSTTYPE.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_CUSTTYPE.MTD","Y")
	callpoint!.setColumnData("SAR_CUSTTYPE.YTD","Y")
	callpoint!.setColumnData("SAR_CUSTTYPE.PRIOR","Y")
	callpoint!.setColumnData("SAR_CUSTTYPE.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_CUSTTYPE.MTD","N")
	callpoint!.setColumnData("SAR_CUSTTYPE.YTD","N")
	callpoint!.setColumnData("SAR_CUSTTYPE.PRIOR","N")
	callpoint!.setColumnData("SAR_CUSTTYPE.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_CUSTTYPE.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_CUSTTYPE.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_CUSTTYPE.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
