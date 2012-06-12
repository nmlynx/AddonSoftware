[[SFE_LOADBAL.CHK_QUOTED.AVAL]]
rem --- call graphing routine

	if callpoint!.getColumnData("SFE_LOADBAL.CHK_QUOTED")<>callpoint!.getUserInput()

		wo_open$=callpoint!.getColumnData("SFE_LOADBAL.CHK_OPENED")
		wo_planned$=callpoint!.getColumnData("SFE_LOADBAL.CHK_PLANNED")
		wo_quoted$=callpoint!.getUserInput()
		op_code$=callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")
		beg_date$=callpoint!.getColumnData("SFE_LOADBAL.BEG_WO_DATE")
		num_days$=callpoint!.getColumnData("SFE_LOADBAL.DAYS_IN_MTH")

		gosub create_chart
	
	endif
[[SFE_LOADBAL.CHK_PLANNED.AVAL]]
rem --- call graphing routine
	
	if callpoint!.getColumnData("SFE_LOADBAL.CHK_PLANNED")<>callpoint!.getUserInput()

		wo_open$=callpoint!.getColumnData("SFE_LOADBAL.CHK_OPENED")
		wo_planned$=callpoint!.getUserInput()
		wo_quoted$=callpoint!.getColumnData("SFE_LOADBAL.CHK_QUOTED")
		op_code$=callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")
		beg_date$=callpoint!.getColumnData("SFE_LOADBAL.BEG_WO_DATE")
		num_days$=callpoint!.getColumnData("SFE_LOADBAL.DAYS_IN_MTH")

		gosub create_chart

	endif
[[SFE_LOADBAL.CHK_OPENED.AVAL]]
rem --- call graphing routine

	if callpoint!.getColumnData("SFE_LOADBAL.CHK_OPENED")<>callpoint!.getUserInput()
		wo_open$=callpoint!.getUserInput()
		wo_planned$=callpoint!.getColumnData("SFE_LOADBAL.CHK_PLANNED")
		wo_quoted$=callpoint!.getColumnData("SFE_LOADBAL.CHK_QUOTED")
		op_code$=callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")
		beg_date$=callpoint!.getColumnData("SFE_LOADBAL.BEG_WO_DATE")
		num_days$=callpoint!.getColumnData("SFE_LOADBAL.DAYS_IN_MTH")

		gosub create_chart

	endif
[[SFE_LOADBAL.BEG_WO_DATE.AVAL]]
rem --- validate this date is in calendar
	
	op_code$=callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")
	beg_dt$=callpoint!.getUserInput()
	if cvs(beg_dt$,3)="" 
		beg_dt$=stbl("+SYSTEM_DATE")
		callpoint!.setUserInput(beg_dt$)
	endif


	rem --- call graphing routine
	if callpoint!.getColumnData("SFE_LOADBAL.BEG_WO_DATE")<>callpoint!.getUserInput() and cvs(callpoint!.getUserInput(),3)<>""

		wo_open$=callpoint!.getColumnData("SFE_LOADBAL.CHK_OPENED")
		wo_planned$=callpoint!.getColumnData("SFE_LOADBAL.CHK_PLANNED")
		wo_quoted$=callpoint!.getColumnData("SFE_LOADBAL.CHK_QUOTED")
		op_code$=callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")
		beg_date$=callpoint!.getUserInput()
		num_days$=callpoint!.getColumnData("SFE_LOADBAL.DAYS_IN_MTH")

		gosub create_chart
	
	endif

	
[[SFE_LOADBAL.ASVA]]
rem --- call graphing routine

		wo_open$=callpoint!.getColumnData("SFE_LOADBAL.CHK_OPENED")
		wo_planned$=callpoint!.getColumnData("SFE_LOADBAL.CHK_PLANNED")
		wo_quoted$=callpoint!.getColumnData("SFE_LOADBAL.CHK_QUOTED")
		op_code$=callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")
		beg_date$=callpoint!.getColumnData("SFE_LOADBAL.BEG_WO_DATE")
		num_days$=callpoint!.getColumnData("SFE_LOADBAL.DAYS_IN_MTH")

		if cvs(op_code$,3)<>"" and cvs(beg_date$,3)<>"" and cvs(num_days$,3)<>"" then gosub create_chart
[[SFE_LOADBAL.DAYS_IN_MTH.AVAL]]
rem --- call graphing routine

	if callpoint!.getColumnData("SFE_LOADBAL.DAYS_IN_MTH")<>callpoint!.getUserInput() and cvs(callpoint!.getUserInput(),3)<>""

		wo_open$=callpoint!.getColumnData("SFE_LOADBAL.CHK_OPENED")
		wo_planned$=callpoint!.getColumnData("SFE_LOADBAL.CHK_PLANNED")
		wo_quoted$=callpoint!.getColumnData("SFE_LOADBAL.CHK_QUOTED")
		op_code$=callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")
		beg_date$=callpoint!.getColumnData("SFE_LOADBAL.BEG_WO_DATE")
		num_days$=callpoint!.getUserInput()

		gosub create_chart
	
	endif
[[SFE_LOADBAL.OP_CODE.AVAL]]
rem --- get op code record (either sf op codes or bm op codes) and display setup/queue time

	opcode_dev=num(callpoint!.getDevObject("opcode_chan"))
	dim opcode$:callpoint!.getDevObject("opcode_tpl")

	found=0

	read record (opcode_dev,key=firm_id$+callpoint!.getUserInput(),dom=*next)opcode$;found=1
	if found
		callpoint!.setColumnData("SFE_LOADBAL.QUEUE_TIME",opcode.queue_time$,1)
		callpoint!.setColumnData("SFE_LOADBAL.PCS_PER_HOUR",opcode.pcs_per_hour$,1)
	endif	

rem --- call graphing routine

	if callpoint!.getColumnData("SFE_LOADBAL.OP_CODE")<>callpoint!.getUserInput() and cvs(callpoint!.getUserInput(),3)<>""

		wo_open$=callpoint!.getColumnData("SFE_LOADBAL.CHK_OPENED")
		wo_planned$=callpoint!.getColumnData("SFE_LOADBAL.CHK_PLANNED")
		wo_quoted$=callpoint!.getColumnData("SFE_LOADBAL.CHK_QUOTED")
		op_code$=callpoint!.getUserInput()
		beg_date$=callpoint!.getColumnData("SFE_LOADBAL.BEG_WO_DATE")
		num_days$=callpoint!.getColumnData("SFE_LOADBAL.DAYS_IN_MTH")

		gosub create_chart
	
	endif
[[SFE_LOADBAL.<CUSTOM>]]
use java.util.GregorianCalendar

rem ==============================================================
create_chart:
rem --- construct chart w/ category names (i.e., days of month), bar chart title, and avail/sched hours
rem --- called from each control's AVAL to provide immediate results
rem --- incoming:
rem ---		wo_opened$, wo_planned$, wo_quoted$, op_code$, beg_date$, num_days$
rem ==============================================================
	wo_stats$=""
	if wo_open$="Y" then wo_stats$="O"
	if wo_planned$="Y" then wo_stats$=wo_stats$+"P"
	if wo_quoted$="Y" then wo_stats$=wo_stats$+"Q"

	wdt$=beg_date$
	gosub check_in_calendar
	if date_valid=1
		numCategories=num(num_days$)

		bc_loadbal!=callpoint!.getDevObject("bc_loadbal")
		bc_loadbal!.clearData()
		bc_loadbal!.setSeriesName(0,"Available Hours")
		bc_loadbal!.setSeriesName(1,"Scheduled Hours")

		sfm_opcalndr=fnget_dev("SFM_OPCALNDR")
		sfe_woschdl=fnget_dev("SFE_WOSCHDL")
		sfe_womastr=fnget_dev("SFE_WOMASTR")

		dim sfm_opcalndr$:fnget_tpl$("SFM_OPCALNDR")
		dim sfe_woschdl$:fnget_tpl$("SFE_WOSCHDL")
		dim sfe_womastr$:fnget_tpl$("SFE_WOMASTR")

		yr=num(wdt$(1,4))
		mo=num(wdt$(5,2))
		dt=num(wdt$(7,2))
		wdisp$=date(jul(yr,mo,dt):"%Ml")
		bc_loadbal!.setTitle("Load Balance beginning "+wdisp$+" "+wdt$(7,2)+", "+wdt$(1,4))
		calendar! = GregorianCalendar.getInstance()
	  	calendar!.set(yr, mo-1, 1)
	 	days = calendar!.getActualMaximum(GregorianCalendar.DAY_OF_MONTH);rem --- returns # days in specified mo/yr
		read_flag=1
		begin_dt=dt

		for categories_ctr=0 to numCategories-1
			bc_loadbal!.setCategoryName(categories_ctr,str(mo)+"/"+str(dt))
			if read_flag=1
				dim sfm_opcalndr$:fattr(sfm_opcalndr$)
				read record (sfm_opcalndr,key=firm_id$+op_code$+str(yr:"0000")+str(mo:"00"),dom=*next)sfm_opcalndr$
				read_flag=0
			endif
			read (sfe_woschdl,key=firm_id$+op_code$+str(yr:"0000")+str(mo:"00")+str(dt:"00"),dom=*next)
			sched_hrs=0
			while 1
				read record (sfe_woschdl,end=*break)sfe_woschdl$
				if pos(firm_id$+op_code$+str(yr:"0000")+str(mo:"00")+str(dt:"00")=sfe_woschdl$)<>1 then break
				read record (sfe_womastr,key=firm_id$+sfe_womastr.wo_location$+sfe_woschdl.wo_no$,dom=*next)sfe_womastr$
				if pos(sfe_womastr.wo_status$=wo_stats$)<>0
					sched_hrs=sched_hrs+sfe_woschdl.setup_time+sfe_woschdl.runtime_hrs
				endif
			wend
			bc_loadbal!.setBarValue(0,categories_ctr,num(field(sfm_opcalndr$,"HRS_PER_DAY_"+str(dt:"00"))))
			bc_loadbal!.setBarValue(1,categories_ctr,sched_hrs)
			dt=dt+1
			if dt>days
				mo=mo+1
				if mo>12
					yr=yr+1
				endif
				calendar!.set(yr,mo,1)
				days=calendar!.getActualMaximum(GregorianCalendar.DAY_OF_MONTH)
				dt=1
				read_flag=1
			endif
		next categories_ctr

	endif

	return

rem ========================================================
check_in_calendar:
rem --- see if selected date is in the SF calendar
rem --- incoming: beg_date$
rem ---                 op_code$
rem ========================================================

	date_valid=0
	if cvs(op_code$,3)<>""
		sfm_opcalndr=fnget_dev("SFM_OPCALNDR")
		dim sfm_opcalndr$:fnget_tpl$("SFM_OPCALNDR")
		read record (sfm_opcalndr,key=firm_id$+op_code$+beg_date$(1,6),dom=*next)sfm_opcalndr$;date_valid=1
	endif
	
	if !date_valid
		msg_id$="SF_NOT_IN_CAL"
		gosub disp_message
	endif	

	return

#include std_missing_params.src
[[SFE_LOADBAL.BSHO]]
rem --- open files/init

	num_files=5
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="IVS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="SFE_WOMASTR",open_opts$[3]="OTA"
	open_tables$[4]="SFE_WOSCHDL",open_opts$[4]="OTA"
	open_tables$[5]="SFM_OPCALNDR",open_opts$[5]="OTA"

	gosub open_tables

	sfs_params=num(open_chans$[1])

	dim sfs_params$:open_tpls$[1]
	dim ivs_params$:open_tpls$[2]

	read record (sfs_params,key=firm_id$+"SF00",dom=std_missing_params)sfs_params$
	bm$=sfs_params.bm_interface$

	if bm$<>"Y"
		callpoint!.setTableColumnAttribute("SFE_LOADBAL.OP_CODE","DTAB","SFC_OPRTNCOD")
	endif

	if bm$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","BM",info$[all]
		bm$=info$[20]
	endif

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	if bm$<>"Y"
		open_tables$[1]="SFC_OPRTNCOD",open_opts$[1]="OTA"
	else
		open_tables$[1]="BMC_OPCODES",open_opts$[1]="OTA"
	endif

	callpoint!.setDevObject("bm",bm$)

	gosub open_tables

	callpoint!.setDevObject("opcode_chan",num(open_chans$[1]))
	callpoint!.setDevObject("opcode_tpl",open_tpls$[1])
	
rem --- add bar chart to form

	ctl_id=num(stbl("+CUSTOM_CTL"))
	numCategories=num(callpoint!.getTableColumnAttribute("SFE_LOADBAL.DAYS_IN_MTH","DFLT"))

	bc_loadbal! = form!.addBarChart(ctl_id, 10, 100, 800, 500, "Days", "Hours", 2,numCategories,1, 1, 0); bc_loadbal!.setTitle("Load Balance Inquiry")

	bc_loadbal!.setSeriesName(0,"Available Hours")
	bc_loadbal!.setSeriesName(1,"Scheduled Hours")

	callpoint!.setDevObject("bc_loadbal",bc_loadbal!)
