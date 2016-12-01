[[GLR_TRANSHISTORY.BEG_GL_PER.AVAL]]
rem --- Verify haven't exceeded calendar total periods for beginning fiscal year
	period$=callpoint!.getUserInput()
	if cvs(period$,2)<>"" and period$<>callpoint!.getColumnData("GLR_TRANSHISTORY.BEG_GL_PER") then
		period=num(period$)
		total_pers=num(callpoint!.getDevObject("beginning_total_pers"))
		if period<1 or period>total_pers then
			msg_id$="AD_BAD_FISCAL_PERIOD"
			dim msg_tokens$[2]
			msg_tokens$[1]=str(total_pers)
			msg_tokens$[2]=callpoint!.getColumnData("GLR_TRANSHISTORY.BEG_YEAR")
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
	endif
[[GLR_TRANSHISTORY.END_GL_PER.AVAL]]
rem --- Verify haven't exceeded calendar total periods for ending fiscal year
	period$=callpoint!.getUserInput()
	if cvs(period$,2)<>"" and period$<>callpoint!.getColumnData("GLR_TRANSHISTORY.END_GL_PER") then
		period=num(period$)
		total_pers=num(callpoint!.getDevObject("ending_total_pers"))
		if period<1 or period>total_pers then
			msg_id$="AD_BAD_FISCAL_PERIOD"
			dim msg_tokens$[2]
			msg_tokens$[1]=str(total_pers)
			msg_tokens$[2]=callpoint!.getColumnData("GLR_TRANSHISTORY.END_YEAR")
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
	endif
[[GLR_TRANSHISTORY.BEG_YEAR.AVAL]]
rem --- Verify calendar exists for entered beginning fiscal year
	year$=callpoint!.getUserInput()
	if cvs(year$,2)<>"" and year$<>callpoint!.getColumnData("GLR_TRANSHISTORY.BEG_YEAR") then
		gls_calendar_dev=fnget_dev("GLS_CALENDAR")
		dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")
		readrecord(gls_calendar_dev,key=firm_id$+year$,dom=*next)gls_calendar$
		if cvs(gls_calendar.year$,2)="" then
			msg_id$="AD_NO_FISCAL_CAL"
			dim msg_tokens$[1]
			msg_tokens$[1]=year$
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
		callpoint!.setDevObject("beginning_total_pers",gls_calendar.total_pers$)

		rem --- Verify haven't exceeded calendar total periods for beginning fiscal year
		period$=callpoint!.getColumnData("GLR_TRANSHISTORY.BEG_GL_PER")
		if cvs(period$,2)<>"" then
			period=num(period$)
			total_pers=num(callpoint!.getDevObject("beginning_total_pers"))
			if period<1 or period>total_pers then
				msg_id$="AD_BAD_FISCAL_PERIOD"
				dim msg_tokens$[2]
				msg_tokens$[1]=str(total_pers)
				msg_tokens$[2]=year$
				gosub disp_message
				callpoint!.setStatus("ABORT")
				break
			endif
		endif
	endif
[[GLR_TRANSHISTORY.END_YEAR.AVAL]]
rem --- Verify calendar exists for entered ending fiscal year
	year$=callpoint!.getUserInput()
	if cvs(year$,2)<>"" and year$<>callpoint!.getColumnData("GLR_TRANSHISTORY.END_YEAR") then
		gls_calendar_dev=fnget_dev("GLS_CALENDAR")
		dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")
		readrecord(gls_calendar_dev,key=firm_id$+year$,dom=*next)gls_calendar$
		if cvs(gls_calendar.year$,2)="" then
			msg_id$="AD_NO_FISCAL_CAL"
			dim msg_tokens$[1]
			msg_tokens$[1]=year$
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
		callpoint!.setDevObject("ending_total_pers",gls_calendar.total_pers$)

		rem --- Verify haven't exceeded calendar total periods for ending fiscal year
		period$=callpoint!.getColumnData("GLR_TRANSHISTORY.END_GL_PER")
		if cvs(period$,2)<>"" then
			period=num(period$)
			total_pers=num(callpoint!.getDevObject("ending_total_pers"))
			if period<1 or period>total_pers then
				msg_id$="AD_BAD_FISCAL_PERIOD"
				dim msg_tokens$[2]
				msg_tokens$[1]=str(total_pers)
				msg_tokens$[2]=year$
				gosub disp_message
				callpoint!.setStatus("ABORT")
				break
			endif
		endif
	endif
[[GLR_TRANSHISTORY.GL_WILDCARD.AVAL]]
rem --- Check length of wildcard against defined mask for GL Account
	if callpoint!.getUserInput()<>""
		call "adc_getmask.aon","GL_ACCOUNT","","","",m0$,0,m0
		if len(callpoint!.getUserInput())>len(m0$)
			msg_id$="GL_WILDCARD_LONG"
			gosub disp_message
			callpoint!.setStatus("ABORT")
		endif
	endif
[[GLR_TRANSHISTORY.ASVA]]
rem --- Check for Ending Period before Beginning Period
	begper$=str(num(callpoint!.getColumnData("GLR_TRANSHISTORY.BEG_YEAR")):"0000")+
:			str(num(callpoint!.getColumnData("GLR_TRANSHISTORY.BEG_GL_PER")):"00")
	endper$=str(num(callpoint!.getColumnData("GLR_TRANSHISTORY.END_YEAR")):"0000")+
:			str(num(callpoint!.getColumnData("GLR_TRANSHISTORY.END_GL_PER")):"00")
	if num(endper$)<>0
		if begper$>endper$
			begper$="Beginning Period/Year "+begper$(5,2)+"/"+begper$(1,4)
			endper$="Ending Period/Year "+endper$(5,2)+"/"+endper$(1,4)
			callpoint!.setMessage("ENTRY_FROM_TO:"+begper$+";"+endper$)
			callpoint!.setStatus("ABORT")
		endif
	endif
[[GLR_TRANSHISTORY.ARAR]]
rem --- Set default values
	gls01_dev=fnget_dev("GLS_PARAMS")
	dim gls01a$:fnget_tpl$("GLS_PARAMS")
	readrecord(gls01_dev,key=firm_id$+"GL00")gls01a$
	callpoint!.setColumnData("GLR_TRANSHISTORY.BEG_GL_PER",gls01a.current_per$)
	callpoint!.setColumnData("GLR_TRANSHISTORY.BEG_YEAR",gls01a.current_year$)
	callpoint!.setColumnData("GLR_TRANSHISTORY.END_GL_PER",gls01a.current_per$)
	callpoint!.setColumnData("GLR_TRANSHISTORY.END_YEAR",gls01a.current_year$)
	callpoint!.setStatus("REFRESH")

rem --- Set maximum number of periods allowed for beginning fiscal year
	gls_calendar_dev=fnget_dev("GLS_CALENDAR")
	dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")
	current_year$=callpoint!.getColumnData("GLR_TRANSHISTORY.BEG_YEAR")
	readrecord(gls_calendar_dev,key=firm_id$+current_year$,dom=*next)gls_calendar$
	callpoint!.setDevObject("beginning_total_pers",gls_calendar.total_pers$)

rem --- Set maximum number of periods allowed for ending fiscal year
	gls_calendar_dev=fnget_dev("GLS_CALENDAR")
	dim gls_calendar$:fnget_tpl$("GLS_CALENDAR")
	current_year$=callpoint!.getColumnData("GLR_TRANSHISTORY.END_YEAR")
	readrecord(gls_calendar_dev,key=firm_id$+current_year$,dom=*next)gls_calendar$
	callpoint!.setDevObject("ending_total_pers",gls_calendar.total_pers$)
[[GLR_TRANSHISTORY.BSHO]]
rem --- Open and get Current Period/Year parameters
	num_files=2
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="GLS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="GLS_CALENDAR",open_opts$[2]="OTA"

	gosub open_tables
