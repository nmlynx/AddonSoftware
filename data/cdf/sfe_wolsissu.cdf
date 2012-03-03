[[SFE_WOLSISSU.LOTSER_NO.BINP]]
rem --- Init the Item ID
	callpoint!.setColumnData("<<DISPLAY>>.ITEM_ID",str(callpoint!.getDevObject("item_id")),1)
[[SFE_WOLSISSU.AGDR]]
rem --- Init the Item ID
	callpoint!.setColumnData("<<DISPLAY>>.ITEM_ID",str(callpoint!.getDevObject("item_id")),1)

rem wgh ... stopped
rem wgh ... how much of this needs to be done for an existing row?
rem wgh ... 2200 REM " --- Find The Lots
rem wgh ... 2210 LET T1$(1)=V$
rem wgh ... 2220 FIND (IVM07_DEV,KEY=N0$+W1$(19,22)+T1$,DOM=2000)IOL=IVM07A ... ivm_lsmaster
rem wgh ... 2225 IF O9$=T1$ THEN LET H[1]=H[1]-O9 ... for new entry O9$="",O9=0 ... for existing entry O9$=T1$,O9=T[0],H[1]=H[1]-O9
rem wgh ... 2227 IF T[0]>=0 THEN GOTO 2240
rem wgh ... 2230 IF LOT$="L" THEN GOTO 2275
rem wgh ... 2231 IF H[0]=0 THEN GOTO 2275
rem wgh ... 2234 LET V0$="S",V1$="C",V2$="",V3$="",V4$="Warning! This Serial Number Is Already On Hand, <Enter> To Retry: ",V0=1,V1=FNV(V4$),V2=22; PRINT @(0,0),'RB',
rem wgh ... 2236 GOSUB 7000
rem wgh ... 2238 GOTO 2000
rem wgh ... 2240 IF H[0]-H[1]>0 THEN GOTO 2260
rem wgh ... 2245 LET V0$="S",V1$="C",V2$="",V3$="",V4$="Quantity Not Available! <Enter> To Retry: ",V0=1,V1=FNV(V4$),V2=22; PRINT @(0,0),'RB',
rem wgh ... 2250 GOSUB 7000
rem wgh ... 2255 GOTO 2000
rem wgh ... 2260 LET T1$(1)=H0$(25,20)
rem wgh ... 2270 IF H[0]-H[1]<T[0] THEN LET T[0]=H[0]-H[1]
rem wgh ... 2275 LET T[1]=H[3]
rem wgh ... 2280 IF LOT$="L" THEN PRINT @(9,L),T1$,@(11+P2,L),T[0]:M2$,@(76-M3,L),T[1]:M3$
rem wgh ... 2290 IF LOT$="S" THEN PRINT @(19,L),T1$,@(70-M3,L),'SB',"Cost: ",'SF',@(76-M3,L),T[1]:M3$
rem wgh ... 2292 IF LOT$="S" THEN LET I0=4
rem wgh ... 2295 GOTO 3200
[[SFE_WOLSISSU.AREC]]
rem --- Init the Item ID
	callpoint!.setColumnData("<<DISPLAY>>.ITEM_ID",str(callpoint!.getDevObject("item_id")),1)

rem wgh ... stopped
rem wgh ... 1600 REM " --- Setup"
rem wgh ... 1620 DIM T1$(20),T2$(20),T[2]
rem wgh ... 1630 IF LOT$="S" THEN LET T[0]=1 ELSE LET T[0]=W[3]-O7
rem wgh ... 1635 IF LOT$="S" AND W[3]<0 THEN LET T[0]=-1
rem wgh ... 1640 LET O9$="",O9=0
[[SFE_WOLSISSU.AWRI]]
rem wgh ... stopped
rem wgh ... 3400 REM " --- Write
rem wgh ... 3410 IF O9$=T1$ AND O9=T[0] THEN GOTO 3460
rem wgh ... 3415 IF O9$="" THEN GOTO 3440
rem wgh ... 3420 LET O$=O9$,O8=O9,I=-1
rem wgh ... 3430 GOSUB 3600
rem wgh ... 3440 LET O$=T1$,O8=T[0],I=1
rem wgh ... 3450 GOSUB 3600
rem wgh ... 3455 LET O9$=T1$,O9=T[0]
rem wgh ... 3460 LET L=L+1; PRINT @(0,21),'LD','LD'
rem wgh ... 3480 WRITE (WOE14_DEV,KEY=T0$(1,17))IOL=WOE14A ... sfe_wolsissu
rem wgh ... 3485 IF V3=4 THEN GOTO 4000
rem wgh ... 3490 GOTO 1000
[[SFE_WOLSISSU.LOTSER_NO.AVAL]]
rem wgh ... stopped here ... lotser_no AVAL
rem wgh ... existing entries are display only
rem wgh ... only new entries can get here

rem wgh ... stopped here
rem wgh ... 2200 REM " --- Find The Lots
rem wgh ... 2210 LET T1$(1)=V$
rem wgh ... 2220 FIND (IVM07_DEV,KEY=N0$+W1$(19,22)+T1$,DOM=2000)IOL=IVM07A ... ivm_lsmaster

rem wgh ... handle existing entries in AGDR
rem wgh ... 2225 IF O9$=T1$ THEN LET H[1]=H[1]-O9 ... for new entry O9$="",O9=0 ... for existing entry O9$=T1$,O9=T[0],H[1]=H[1]-O9

rem wgh ... for new entries
rem wgh ... if serialized then ls_qty_issued=1 else ls_qty_issued=qty_issued-tot_ls_qty_issued
rem wgh ... 1630 IF LOT$="S" THEN LET T[0]=1 ELSE LET T[0]=W[3]-O7
rem wgh ... if serialized and qty_issued<0 then ls_qty_issued=-1
rem wgh ... 1635 IF LOT$="S" AND W[3]<0 THEN LET T[0]=-1

rem wgh ... if ls_qty_issued>=0 goto 2240
rem wgh ... 2227 IF T[0]>=0 THEN GOTO 2240
rem wgh ... 2230 IF LOT$="L" THEN GOTO 2275
rem wgh ... 2231 IF H[0]=0 THEN GOTO 2275
rem wgh ... 2234 LET V0$="S",V1$="C",V2$="",V3$="",V4$="Warning! This Serial Number Is Already On Hand, <Enter> To Retry: ",V0=1,V1=FNV(V4$),V2=22; PRINT @(0,0),'RB',
rem wgh ... 2236 GOSUB 7000
rem wgh ... 2238 GOTO 2000

rem wgh ... if qty_on_hand-qty_commited>0 then goto 2260
rem wgh ... 2240 IF H[0]-H[1]>0 THEN GOTO 2260
rem wgh ... 2245 LET V0$="S",V1$="C",V2$="",V3$="",V4$="Quantity Not Available! <Enter> To Retry: ",V0=1,V1=FNV(V4$),V2=22; PRINT @(0,0),'RB',
rem wgh ... 2250 GOSUB 7000
rem wgh ... 2255 GOTO 2000

rem wgh ... don't need to do this
rem wgh ... 2260 LET T1$(1)=H0$(25,20)

rem wgh ... if ls_qty_issued>qty_on_hand-qty_commited then ls_qty_issued=qty_on_hand-qty_commited
rem wgh ... 2270 IF H[0]-H[1]<T[0] THEN LET T[0]=H[0]-H[1]

rem wgh ... issue_cost=unit_cost
rem wgh ... 2275 LET T[1]=H[3]

rem wgh ... stopped here
rem wgh ... 2280 IF LOT$="L" THEN PRINT @(9,L),T1$,@(11+P2,L),T[0]:M2$,@(76-M3,L),T[1]:M3$
rem wgh ... 2290 IF LOT$="S" THEN PRINT @(19,L),T1$,@(70-M3,L),'SB',"Cost: ",'SF',@(76-M3,L),T[1]:M3$

rem wgh ... if serialized then qty_issued is display only
rem wgh ... 2292 IF LOT$="S" THEN LET I0=4
rem wgh ... 2295 GOTO 3200
[[SFE_WOLSISSU.AOPT-LLOK]]
rem wgh ... stopped
[[SFE_WOLSISSU.QTY_ISSUED.AVAL]]
rem wgh ... stopped
rem wgh ... 2400 REM " --- Order / Ship Quantity

rem wgh ... if serialized then qty_issued is display only
rem wgh ... 2410 IF LOT$="S" THEN GOTO 3200

rem wgh ... 2420 LET V0$="N",V1$="C",V2$=STR(T[0]),V3$=M2$,V4$="Enter Qty Issued On This Line.",V0=7,V1=11+P2,V2=L
rem wgh ... 2440 GOSUB 7000
rem wgh ... 2450 IF V3=2 OR V3=4 THEN GOTO 3200
rem wgh ... 2460 LET T[0]=V
rem wgh ... 2465 IF B2$(20,1)="Y" AND T[0]<0 THEN GOTO 2490
rem wgh ... 2470 IF B2$(20,1)="Y" AND T[0]>H[0]-H[1] THEN GOTO 2475 ELSE GOTO 2490
rem wgh ... 2475 LET V0$="S",V1$="C",V2$="",V3$="",V4$="Quantity Not Available! <Enter> To Retry: ",V0=1,V1=FNV(V4$),V2=22; PRINT @(0,0),'RB',
rem wgh ... 2480 GOSUB 7000
rem wgh ... 2485 GOTO 2400
rem wgh ... 2490 GOTO 3200
[[SFE_WOLSISSU.AGRE]]
rem wgh ... stopped
rem wgh ... refresh display???
[[SFE_WOLSISSU.AGRN]]
rem wgh ... stopped

rem wgh ... from ope_ordlsdet
rem --- keep track of starting qty for this line, so we can accurately check avail qty minus what's already been committed
rem	user_tpl.prev_ord = num(callpoint!.getColumnData("OPE_ORDLSDET.QTY_ORDERED"))
[[SFE_WOLSISSU.AUDE]]
rem wgh ... stopped
[[SFE_WOLSISSU.BEND]]
rem wgh ... stopped
rem wgh ... 4003 IF O7=W[3] THEN GOTO 4010
rem wgh ... 4004 PRINT 'RB',@(10,21),"Warning!!  Not Enough "+P8$,"'s Assigned.  Total: "+STR(O7),"  Not ",STR(W[3])
rem wgh ... 4006 LET V0$="S",V1$="C",V2$="",V3$="",V4$="<Enter> To Retry Or <F1> To Accept: ",V0=1,V1=FNV(V4$),V2=22
rem wgh ... 4007 GOSUB 7000; PRINT @(0,21),'CL',
rem wgh ... 4008 IF V3<>1 THEN LET V$="N"; GOTO 1000
rem wgh ... 4010 PRINT @(8,22),"Is The "+P8$+" Information Correct? (Y/N/Review/List/Delete): "

rem wgh ... 4100 REM " --- OK Here
rem wgh ... 4110 PRINT @(0,L1+2),'CE',; LET L=L1+2
rem wgh ... 4120 LET L=L1,O0=1,K9$=W0$(1,14),L9=18,W0=NUM(W0$(12,3)),V3=0,T0=0,T1=0
rem wgh ... 4125 REM " --- Calc Unit Cost/Qty Shipped
rem wgh ... 4130 READ (WOE14_DEV,KEY=W0$(1,14),DOM=4140) ... sfe_wolsissu
rem wgh ... 4140 LET K1$=KEY(WOE14_DEV,END=4185) ... sfe_wolsissu
rem wgh ... 4150 IF K1$(1,14)<>W0$(1,14) THEN GOTO 4185
rem wgh ... 4160 READ (WOE14_DEV)IOL=WOE14A ... sfe_wolsissu
rem wgh ... 4170 LET T0=T0+T[0],T1=T1+T[0]*T[1]
rem wgh ... 4175 GOTO 4140
rem wgh ... 4185 IF T0<>W[3] THEN LET W[3]=T0,O0=2,I0=5
rem wgh ... 4187 IF T0<>0 THEN IF W[4]<>T1/T0 THEN LET W[4]=T1/T0,O0=2,I0=5
rem wgh ... 4188 IF T0<>0 THEN LET W[2]=T1/T0,C[11]=W[2]
rem wgh ... 4190 RUN "WOE.DB"
[[SFE_WOLSISSU.BDEL]]
rem wgh ... stopped
rem wgh ... 3500 REM " --- Delete"
rem wgh ... 3510 REMOVE (WOE14_DEV,KEY=T0$(1,17),DOM=3520) ... sfe_wolsissu
rem wgh ... 3520 PRINT @(0,L),'CL',@(0,21),'LD','LD',
rem wgh ... 3540 IF O9$="" THEN GOTO 3590
rem wgh ... 3550 LET O$=O9$,O8=O9,I=-1
rem wgh ... 3570 GOSUB 3600
[[SFE_WOLSISSU.BSHO]]
rem wgh ... should qty_ordered be displayed like in ope_ordlsdet?

rem --- Set STBLs needed for lot/serial file validation
	x$=stbl("+WAREHOUSE_ID",callpoint!.getDevObject("warehouse_id"))
	x$=stbl("+ITEM_ID",callpoint!.getDevObject("item_id"))

rem --- Init lot/serial button
	switch pos(callpoint!.getDevObject("lotser")="LS")
		case 1
			callpoint!.setOptionText("LLOK",Translate!.getTranslation("AON_LOT_LOOKUP"))
			break
		case 2
			callpoint!.setOptionText("LLOK",Translate!.getTranslation("AON_SERIAL_LOOKUP"))
			break
		case default
			callpoint!.setOptionEnabled("LLOK",0)
			break
	swend
