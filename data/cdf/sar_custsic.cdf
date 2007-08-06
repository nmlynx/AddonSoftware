[[SAR_CUSTSIC.PRIOR.AVAL]]
if callpoint!.getColumnData("SAR_CUSTOMER.PRIOR") = "Y" 
	if callpoint!.getColumnData("SAR_CUSTSIC.MTD") <> "Y" and
:	   callpoint!.getColumnData("SAR_CUSTSIC.YTD") <> "Y"
		MSG_ID$="SA_PRIOR_INVALID"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[SAR_CUSTSIC.12_PER_REPORT.AVAL]]
x$=callpoint!.getColumnData("SAR_CUSTSIC.12_PER_REPORT")
if x$="N" then
	callpoint!.setColumnData("SAR_CUSTSIC.MTD","Y")
	callpoint!.setColumnData("SAR_CUSTSIC.YTD","Y")
	callpoint!.setColumnData("SAR_CUSTSIC.PRIOR","Y")
	callpoint!.setColumnData("SAR_CUSTSIC.SALES_UNITS","")
else
	callpoint!.setColumnData("SAR_CUSTSIC.MTD","N")
	callpoint!.setColumnData("SAR_CUSTSIC.YTD","N")
	callpoint!.setColumnData("SAR_CUSTSIC.PRIOR","N")
	callpoint!.setColumnData("SAR_CUSTSIC.SALES_UNITS","S")
endif
callpoint!.setStatus("REFRESH")
[[SAR_CUSTSIC.ARAR]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params_chn=num(open_chans$[1]),ars_params_tpl$=open_tpls$[1]

dim ars_params$:ars_params_tpl$
readrecord(ars_params_chn,key=firm_id$+"AR00")ars_params$

callpoint!.setColumnData("SAR_CUSTSIC.CURRENT_PER",ars_params.current_per$)
callpoint!.setColumnData("SAR_CUSTSIC.CURRENT_YEAR",ars_params.current_year$)
callpoint!.setStatus("REFRESH")
[[SAR_CUSTSIC.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="SAM_CUSTSIC",open_opts$[1]="OTA"
gosub open_tables
