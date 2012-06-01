[[SFE_TIMEEMPLDET.START_TIME.AVAL]]
rem --- Calculate hours
	start_time$=callpoint!.getUserInput()
	stop_time$=callpoint!.getColumnData("SFE_TIMEEMPLDET.STOP_TIME")
	gosub calculate_hours

	rem --- Calculate hrs and extension
	if hours<>0 then
		setup_time=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.SETUP_TIME"))
		callpoint!.setColumnData("SFE_TIMEEMPLDET.HRS",str(hours-setup_time),1)
		gosub calculate_extension
	endif
[[SFE_TIMEEMPLDET.<CUSTOM>]]
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
	hrs=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.HRS"))
	direct_rate=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.DIRECT_RATE"))
	setup_time=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.SETUP_TIME"))
	opcode_ovhd_factor=callpoint!.getDevObject("opcode_ovhd_factor")
	ovhd_rate=direct_rate*opcode_ovhd_factor
	extended_amt=round((hrs+setup_time)*direct_rate,2)+round((hrs+setup_time)*ovhd_rate,2)
	callpoint!.setColumnData("SFE_TIMEEMPLDET.OVHD_RATE",str(ovhd_rate))
	callpoint!.setColumnData("SFE_TIMEEMPLDET.EXTENDED_AMT",str(extended_amt))
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
		if num(callpoint!.getColumnData("SFE_TIMEEMPLDET.DIRECT_RATE"))=0 then
			callpoint!.setColumnData("SFE_TIMEEMPLDET.DIRECT_RATE",str(callpoint!.getDevObject("opcode_direct_rate")))
		endif
		gosub calculate_extension
	else
		rem --- Payroll Interface,  use employee's pay and title codes
		employee_no$=callpoint!.getHeaderColumnData("SFE_TIMEEMPL.EMPLOYEE_NO")

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
				callpoint!.setColumnData("SFE_TIMEEMPLDET.DIRECT_RATE",str(rate))
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
[[SFE_TIMEEMPLDET.AREC]]
rem --- Initialize new start_time
	callpoint!.setColumnData("SFE_TIMEEMPLDET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)

rem --- Initialize opcode overhead factor
	callpoint!.setDevObject("opcode_direct_rate",0)
	callpoint!.setDevObject("opcode_ovhd_factor",0)
[[SFE_TIMEEMPLDET.START_TIME.BINP]]
rem --- Initialize new start_time
	if cvs(callpoint!.getColumnData("SFE_TIMEEMPLDET.START_TIME"),2)="" then
		callpoint!.setColumnData("SFE_TIMEEMPLDET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)
	endif
[[SFE_TIMEEMPLDET.COMPLETE_QTY.AVAL]]
rem wgh ... 
rem wgh ... 3500 REM " --- Comlete Quantity"
rem wgh ... 3510 LET V0$="N",V1$="C",V2$=STR(W[5]),V3$=M2$,V4$="Enter Number of Finished Goods Completed For These Hours",V0=0,V1=Q[8],V2=L
rem wgh ... 3520 GOSUB 7000
rem wgh ... 3530 LET W[5]=V
rem wgh ... 3540 GOSUB 5090
rem wgh ... 3550 GOTO 3600
[[SFE_TIMEEMPLDET.SETUP_TIME.AVAL]]
rem wgh ... 
rem wgh ... 3400 REM " --- Setup Hours"
rem wgh ... 3410 LET V0$="N",V1$="C",V2$=STR(W[4]),V3$=M2$,V4$="Enter Number of Setup Hours",V0=0,V1=Q[6],V2=L
rem wgh ... 3420 GOSUB 7000
rem wgh ... 3430 LET V9=V
rem wgh ... 3440 IF P3$(13,1)="Y" THEN GOSUB 6900; IF V<>0 AND V9>V THEN GOTO 3400 ELSE LET W[0]=V-V9
rem wgh ... 3450 LET W[4]=V9
rem wgh ... 3460 IF POS(TS_SEQ$="E")<>0 AND P3$(13,1)="Y" THEN PRINT @(Q[5],L),FNE$(W1$(20,4))
rem wgh ... 3470 GOSUB 5090
rem wgh ... 3480 GOTO 3600
[[SFE_TIMEEMPLDET.HRS.AVAL]]
rem wgh ... 
rem wgh ... 3300 REM " --- Hours
rem wgh ... 3310 IF CVS(W1$(16,4),2)<>"" AND CVS(W1$(20,4),2)<>"" THEN GOTO 3350
rem wgh ... 3320 LET V0$="N",V1$="C",V2$=STR(W[0]),V3$=M2$,V4$="Enter Number of Hours Worked",V0=0,V1=Q[7],V2=L
rem wgh ... 3330 GOSUB 7000
rem wgh ... 3340 LET W[0]=V
rem wgh ... 3350 GOSUB 6800
rem wgh ... 3360 IF POS(TS_SEQ$="E")<>0 AND P3$(13,1)="Y" THEN PRINT @(Q[5],L),FNE$(W1$(20,4))
rem wgh ... 3370 GOTO 3600
[[SFE_TIMEEMPLDET.TITLE_CODE.AVAL]]
rem --- Get pay rate
	title_code$=callpoint!.getUserInput()
	pay_code$=callpoint!.getColumnData("SFE_TIMEEMPLDET.PAY_CODE")
	gosub get_pay_rate
	if bad_code$="TC" then
		callpoint!.setStatus("ABORT")
		break
	endif
[[SFE_TIMEEMPLDET.PAY_CODE.AVAL]]
rem --- Get pay rate
	pay_code$=callpoint!.getUserInput()
	title_code$=callpoint!.getColumnData("SFE_TIMEEMPLDET.TITLE_CODE")
	gosub get_pay_rate
	if bad_code$="PC" then
		callpoint!.setStatus("ABORT")
		break
	endif
[[SFE_TIMEEMPLDET.OP_SEQ.AVAL]]
rem wgh ... 
rem wgh ... 2600 REM " --- Step
rem wgh ... 2610 LET V0$="Z",V1$="CRE",V2$=W1$(1,3),V3$="",V4$="Enter Operation Sequence # From Work Order, <F3>=Lookup",V0=3,V1=Q[0],V2=L
rem wgh ... 2620 GOSUB 7000
rem wgh ... 2630 IF V3=2 THEN GOTO 3600
rem wgh ... 2640 IF V3=4 THEN GOTO 4000
rem wgh ... 2650 IF V3=3 THEN LET V$=W9$; CALL "WOC.DA",V$,SYS01_DEV,OPCODE_DEV,WOE02_DEV
rem wgh ... 2660 DIM L[13]
rem wgh ... 2670 FIND (WOE02_DEV,KEY=N0$+"  "+W9$+"A"+V$,DOM=2600)IOL=WOE02A
rem wgh ... 2680 IF L1$(91,1)="M" THEN LET V0$="S",V1$="C",V2$="",V3$="",V4$="You May Not Apply Labor To A Comment Line. <Enter> To Continue. ",V0=1,V1=FNV(V4$),V2=22; GOSUB 7000; GOTO 2600
rem wgh ... 2690 LET W1$(1,3)=V$,W1$(4,3)=L1$(1,3),L1$=L1$(7,20)
rem wgh ... 2700 FIND (OPCODE_DEV,KEY=N0$+W1$(4,3),DOM=2710)IOL=OPCODE
rem wgh ... 2710 PRINT @(V1,V2),V$,@(Q[1],L),W1$(4,3),@(40,L+1)," ",L1$
rem wgh ... 2720 GOSUB 6600
rem wgh ... 2730 GOTO 3600
[[SFE_TIMEEMPLDET.STOP_TIME.AVAL]]
rem --- Capture entry so can be used for next new start time
	stop_time$=callpoint!.getUserInput()
	callpoint!.setDevObject("prev_stoptime",callpoint!.getUserInput())

rem --- Calculate hours
	start_time$=callpoint!.getColumnData("SFE_TIMEEMPLDET.START_TIME")
	gosub calculate_hours

	rem --- Calculate hrs and extension
	if hours<>0 then
		setup_time=num(callpoint!.getColumnData("SFE_TIMEEMPLDET.SETUP_TIME"))
		callpoint!.setColumnData("SFE_TIMEEMPLDET.HRS",str(hours-setup_time),1)
		gosub calculate_extension
	endif
[[SFE_TIMEEMPLDET.WO_NO.AVAL]]
rem wgh ... 
rem wgh ... 2200 REM " --- W/O # ("DE" Selections)
rem wgh ... 2205 LET V0$="Z",V1$="CREK",V2$=W1$(7,7),V3$="",V4$="Enter WO #, <F3>=Lookup",V0=7,V1=3,V2=L
rem wgh ... 2210 GOSUB 7000
rem wgh ... 2215 IF V3=2 AND W[0]=0 THEN GOTO 1400
rem wgh ... 2220 IF V3=4 THEN GOTO 4000
rem wgh ... WO lookup for only OPEN WOs
rem wgh ... 2225 IF V3=3 THEN GOSUB 6500
rem wgh ... 2230 PRINT @(V1,L+1),'CL'
rem wgh ... 2235 FIND (WOE01_DEV,KEY=A0$(1,2)+"  "+V$,DOM=2200)IOL=WOE01A
rem wgh ... 2240 IF POS(X$(15,1)="CPQ")=0 THEN GOTO 2270
rem wgh ... 2245 IF X$(15,1)="C" THEN LET STAT$="Closed" ELSE IF X$(15,1)="P" THEN LET STAT$="Planned" ELSE LET STAT$="Quoted"
rem wgh ... 2250 DIM MESS$[1]
rem wgh ... 2255 LET MESS$[0]="Work Order Is "+STAT$+"!! <Enter> To Reselect:"
rem wgh ... 2260 CALL "SYC.XA",2,MESS$[ALL],0,22,-1,V$,V3
rem wgh ... 2265 GOTO 2200
rem wgh ... 2270 DIM B1$(60)
rem wgh ... 2275 FIND (IVM01_DEV,KEY=N0$+X$(56,20),DOM=2280)IOL=IVM01A
rem wgh ... 2280 IF X$(14,1)<>"I" THEN PRINT @(V1,L+1),X1$(1,30), ELSE PRINT @(V1,L+1),B1$(1,MIN(DESC[1],30)),
rem wgh ... 2285 LET W1$(7,7)=V$,W9$=V$
rem wgh ... 2290 GOTO 3600
[[SFE_TIMEEMPLDET.AWRI]]
rem wgh ... need to update entered_hrs = hrs + setup_time
[[SFE_TIMEEMPLDET.ADGE]]
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
[[SFE_TIMEEMPLDET.BGDS]]
rem --- Set precision
	precision num(callpoint!.getDevObject("precision"))

rem wgh ... stopped at line 800 woe.bb
[[SFE_TIMEEMPLDET.AGCL]]
rem --- set preset val for batch_no
	callpoint!.setTableColumnAttribute("SFE_TIMEEMPLDET.BATCH_NO","PVAL",$22$+stbl("+BATCH_NO")+$22$)
