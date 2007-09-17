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
dflt_data$[1,0]="GL_ACCOUNT_1"
dflt_data$[1,1]=cp_acct$
dflt_data$[2,0]="GL_ACCOUNT_2"
dflt_data$[2,1]=cp_acct$
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "GLR_SUMMARY",
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

files=1,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="GLS_PARAMS";rem --- ads-01

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
