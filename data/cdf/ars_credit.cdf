[[ARS_CREDIT.ARAR]]
rem --- Open/Lock files

	files=2,begfile=1,endfile=2
	dim files$[files],options$[files],chans$[files],templates$[files]

	files$[1]="ARS_PARAMS";rem --- "ars-01"
	files$[2]="ARS_CREDIT"

	for wkx=begfile to endfile
		options$[wkx]="OTA"
	next wkx

	call stbl("+DIR_SYP")+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:       		                            chans$[all],templates$[all],table_chans$[all],batch,status$

	if status$<>"" goto std_exit
	ars01_dev=num(chans$[1])
	ars_credit_dev=num(chans$[2])

rem --- Dimension string templates

	dim ars01a$:templates$[1],ars01c$:templates$[2]

rem --- check to see if main AR param rec (firm/AR/00) exists; if not, tell user to set it up first

	ars01a_key$=firm_id$+"AR00"
	find record (ars01_dev,key=ars01a_key$,err=*next) ars01a$
	if cvs(ars01a.current_per$,2)=""
		msg_id$="AR_PARAM_ERR"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		release
	endif

rem --- check if new record - refresh display using defaults if so

	find record(ars_credit_dev,key=firm_id$+"AR01",err=*next)ars01c$
	if cvs(ars01c.sys_install$,2)=""
		callpoint!.setStatus("REFRESH")
	endif
