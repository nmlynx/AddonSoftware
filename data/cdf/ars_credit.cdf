[[ARS_CREDIT.ARAR]]
rem --- Retrieve miscellaneous templates

	files=2,begfile=1,endfile=files
	dim ids$[files],templates$[files]
	ids$[1]="ars-01A"
	ids$[2]="ars-01C"
	call dir_pgm$+"adc_template.aon",begfile,endfile,ids$[all],templates$[all],status
	if status goto std_exit

rem --- Dimension miscellaneous string templates

	dim ars01a$:templates$[1],ars01c$:templates$[2]

rem --- find channel on which ads-01 is open

	ads01_dev=fnget_dev("ARS_CREDIT")

rem --- check to see if main AR param rec (firm/AR/00) exists; if not, tell user to set it up first

	ars01a_key$=firm_id$+"AR00"
	find record (ads01_dev,key=ars01a_key$,err=*next) ars01a$
	if cvs(ars01a.current_per$,2)=""
		msg_id$="AR_PARAM_ERR"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		release
	endif

rem --- check if new record - refresh display using defaults if so
	find record(ads01_dev,key=firm_id$+"AR01",err=*next)ars01c$
	if cvs(ars01c.sys_install$,2)=""
		callpoint!.setStatus("REFRESH")
	endif
