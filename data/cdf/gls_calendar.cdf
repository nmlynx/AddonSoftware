[[GLS_CALENDAR.ADIS]]
rem --- Show current fiscal year and period
gosub show_current_fiscal_yr
[[GLS_CALENDAR.AREC]]
rem --- Show current fiscal year and period
gosub show_current_fiscal_yr
[[GLS_CALENDAR.BSHO]]
rem -- Get GL parameters
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="GLS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
gls_params_dev=num(open_chans$[1])
dim gls_params$:open_tpls$[1]

find record(gls_params_dev,key=firm_id$+"GL00",err=std_missing_params)gls_params$
callpoint!.setDevObject("gls_params",gls_params$)
[[GLS_CALENDAR.LOCKED_FLAG_01.BINP]]
callpoint!.setStatus("REFRESH")
[[GLS_CALENDAR.<CUSTOM>]]
#include std_missing_params.src

rem --- Show current fiscal year and period
show_current_fiscal_yr:
	dim gls_params$:fnget_tpl$("GLS_PARAMS")
	gls_params$=callpoint!.getDevObject("gls_params")
	callpoint!.setColumnData("<<DISPLAY>>.CURRENT_YEAR",gls_params.current_year$,1)
	callpoint!.setColumnData("<<DISPLAY>>.CURRENT_PER",gls_params.current_per$,1)
	callpoint!.setColumnData("<<DISPLAY>>.GL_YR_CLOSED",gls_params.gl_yr_closed$,1)
	callpoint!.setColumnData("<<DISPLAY>>.ADJUST_FEBRUARY",str(gls_params.adjust_february),1)
	callpoint!.setColumnData("<<DISPLAY>>.CREATE_NEXT_CAL",str(gls_params.create_next_cal),1)
return
