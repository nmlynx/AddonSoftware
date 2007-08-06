[[ARE_CNVINV.BSHO]]
rem --- Open/Lock files

	files=6,begfile=1,endfile=6
	dim files$[files],options$[files],chans$[files],templates$[files]
	files$[1]="ARS_PARAMS";rem --- "ARS_PARAMS"..."ads-01"
	files$[2]="ARM_CUSTMAST";rem --- "arm-01"
	files$[3]="ARM_CUSTDET";rem --- "arm-02"
	files$[4]="ARC_TERMCODE";rem --- "arm-10" (A)
	files$[5]="ARC_DISTCODE";rem --- "arm-10 (D)
	files$[6]="ART_INVHDR";rem --- "art-01"

	for wkx=begfile to endfile
		options$[wkx]="OTA"
	next wkx

	call dir_pgm$+"adc_open_tables.aon",begfile,endfile,files$[all],options$[all],
:                                   chans$[all],templates$[all],table_chans$[all],batch,status$

	if status$<>"" goto std_exit
	ads01_dev=num(chans$[1])

rem --- Retrieve miscellaneous templates

	files=2,begfile=1,endfile=files
	dim ids$[files],templates$[files]
	ids$[1]="ars-01A"
	ids$[2]="gls-01A"
	call dir_pgm$+"adc_template.aon",begfile,endfile,ids$[all],templates$[all],status
	if status goto std_exit

rem --- Dimension miscellaneous string templates

	dim ars01a$:templates$[1],gls01a$:templates$[2]
	dim aon_tpl$:"firm_id:c(2),op_installed:C(1),glyr:C(4),glper:C(2),no_glpers:C(2),"+
:	    "disc_pct:C(7),inv_days_due:C(7),disc_days:C(7),prox_days:C(1)"
	aon_tpl.firm_id$=firm_id$

rem --- Retrieve parameter data/see if OP is installed

	call dir_pgm$+"adc_application.aon","OP",info$[all]
	op$=info$[20]
	aon_tpl.op_installed$=op$

	ars01a_key$=firm_id$+"AR00"
	find record (ads01_dev,key=ars01a_key$,err=std_missing_params) ars01a$

	gls01a_key$=firm_id$+"GL00"
	find record (ads01_dev,key=gls01a_key$,err=std_missing_params) gls01a$ 
	aon_tpl.glyr$=gls01a.current_year$
	aon_tpl.glper$=gls01a.current_per$
	aon_tpl.no_glpers$=gls01a.total_pers$     
[[ARE_CNVINV.AR_INV_NO.AVAL]]
rem --- check art-01 and be sure invoice# they've entered isn't in use for this cust.
rem --- otherwise, display the selected invoice...
rem --- note: this means it's possible to have same inv# assigned to diff customers

art_invhdr_dev=fnget_dev("ART_INVHDR")
dim art01a$:fnget_tpl$("ART_INVHDR")
invhdr_key$=firm_id$+"  "+callpoint!.getColumnData("ARE_CNVINV.CUSTOMER_ID")+callpoint!.getUserInput()
read(art_invhdr_dev,key=invhdr_key$,dom=*next)
readrecord(art_invhdr_dev,end=*next)art01a$
if art01a.firm_id$=firm_id$ and art01a.customer_id$=callpoint!.getColumnData("ARE_CNVINV.CUSTOMER_ID") and
:                       art01a.ar_inv_no$=callpoint!.getUserInput()
		rd_msg_id$="AR_INV_USED"
		dim rd_msg_tokens$[1]
		gosub disp_message
		callpoint!.setColumnData("ARE_CNVINV.AR_INV_NO","")
		callpoint!.setStatus("REFRESH-ABORT")                           
endif
[[ARE_CNVINV.AR_TERMS_CODE.AVAL]]
arc_termcode_dev=fnget_dev("ARC_TERMCODE")
dim arm10a$:fnget_tpl$("ARC_TERMCODE")
read record(arc_termcode_dev,key=firm_id$+"A"+callpoint!.getUserInput(),dom=*next)arm10a$
aon_tpl.disc_pct$=str(arm10a.disc_percent$)
aon_tpl.inv_days_due$=str(arm10a.inv_days_due$)
aon_tpl.disc_days$=str(arm10a.disc_days$)
aon_tpl.prox_days$=arm10a.prox_or_days$

if num(callpoint!.getColumnData("ARE_CNVINV.INVOICE_AMT"))<>0
	wk_amt=num(callpoint!.getColumnData("ARE_CNVINV.INVOICE_AMT"))*num(aon_tpl.disc_pct$)/100
	callpoint!.setColumnData("ARE_CNVINV.DISCOUNT_AMT",str(wk_amt))
	callpoint!.setColumnUndoData("ARE_CNVINV.DISCOUNT_AMT",str(wk_amt))
	callpoint!.setStatus("REFRESH")
endif

if cvs(callpoint!.getColumnData("ARE_CNVINV.INVOICE_DATE"),2)<>""
	call dir_pgm$+"adc_duedate.aon",aon_tpl.prox_days$,callpoint!.getColumnData("ARE_CNVINV.INVOICE_DATE"),
:                              num(aon_tpl.inv_days_due$),wk_date_out$,status
	if status then callpoint!.setStatus("ABORT")
	callpoint!.setColumnData("ARE_CNVINV.INV_DUE_DATE",wk_date_out$)
	callpoint!.setColumnUndoData("ARE_CNVINV.INV_DUE_DATE",wk_date_out$)
	call dir_pgm$+"adc_duedate.aon",aon_tpl.prox_days$,callpoint!.getColumnData("ARE_CNVINV.INVOICE_DATE"),
:                               num(aon_tpl.disc_days$),wk_date_out$,status
	if status then callpoint!.setStatus("ABORT")
	callpoint!.setColumnData("ARE_CNVINV.DISC_DATE",wk_date_out$)
	callpoint!.setColumnUndoData("ARE_CNVINV.DISC_DATE",wk_date_out$)
	callpoint!.setStatus("REFRESH")
endif
[[ARE_CNVINV.CUSTOMER_ID.AVAL]]
rem --- if on new rec, check are-02 and set default inv# to first one for this customer, if there is one.
if cvs(callpoint!.getColumnData("ARE_CNVINV.AR_INV_NO"),2)=""
	arm_custdet_dev=fnget_dev("ARM_CUSTDET")
	dim arm02a$:fnget_tpl$("ARM_CUSTDET")
	readrecord(arm_custdet_dev,key=firm_id$+callpoint!.getUserInput()+"  ",dom=*next)arm02a$
	if arm02a.firm_id$=firm_id$ and arm02a.customer_id$=callpoint!.getUserInput()
		callpoint!.setColumnData("ARE_CNVINV.AR_DIST_CODE",arm02a.ar_dist_code$)
		callpoint!.setColumnUndoData("ARE_CNVINV.AR_DIST_CODE",arm02a.ar_dist_code$)

		callpoint!.setColumnData("ARE_CNVINV.AR_TERMS_CODE",arm02a.ar_terms_code$)
		callpoint!.setColumnUndoData("ARE_CNVINV.AR_TERMS_CODE",arm02a.ar_terms_code$)
		callpoint!.setStatus("REFRESH")
	endif
endif
[[ARE_CNVINV.INVOICE_AMT.AVAL]]
wk_amt=num(callpoint!.getUserInput())*num(aon_tpl.disc_pct$)/100
callpoint!.setColumnData("ARE_CNVINV.DISCOUNT_AMT",str(wk_amt))
callpoint!.setColumnUndoData("ARE_CNVINV.DISCOUNT_AMT",str(wk_amt))
callpoint!.setStatus("REFRESH")
[[ARE_CNVINV.INVOICE_DATE.AVAL]]
call dir_pgm$+"adc_duedate.aon",aon_tpl.prox_days$,callpoint!.getUserInput(),num(aon_tpl.inv_days_due$),
:	wk_date_out$,status
if status then callpoint!.setStatus("ABORT")
callpoint!.setColumnData("ARE_CNVINV.INV_DUE_DATE",wk_date_out$)
callpoint!.setColumnUndoData("ARE_CNVINV.INV_DUE_DATE",wk_date_out$)
call dir_pgm$+"adc_duedate.aon",aon_tpl.prox_days$,callpoint!.getUserInput(),num(aon_tpl.disc_days$),
:	wk_date_out$,status
if status then callpoint!.setStatus("ABORT")
callpoint!.setColumnData("ARE_CNVINV.DISC_DATE",wk_date_out$)
callpoint!.setColumnUndoData("ARE_CNVINV.DISC_DATE",wk_date_out$)
callpoint!.setStatus("REFRESH")
[[ARE_CNVINV.<CUSTOM>]]
#include std_missing_params.src
