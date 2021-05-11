[[ARR_AGINGREPORT.AGEDATE_30_FROM.AVAL]]
tmp_30_from$=callpoint!.getUserInput()
if tmp_30_from$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_30_FROM") then break
tmp_cur_from$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM")

gosub calc_dates2

[[ARR_AGINGREPORT.AGEDATE_60_FROM.AVAL]]
tmp_60_from$=callpoint!.getUserInput()
if tmp_60_from$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_60_FROM") then break
tmp_cur_from$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM")

gosub calc_dates3

[[ARR_AGINGREPORT.AGEDATE_90_FROM.AVAL]]
tmp_90_from$=callpoint!.getUserInput()
if tmp_90_from$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_90_FROM") then break
tmp_cur_from$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM")

gosub calc_dates4

[[ARR_AGINGREPORT.AGEDATE_CUR_FROM.AVAL]]
tmp_cur_from$=callpoint!.getUserInput()
if tmp_cur_from$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM") then break

gosub calc_dates1

[[<<DISPLAY>>.AGED_DAYS_120.AVAL]]
rem --- aged_days_120 must be a whole number greater than aged_days_90 and less than 1000
	aged_days=num(callpoint!.getUserInput())
	if aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_120")) then break
	min_aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_90"))+1
	max_aged_days=999
	if aged_days<=min_aged_days or aged_days>=max_aged_days then
		msg_id$="MIN_MAX_AGE_PER_SIZE"
		dim msg_tokens$[2]
		msg_tokens$[1]=str(min_aged_days)
		msg_tokens$[2]=str(max_aged_days)
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Update From and Thru dates
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	new_from_date$=date(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-aged_days+1:"%Yd%Mz%Dz")
	new_thru_date$=date(jul(new_from_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_90_FROM",new_from_date$,1)
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_120_THRU",new_thru_date$,1)

[[<<DISPLAY>>.AGED_DAYS_30.AVAL]]
rem --- aged_days_30 must be a whole number greater than 0 and less than aged_days_60
	aged_days=num(callpoint!.getUserInput())
	if aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_30")) then break
	min_aged_days=1
	max_aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_60"))-1
	if aged_days<min_aged_days or aged_days>max_aged_days then
		msg_id$="MIN_MAX_AGE_PER_SIZE"
		dim msg_tokens$[2]
		msg_tokens$[1]=str(min_aged_days)
		msg_tokens$[2]=str(max_aged_days)
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Update From and Thru dates
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	new_from_date$=date(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-aged_days+1:"%Yd%Mz%Dz")
	new_thru_date$=date(jul(new_from_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM",new_from_date$,1)
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_30_THRU",new_thru_date$,1)

[[<<DISPLAY>>.AGED_DAYS_60.AVAL]]
rem --- aged_days_60 must be a whole number greater than aged_days_30 and less than aged_days_90
	aged_days=num(callpoint!.getUserInput())
	if aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_60")) then break
	min_aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_30"))+1
	max_aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_90"))-1
	if aged_days<min_aged_days or aged_days>max_aged_days then
		msg_id$="MIN_MAX_AGE_PER_SIZE"
		dim msg_tokens$[2]
		msg_tokens$[1]=str(min_aged_days)
		msg_tokens$[2]=str(max_aged_days)
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Update From and Thru dates
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	new_from_date$=date(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-aged_days+1:"%Yd%Mz%Dz")
	new_thru_date$=date(jul(new_from_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_30_FROM",new_from_date$,1)
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_60_THRU",new_thru_date$,1)

[[<<DISPLAY>>.AGED_DAYS_90.AVAL]]
rem --- aged_days_90 must be a whole number greater than aged_days_60 and less than aged_days_120
	aged_days=num(callpoint!.getUserInput())
	if aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_90")) then break
	min_aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_60"))+1
	max_aged_days=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_120"))-1
	if aged_days<min_aged_days or aged_days>max_aged_days then
		msg_id$="MIN_MAX_AGE_PER_SIZE"
		dim msg_tokens$[2]
		msg_tokens$[1]=str(min_aged_days)
		msg_tokens$[2]=str(max_aged_days)
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Update From and Thru dates
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	new_from_date$=date(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-aged_days+1:"%Yd%Mz%Dz")
	new_thru_date$=date(jul(new_from_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_60_FROM",new_from_date$,1)
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_90_THRU",new_thru_date$,1)

[[ARR_AGINGREPORT.AGE_CREDITS.AVAL]]
rem --- If updating customer record, MUST age credits
if callpoint!.getUserInput()="N"and callpoint!.getColumnData("ARR_AGINGREPORT.UPDATE_AGING")="Y"
	callpoint!.setMessage("AGE_CREDITS")
rem ... Age Credits is required to update the Customer.
	callpoint!.setColumnData("ARR_AGINGREPORT.AGE_CREDITS","Y",1)
	callpoint!.setStatus("ABORT")
	break
endif

[[ARR_AGINGREPORT.AREC]]
tmp_rpt_opt$=callpoint!.getColumnData("ARR_AGINGREPORT.REPORT_OPTION")
tmp_rpt_seq$=callpoint!.getColumnData("ARR_AGINGREPORT.REPORT_SEQUENCE")
gosub set_selections

[[ARR_AGINGREPORT.ARER]]
rem --- default age_by (report_type) based on AR params

num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params=num(open_chans$[1])
dim ars_params$:open_tpls$[1]

readrecord(ars_params,key=firm_id$+"AR00",dom=std_missing_params)ars_params$
callpoint!.setColumnData("ARR_AGINGREPORT.REPORT_TYPE",iff(cvs(ars_params.dflt_age_by$,2)="","I",ars_params.dflt_age_by$),1)

callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_30",str(callpoint!.getDevObject("30_DAY_DEFAULT")),1)
callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_60",str(callpoint!.getDevObject("60_DAY_DEFAULT")),1)
callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_90",str(callpoint!.getDevObject("90_DAY_DEFAULT")),1)
callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_120",str(callpoint!.getDevObject("120_DAY_DEFAULT")),1)

start_date$=callpoint!.getColumnData("ARR_AGINGREPORT.REPORT_DATE")
if callpoint!.getColumnData("ARR_AGINGREPORT.FIXED_PERIODS")="Y" then
	rem --- fixed size periods
	gosub calc_dates_fixed
else
	rem --- non-fixed size periods
	from_future$=date(jul(start_date$,"%Yd%Mz%Dz")+1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_FUT_FROM",from_future$,1)

	cur_thru$=start_date$
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU",cur_thru$,1)
	cur_from$=date(jul(cur_thru$,"%Yd%Mz%Dz")-callpoint!.getDevObject("30_DAY_DEFAULT")+1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM",cur_from$,1)

	thru_30$=date(jul(cur_from$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_30_THRU",thru_30$,1)
	from_30$=date(jul(thru_30$,"%Yd%Mz%Dz")-(callpoint!.getDevObject("60_DAY_DEFAULT")-callpoint!.getDevObject("30_DAY_DEFAULT"))+1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_30_FROM",from_30$,1)

	thru_60$=date(jul(from_30$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_60_THRU",thru_60$,1)
	from_60$=date(jul(thru_60$,"%Yd%Mz%Dz")-(callpoint!.getDevObject("90_DAY_DEFAULT")-callpoint!.getDevObject("60_DAY_DEFAULT"))+1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_60_FROM",from_60$,1)

	thru_90$=date(jul(from_60$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_90_THRU",thru_90$,1)
	from_90$=date(jul(thru_90$,"%Yd%Mz%Dz")-(callpoint!.getDevObject("120_DAY_DEFAULT")-callpoint!.getDevObject("90_DAY_DEFAULT"))+1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_90_FROM",from_90$,1)

	thru_120$=date(jul(from_90$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_120_THRU",thru_120$,1)

	rem --- Set size of individual aging periods
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_30",str(callpoint!.getDevObject("30_DAY_DEFAULT")),1)
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_60",str(callpoint!.getDevObject("60_DAY_DEFAULT")),1)
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_90",str(callpoint!.getDevObject("90_DAY_DEFAULT")),1)
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_120",str(callpoint!.getDevObject("120_DAY_DEFAULT")),1)

	rem --- Allow changing individual aging period sizes when using fixed size periods
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_30",1)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_60",1)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_90",1)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_120",1)
endif

[[ARR_AGINGREPORT.BSHO]]
rem --- Inits
	use ::ado_util.src::util

rem --- Open/Lock files
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
	gosub open_tables

	arsParams_dev=num(open_chans$[1])
	dim arsParams$:open_tpls$[1]

rem --- Retrieve parameter data
	find record (arsParams_dev,key=firm_id$+"AR00",err=std_missing_params) arsParams$

rem --- Get default aging period sizes from AR Parameters
	callpoint!.setDevObject("30_DAY_DEFAULT",arsParams.age_per_days_1)
	callpoint!.setDevObject("60_DAY_DEFAULT",arsParams.age_per_days_2)
	callpoint!.setDevObject("90_DAY_DEFAULT",arsParams.age_per_days_3)
	callpoint!.setDevObject("120_DAY_DEFAULT",arsParams.age_per_days_4)

rem --- Is default using fixed size aging periods?
	if arsParams.age_per_days_2=2 * arsParams.age_per_days_1 and
:	arsParams.age_per_days_3=3 * arsParams.age_per_days_1 and
:	arsParams.age_per_days_4=4 * arsParams.age_per_days_1 then
		callpoint!.setDevObject("default_days_in_per",str(arsParams.age_per_days_1))
	else
		callpoint!.setDevObject("default_days_in_per","")
	endif

rem --- Update Control Labels for aging days
	days$=" "+Translate!.getTranslation("AON_DAYS","Days",1)

	ctrl30!=util.findControl(Form!,Translate!.getTranslation("DDM_TABLE_LABL-ARR_AGINGREPORT-LABEL_30-DD_ATTR_LABL"))
	ctrl60!=util.findControl(Form!,Translate!.getTranslation("DDM_TABLE_LABL-ARR_AGINGREPORT-LABEL_60-DD_ATTR_LABL"))
	ctrl90!=util.findControl(Form!,Translate!.getTranslation("DDM_TABLE_LABL-ARR_AGINGREPORT-LABEL_90-DD_ATTR_LABL"))
	ctrl120!=util.findControl(Form!,Translate!.getTranslation("DDM_TABLE_LABL-ARR_AGINGREPORT-LABEL_120-DD_ATTR_LABL"))

	ctrl30!.setText(days$)
	ctrl60!.setText(days$)
	ctrl90!.setText(days$)
	ctrl120!.setText(" +"+days$)

[[ARR_AGINGREPORT.COL_FORMAT.AVAL]]
rem --- Enable/Disable Comments field based on this value

	if callpoint!.getUserInput()="Y"
		callpoint!.setColumnData("ARR_AGINGREPORT.CUST_COMMENTS","",1)
		callpoint!.setColumnEnabled("ARR_AGINGREPORT.CUST_COMMENTS",0)
	else
		callpoint!.setColumnEnabled("ARR_AGINGREPORT.CUST_COMMENTS",1)
	endif

[[ARR_AGINGREPORT.DAYS_IN_PER.AVAL]]
rem --- Recalculate dates using new fixed number of days
rem --- If updating customer record, MUST use the default fixed period size

	days_in_per=num(callpoint!.getUserInput())
	if days_in_per=num(callpoint!.getColumnData("ARR_AGINGREPORT.DAYS_IN_PER")) then break

	if callpoint!.getColumnData("ARR_AGINGREPORT.UPDATE_AGING")="Y"
		default_days_in_per$=cvs(callpoint!.getDevObject("default_days_in_per"),2)
		if days_in_per<>num(default_days_in_per$)
			msg_id$="PER_30_REQUIRED"
			dim msg_tokens$[1]
			msg_tokens$[1]=default_days_in_per$
			gosub disp_message
			callpoint!.setUserInput(default_days_in_per$)
		endif
	else
		start_date$=callpoint!.getColumnData("ARR_AGINGREPORT.REPORT_DATE")
		callpoint!.setColumnData("ARR_AGINGREPORT.DAYS_IN_PER",str(days_in_per),1)
		gosub calc_dates_fixed		
	endif

	callpoint!.setStatus("REFRESH")

[[ARR_AGINGREPORT.FIXED_PERIODS.AVAL]]
rem --- Recalc dates if fixed periods
if callpoint!.getUserInput()="Y"
	fixed_periods$=callpoint!.getUserInput()
	start_date$=callpoint!.getColumnData("ARR_AGINGREPORT.REPORT_DATE")
	gosub calc_dates_fixed
	callpoint!.setStatus("REFRESH")

	rem --- Don't allow changing individual aging period sizes when using fixed size periods
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_30",0)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_60",0)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_90",0)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_120",0)
else
	if callpoint!.getColumnData("ARR_AGINGREPORT.UPDATE_AGING")="Y"
		callpoint!.setMessage("FIXED_PERIODS")
		callpoint!.setColumnData("ARR_AGINGREPORT.FIXED_PERIODS","Y",1)
		callpoint!.setStatus("ABORT")
		break
	else
		rem --- Allow changing individual aging period sizes when using fixed size periods
		callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_30",1)
		callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_60",1)
		callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_90",1)
		callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_120",1)
	endif
endif

[[ARR_AGINGREPORT.FUTURE_AGING.AVAL]]
rem --- If updating customer record, MUST do future aging
if callpoint!.getUserInput()="N"and callpoint!.getColumnData("ARR_AGINGREPORT.UPDATE_AGING")="Y"
	callpoint!.setMessage("FUTURE_AGING")
rem ... Future Aging is required to update the Customer.
	callpoint!.setColumnData("ARR_AGINGREPORT.FUTURE_AGING","Y",1)
	callpoint!.setStatus("ABORT")
	break
endif

[[ARR_AGINGREPORT.REPORT_DATE.AVAL]]
start_date$=callpoint!.getUserInput()
if callpoint!.getColumnData("ARR_AGINGREPORT.FIXED_PERIODS")="Y"
	gosub calc_dates_fixed
else
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU",start_date$,1)
	future_from$=date(jul(start_date$,"%Yd%Mz%Dz")+1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_FUT_FROM",future_from$,1)

	tmp_cur_from$=date(jul(start_date$,"%Yd%Mz%Dz")-num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_30"))+1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM",tmp_cur_from$,1)

	gosub calc_dates1
endif
callpoint!.setStatus("REFRESH")

[[ARR_AGINGREPORT.REPORT_OPTION.AVAL]]
tmp_rpt_opt$=callpoint!.getUserInput()
tmp_rpt_seq$=callpoint!.getColumnData("ARR_AGINGREPORT.REPORT_SEQUENCE")
gosub set_selections

[[ARR_AGINGREPORT.REPORT_SEQUENCE.AVAL]]
tmp_rpt_opt$=callpoint!.getColumnData("ARR_AGINGREPORT.REPORT_OPTION")
tmp_rpt_seq$=callpoint!.getUserInput()
gosub set_selections

[[ARR_AGINGREPORT.REPORT_SUMM_DET.AVAL]]
rem --- Enable/Disable Comments field based on this value

	if callpoint!.getUserInput()="S"
		callpoint!.setColumnData("ARR_AGINGREPORT.CUST_COMMENTS","",1)
		callpoint!.setColumnEnabled("ARR_AGINGREPORT.CUST_COMMENTS",0)
	else
		callpoint!.setColumnEnabled("ARR_AGINGREPORT.CUST_COMMENTS",1)
	endif

[[ARR_AGINGREPORT.UPDATE_AGING.AVAL]]
rem --- If updating customer record, MUST use default aging periods sizes, do future aging and age credits.
if callpoint!.getUserInput()="Y"
	if num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_30"))<>callpoint!.getDevObject("30_DAY_DEFAULT") or
:	num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_60"))<>callpoint!.getDevObject("60_DAY_DEFAULT") or
:	num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_90"))<>callpoint!.getDevObject("90_DAY_DEFAULT") or
:	num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_120"))<>callpoint!.getDevObject("120_DAY_DEFAULT") or
:	callpoint!.getColumnData("ARR_AGINGREPORT.FUTURE_AGING")="N" or
:	callpoint!.getColumnData("ARR_AGINGREPORT.AGE_CREDITS")="N" then
		msg_id$="AR_CUST_AGING_REQ"
		dim msg_tokens$[4]
		msg_tokens$[1]=str(callpoint!.getDevObject("30_DAY_DEFAULT"))
		msg_tokens$[2]=str(callpoint!.getDevObject("60_DAY_DEFAULT"))
		msg_tokens$[3]=str(callpoint!.getDevObject("90_DAY_DEFAULT"))
		msg_tokens$[4]=str(callpoint!.getDevObject("120_DAY_DEFAULT"))
		gosub disp_message

		callpoint!.setUserInput("N")
		callpoint!.setStatus("REFRESH")
	endif
endif

[[ARR_AGINGREPORT.<CUSTOM>]]
calc_dates_fixed:rem --- Calculate Aging Dates
rem --- start_date$ being set prior to gosub
	days_in_per=num(callpoint!.getColumnData("ARR_AGINGREPORT.DAYS_IN_PER"))
	if days_in_per=0 then days_in_per=num(callpoint!.getDevObject("default_days_in_per"))
	if days_in_per=0 then days_in_per=30
	new_start$=""
	call stbl("+DIR_PGM")+"adc_daydates.aon",start_date$,new_start$,1
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_FUT_FROM",new_start$,1)
	prev_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_FUT_FROM")
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU",new_date$,1)
	prev_date$=new_date$
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM",new_date$,1)
	prev_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_FROM")
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_30_THRU",new_date$,1)
	prev_date$=new_date$
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_30_FROM",new_date$,1)
	prev_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_30_FROM")
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_60_THRU",new_date$,1)
	prev_date$=new_date$
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_60_FROM",new_date$,1)
	prev_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_60_FROM")
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_90_THRU",new_date$,1)
	prev_date$=new_date$
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-(days_in_per-1):"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_90_FROM",new_date$,1)
	prev_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_90_FROM")
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_120_THRU",new_date$,1)

	rem --- Set size of individual aging periods
	callpoint!.setColumnData("ARR_AGINGREPORT.DAYS_IN_PER",str(days_in_per),1)
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_30",str(days_in_per),1)
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_60",str(days_in_per*2),1)
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_90",str(days_in_per*3),1)
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_120",str(days_in_per*4),1)

	rem --- Don't allow changing individual aging period sizes when using fixed size periods
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_30",0)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_60",0)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_90",0)
	callpoint!.setColumnEnabled("<<DISPLAY>>.AGED_DAYS_120",0)
return

calc_dates1:
	rem --- tmp_cur_from$ set prior to gosub
	days_in_per=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_30"))
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	last_date$=agedate_cur_thru$
	prev_date$=tmp_cur_from$
	gosub check_dates
	if err_stat$="Y" then callpoint!.setStatus("ABORT-REFRESH")
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_30",str(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-jul(prev_date$,"%Yd%Mz%Dz")+1),1)
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_30_THRU",new_date$,1)
return

calc_dates2:
	rem --- tmp_30_from$ set prior to gosub
	days_in_per=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_60"))-num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_30"))
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	last_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_30_THRU")
	prev_date$=tmp_30_from$
	gosub check_dates
	if err_stat$="Y" then callpoint!.setStatus("ABORT-REFRESH")
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_60",str(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-jul(prev_date$,"%Yd%Mz%Dz")+1),1)
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_60_THRU",new_date$,1)
return

calc_dates3:
	rem --- tmp_60_from$ set prior to gosub
	days_in_per=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_90"))-num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_60"))
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	last_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_60_THRU")
	prev_date$=tmp_60_from$
	gosub check_dates
	if err_stat$="Y" then callpoint!.setStatus("ABORT-REFRESH")
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_90",str(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-jul(prev_date$,"%Yd%Mz%Dz")+1),1)
	new_date$=date(jul(prev_date$,"%Yd%Mz%Dz")-1:"%Yd%Mz%Dz")
	callpoint!.setColumnData("ARR_AGINGREPORT.AGEDATE_90_THRU",new_date$,1)
return

calc_dates4:
	rem --- tmp_90_from$ set prior to gosub
	days_in_per=num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_120"))-num(callpoint!.getColumnData("<<DISPLAY>>.AGED_DAYS_90"))
	agedate_cur_thru$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_CUR_THRU")
	last_date$=callpoint!.getColumnData("ARR_AGINGREPORT.AGEDATE_90_THRU")
	prev_date$=tmp_90_from$
	gosub check_dates
	if err_stat$="Y" then callpoint!.setStatus("ABORT-REFRESH")
	callpoint!.setColumnData("<<DISPLAY>>.AGED_DAYS_120",str(jul(agedate_cur_thru$,"%Yd%Mz%Dz")-jul(prev_date$,"%Yd%Mz%Dz")+1),1)
return

check_dates: rem Check validity of entered FROM dates against THRU dates
	err_stat$="N"
	if prev_date$>last_date$
		err_stat$="Y"
		out1$=date(jul(prev_date$,"%Yd%Mz%Dz"):"%Mz/%Dz/%Yd")
		out2$=date(jul(last_date$,"%Yd%Mz%Dz"):"%Mz/%Dz/%Yd")
		msg_id$="ENTRY_FROM_TO"
		dim msg_tokens$[2]
		msg_tokens$[1]=out1$
		msg_tokens$[2]=out2$
		gosub disp_message
	endif
return

set_selections: rem --- Enable/Disable Selection columns based on entries
rem --- tmp_rpt_opt$,tmp_rpt_seq$ set prior to gosub
dim ctl_name$[6]
dim ctl_stat$[6]
ctl_name$[1]="ARR_AGINGREPORT.CUSTOMER_ID_1"
ctl_name$[2]="ARR_AGINGREPORT.CUSTOMER_ID_2"
ctl_name$[3]="ARR_AGINGREPORT.ALT_SEQUENCE_1"
ctl_name$[4]="ARR_AGINGREPORT.ALT_SEQUENCE_2"
ctl_name$[5]="ARR_AGINGREPORT.SALESPERSON_1"
ctl_name$[6]="ARR_AGINGREPORT.SALESPERSON_2"
if tmp_rpt_opt$<> "C"
	ctl_stat$[1]="D"
	ctl_stat$[2]="D"
	ctl_stat$[3]="D"
	ctl_stat$[4]="D"
	ctl_stat$[5]=" "
	ctl_stat$[6]=" "
	callpoint!.setColumnData("ARR_AGINGREPORT.CUSTOMER_ID_1","")
	callpoint!.setColumnData("ARR_AGINGREPORT.CUSTOMER_ID_2","")
	callpoint!.setColumnData("ARR_AGINGREPORT.ALT_SEQUENCE_1","")
	callpoint!.setColumnData("ARR_AGINGREPORT.ALT_SEQUENCE_2","")
else
	ctl_stat$[5]="D"
	ctl_stat$[6]="D"
	callpoint!.setColumnData("ARR_AGINGREPORT.SALESPERSON_1","")
	callpoint!.setColumnData("ARR_AGINGREPORT.SALESPERSON_2","")
	if tmp_rpt_seq$="A"
		ctl_stat$[1]="D"
		ctl_stat$[2]="D"
		ctl_stat$[3]=" "
		ctl_stat$[4]=" "
		callpoint!.setColumnData("ARR_AGINGREPORT.CUSTOMER_ID_1","")
		callpoint!.setColumnData("ARR_AGINGREPORT.CUSTOMER_ID_2","")
	else
		ctl_stat$[1]=" "
		ctl_stat$[2]=" "
		ctl_stat$[3]="D"
		ctl_stat$[4]="D"
		callpoint!.setColumnData("ARR_AGINGREPORT.ALT_SEQUENCE_1","")
		callpoint!.setColumnData("ARR_AGINGREPORT.ALT_SEQUENCE_2","")
	endif
endif
gosub disable_fields

rem --- Fixed size aging periods?
days_in_per$=cvs(callpoint!.getDevObject("default_days_in_per"),2)
if days_in_per$="" then
	rem --- Not fixed size
	callpoint!.setColumnData("ARR_AGINGREPORT.FIXED_PERIODS","N",1)
	callpoint!.setColumnData("ARR_AGINGREPORT.DAYS_IN_PER","",1)
	callpoint!.setColumnEnabled("ARR_AGINGREPORT.DAYS_IN_PER",0)
else
	rem --- Fixed size
	callpoint!.setColumnData("ARR_AGINGREPORT.FIXED_PERIODS","Y",1)
	callpoint!.setColumnData("ARR_AGINGREPORT.DAYS_IN_PER",days_in_per$,1)
	callpoint!.setColumnEnabled("ARR_AGINGREPORT.DAYS_IN_PER",1)
endif
return

disable_fields:
rem --- used to disable/enable controls depending on parameter settings
rem --- send in control to toggle (format "ALIAS.CONTROL_NAME"), and D or space to disable/enable
	for x=1 to 6
		wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$[x],"CTLI")):"00000")
		wmap$=callpoint!.getAbleMap()
		wpos=pos(wctl$=wmap$,8)
		wmap$(wpos+6,1)=ctl_stat$[x]
		callpoint!.setAbleMap(wmap$)
		callpoint!.setStatus("ABLEMAP-REFRESH-ACTIVATE")
	next x 
return

#include [+ADDON_LIB]std_missing_params.aon



