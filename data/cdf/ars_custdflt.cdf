[[ARS_CUSTDFLT.ARAR]]
rem --- Open/Lock files

	files=1,begfile=1,endfile=1
	dim files$[files],options$[files],chans$[files],templates$[files]
	files$[1]="ARS_PARAMS";rem --- "ARS_PARAMS"..."ads-01"

	for wkx=begfile to endfile
		options$[wkx]="OTA"
	next wkx

	call dir_pgm$+"adc_open_tables.aon",begfile,endfile,files$[all],options$[all],
:                                   chans$[all],templates$[all],table_chans$[all],batch,status$

	if status$<>"" goto std_exit
	ads01_dev=num(chans$[1])

rem --- Retrieve miscellaneous templates

	files=1,begfile=1,endfile=files
	dim ids$[files],templates$[files]
	ids$[1]="ars-01A"
	call dir_pgm$+"adc_template.aon",begfile,endfile,ids$[all],templates$[all],status
	if status goto std_exit

rem --- Dimension miscellaneous string templates

	dim ars01a$:templates$[1]

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
