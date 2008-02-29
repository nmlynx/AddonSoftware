[[GLM_ACCT.BDEQ]]
escape;rem bdeq
[[GLM_ACCT.BREM]]
escape;rem brem
[[GLM_ACCT.BDEL]]
rem --- Check for activity

	okay$="Y"
	mp=13
rem --- Check glm-02 for activity
	glm02_dev=fnget_dev("GLM_ACCTSUMMARY")
	dim glm02a$:fnget_tpl$("GLM_ACCTSUMMARY")
	this_acct$=callpoint!.getColumnData("GLM_ACCT.GL_ACCOUNT")
	read(glm02_dev,key=firm_id$+this_acct$,dom=*next)
	while 1
		readrecord (glm02_dev,end=*break)glm02a$
		if pos(firm_id$+this_acct$=glm02a.firm_id$+glm02a.gl_account$)<>1 break
		if glm02a.begin_amt<>0 break
		if glm02a.begin_units<>0 break
		for x=1 to mp
			if nfield(glm02a$,"period_amt_"+str(x:"00"))<>0 okay$="N"
			if nfield(glm02a$,"period_units_"+str(x:"00"))<>0 okay$="N"
		next x
		if okay$="N" break
	wend

rem --- Check glt-06 for history
	if okay$="Y"
		glt06_dev=fnget_dev("GLT_TRANSDETAIL")
		dim glt06a$:fnget_tpl$("GLT_TRANSDETAIL")
		read (glt06_dev,key=firm_id$+this_acct$,dom=*next)
		while 1
			glt06_key$=key(glt06_dev,end=*break)
			if pos(firm_id$+this_acct$=glt06_key$)=1 okay$="N"
			break
		wend
	endif
escape
	if okay$="N"
		msg_id$="ACTIVITY_EXISTS"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[GLM_ACCT.AOPT-TRAN]]
rem Transaction History Inquiry

cp_acct$=callpoint!.getColumnData("GLM_ACCT.GL_ACCOUNT")
user_id$=stbl("+USER_ID")
dim dflt_data$[2,1]
dflt_data$[1,0]="GL_ACCOUNT_1"
dflt_data$[1,1]=cp_acct$
dflt_data$[2,0]="GL_ACCOUNT_2"
dflt_data$[2,1]=cp_acct$
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "GLR_TRANSHISTORY",
:                       user_id$,
:                   	  "",
:                       "",
:                       table_chans$[all],
:                       "",
:                       dflt_data$[all]
[[GLM_ACCT.AOPT-SUMM]]
rem Summary Activity Inquiry

cp_acct$=callpoint!.getColumnData("GLM_ACCT.GL_ACCOUNT")
user_id$=stbl("+USER_ID")
dim dflt_data$[2,1]
dflt_data$[1,0]="GL_ACCOUNT"
dflt_data$[1,1]=cp_acct$
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "GLM_SUMMACTIVITY",
:                       user_id$,
:                   	  "",
:                       "",
:                       table_chans$[all],
:                       "",
:                       dflt_data$[all]
[[GLM_ACCT.<CUSTOM>]]
#include std_missing_params.src
[[GLM_ACCT.BSHO]]
rem --- Open/Lock files

files=3,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="GLS_PARAMS";rem --- ads-01
files$[2]="GLM_ACCTSUMMARY"
files$[3]="GLT_TRANSDETAIL"

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$

if status$<>""  goto std_exit

ads01_dev=num(chans$[1])
dim gls01a$:templates$[1]


rem --- init/parameters

gls01a_key$=firm_id$+"GL00"
find record (ads01_dev,key=gls01a_key$,err=std_missing_params) gls01a$
