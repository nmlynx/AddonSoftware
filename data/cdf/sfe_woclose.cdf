[[SFE_WOCLOSE.ADIS]]
rem --- Close at standard or actual?
	wotypecd_dev=fnget_dev("@SFC_WOTYPECD")
	dim wotypecd$:fnget_tpl$("@SFC_WOTYPECD")
	wo_type$=callpoint!.getColumnData("SFE_WOCLOSE.WO_TYPE")
	findrecord(wotypecd_dev,key=firm_id$+"A"+wo_type$,dom=*next)wotypecd$
	callpoint!.setDevObject("stdact_flag",wotypecd.stdact_flag$)

rem --- Work order scheduled to be closed?
	closedwo_dev=fnget_dev("1SFE_CLOSEDWO")
	dim closedwo$:fnget_tpl$("1SFE_CLOSEDWO")
	wo_location$=callpoint!.getColumnData("SFE_WOCLOSE.WO_LOCATION")
	wo_no$=callpoint!.getColumnData("SFE_WOCLOSE.WO_NO")
	findrecord(closedwo_dev,key=firm_id$+wo_location$+wo_no$,dom=*next)closedwo$
	if closedwo.wo_no$=wo_no$ then
		rem --- Reopen closed work order?
		msg_id$="SF_REOPEN_WO"
		gosub disp_message
		if msg_opt$="Y"
			rem --- Reopen work order
			remove(closedwo_dev,key=firm_id$+wo_location$+wo_no$,dom=*next)
			callpoint!.setColumnData("SFE_WOCLOSE.CLS_INP_DATE","")
			callpoint!.setColumnData("SFE_WOCLOSE.COMPLETE_FLG","")
			callpoint!.setColumnData("SFE_WOCLOSE.CLS_INP_QTY","0")
			callpoint!.setColumnData("SFE_WOCLOSE.CLOSED_COST","0")
			callpoint!.setStatus("SAVE")

			rem --- Clear close entries for serial/lot numbers for this work order
			lotser$=callpoint!.getDevObject("lotser")
			if pos(lotser$="LS")=0 then
				wolotser_dev=fnget_dev("1SFE_WOLOTSER")
				dim wolotser$:fnget_tpl$("1SFE_WOLOTSER")
				read(wolotser_dev,key=firm_id$+wo_location$+wo_no$,dom=*next)closedwo$
				while 1
					wolotser_key$=key(wolotser_dev,end=*break)
					if pos(firm_id$+wo_location$+wo_no$=wolotser_key$)<>1 then break
					extractrecord(wolotser_dev,key=wolotser_key$)wolotser$
					wolotser.cls_inp_qty=0
					wolotser.closed_cost=0
					writerecord(wolotser_dev)wolotser$
				wend
			endif

			rem --- Done with this work order
			callpoint!.setStatus("ABORT")
			break
		endif
	endif

rem --- Check work order status
	wo_status$=callpoint!.getColumnData("SFE_WOCLOSE.WO_STATUS")
	if wo_status$<>"O" then
		switch (BBjAPI().TRUE)
			case styp$="P"
				msg_id$="SF_CANNOT_CLOSE_P"
				break
			case styp$="Q"
				msg_id$="SF_CANNOT_CLOSE_Q"
				break
			case styp$="C"
				msg_id$="SF_WO_CLS_UPDT"
				break
			case default
				break
		swend
		gosub disp_message

		rem --- Done with this work order
		callpoint!.setStatus("ABORT")
		break
	endif

rem wgh ... stopped here
rem wgh 1500 REM " --- Calc Std=A0, Act=A1, Last Op Code Seq#=LOP$, Complete Qty=A9
rem wgh 1505 LET A0=0,A1=0,LOP$="",A9=A[4]
rem wgh 1510 IF A0$(14,1)<>"I" THEN GOTO 1525
rem wgh 1515 FIND (IVM02_DEV,KEY=N0$+A0$(54),DOM=1525)IOL=IVM02A
rem wgh 1520 LET A0=A[0]*A2
rem wgh 1525 IF P3$(8,1)<>"S" AND X1$(27,1)="S" THEN LET A0=0
rem wgh 1530 LET WOREQ_DEV=WOE02_DEV
rem wgh 1535 READ (WOREQ_DEV,KEY=A0$(1,11),DOM=1540)
rem wgh 1540 LET K6$=KEY(WOREQ_DEV,END=1570)
rem wgh 1545 IF K6$(1,11)<>A0$(1,11) THEN GOTO 1570
rem wgh 1550 READ (WOREQ_DEV,KEY=K6$)IOL=WOREQ
rem wgh 1555 IF A0$(14,1)<>"I" OR (P3$(8,1)<>"S" AND X1$(27,1)="S") THEN LET A0=A0+W[3]
rem wgh 1560 IF W0$(12,1)="A" THEN LET LOP$=W0$(13,3)
rem wgh 1565 GOTO 1540
rem wgh 1570 IF WOREQ_DEV=WOE02_DEV THEN LET WOREQ_DEV=WOE22_DEV; GOTO 1535
rem wgh 1575 IF WOREQ_DEV=WOE22_DEV THEN LET WOREQ_DEV=WOE32_DEV; GOTO 1535
rem wgh 1580 IF P3$(8,1)<>"S" AND X1$(27,1)="S" THEN LET A2=0
rem wgh 1585 LET WOTRAN_DEV=WOT01_DEV
rem wgh 1590 READ (WOTRAN_DEV,KEY=A0$(1,11),DOM=1595)
rem wgh 1595 LET K9$=KEY(WOTRAN_DEV,END=1625)
rem wgh 1600 IF K9$(1,11)<>A0$(1,11) THEN GOTO 1625
rem wgh 1605 READ (WOTRAN_DEV,KEY=K9$)IOL=WOTRAN
rem wgh 1610 LET A1=A1+W[2]
rem wgh 1615 IF W0$(15,1)="O" AND W1$(1,3)=LOP$ THEN IF CLOSED_NO_REOPEN=0 THEN LET A9=A9+W[5]
rem wgh 1620 GOTO 1595
rem wgh 1625 IF WOTRAN_DEV=WOT01_DEV THEN LET WOTRAN_DEV=WOT21_DEV; GOTO 1590
rem wgh 1630 IF WOTRAN_DEV=WOT21_DEV THEN LET WOTRAN_DEV=WOT31_DEV; GOTO 1590

rem wgh 1700 REM " --- Calc New Amounts
rem wgh 1710 IF A0$(14,1)="I" AND (P3$(8,1)="S" OR X1$(27,1)<>"S") THEN GOTO 1730
rem wgh 1720 IF A[0]<>0 THEN LET A2=A0/A[0] ELSE LET A2=0
rem wgh 1730 IF A[0]<>0 THEN LET A3=A1/A[0] ELSE LET A3=0
rem wgh 1740 IF A[5]=0 THEN IF Y0$(27,1)<>"A" THEN LET A[5]=A2
rem wgh 1750 LET A[4]=A9-A[2]
rem wgh 1760 IF A[4]<0 THEN LET A[4]=0
rem wgh 1770 GOSUB 5200

rem wgh 1800 REM " --- Now Close It
rem wgh 1810 IF A1$(94,1)="Y" THEN GOTO 4000
rem wgh 1820 FIND (WOE04_DEV,KEY=N0$+"  "+"B"+A0$(5,7),DOM=1830); GOTO 1900
rem wgh 1830 LET V4$="Do You Wish To Close This Work Order"
rem wgh 1840 CALL "SYC.YN",1,V4$,1,V$,V3
rem wgh 1850 IF V$="N" THEN GOTO 1000
rem wgh 1860 IF V3=4 THEN GOTO 1000

rem ... focus needs to move to the grid re Barista bug 6299
[[SFE_WOCLOSE.<CUSTOM>]]
#include std_missing_params.src
[[SFE_WOCLOSE.BTBL]]
rem wgh ... looks like WO Close is a batched process
rem wgh ... need to add batch_no and new key to both sfe_woclose and sfe_womastr, then rebuild womastr
rem wgh ... need to fix up process maint for WO Close
[[SFE_WOCLOSE.BSHO]]
rem --- Open Files
	num_files=13
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFS_PARAMS",open_opts$[1]="OTA@"
	open_tables$[2]="IVS_PARAMS",open_opts$[2]="OTA@"
	open_tables$[3]="SFE_WOOPRTN",open_opts$[3]="OTA[1]"
	open_tables$[4]="SFE_CLOSEDWO",open_opts$[4]="OTA[1]"
	open_tables$[5]="SFE_WOMATL",open_opts$[5]="OTA[1]"
	open_tables$[6]="SFE_WOSUBCNT",open_opts$[6]="OTA[1]"
	open_tables$[7]="SFC_WOTYPECD",open_opts$[7]="OTA@"
	open_tables$[8]="SFT_OPNOPRTR",open_opts$[8]="OTA@"
	open_tables$[9]="SFT_OPNMATTR",open_opts$[9]="OTA@"
	open_tables$[10]="SFT_OPNSUBTR",open_opts$[10]="OTA@"
	open_tables$[11]="IVM_ITEMMAST",open_opts$[11]="OTA@"
	open_tables$[12]="IVM_ITEMWHSE",open_opts$[12]="OTA@"
	open_tables$[13]="IVC_WHSECODE",open_opts$[13]="OTA@"

	gosub open_tables

	sfs_params_dev=num(open_chans$[1]),sfs_params_tpl$=open_tpls$[1]
	ivs_params_dev=num(open_chans$[2]),ivs_params_tpl$=open_tpls$[2]

rem --- Get SF parameters
	dim sfs_params$:sfs_params_tpl$
	read record (sfs_params_dev,key=firm_id$+"SF00",dom=std_missing_params) sfs_params$
	po$=sfs_params.po_interface$
	gl$=sfs_params.post_to_gl$

	if po$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","PO",info$[all]
		po$=info$[20]
	endif
	callpoint!.setDevObject("po",po$)

	if gl$="Y"
		gl$="N"
		status=0
		source$=pgm(-2)
		call stbl("+DIR_PGM")+"glc_ctlcreate.aon",err=*next,source$,"SF",glw11$,gl$,status
		if status<>0 goto std_exit
	endif
	callpoint!.setDevObject("gl",gl$)

rem --- Get IV parameters
	dim ivs_params$:ivs_params_tpl$
	read record (ivs_params_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs_params$
	lotser$=ivs_params.lotser_flag$
	callpoint!.setDevObject("lotser",lotser$)
	precision$=ivs_params.precision$
	callpoint!.setDevObject("precision",precision$)
	precision num(precision$)

rem --- Additional file opens
	num_files=4
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	if po$="Y" then
		open_tables$[1]="POE_REQDET",open_opts$[1]="OTA@"
		open_tables$[2]="POE_PODET",open_opts$[2]="OTA@"
	endif
	if pos(lotser$="LS") then
		open_tables$[3]="SFE_WOLOTSER",open_opts$[3]="OTA[1]"
		open_tables$[4]="IVM_LSMASTER",open_opts$[4]="OTA@"
	endif

	gosub open_tables
