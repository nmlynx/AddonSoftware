[[ARC_TERMCODE.BDEL]]
goto check_default; rem *** DISABLED ***

rem --- Inits

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARM_CUSTDET",open_opts$[1]="OTA"
	gosub open_tables
	arm_custdet_dev = num(open_chans$[1])
	arm_custdet_tmpl$ = open_tpls$[1]

	terms_code_knum = 3
	terms_code$ = callpoint!.getColumnData("ARC_TERMCODE.AR_TERMS_CODE")

rem --- Check if code is used by a customer

	escape; rem debug
	read(arm_custdet_dev,key=firm_no$+terms_code$,knum=terms_code_knum,dom=*next)
	dim k$:arm_custdet_tmpl$
	k$ = key(arm_custdet_dev,end=check_default)
	if k.firm_no$ <> firm_no$ or k.ar_terms_code$ <> terms_code$ then goto check_default

	msg_id$ = "AR_TERM_IN_USE"
	gosub disp_message
	callpoint!.setStatus("ABORT")

check_default: rem --- Check if code is a default
[[ARC_TERMCODE.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_CREDIT",open_opts$[1]="OTA"
gosub open_tables
ars_credit=num(open_chans$[1])
dim ars_credit$:open_tpls$[1]

read record (ars_credit,key=firm_id$+"AR01",dom=*next)ars_credit$
if ars_credit.sys_install$ <> "Y"
 	ctl_name$="ARC_TERMCODE.CRED_HOLD"
 	ctl_stat$="I"
 	gosub disable_fields
endif
[[ARC_TERMCODE.<CUSTOM>]]
disable_fields:
rem --- used to disable/enable controls depending on parameter settings
rem --- send in control to toggle (format "ALIAS.CONTROL_NAME"), and D or space to disable/enable
 
	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP-REFRESH")

return

cant_delete: rem --- Inform user this code can't be deleted

	msg_id$ = "CANT_DELETE"
	gosub disp_message

return
