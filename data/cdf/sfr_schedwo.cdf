[[SFR_SCHEDWO.<CUSTOM>]]
rem --- Calculate Estimated Start/Completion Date"

	status$="00"
	sched_flag$=callpoint!.getColumnData("SFR_SCHEDWO")
	wo_no$=callpoint!.getDevObject("wo_no")

	if sched_flag$<>"FB"
		if sched_flag$="F" THEN LET F_DATE$=A0$(19,3) ELSE LET F_DATE$=A0$(22,3)
		call "WOC.AA",wo_no$,F_DATE$,NEW_DATE$,A1$(98,1),OPCODE_DEV,status$
		if status$(1,1)="1" THEN GOSUB 2100
		if status$(2,1)<>"0"
			gosub 1800
			goto 1710
		endif
		1690 IF A1$(98,1)="F" THEN LET A0$(22,3)=NEW_DATE$ ELSE LET A0$(19,3)=NEW_DATE$
		1700 PRINT @(40,14),FNB$(A0$(19,3)),@(40,15),FNB$(A0$(22,3)),
	endif
1710 GOTO 3900
1800 REM " --- Error In Calculating Date "
1810 DIM MESSAGE$[4]
1820 ON POS(STATUS$(2,1)="135") GOTO 2160,1830,1930,1880
1830 LET MESSAGE$[0]="An Unscheduled Date For An Operation Code Was Found"
1840 LET MESSAGE$[1]="During The Calculation Process. Correct The Calendar"
1850 LET MESSAGE$[2]="Or Change The Scheduling Method To Manual."
1860 LET FIELDS=2
1870 GOTO 1990
1880 LET MESSAGE$[0]="An Unscheduled Date For A Subcontract Was Found"
1890 LET MESSAGE$[1]="During The Calculation Process. Correct The Calendar"
1900 LET MESSAGE$[2]="Or Change The Scheduling Method To Manual."
1910 LET FIELDS=2
1920 GOTO 1990
1930 LET MESSAGE$[0]="A File Was Found To Be Missing During The Calculation"
1940 LET MESSAGE$[1]="Process. Make Sure That The Calendar Has Been Created"
1950 LET MESSAGE$[2]="And There Are Operations For The Current Work Order."
1960 LET FIELDS=2
1970 GOTO 1990
1980 LET MESSAGE$[0]="An Error Has Occurred During The Calculation Process.",MES
SAGE$[1]="Date Will Not Be Calculated.",FIELDS=1
1990 CALL "SYC.XA",1,MESSAGE$[ALL],FIELDS,22,-1,V$,V3
2000 RETURN
2100 REM " --- Subcontract Date Changed"
2110 DIM MESSAGE$[2]
2120 LET MESSAGE$[0]="A Date Required For A Subcontract Line Has Changed. You"
2130 LET MESSAGE$[1]="Should Check The Associated Purchase Orders And Requisitio
ns"
2140 LET MESSAGE$[2]="And Change Those Dates As Necessary."
2150 CALL "SYC.XA",2,MESSAGE$[ALL],2,22,-1,V$,V3
2160 RETURN
[[SFR_SCHEDWO.ESTSTT_DATE.AVAL]]
rem --- Estimated Start Date

	start_date$=callpoint!.getUserInput()
	if pos(" "<>callpoint!.getDevObject("order_no"))=0
		call "SYC.CA",start_date$,ret_date$,leadtime
		if ret_date$<>"N" callpoint!.setColumnData("SFR_SCHEDWO.ESTCMP_DATE",ret_date$,1)
	endif
