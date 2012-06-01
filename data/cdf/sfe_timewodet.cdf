[[SFE_TIMEWODET.TITLE_CODE.AVAL]]
rem --- Get pay rate
	title_code$=callpoint!.getUserInput()
	pay_code$=callpoint!.getColumnData("SFE_TIMEWODET.PAY_CODE")
	gosub get_pay_rate
	if bad_code$="TC" then
		callpoint!.setStatus("ABORT")
		break
	endif
[[SFE_TIMEWODET.START_TIME.AVAL]]
rem --- Calculate hours
break; rem wgh ... stopped here
	start_time$=callpoint!.getUserInput()
	stop_time$=callpoint!.getColumnData("SFE_TIMEWODET.STOP_TIME")
	gosub calculate_hours

	rem --- Calculate hrs and extension
	if hours<>0 then
		setup_time=num(callpoint!.getColumnData("SFE_TIMEWODET.SETUP_TIME"))
		callpoint!.setColumnData("SFE_TIMEWODET.HRS",str(hours-setup_time),1)
		gosub calculate_extension
	endif
[[SFE_TIMEWODET.PAY_CODE.AVAL]]
rem --- Get pay rate
	pay_code$=callpoint!.getUserInput()
	title_code$=callpoint!.getColumnData("SFE_TIMEWODET.TITLE_CODE")
	gosub get_pay_rate
	if bad_code$="PC" then
		callpoint!.setStatus("ABORT")
		break
	endif
[[SFE_TIMEWODET.<CUSTOM>]]
rem ==========================================================================
calculate_hours: rem --- Calculate hours
rem --- start_time$: input
rem --- stop_time$: input
rem --- hours: output
rem ==========================================================================
	hours=0
	if cvs(start_time$,2)<>"" and cvs(stop_time$,2)<>"" then
		start=num(start_time$)
		stop=num(stop_time$)
		if stop<start then stop=stop+2400
		if mod(stop,100)<mod(start,100) then stop=stop-40
		hours=(int((stop-start)*.01)+mod(stop-start,100)/60)*1
	endif
	return

rem ==========================================================================
calculate_extension: rem --- Calculate extension
rem ==========================================================================
	hrs=num(callpoint!.getColumnData("SFE_TIMEWODET.HRS"))
	direct_rate=num(callpoint!.getColumnData("SFE_TIMEWODET.DIRECT_RATE"))
	setup_time=num(callpoint!.getColumnData("SFE_TIMEWODET.SETUP_TIME"))
	opcode_ovhd_factor=callpoint!.getDevObject("opcode_ovhd_factor")
	ovhd_rate=direct_rate*opcode_ovhd_factor
	extended_amt=round((hrs+setup_time)*direct_rate,2)+round((hrs+setup_time)*ovhd_rate,2)
	callpoint!.setColumnData("SFE_TIMEWODET.OVHD_RATE",str(ovhd_rate))
	callpoint!.setColumnData("SFE_TIMEWODET.EXTENDED_AMT",str(extended_amt))
	return

rem ==========================================================================
get_pay_rate: rem --- Determine pay rate if actual
rem --- pay_code$: input
rem --- title_code$: input
rem --- bad_code$: output
rem ==========================================================================
	bad_code$=""
	if callpoint!.getDevObject("pr")<>"Y" then
		rem --- No payroll interface, use opcode direct rate
		if num(callpoint!.getColumnData("SFE_TIMEWODET.DIRECT_RATE"))=0 then
			callpoint!.setColumnData("SFE_TIMEWODET.DIRECT_RATE",str(callpoint!.getDevObject("opcode_direct_rate")))
		endif
		gosub calculate_extension
	else
		rem --- Payroll Interface,  use employee's pay and title codes
		employee_no$=callpoint!.getColumnData("SFE_TIMEWODET.EMPLOYEE_NO")

		rem --- Use imployee's pay code
		bad_code$="PC"
		emplearn_dev=callpoint!.getDevObject("emplearn_dev")
		find(emplearn_dev,key=firm_id$+employee_no$+"A"+pay_code$,dom=*endif)
		paycode_dev=callpoint!.getDevObject("paycode_dev")
		dim paycode$:callpoint!.getDevObject("paycode_tpl")
		findrecord(paycode_dev,key=firm_id$+"A"+pay_code$,dom=*endif)paycode$
		bad_code$=""
		paycode_rate=paycode.calc_rtamt
		premium_rate=paycode.prem_factor

		rem --- Use imployee's title code
		if callpoint!.getDevObject("pay_actstd")="A" then 
			bad_code$="TC"
			emplpay_dev=callpoint!.getDevObject("emplpay_dev")
			dim emplpay$:callpoint!.getDevObject("emplpay_tpl")
			findrecord(emplpay_dev,key=firm_id$+employee_no$+title_code$,dom=*endif)emplpay$
			titlcode_dev=callpoint!.getDevObject("titlcode_dev")
			dim titlcode$:callpoint!.getDevObject("titlcode_tpl")
			findrecord(titlcode_dev,key=firm_id$+"F"+title_code$,dom=*endif)titlcode$
			bad_code$=""

			rem --- Calculate actual pay rate"
			rate=0
			std_rate=emplpay.std_rate
			std_hrs=emplpay.std_hrs
			if callpoint!.getDevObject("hrlysalary")<>"S" then
				rate=std_rate
			else
				if std_hrs<>0 then rate=std_rate/std_hrs
			endif
			if paycode_rate<>0 then rate=paycode_rate; rem --- override by pay code
			if rate=0 then rate=titlcode.std_rate; rem --- use title code rate if needed
			if premium_rate<>0 then rate=rate*premium_rate; rem --- premium factor
    
			if rate<>0 then
				callpoint!.setColumnData("SFE_TIMEWODET.DIRECT_RATE",str(rate))
				gosub calculate_extension
			else
				bad_code$="TC"
			endif
		endif
	endif

	rem --- Bad pay code
	if bad_code$="PC" and cvs(pay_code$,2)<>"" then
		msg_id$ = "PR_BAD_PAY_CODE"
		dim msg_tokens$[1]
		msg_tokens$[1]=pay_code$
		gosub disp_message
	endif

	rem --- Bad title code
	if bad_code$="TC" and cvs(title_code$,2)<>"" then
		msg_id$ = "PR_BAD_TITLE_CODE"
		dim msg_tokens$[1]
		msg_tokens$[1]=title_code$
		gosub disp_message
	endif

	return
[[SFE_TIMEWODET.STOP_TIME.AVAL]]
rem --- Capture entry so can be used for next new start time
break; rem wgh ... stopped here
	stop_time$=callpoint!.getUserInput()
	callpoint!.setDevObject("prev_stoptime",callpoint!.getUserInput())

rem --- Calculate hours
	start_time$=callpoint!.getColumnData("SFE_TIMEWODET.START_TIME")
	gosub calculate_hours

	rem --- Calculate hrs and extension
	if hours<>0 then
		setup_time=num(callpoint!.getColumnData("SFE_TIMEWODET.SETUP_TIME"))
		callpoint!.setColumnData("SFE_TIMEWODET.HRS",str(hours-setup_time),1)
		gosub calculate_extension
	endif
[[SFE_TIMEWODET.AREC]]
rem --- Initialize new start_time
	callpoint!.setColumnData("SFE_TIMEWODET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)

rem --- Initialize opcode overhead factor
	callpoint!.setDevObject("opcode_direct_rate",0)
	callpoint!.setDevObject("opcode_ovhd_factor",0)
[[SFE_TIMEWODET.START_TIME.BINP]]
rem --- Initialize new start_time
break; rem wgh ... stopped here
	if cvs(callpoint!.getColumnData("SFE_TIMEWODET.START_TIME"),2)="" then
		callpoint!.setColumnData("SFE_TIMEWODET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)
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
		callpoint!.setColumnEnabled(-1,"SFE_TIMEWODET.START_TIME",0)
		callpoint!.setColumnEnabled(-1,"SFE_TIMEWODET.STOP_TIME",0)
	endif
	if callpoint!.getDevObject("pr")<>"Y" then
		callpoint!.setColumnEnabled(-1,"SFE_TIMEWODET.PAY_CODE",0)
		callpoint!.setColumnEnabled(-1,"SFE_TIMEWODET.TITLE_CODE",0)
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
