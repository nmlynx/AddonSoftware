[[SFE_TIMEEMPLDET.<CUSTOM>]]
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
[[SFE_TIMEEMPLDET.AREC]]
rem --- Initialize new start_time
	callpoint!.setColumnData("SFE_TIMEEMPLDET.START_TIME",str(callpoint!.getDevObject("prev_stoptime")),1)

rem --- Initialize opcode overhead factor
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
rem wgh ... 
rem wgh ... 3100 REM " --- Title Code Here
rem wgh ... 3110 IF P3$(4,1)<>"Y" THEN GOTO 3270
rem wgh ... 3120 LET V0$="S",V1$="C",V2$=W1$(26,2),V3$="",V4$="Enter An Appropriate Title Code, <F3>=Lookup ",V0=2,V1=Q[3],V2=L
rem wgh ... 3130 GOSUB 7000
rem wgh ... 3140 IF V3=2 THEN GOTO 3270
rem wgh ... 3150 IF V3<>3 THEN GOTO 3220
rem wgh ... 3160 LET NUMBER=1; GOSUB DIMENSION_LOOKUP_PARAMETERS
rem wgh ... 3170 LET DESCRIPTION$[0]="Code:",DESCRIPTION$[1]="Description:"
rem wgh ... 3180 LET FIELD[0]=1,POSITION[0]=4,LENGTH[0]=2
rem wgh ... 3190 LET FIELD[1]=1,POSITION[1]=6,LENGTH[1]=20
rem wgh ... 3200 LET ROW=V2+1,COLUMN=79-LENGTH[0]-LENGTH[1]-2-NUMBER*4,CHANNEL=PRM10_DEV,RECORD$="F",TITLE$="Code Lookup"
rem wgh ... 3210 CALL "SYC.LK",CHANNEL,RECORD$,NUMBER,TITLE$,DESCRIPTION$[ALL],FIELD[ALL],POSITION[ALL],LENGTH[ALL],COLUMN,ROW,V$
rem wgh ... 3220 LET V$=V$+"  ",V$=V$(1,2)
rem wgh ... 3230 FIND (PRM10_DEV,KEY=N0$+"F"+V$,DOM=3120)IOL=PRM10
rem wgh ... 3235 LET OLDTC$=W1$(26,2),W1$(26,2)=V$
rem wgh ... 3240 GOSUB 6000
rem wgh ... 3245 IF BAD_CODE$="Y" THEN LET W1$(26,2)=OLDTC$; GOTO 3100
rem wgh ... 3247 LET OLDTC$=""
rem wgh ... 3250 PRINT @(40,23),"Title Code: ",V$," ",Y0$(6,20),
rem wgh ... 3260 PRINT @(V1,V2),V$
rem wgh ... 3270 GOTO 3600
[[SFE_TIMEEMPLDET.PAY_CODE.AVAL]]
rem wgh ... 
rem wgh ... 2800 REM " --- Pay Code Here
rem wgh ... 2810 IF P3$(4,1)<>"Y" THEN GOTO 2990
rem wgh +++ 2820 LET V0$="S",V1$="C",V2$=W1$(24,2),V3$="",V4$="Enter An Appropriate Pay Code, <F3>=Lookup",V0=2,V1=Q[2],V2=L
rem wgh ... 2830 GOSUB 7000
rem wgh ... 2840 IF V3=2 THEN GOTO 2990
rem wgh ... 2850 IF V3<>3 THEN GOTO 2930
rem wgh ... 2860 LET NUMBER=1; GOSUB DIMENSION_LOOKUP_PARAMETERS
rem wgh ... 2870 LET DESCRIPTION$[0]="Code:",DESCRIPTION$[1]="Description:"
rem wgh ... 2880 LET FIELD[0]=1,POSITION[0]=4,LENGTH[0]=2
rem wgh ... 2890 LET FIELD[1]=1,POSITION[1]=6,LENGTH[1]=16
rem wgh ... 2900 LET ROW=V2+1,COLUMN=79-LENGTH[0]-LENGTH[1]-2-NUMBER*4
rem wgh ... 2910 LET CHANNEL=PRM10_DEV,RECORD$="A",TITLE$="Code Lookup"
rem wgh ... 2920 CALL "SYC.LK",CHANNEL,RECORD$,NUMBER,TITLE$,DESCRIPTION$[ALL],FIELD[ALL],POSITION[ALL],LENGTH[ALL],COLUMN,ROW,V$
rem wgh ... 2930 LET V$=V$+"  ",V$=V$(1,2)
rem wgh ... 2940 FIND (PRM10_DEV,KEY=N0$+"A"+V$,DOM=2820)IOL=PRM10
rem wgh ... 2945 LET OLDPC$=W1$(24,2),W1$(24,2)=V$
rem wgh +++ 2950 GOSUB 6000
rem wgh ... 2955 IF BAD_CODE$="Y" THEN LET W1$(24,2)=OLDPC$; GOTO 2800
rem wgh ... 2960 LET OLDPC$=""
rem wgh ... 2970 PRINT @(V1,V2),V$
rem wgh ... 2980 PRINT @(0,23),"Pay Code: ",V$," ",Y0$(6,10),
rem wgh ... 2990 GOTO 3600
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
	callpoint!.setDevObject("prev_stoptime",stop_time$)

rem --- Calculate hours
	callpoint!.setColumnData("SFE_TIMEEMPLDET.STOP_TIME",stop_time$)
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
