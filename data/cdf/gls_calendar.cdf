[[GLS_CALENDAR.PER_ENDING_03.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="03" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_04.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="04" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_05.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="05" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_06.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="06" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_07.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="07" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_08.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="08" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_09.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="09" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_10.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="10" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_11.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="11" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.PER_ENDING_12.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="12" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
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
rem wgh ... 4394 ... 3.c.iv <<< ?????
[[GLS_CALENDAR.BWRI]]
rem wgh ... 4394 ... 3.c.xii
[[GLS_CALENDAR.BDEL]]
rem wgh ... 4394 ... 3.c.xi
[[GLS_CALENDAR.PER_ENDING_01.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="01" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif

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
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="02" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif

rem wgh ... 4394 ... 3.c.vii
[[GLS_CALENDAR.PER_ENDING_13.AVAL]]
rem --- The last period must end on the day before the calendar start date of the next year.
	if callpoint!.getColumnData("GLS_CALENDAR.TOTAL_PERS")="13" then
		per_ending$=callpoint!.getUserInput()
		gosub validate_cal_end
		if abort then break
	endif
[[GLS_CALENDAR.CAL_START_DATE.AVAL]]
rem wgh ... Must be a valid date
	cal_start_date$=callpoint!.getUserInput()
	year=num(callpoint!.getColumnData("GLS_CALENDAR.YEAR"))
	julian=-1
	julian=jul(year,num(cal_start_date$(1,2)),num(cal_start_date$(3,2)),err=*next)
	if julian<0 then
		msg_id$="INVALID_DATE"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Must be the day after the ending period of the prior year when there is a calendar for the prior year.
	gls_calendar_dev=fnget_dev("GLS_CALENDAR")
	dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")
	prior_year$=str(num(callpoint!.getColumnData("GLS_CALENDAR.YEAR"))-1)
	readrecord(gls_calendar_dev,key=firm_id$+prior_year$,dom=*next)gls_calendar$
	if cvs(gls_calendar.year$,2)<>"" then
		enddate$=date(julian-1:"%Yl%Mz%Dz")
		if enddate$(5)<>field(gls_calendar$,"PER_ENDING_"+gls_calendar.total_pers$) then
			msg_id$="GL_BAD_START_DATE"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
	endif

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
	gls_calendar_dev=fnget_dev("GLS_CALENDAR")
	dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")
	dim gls_params$:fnget_tpl$("GLS_PARAMS")
	gls_params$=callpoint!.getDevObject("gls_params")

	year$=callpoint!.getUserInput()
	if year$<>gls_params.current_year$ then
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
			callpoint!.setColumnData("GLS_CALENDAR.CAL_START_DATE","",1)
			callpoint!.setColumnEnabled("GLS_CALENDAR.CAL_START_DATE",1)
		else
			rem --- For new records, initialize CAL_START_DATE to the day after the ending period of the prior year.
			newRecord=1
			readrecord(gls_calendar_dev,key=firm_id$+year$,dom=*next); newRecord=1
			if newRecord then
				rem --- Calculate calendar start date based on last date of last period.
				calendar_year=num(year$)-1
				begdate$=field(gls_calendar$,"PER_ENDING_"+gls_calendar.total_pers$)
				if begdate$(1,4)<gls_calendar.PER_ENDING_01$ then calendar_year=calendar_year+1
				rem --- Adjust last day of February for leap year
				if begdate$(1,2)="02" then
					Calendar! = new java.util.GregorianCalendar()
					if begdate$(3,2)="29" and !Calendar!.isLeapYear(calendar_year) then begdate$(3,2)="28"
					if begdate$(3,2)="28" and Calendar!.isLeapYear(calendar_year) then begdate$(3,2)="29"
				endif
				julian=jul(calendar_year,num(begdate$(1,2)),num(begdate$(3,2)))+1
				begdate$=date(julian:"%Yl%Mz%Dz")
				callpoint!.setColumnData("GLS_CALENDAR.CAL_START_DATE",begdate$(5),1)
				callpoint!.setColumnEnabled("GLS_CALENDAR.CAL_START_DATE",0)
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
			rem --- Default to a calendar year for the very first calendar entered, which is for the current fiscal year.
			callpoint!.setColumnData("GLS_CALENDAR.YEAR",gls_params.current_year$)
			callpoint!.setColumnData("GLS_CALENDAR.CAL_START_DATE","0101")
			callpoint!.setColumnData("GLS_CALENDAR.TOTAL_PERS","12")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_01","0131")
			Calendar! = new java.util.GregorianCalendar()
			if Calendar!.isLeapYear(num(gls_params.current_year$)) then
				callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_02","0229")
			else
				callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_02","0228")
			endif
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_03","0331")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_04","0430")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_05","0531")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_06","0630")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_07","0731")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_08","0831")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_09","0930")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_10","1031")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_11","1130")
			callpoint!.setColumnData("GLS_CALENDAR.PER_ENDING_12","1231")
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_01",Translate!.getTranslation("AON_JANUARY"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_02",Translate!.getTranslation("AON_FEBRUARY"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_03",Translate!.getTranslation("AON_MARCH"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_04",Translate!.getTranslation("AON_APRIL"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_05",Translate!.getTranslation("AON_MAY"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_06",Translate!.getTranslation("AON_JUNE"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_07",Translate!.getTranslation("AON_JULY"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_08",Translate!.getTranslation("AON_AUGUST"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_09",Translate!.getTranslation("AON_SEPTEMBER"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_10",Translate!.getTranslation("AON_OCTOBER"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_11",Translate!.getTranslation("AON_NOVEMBER"))
			callpoint!.setColumnData("GLS_CALENDAR.PERIOD_NAME_12",Translate!.getTranslation("AON_DECEMBER"))
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_01","Jan")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_02","Feb")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_03","Mar")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_04","Apr")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_05","May")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_06","Jun")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_07","Jul")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_08","Aug")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_09","Sep")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_10","Oct")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_11","Nov")
			callpoint!.setColumnData("GLS_CALENDAR.ABBR_NAME_12","Dec")

			total_pers=12
			gosub disable_periods
			callpoint!.setStatus("REFRESH-MODIFIED")
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

disable_periods: rem --- Disable and clear periods based on total number of fiscal periods
                            rem --- Input: total_pers = total number of periods in this fiscal year
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

validate_cal_end: rem --- The ending day of the last period must be the day before the start of
                              rem --- the next year when a fiscal calendar exists for the next year.
                              rem --- Input: per_ending$ = mmdd period ending date
                              rem --- Output: abourt = 1 (true) or 0 (false) for callpoint!.setStatus("ABORT")
	gls_calendar_dev=fnget_dev("GLS_CALENDAR")
	dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")
	abort=0

	next_year$=str(num(callpoint!.getColumnData("GLS_CALENDAR.YEAR"))+1)
	readrecord(gls_calendar_dev,key=firm_id$+next_year$,dom=*next)gls_calendar$
	if cvs(gls_calendar.year$,2)<>"" then
		start_date$=callpoint!.getColumnData("GLS_CALENDAR.CAL_START_DATE")
		julian=jul(num(next_year$),num(start_date$(1,2)),num(start_date$(3,2)))
		enddate$=date(julian-1:"%Yl%Mz%Dz")
		if per_ending$<>enddate$(5) then
			msg_id$="GL_BAD_END_DATE"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			abourt=1
		endif
	endif
return

rem wgh ... 4394 ... 3.c.xiii
