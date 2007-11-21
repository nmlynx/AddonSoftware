[[GLM_BANKMASTER.BSHO]]
rem --- Open/Lock files
	dir_pgm$=stbl("+DIR_PGM")
	sys_pgm$=stbl("+DIR_SYP")

	num_files=3
	dim files$[num_files],options$[num_files],ids$[num_files],templates$[num_files],channels[num_files]
	files$[1]="gls_params",ids$[1]="GLS_PARAMS",options$[1]="OTA"
	files$[2]="glt-06",ids$[2]="GLT_TRANSDETAIL",options$[2]="OTA"; rem ars-10D
	files$[3]="glm-02",ids$[3]="GLM_ACCTSUMMARY",options$[3]="OTA"
	call stbl("+DIR_PGM")+"adc_fileopen.aon",action,1,num_files,files$[all],options$[all],
:                              ids$[all],templates$[all],channels[all],batch,status
	if status goto std_exit
	gls01_dev=channels[1]
	glt06_dev=channels[2]
	glm02_dev=channels[3]

rem --- Set up user_tpl$

	dim user_tpl$:"gls01_tpl:c(2048),glt06_tpl:c(1024),glm02_tpl:c(1024),"+
:	"gls01_dev:n(4),glt06_dev:n(4),glm02_dev:n(4)"

	user_tpl.gls01_tpl$=templates$[1]
	user_tpl.glt06_tpl$=templates$[2]
	user_tpl.glm02_tpl$=templates$[3]
	user_tpl.gls01_dev=gls01_dev
	user_tpl.glt06_dev=glt06_dev
	user_tpl.glm02_dev=glm02_dev
[[GLM_BANKMASTER.<CUSTOM>]]
check_date: rem " --- Check Statement Ending Date"

	status=0
	call stbl("+DIR_PGM")+"adc_periodyear.aon",gls01_dev,gls01a$,curper,curyear,fullname$,abbrname$,begdate$,enddate$,status
escape
	stmtperiod=num(stmtperiod$)
	stmtperiod$=str(stmtperiod:"00")
	stmtyear=FNYY_YEAR(STMTYEAR$)
	if P4$(6,1)="Y" currentgl=P[2] else currentgl=P[2]-1; REM "GL year end closed?
	priorgl=currentgl-1
	nextgl=currentgl+1
	if stmtyear<priorgl and stmtyear>nextgl
		dim MESSAGE$[1]
		MESSAGE$[0]="Date is not in prior, current or next G/L year."
		MESSAGE$[1]="       Press <Enter> to Continue"
		CALL "SYC.XA",2,MESSAGE$[ALL],1,22,-1,V$,V3
		status=1
	endif
	return
[[GLM_BANKMASTER.AOPT-RECL]]
rem " --- Find G/L Record"
	dim glm02a$:user_tpl.glm02_tpl$
	dim glt06a$:user_tpl.glt06_tpl$
	dim gls01a$:user_tpl.gls01_tpl$
	glm02_dev=user_tpl.glm02_dev
	glt06_dev=user_tpl.glt06_dev
	gls01_dev=user_tpl.gls01_dev

	stmtdate$=callpoint!.getColumnData("GLM_BANKMASTER.CURSTM_DATE")
	gosub check_date
	if status THEN GOTO 6790
	r0$=firm_id$+callpoint!.getColumnData("GLM_BANKMASTER.GL_ACCOUNT"),S0$=""
	if stmtyear =PRIORGL THEN LET S0$=R0$+"2"; REM "Use prior year actual
	IF STMTYEAR=CURRENTGL THEN LET S0$=R0$+"0"; REM "Use current year actual
	IF STMTYEAR=NEXTGL THEN LET S0$=R0$+"4"; REM "Use next year actual
	IF S0$="" THEN GOTO 6790; REM "Invalid statement year
	read record (glm02_dev,key=S0$,dom=*next) glm02a

rem " --- Calculate Balance"
	DIM X[1],D[4]
	FOR X=0 TO STMTPERIOD
	LET X[0]=X[0]+R[X],X[1]=X[1]+S[X]
	NEXT X
	CALL "SYC.CA",C1$(7,6),NEXTDAY$,1
	d0$=R0$+STMTYEAR$+STMTPERIOD$+NEXTDAY$,amount=0
	readrecord (glt06_dev,key=d0$,dom=*next)

rem " --- Accumulate transactions for period after statement date"
	while 1
		k$=key(glt06_dev,END=*break)
		IF POS(R0$=K$)<>1 break
		IF K$(13,4)<>STMTYEAR$+STMTPERIOD$ break
		read record (glt06_dev,key=K$)glt06a
		amount=amount+D[0]
	wend

rem " --- Back out transactions for period after statement date"
	X[0]=X[0]-AMOUNT

rem " --- All Done"
	C[2]=X[0]
	PRINT @(64,12),C[2]:M1$,
