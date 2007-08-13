[[ARS_REPORT.ARAR]]
rem --- Retrieve miscellaneous templates

	files=1,begfile=1,endfile=files
	dim ids$[files],templates$[files]
	ids$[1]="ars-01A"
	call dir_pgm$+"bac_template.bbj",begfile,endfile,ids$[all],templates$[all],status
	if status goto std_exit

rem --- Dimension miscellaneous string templates

	dim ars01a$:templates$[1]

rem --- find channel on which ads-01 is open

	ads01_dev=num(table_chans$[0,0](pos("ARS_REPORT"=table_chans$[0,0],20)+17,3))

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
