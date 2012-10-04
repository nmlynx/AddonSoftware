[[SFE_WOLOTSER.ADTW]]

[[SFE_WOLOTSER.CLS_INP_QTY.AVAL]]
rem wgh ... entry only allowed for woclose

rem wgh ... 2600 REM " --- Closed Qty Here
rem wgh ... 2610 IF W[4]=0 THEN IF P3$(17,1)<>"L" THEN LET W[4]=W[0],NEEDED=NEEDED-W[4] ELSE LET W[4]=A[4],NEEDED=NEEDED-W[4]
rem wgh ... 2620 LET OLDQTY=W[4]
rem wgh ... 2630 LET V0$="N",V1$="C",V3$=M2$,V4$="",V0=7,V1=72-M3-M2,V2=L
rem wgh ... 2640 IF P3$(17,1)="S" AND V3<>2 THEN PRINT @(V1,V2),W[4]:M2$; GOTO 2720
rem wgh ... 2660 LET V2$=STR(W[4]),V4$="Enter Qty To Complete This "+S9$+", <Enter>="+V2$
rem wgh ... 2680 GOSUB 7000
rem wgh ... 2690 IF P3$(17,1)="S" THEN IF LEN(D2$)>0 THEN IF D2$(19,1)="Y" THEN IF V<0 OR V>1 THEN LET V3=2; GOTO 2600
rem wgh ... 2700 LET W[4]=V
rem wgh ... 2720 IF W[4]=0 THEN LET W[5]=0,W1$(25,1)="" ELSE LET W[5]=A[5]
rem wgh ... 2740 PRINT @(72-M3,L),W[5]:M3$,
rem wgh ... 2750 IF OLDQTY<>W[4] THEN LET NEEDED=NEEDED-W[4]+OLDQTY
rem wgh ... 2790 GOTO 3200
[[SFE_WOLOTSER.COMPLETE_FLG.AVAL]]
rem wgh ... entry only allowed for woclose

rem wgh ... 2800 REM " --- Complete?
rem wgh ... 2810 IF P3$(17,1)="S" AND W[2]+W[4]>0 THEN LET W1$(25,1)="Y"; PRINT @(75,L),W1$(25,1); GOTO 3200
rem wgh ... 2820 IF W[2]+W[4]=W[0] THEN LET W1$(25,1)="Y"
rem wgh ... 2830 LET V4$="Is This "+S9$+" Complete (Y/N)?"
rem wgh ... 2835 LET V0$="Y",V1$="C",V2$=W1$(25,1),V3$="",V0=1,V1=75,V2=L
rem wgh ... 2840 GOSUB 7000
rem wgh ... 2860 LET W1$(25,1)=V$
rem wgh ... 2890 GOTO 3200

[[SFE_WOLOTSER.AOPT-AUTO]]
rem wgh ... 6400 REM " --- Auto Generate Numbers"
rem wgh ... 6410 DIM SERIAL$[1]
rem wgh ... 6420 LET SERIAL$[0]=STR(NEEDED)
rem wgh ... 6430 CALL "IVC.SN",SYS01_DEV,V2,NEEDED,SERIAL$[ALL],STATUS
rem wgh ... 6440 IF STATUS>0 THEN GOSUB 6000; GOTO 6690
rem wgh ... 6450 IF NUM(W0$(12,3))+NUM(SERIAL$[0])-1>999 THEN GOSUB 6000; GOTO 6690
rem wgh ... 6455 IF NUM(SERIAL$[0])=0 THEN GOTO 6690
rem wgh ... 6460 FOR X0=1 TO NUM(SERIAL$[0])
rem wgh ... 6470 DIM X0$(20)
rem wgh ... 6480 LET X0$(1)=SERIAL$[X0]
rem wgh ... 6490 FIND (IVM07_DEV,KEY=N0$+A0$(54)+X0$,DOM=6550)IOL=IVM07A
rem wgh ... 6500 IF D[1]-D[2]>0 THEN GOTO 6510 ELSE GOTO 6550
rem wgh ... 6510 LET V4$="WARNING: Serial Number On Hand - OK"
rem wgh ... 6520 PRINT @(V1,V2),'RB',
rem wgh ... 6530 CALL "SYC.YN",1,V4$,2,V$,V3
rem wgh ... 6540 IF V$="N" THEN EXITTO 6690 ELSE GOTO 6550
rem wgh ... 6550 NEXT X0
rem wgh ... 6610 FOR X0=1 TO NUM(SERIAL$[0])
rem wgh ... 6620 DIM W[5]
rem wgh ... 6630 LET W1$(1)="",W1$(37)=SERIAL$[X0]
rem wgh ... 6640 LET W[0]=1,NEEDED=NEEDED-W[0]
rem wgh ... 6650 WRITE (WOE06_DEV,KEY=W0$(1,14))IOL=WOE06A
rem wgh ... 6660 LET W0=NUM(W0$(12,3))+1
rem wgh ... 6670 LET W0$(12,3)=STR(W0:"000")
rem wgh ... 6680 NEXT X0
rem wgh ... 6690 RETURN 
[[SFE_WOLOTSER.WO_LS_CMT.AVAL]]
rem wgh ... 2400 REM " --- Comments
rem wgh ... 2420 LET V0$="S",V1$="",V2$=W1$(5,20),V3$="",V4$="",V0=20,V1=10,V2=L+1
rem wgh ... 2440 GOSUB 7000
rem wgh ... 2460 LET W1$(5,20)=V$
rem wgh ... 2490 GOTO 3200
[[SFE_WOLOTSER.LOTSER_NO.AVAL]]
rem wgh ... 2000 REM " --- Enter Data
rem wgh ... 2010 IF W1$(1,1)="Y" THEN LET V3=4; GOTO 3200
rem wgh ... 2020 LET V0$="S",V1$="CE",V2$=W1$(37,SS9),V3$="",V4$="Enter "+SL$,V0=SS9,V1=10,V2=L
rem wgh ... 2030 IF POS(P3$(17,1)="SL")>0 AND NEEDED>1 THEN LET V4$=V4$+" (<F1> To Auto Generate Numbers)"
rem wgh ... 2040 GOSUB 7000
rem wgh ... 2050 IF V3=2 THEN GOTO 1100
rem wgh ... 2055 IF POS(P3$(17,1)="SL")>0 AND V3=1 AND NEEDED>1 THEN GOSUB 6400; LET V$="L"; GOTO 4400
rem wgh ... 2060 IF V$=J1$(1,20) THEN GOTO 2000
rem wgh ... 2070 LET W1$(37)=V$
rem wgh ... 2080 FIND (IVM07_DEV,KEY=N0$+A0$(54)+W1$(37),DOM=2190)IOL=IVM07A
rem wgh ... 2090 GOTO 3200
rem wgh ... 2100 IF P3$(17,1)="S" AND D[1]-D[2]>0 THEN GOTO 2105 ELSE GOTO 2120
rem wgh ... 2105 LET V4$="Warning!! Serial Number On Hand! :"
rem wgh ... 2110 CALL "SYC.YN",1,V4$,2,V$,V3
rem wgh ... 2115 IF V$="N" THEN GOTO 2000 ELSE GOTO 2190
rem wgh ... 2118 PRINT @(V1,V2),'RB',
rem wgh ... 2120 IF P3$(17,1)="L" AND D[1]-D[2]>0 THEN GOTO 2130 ELSE GOTO 2170
rem wgh ... 2130 PRINT 'RB'
rem wgh ... 2135 LET V4$="Warning!! "+STR(D[1]-D[2])+" Items Are Currently On Hand!! <Enter> To Continue:"
rem wgh ... 2140 LET V0$="S",V1$="C",V2$="",V3$="",V0=1,V1=FNV(V4$),V2=22
rem wgh ... 2150 GOSUB 7000
rem wgh ... 2190 IF P3$(17,1)="S" THEN LET NEEDED=NEEDED+W[0]-1,W[0]=1,I0=I0+1; PRINT @(72-M2*2-M3,L),W[0]:M2$,
rem wgh ... 2195 GOTO 3200
[[SFE_WOLOTSER.SCH_PROD_QTY.AVAL]]
rem wgh ... 2200 REM " --- Production Qty Here
rem wgh ... 2210 IF W1$(1,1)="Y" THEN GOTO 3200
rem wgh ... 2215 LET OLDQTY=W[0]
rem wgh ... 2220 LET V0$="N",V1$="C",V2$=STR(W[0]),V3$=M2$,V4$="Enter Production Qty For This "+SL$,V0=7,V1=72-M3-M2*2,V2=L
rem wgh ... 2230 IF W[0]=0 AND P3$(17,1)="L" THEN LET V2$=STR(A[0]-A[2]-A[4]),V4$=V4$+", <Enter>="+V2$+"."
rem wgh ... 2240 GOSUB 7000
rem wgh ... 2250 IF V3=2 OR V3=4 THEN GOTO 3200
rem wgh ... 2260 LET W[0]=V
rem wgh ... 2280 IF W[0]>A[0]-A[2]-A[4] THEN GOTO 2200
rem wgh ... 2285 IF OLDQTY<>W[0] THEN LET NEEDED=NEEDED-W[0]+OLDQTY
rem wgh ... 2290 GOTO 3200
[[SFE_WOLOTSER.BEND]]
rem --- loop thru and count lot/ser quantities compared to WO sched prod qty

	sfe_wolotser=fnget_dev("SFE_WOLOTSER")
	dim sfe_wolotser$:fnget_tpl$("SFE_WOLOTSER")

	sch_prod_qty=num(callpoint!.getDevObject("prod_qty"))
	wo_loc$=callpoint!.getColumnData("SFE_WOLOTSER.WO_LOCATION")
	wo_no$=callpoint!.getColumnData("SFE_WOLOTSER.WO_NO")

	tot_lotser=0
	read (sfe_wolotser,key=firm_id$+wo_loc$+wo_no$,dom=*next)

	while 1		
		readrecord (sfe_wolotser,end=*break)sfe_wolotser$
		if pos(firm_id$+wo_loc$+wo_no$=sfe_wolotser$)<>1 then break
		tot_lotser=tot_lotser+num(sfe_wolotser.sch_prod_qty$)
	wend

	if tot_lotser>sch_prod_qty
		msg_id$="SF_TOO_MANY"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif

[[SFE_WOLOTSER.AREC]]
rem --- if serialized, then make qty control read only
	
	if callpoint!.getDevObject("lotser")="S" 		
		callpoint!.setColumnEnabled("SFE_WOLOTSER.SCH_PROD_QTY",0)
	endif
[[SFE_WOLOTSER.ADIS]]
rem --- disable inputs if on a closed WO

	if callpoint!.getDevObject("wo_status")="C" 
		callpoint!.setColumnEnabled("SFE_WOLOTSER.LOTSER_NO",0)
		callpoint!.setColumnEnabled("SFE_WOLOTSER.SCH_PROD_QTY",0)
	endif
[[SFE_WOLOTSER.BSHO]]
rem --- Disable fields when closing work order, or not
rem wgh ... stopped here
	if callpoint!.getDevObject("allow_close")<>"Y"then
		callpoint!.setColumnEnabled("SFE_WOLOTSER.CLS_INP_QTY",0)
		callpoint!.setColumnEnabled("SFE_WOLOTSER.COMPLETE_FLG",0)
	endif

rem --- Disable auto-assign option if lotted
rem wgh ... stopped here
rem wgh ... also disable if need<=1
	if callpoint!.getDevObject("lotser")<>"S" then
		callpoint!.setOptionEnabled("AUTO",0)
	endif

rem --- dflt qty to 1 if serialized
rem wgh ... stopped here
rem wgh ... looks better if this is done after lot/serial is entered
	if callpoint!.getDevObject("lotser")="S"
		callpoint!.setTableColumnAttribute("SFE_WOLOTSER.SCH_PROD_QTY","DFLT","1")
	endif
