[[SFE_TIMEDATEDET.<CUSTOM>]]
rem ==========================================================================
calculate_hours: rem --- Calculate hours
rem --- hours: output
rem ==========================================================================
	start=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.START_TIME"))
	stop=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.STOP_TIME"))
	if mod(stop,100)<mod(start,100) then stop=stop-40
	hours=(int((stop-start)*.01)+mod(stop-start,100)/60)*1
return

rem ==========================================================================
calculate_extension: rem --- Calculate extension
rem ==========================================================================
	hrs=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.HRS"))
	direct_rate=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.DIRECT_RATE"))
	setup_time=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.SETUP_TIME"))
	opcode_ovhd_factor=callpoint!.getDevObject("opcode_ovhd_factor")
	ovhd_rate=direct_rate*opcode_ovhd_factor
	extended_amt=round((hrs+setup_time)*direct_rate,2)+round((hrs+setup_time)*ovhd_rate,2)
	callpoint!.setColumnData("SFE_TIMEEMPLDET.OVHD_RATE",str(ovhd_rate))
	callpoint!.setColumnData("SFE_TIMEEMPLDET.EXTENDED_AMT",str(extended_amt))
return
[[SFE_TIMEDATEDET.STOP_TIME.AVAL]]
rem --- Capture entry so can be used for next new start time
	callpoint!.setDevObject("prev_stoptime",callpoint!.getUserInput())

rem --- Calculate hours
	callpoint!.setColumnData("SFE_TIMEEMPLDET.STOP_TIME",stop_time$)
	gosub calculate_hours

rem --- Calculate hrs and extension
if hours<>0 then
	setup_time=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.SETUP_TIME"))
	callpoint!.setColumnData("SFE_TIMEEMPLDET.HRS",str(hours-setup_time),1)
	gosub calculate_extension
endif
[[SFE_TIMEDATEDET.AREC]]
rem --- Initialize new start_time
	callpoint!.setColumnData("SFE_TIMEEMPLDET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)

rem --- Initialize opcode overhead factor
	callpoint!.setDevObject("opcode_ovhd_factor",0)
[[SFE_TIMEDATEDET.START_TIME.BINP]]
rem --- Initialize new start_time
	if cvs(callpoint!.getColumnData("SFE_TIMEEMPLDET.START_TIME"),2)="" then
		callpoint!.setColumnData("SFE_TIMEEMPLDET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)
	endif
[[SFE_TIMEDATEDET.ADGE]]
rem --- Disable fields
	if callpoint!.getDevObject("time_clk_flg")<>"Y" then
		callpoint!.setColumnEnabled(-1,"SFE_TIMEEMPLDET.START_TIME",0)
		callpoint!.setColumnEnabled(-1,"SFE_TIMEEMPLDET.STOP_TIME",0)
	endif
	if callpoint!.getDevObject("pr")<>"Y" then
		callpoint!.setColumnEnabled(-1,"SFE_TIMEEMPLDET.PAY_CODE",0)
		callpoint!.setColumnEnabled(-1,"SFE_TIMEEMPLDET.TITLE_CODE",0)
	endif

rem --- Initializations
	callpoint!.setDevObject("prev_stoptime","")
[[SFE_TIMEDATEDET.BGDS]]
rem --- Set precision
	precision num(callpoint!.getDevObject("precision"))

rem wgh ... stopped at line 505 woe.bb
[[SFE_TIMEDATEDET.AGCL]]
rem --- set preset val for batch_no
	callpoint!.setTableColumnAttribute("SFE_TIMEDATEDET.BATCH_NO","PVAL",$22$+stbl("+BATCH_NO")+$22$)
