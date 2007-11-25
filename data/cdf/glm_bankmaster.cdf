[[GLM_BANKMASTER.AOPT-DETL]]
gl_account$=callpoint!.getColumnData("GLM_BANKMASTER.GL_ACCOUNT")
call stbl("+DIR_PGM")+"glr_bankmaster.aon",gl_account$
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
	call stbl("+DIR_PGM")+"glc_ctlcreate.aon",pgm(-2),"GL","","",status
	if status release
	call stbl("+DIR_PGM")+"glc_datecheck.aon",stmtdate$,"Y",stmtperiod$,stmtyear$,status
	stmtperiod=num(stmtperiod$)
	stmtperiod$=str(stmtperiod:"00")
	stmtyear=num(stmtyear$)
	if gls01a.gl_yr_closed$="Y" currentgl=num(gls01a.current_year$) else currentgl=num(gls01a.current_year$)-1; rem "GL year end closed?
	priorgl=currentgl-1
	nextgl=currentgl+1
	if stmtyear<priorgl and stmtyear>nextgl
		dim message$[1]
		message$[0]="Date is not in prior, current or next G/L year."
		message$[1]="       Press <Enter> to Continue"
		call stbl("+DIR_PGM")+ "adc.stdmessage.aon",2,message$[all],1,0,0,v$,v3
		status=1
	endif
	return
[[GLM_BANKMASTER.AOPT-RECL]]
rem --- Validate Current Statement Date
	stmtdate$=callpoint!.getColumnData("GLM_BANKMASTER.CURSTM_DATE")
	if num(stmtdate$)=0
		rd_msg_id$="INVALID_DATE"
		dim rd_msg_tokens$[1]
		rd_msg_opt$=""
		gosub disp_message
		break
	endif

rem --- Find G/L Record"
	dim glm02a$:user_tpl.glm02_tpl$
	dim glt06a$:user_tpl.glt06_tpl$
	dim gls01a$:user_tpl.gls01_tpl$
	glm02_dev=user_tpl.glm02_dev
	glt06_dev=user_tpl.glt06_dev
	gls01_dev=user_tpl.gls01_dev
	readrecord(gls01_dev,key=firm_id$+"GL00")gls01a$
	gosub check_date
	if status exit

	r0$=firm_id$+callpoint!.getColumnData("GLM_BANKMASTER.GL_ACCOUNT"),s0$=""
	if stmtyear=priorgl s0$=r0$+"2"; rem "Use prior year actual
	if stmtyear=currentgl s0$=r0$+"0"; rem "Use current year actual
	if stmtyear=nextgl s0$=r0$+"4"; rem "Use next year actual
	if s0$="" 
		dim message$[1]
		message$[0]="Invalid date."
		message$[1]="Press <Enter> to Continue"
		call stbl("+DIR_PGM")+ "adc.stdmessage.aon",2,message$[all],1,0,0,v$,v3
		exit; rem "Invalid statement year
	endif
	read record (glm02_dev,key=s0$,dom=*next) glm02a$

rem --- Calculate Balance"
	total_amt=glm02a.begin_amt,total_units=glm02a.begin_units
	for x=1 to stmtperiod
		total_amt=total_amt+nfield(glm02a$,"period_amt_"+str(x:"00"))
		total_units=total_units+nfield(glm02a$,"period_units_"+str(x:"00"))
	next x
	call stbl("+DIR_PGM")+"adc_daydates.aon",stmtdate$,nextday$,1
	d0$=r0$+stmtyear$+stmtperiod$+nextday$,amount=0
	readrecord (glt06_dev,key=d0$,dom=*next)

rem --- Accumulate transactions for period after statement date"
	while 1
		k$=key(glt06_dev,END=*break)
		if pos(r0$=k$)<>1 break
		if k$(13,4)<>stmtyear$+stmtperiod$ break
		dim glt06a$:fattr(glt06a$)
		read record (glt06_dev,key=K$)glt06a$
		amount=amount+glto6a.trans_amt
	wend

rem --- Back out transactions for period after statement date"
	total_amt=total_amt-amount

rem --- All Done"
	callpoint!.setColumnData("GLM_BANKMASTER.BOOK_BALANCE",str(total_amt))
	callpoint!.setStatus("REFRESH")
