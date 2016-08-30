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

rem --- Need to know later if form was just launched
	callpoint!.setDevObject("justLaunched","1")
[[GLS_CALENDAR.ADEL]]
rem wgh ... remove deleted year from fiscal year ListButton
[[GLS_CALENDAR.LOCKED_FLAG_02.AVAL]]
rem wgh ... 4394 ... 3.c.iv
[[GLS_CALENDAR.BWRI]]
rem wgh ... 4394 ... 3.c.xii
[[GLS_CALENDAR.BDEL]]
rem wgh ... 4394 ... 3.c.xi
[[GLS_CALENDAR.PER_ENDING_01.AVAL]]
rem wgh ... 4394 ... 3.c.x.1
rem wgh ... 4394 ... 3.c.x.2
rem wgh ... 4394 ... 3.c.x.3
rem wgh ... 4394 ... 3.c.x.4
rem wgh ... 4394 ... 3.c.x.5
rem wgh ... 4394 ... 3.c.x.6
rem wgh ... 4394 ... 3.c.x.7
rem wgh ... 4394 ... 3.c.x.8

rem wgh ... 4394 ... see gls_calendar's gosub validate_mo_day
[[GLS_CALENDAR.AWRI]]
rem wgh ... 4394 ... 3.c.viii.1
rem wgh ... 4394 ... 3.c.viii.2
rem wgh ... 4394 ... 3.c.viii.3
[[GLS_CALENDAR.PER_ENDING_02.AVAL]]
rem wgh ... 4394 ... 3.c.vii
[[GLS_CALENDAR.AFMC]]
rem wgh ... 4394 ... 3.c.vi
[[GLS_CALENDAR.PER_ENDING_13.AVAL]]
rem wgh ... 4394 ... 3.c.v
[[GLS_CALENDAR.CAL_START_DATE.AVAL]]
rem wgh ... 4394 ... 3.c.iv.1
rem wgh ... 4394 ... 3.c.iv.2

rem wgh ... 4394 ... 3.c.x.1
rem wgh ... 4394 ... 3.c.x.2
rem wgh ... 4394 ... 3.c.x.3
rem wgh ... 4394 ... 3.c.x.4
rem wgh ... 4394 ... 3.c.x.5
rem wgh ... 4394 ... 3.c.x.6
rem wgh ... 4394 ... 3.c.x.7
rem wgh ... 4394 ... 3.c.x.8
[[GLS_CALENDAR.YEAR.AVAL]]
rem --- Unless it's the current fiscal year, a new year must have an existing prior year, or next year.
	dim gls_params$:fnget_tpl$("GLS_PARAMS")
	gls_params$=callpoint!.getDevObject("gls_params")
	year$=callpoint!.getUserInput()
	if year$<>gls_params.current_year$ then
		gls_calendar_dev=fnget_dev("GLS_CALENDAR")
		dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")

		prior_year$=str(num(year$)-1)
		readrecord(gls_calendar_dev,key=firm_id$+prior_year$,dom=*next)gls_calendar$
		if cvs(gls_calendar.year$,2)="" then
			next_year$=str(num(year$)+1)
			readrecord(gls_calendar_dev,key=firm_id$+next_year$,dom=*next)gls_calendar$
			if cvs(gls_calendar.year$,2)="" then
				msg_id$="GL_CALENDAR_MISSING"
				gosub disp_message
				callpoint!.setStatus("ABORT")
				break
			endif
		endif
	endif
[[GLS_CALENDAR.TOTAL_PERS.AVAL]]
rem --- Disable and clear un-used periods
	total_pers=num(callpoint!.getUserInput())
	gosub disable_periods

rem wgh ... 4394 ... 3.c.x.1
rem wgh ... 4394 ... 3.c.x.2
rem wgh ... 4394 ... 3.c.x.3
rem wgh ... 4394 ... 3.c.x.4
rem wgh ... 4394 ... 3.c.x.5
rem wgh ... 4394 ... 3.c.x.6
rem wgh ... 4394 ... 3.c.x.7
rem wgh ... 4394 ... 3.c.x.8
[[GLS_CALENDAR.ADIS]]
rem --- Show current fiscal year and period
	gosub show_current_fiscal_yr

rem --- Disable and clear un-used periods
	total_pers=num(callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS"))
	gosub disable_periods
[[GLS_CALENDAR.AREC]]
rem --- Show current fiscal year and period
	gosub show_current_fiscal_yr

rem --- Disable and clear un-used periods
	total_pers=num(callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS"))
	gosub disable_periods

rem --- On launch initialize form with calendar for current fiscal year
	if num(callpoint!.getDevObject("justLaunched")) then
		callpoint!.setDevObject("justLaunched","0")
		gls_calendar_dev=fnget_dev("GLS_CALENDAR")
		dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")

		dim gls_params$:fnget_tpl$("GLS_PARAMS")
		gls_params$=callpoint!.getDevObject("gls_params")
		readrecord(gls_calendar_dev,key=firm_id$+gls_params.current_year$,dom=*next)gls_calendar$
		if cvs(gls_calendar.year$,2)<>"" then
			callpoint!.setStatus("NEWRECORD:["+firm_id$+gls_calendar.year$+"]")
		else
			callpoint!.setColumnData("GLS_CALENDAR.YEAR",gls_params.current_year$,1)
		endif
	endif

rem wgh ... 4394 ... 3.c.ix.1
rem wgh ... 4394 ... 3.c.ix.2
[[GLS_CALENDAR.<CUSTOM>]]
#include std_missing_params.src

show_current_fiscal_yr: rem --- Show current fiscal year and period
	dim gls_params$:fnget_tpl$("GLS_PARAMS")
	gls_params$=callpoint!.getDevObject("gls_params")
	callpoint!.setColumnData("<<DISPLAY>>.CURRENT_YEAR",gls_params.current_year$,1)
	callpoint!.setColumnData("<<DISPLAY>>.CURRENT_PER",gls_params.current_per$,1)
	callpoint!.setColumnData("<<DISPLAY>>.GL_YR_CLOSED",gls_params.gl_yr_closed$,1)
	callpoint!.setColumnData("<<DISPLAY>>.ADJUST_FEBRUARY",str(gls_params.adjust_february),1)
	callpoint!.setColumnData("<<DISPLAY>>.CREATE_NEXT_CAL",str(gls_params.create_next_cal),1)
return

disable_periods: rem --- Disable and clear periosd based on total number of fiscal periods
                            rem --- Input: total_pers = total number of periods in this fiscal year
rem wgh ... 4394 ... 3.c.xiii

rem wgh ... 4394 ... 3.c.v
	for per=1 to 13
		able=iff(per<=total_pers,1,0)
		callpoint!.setColumnEnabled("GLS_CALENDAR.PER_ENDING_"+str(per:"00"),able)
		callpoint!.setColumnEnabled("GLS_CALENDAR.PERIOD_NAME_"+str(per:"00"),able)
		callpoint!.setColumnEnabled("GLS_CALENDAR.ABBR_NAME_"+str(per:"00"),able)
		callpoint!.setColumnEnabled("GLS_CALENDAR.LOCKED_FLAG_"+str(per:"00"),able)
		callpoint!.setColumnEnabled("GLS_CALENDAR.LOCKED_DATE_"+str(per:"00"),able)
		if !able then
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_"+str(per:"00"),"")
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_"+str(per:"00"),"")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_"+str(per:"00"),"")
			callpoint!.setColumnData("GLS_CALENDAR.LOCKED_FLAG_"+str(per:"00"),"")
			callpoint!.setColumnData("GLS_CALENDAR.LOCKED_DATE_"+str(per:"00"),"")
		endif
	next per
	callpoint!.setStatus("REFRESH")
return
