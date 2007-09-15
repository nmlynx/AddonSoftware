[[ARR_AGINGREPORT.AREC]]
cal_date=1
gosub set_date_seq
gosub calc_dates
[[ARR_AGINGREPORT.DAYS_IN_PER.AVAL]]
cal_date=1
gosub set_date_seq
gosub calc_dates
callpoint.callpoint_stat$="REFRESH"
[[ARR_AGINGREPORT.REPORT_DATE.AVAL]]
cal_date=1
gosub set_date_seq
gosub calc_dates
callpoint.callpoint_stat$="REFRESH"
[[ARR_AGINGREPORT.<CUSTOM>]]
set_date_seq:rem --- Set Sequence of Date Columns

	date_seq$=
:		pad("ARR_AGINGREPORT.AGEDATE_FUT_FROM",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_CUR_FROM",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_CUR_THRU",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_30_FROM",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_30_THRU",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_60_FROM",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_60_THRU",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_90_FROM",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_90_THRU",40)+
:		pad("ARR_AGINGREPORT.AGEDATE_120_THRU",40)

	return

calc_dates:rem --- Calculate Aging Dates
escape
	fixed_periods$=fnget_rec$("ARR_AGINGREPORT.FIXED_PERIODS")
	days_in_per=num(fnget_rec$("ARR_AGINGREPORT.DAYS_IN_PER"))
	if days_in_per=0 days_in_per=30
	start_date$=fnget_rec$("ARR_AGINGREPORT.REPORT_DATE")

	switch cal_date
		case 1
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_FUT_FROM",rec_data$[0,0],40),0]=start_date$
		case 2
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_FUT_FROM")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_CUR_THRU",rec_data$[0,0],40),0]=new_date$
		case 3
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_CUR_FROM",rec_data$[0,0],40),0]=new_date$
		case 4
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_CUR_FROM")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_30_THRU",rec_data$[0,0],40),0]=new_date$
		case 5
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_30_THRU")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_30_FROM",rec_data$[0,0],40),0]=new_date$
		case 6
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_30_FROM")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_60_THRU",rec_data$[0,0],40),0]=new_date$
		case 7
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_60_THRU")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_60_FROM",rec_data$[0,0],40),0]=new_date$
		case 8
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_60_FROM")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_90_THRU",rec_data$[0,0],40),0]=new_date$
		case 9
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_90_THRU")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_90_FROM",rec_data$[0,0],40),0]=new_date$
		case 10
			prev_date$=fnget_rec$("ARR_AGINGREPORT.AGEDATE_90_FROM")
			if fixed_periods$="Y"
				new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
			endif
			rec_data$[fnstr_pos("ARR_AGINGREPORT.AGEDATE_120_THRU",rec_data$[0,0],40),0]=new_date$
		break
	swend

	return
