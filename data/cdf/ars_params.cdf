[[ARS_PARAMS.ARAR]]
	pgmdir$=stbl("+DIR_PGM")

rem --- Open/Lock files

	files=2,begfile=1,endfile=files
	dim files$[files],options$[files],ids$[files],templates$[files],channels[files]
	files$[1]="ars_params",ids$[1]="ARS_PARAMS"
	files$[2]="gls_params",ids$[2]="GLS_PARAMS"
	call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],
:                                   ids$[all],templates$[all],channels[all],batch,status
	if status goto std_exit
	ars01_dev=channels[1]
	gls01_dev=channels[2]

rem --- Dimension string templates

	dim ars01a$:templates$[1],gls01a$:templates$[2]

rem --- Retrieve parameter data

	dim info$[20]

	gls01a_key$=firm_id$+"GL00"
	find record (gls01_dev,key=gls01a_key$,err=std_missing_params) gls01a$  

	call stbl("+DIR_PGM")+"adc_application.aon","GL",info$[all]
	gl$=info$[20]
	call stbl("+DIR_PGM")+"adc_application.aon","AP",info$[all]
	ap$=info$[20],br$=info$[9]
	call stbl("+DIR_PGM")+"adc_application.aon","IV",info$[all]
	iv$=info$[20]

	dim user_tpl$:"app:c(2),gl_pers:c(2),gl_installed:c(1),"+
:                  "ap_installed:c(1),iv_installed:c(1),bank_rec:c(1)"

	user_tpl.app$="AR"
	user_tpl.gl_pers$=gls01a.total_pers$
	user_tpl.gl_installed$=gl$
	user_tpl.ap_installed$=ap$
	user_tpl.iv_installed$=iv$
	user_tpl.bank_rec$=br$

	rem --- set some defaults (that I can't do via arde) if param doesn't yet exist
	ars01a_key$=firm_id$+"AR00"
	find record (ars01_dev,key=ars01a_key$,err=*next) ars01a$
	if cvs(ars01a.current_per$,2)=""
		escape;rem --- current_per$ should only be null if param rec didn't exist
		callpoint!.setColumnData("ARS_PARAMS.CURRENT_PER",gls01a.current_per$)
		callpoint!.setColumnUndoData("ARS_PARAMS.CURRENT_PER",gls01a.current_per$)
		callpoint!.setColumnData("ARS_PARAMS.CURRENT_YEAR",gls01a.current_year$)
		callpoint!.setColumnUndoData("ARS_PARAMS.CURRENT_YEAR",gls01a.current_year$)
		callpoint!.setColumnData("ARS_PARAMS.CUSTOMER_SIZE",
:			callpoint!.getColumnData("ARS_PARAMS.MAX_CUSTOMER_LEN"))
		callpoint!.setColumnUndoData("ARS_PARAMS.CUSTOMER_SIZE",
:                     	callpoint!.getColumnData("ARS_PARAMS.MAX_CUSTOMER_LEN"))
		wkdata$=callpoint!.getColumnData("ARS_PARAMS.CUSTOMER_INPUT")
		gosub format_cust_outmask
		callpoint!.setColumnData("ARS_PARAMS.CUSTOMER_OUTPUT",cust_out$)
		callpoint!.setColumnUndoData("ARS_PARAMS.CUSTOMER_OUTPUT",cust_out$)
		if ap$="Y" and gl$="Y" and br$="Y" 
			callpoint!.setColumnData("ARS_PARAMS.BR_INTERFACE","Y")
			callpoint!.setColumnUndoData("ARS_PARAMS.BR_INTERFACE","Y")
		endif

   callpoint!.setStatus("MODIFIED-REFRESH")


	endif
[[ARS_PARAMS.AUTO_NO.AVAL]]
rem --- check here and be sure seq #'s rec exists, if auto-number got checked
if callpoint!.getUserInput()="Y"
	dim open_tables$[1],open_chans$[1],open_opts$[1],open_tpls$[1]
	open_beg=1,open_end=1,open_status$=""
	open_tables$[1]="ADS_SEQUENCES"
	open_opts$[1]="OTA"
	gosub open_tables
	dim ads_sequences$:open_tpls$[1]
	ads_sequences.firm_id$=firm_id$,ads_sequences.seq_id$="CUSTOMER_ID"
	read record (num(open_chans$[1]),key=ads_sequences.firm_id$+
:                               ads_sequences_seq_id$,dom=*next)ads_sequences$;break
	if ads_sequences.firm_id$<>firm_id$ or cvs(ads_sequences.seq_id$,2)<>"CUSTOMER_ID"
		msg_id$="AR_CUST_SEQ"
		dim msg_tokens$[1]
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
endif
[[ARS_PARAMS.BR_INTERFACE.AVAL]]
if user_tpl.ap_installed$<>"Y" or user_tpl.gl_installed$<>"Y" or user_tpl.bank_rec$<>"Y"
	if callpoint!.getUserInput()<>"N"
		msg_id$="AR_BANKREC_ERR"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		callpoint!.setColumnData("ARS_PARAMS.BR_INTERFACE","N")
		callpoint!.setStatus("REFRESH")
	endif
endif
[[ARS_PARAMS.CURRENT_PER.AVAL]]
if num(callpoint!.getUserInput())<1 or num(callpoint!.getUserInput())>num(user_tpl.gl_pers$)
	msg_id$="AR_INVALID_PER"
	dim msg_tokens$[1];msg_tokens$[1]=user_tpl.gl_pers$
	msg_opt$=""
	gosub disp_message
	callpoint!.setColumnData("ARS_PARAMS.CURRENT_PER",
:                           callpoint!.getColumnUndoData("ARS_PARAMS.CURRENT_PER"))
	callpoint!.setStatus("REFRESH-ABORT")
endif
[[ARS_PARAMS.CUSTOMER_INPUT.AVAL]]
wkdata$=callpoint!.getUserInput()
gosub format_cust_outmask
if cust_sz > maxsz
	msg_id$="AR_CUSTNO_MAX"
	dim msg_tokens$[1];msg_tokens$[1]=str(maxsz)
	msg_opt$=""
	gosub disp_message
	callpoint!.setColumnData("ARS_PARAMS.CUSTOMER_INPUT",
:                           callpoint!.getColumnUndoData("ARS_PARAMS.CUSTOMER_INPUT"))
	callpoint!.setStatus("REFRESH")
else
	rem --- set customer_size and customer_output based on input mask entered
	rem --- i.e., same as 6200 logic in ARP.AB
	callpoint!.setColumnData("ARS_PARAMS.CUSTOMER_SIZE",str(cust_sz:"00"))
	callpoint!.setColumnData("ARS_PARAMS.CUSTOMER_OUTPUT",cust_out$)

endif
[[ARS_PARAMS.DIST_BY_ITEM.AVAL]]
if user_tpl.iv_installed$<>"Y"
	if callpoint!.getUserInput()<>"N"
		msg_id$="AR_DISTITEM_ERR"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		callpoint!.setColumnData("ARS_PARAMS.DIST_BY_ITEM","N")
		callpoint!.setStatus("REFRESH")
	endif
endif
[[ARS_PARAMS.<CUSTOM>]]
format_cust_outmask:
	maxsz=num(callpoint!.getColumnData("ARS_PARAMS.MAX_CUSTOMER_LEN")),cust_sz=0,cust_out$=""
	for wk=1 to len(wkdata$)
		if pos("#"=wkdata$(wk,1))<>0 then let cust_sz=cust_sz+1,cust_out$=cust_out$+"0"
		if pos("#"=wkdata$(wk,1))=0 then let cust_out$=cust_out$+wkdata$(wk,1)
	next wk
return

#include std_missing_params.src
