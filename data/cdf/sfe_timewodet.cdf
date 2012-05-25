[[SFE_TIMEWODET.<CUSTOM>]]
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
[[SFE_TIMEWODET.STOP_TIME.AVAL]]
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
[[SFE_TIMEWODET.AREC]]
rem --- Initialize new start_time
	callpoint!.setColumnData("SFE_TIMEEMPLDET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)

rem --- Initialize opcode overhead factor
	callpoint!.setDevObject("opcode_ovhd_factor",0)
[[SFE_TIMEWODET.START_TIME.BINP]]
rem --- Initialize new start_time
	if cvs(callpoint!.getColumnData("SFE_TIMEEMPLDET.START_TIME"),2)="" then
		callpoint!.setColumnData("SFE_TIMEEMPLDET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)
	endif
[[SFE_TIMEWODET.EMPLOYEE_NO.AVAL]]
rem wgh ...
rem wgh ... 2000 REM " --- Employee
rem wgh ... 2010 IF POS(TS_SEQ$="DE")>0 THEN GOTO 2200
rem wgh ... 2020 LET V0$="M",V1$="KCRE",V2$=W1$(7,P[0]),V3$=M0$,V4$="Enter A Valid Employee Number (<F3>=Lookup)",V0=9,V1=3,V2=L
rem wgh ... 2030 GOSUB 7000
rem wgh ... 2035 IF V3=2 AND W[0]=0 THEN GOTO 1400
rem wgh ... 2040 IF V3=4 THEN GOTO 4000
rem wgh ... 2050 IF V3<>3 THEN GOTO 2090
rem wgh ... 2080 CALL "WOC.LP",V$
rem wgh ... 2090 IF V$="" THEN GOTO 2000
rem wgh ... 2095 FIND (EMPCODE_DEV,KEY=N0$+V$,DOM=2000)IOL=EMPCODE
rem wgh ... 2100 IF P3$(4,1)="Y" THEN LET R1$=Y1$(223,2),R2$=Y1$(225,1)
rem wgh ... 2105 LET W1$(7,9)=V$,W1$(26,2)=R1$,W1$(24,2)=R$
rem wgh ... 2130 GOSUB 6700
rem wgh ... 2140 PRINT @(V1,V2),FNF$(V$(1,P[0]),M0$),@(V1,L+1),Y1$(1,30)
rem wgh ... 2190 GOTO 3600
[[SFE_TIMEWODET.ADGE]]
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
[[SFE_TIMEWODET.BGDS]]
rem --- Set precision
	precision num(callpoint!.getDevObject("precision"))

rem wgh ... stopped at line 505 woe.bb
[[SFE_TIMEWODET.AGCL]]
rem --- set preset val for batch_no
	callpoint!.setTableColumnAttribute("SFE_TIMEWODET.BATCH_NO","PVAL",$22$+stbl("+BATCH_NO")+$22$)
