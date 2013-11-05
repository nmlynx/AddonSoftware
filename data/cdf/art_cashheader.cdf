[[ART_CASHHEADER.ARER]]
	callpoint!.setColumnEnabled("ART_CASHHEADER.RECEIPT_DATE",1)
	callpoint!.setColumnEnabled("ART_CASHHEADER.CUSTOMER_ID",1)

	callpoint!.setColumnData("art_cashheader.status","O ")	
	callpoint!.setColumnData("art_cashheader.cr_source","CR")
	callpoint!.setColumnData("ART_CASHHEADER.CR_TRANS_TYPE","CH",1)

	switch_var$=callpoint!.getColumnData("ART_CASHHEADER.CR_TRANS_TYPE")
	gosub update_fields
[[ART_CASHHEADER.CR_TRANS_TYPE.AVAL]]


	rem --- update text files and enable/disable fields for entry
	switch_var$=callpoint!.getUserInput()
	gosub update_fields
[[ART_CASHHEADER.AREA]]

gosub check_if_detail_lines_exist

rem --- if any detail line exists, skip modification of field
if lines_exist
	callpoint!.setColumnEnabled("ART_CASHHEADER.RECEIPT_DATE",0)
	callpoint!.setColumnEnabled("ART_CASHHEADER.CUSTOMER_ID",0)
endif
[[ART_CASHHEADER.BSHO]]
rem --- Hold on to the control for entered_hrs so it can be updated in detail grid

	callpoint!.setDevObject("disp_bal",callpoint!.getControl("<<DISPLAY>>.DISP_BAL"))
	callpoint!.setDevObject("disp_applied",callpoint!.getControl("<<DISPLAY>>.DISP_APPLIED"))
[[ART_CASHHEADER.RECEIPT_DATE.BINP]]
gosub check_if_detail_lines_exist

rem --- if any detail line exists, skip modification of field
if lines_exist
	callpoint!.setColumnEnabled("ART_CASHHEADER.RECEIPT_DATE",0)
	callpoint!.setFocus("art_cashheader.cash_rec_cd")
endif
[[ART_CASHHEADER.AR_TRANS_ID.AVAL]]
rem --- do we need to create new record
	if cvs(callpoint!.getUserInput(),3)=""
		msg_id$="ENTRY_NEW_REC"
		gosub disp_message
		if msg_opt$="Y" 
			call stbl("+DIR_SYP")+"bas_sequences.bbj", "AR_TRANS_ID", ar_trans_id$, table_chans$[all]
			callpoint!.setUserInput(ar_trans_id$)
			callpoint!.setColumnData("ART_CASHHEADER.AR_TRANS_ID",ar_trans_id$,1)


		else
			callpoint!.setStatus("ABORT")
		endif
	endif


rem -- check to see if detail lines exist. If they exist, jumpt to cash_rec_cd as you cannot change customer number or date.

	gosub check_if_detail_lines_exist
	if lines_exist
		callpoint!.setFocus("art_cashheader.cash_rec_cd")
	endif
[[ART_CASHHEADER.CUSTOMER_ID.BINP]]

gosub check_if_detail_lines_exist

rem --- if any detail line exists, skip modification of field
if lines_exist
	callpoint!.setColumnEnabled("ART_CASHHEADER.CUSTOMER_ID",0)
	callpoint!.setFocus("art_cashheader.cash_rec_cd")
endif
[[ART_CASHHEADER.BDEL]]

	gosub delete_cashpost
[[ART_CASHHEADER.PAYMENT_AMT.AVAL]]
rem --- update balance information

	callpoint!.setColumnData("<<DISPLAY>>.DISP_BAL",str(num(callpoint!.getUserInput())-num(callpoint!.getColumnData("<<DISPLAY>>.DISP_APPLIED"))),1)
[[ART_CASHHEADER.AOPT-AOA]]
rem ---

	if num(callpoint!.getColumnData("<<DISPLAY>>.DISP_BAL"))<>0
		gosub apply_on_acct
	endif

[[ART_CASHHEADER.AOPT-GLP]]
rem --- call up GL Dist grid if GL installed

	if user_tpl.glint$="Y"
		gosub gl_distribution
	else
		msg_id$="AR_NO_GL"
		gosub disp_message							
	endif
	
[[ART_CASHHEADER.ADIS]]
	if callpoint!.getColumnData("art_cashheader.status")="C"
		msg_id$ = "AR_CR_CLOSED"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif

	gosub get_cr_bal

	switch_var$=callpoint!.getColumnData("ART_CASHHEADER.CR_TRANS_TYPE")
	gosub update_fields
[[ART_CASHHEADER.<CUSTOM>]]
rem ==================================================================
apply_on_acct:
rem ==================================================================

	file$="@ART_INVHEADER"
	invheader_dev=fnget_dev(file$)
	dim invheader$ : fnget_tpl$(file$)

	file$="@ART_INVTRANS"
	invtrans_dev=fnget_dev(file$)
	dim invtrans$ : fnget_tpl$(file$)
	

	rem --- revisit for internalizatino

	rem --- create loop to start a new on-account invoice

	base_key$=callpoint!.getColumnData("art_cashheader.firm_id")+callpoint!.getColumnData("art_cashheader.customer_id"), knum$="CUST_INVNO"
	while 1
		call stbl("+DIR_SYP")+"bas_sequences.bbj", "AR_OA_INVOICE", ar_oa_invoice$, table_chans$[all]
		if cvs(ar_oa_invoice$,3) = "" 
			rem --- catastropic error in get.  Need to abort with error and not continue
			msg_id$="UNABLE_CREATE_OA_INVCR_IMBAL"
			gosub disp_message
			ar_oa_invoice$=""
			break
		endif
		dim invheader$:fattr(invheader$)
		read record (invheader_dev,key=base_key$+ar_oa_invoice$,knum=KNUM$,dom=*break)invheader$
	wend

	rem --- if we do not have an OA invoice number then skip OA processing
	if ar_oa_invoice$<>"" 
		rem --- Create new OA invoice	
		if cvs(invheader.customer_id$,3)=""
			
			call stbl("+DIR_SYP")+"bas_sequences.bbj", "AR_TRANS_ID", ar_trans_id$, table_chans$[all]
	  		if cvs(ar_trans_id$,3)="" 
				escape; rem << On Acct CR Trans ID MUST be generated - why did it not work in previous line? >>
			endif

			invheader.firm_id$=firm_id$
			invheader.ar_trans_id$=ar_trans_id$
			invheader.ar_type$=ar_type$
	    		invheader.customer_id$=callpoint!.getColumnData("art_cashheader.customer_id")
			invheader.invoice_no$=ar_oa_invoice$
			invheader.invoice_source$="CR"

			rem --- Get On-Account Parameter defaults from default new customer
			file$="@ARS_CUSTDFLT"
			ars_custdflt_dev=fnget_dev(file$)
			dim ars_custdflt$ : fnget_tpl$(file$)	
			read record (ars_custdflt_dev,key=firm_id$+"D",dom=*next)ars_custdflt$

			invheader.dist_code$=ars_custdflt.ar_dist_code$
			invheader.terms_code$=ars_custdflt.ar_terms_code$

			invheader.invoice_date$=callpoint!.getColumnData("ART_CASHHEADER.RECEIPT_DATE")
			invheader.due_date$=callpoint!.getColumnData("ART_CASHHEADER.RECEIPT_DATE")
			invheader.disc_date$=callpoint!.getColumnData("ART_CASHHEADER.RECEIPT_DATE")
			invheader.gl_audit_no$=""
			invheader.ar_inv_type$="OA"
			invheader.invoice_amt$="0"
			invheader.disc_allowed$="0"

			rcd$=field(invheader$) 
			write record (invheader_dev)rcd$
		endif

	
		rem ---- build invoice base trans record

		key$=invheader.firm_id$+invheader.ar_trans_id$+"001"
		read record (invtrans_dev,key=key$,knum="PRI",dom=*next)invtrans$
		if cvs(invtrans.ar_invoice_id$,3)=""
			invtrans.firm_id$=invheader.firm_id$
			invtrans.ar_trans_id$=invheader.ar_trans_id$
			invtrans.sequence_no$="001"
			invtrans.trans_date$=invheader.invoice_date$
			invtrans.ar_trans_type$="IN"
			invtrans.ar_invoice_id$=invheader.ar_trans_id$
			rem --- to not set CR_TRANS_ID for IN record type
			invtrans.cr_trans_id$=""
			invtrans.trans_amount$="0"
			invtrans.disc_amount$="0"
	 
			rcd$=field(invtrans$) 
			write record (invtrans_dev)rcd$
		endif
		 

		rem ---- create cash recript record

		file$="@ART_CASHTRANS"
		cashtrans_dev=fnget_dev(file$)
		dim cashtrans$ : fnget_tpl$(file$)

		key$=firm_id$+callpoint!.getColumnData("art_cashheader.ar_trans_id")
		rcds=1
		read (cashtrans_dev,key=key$,knum="CR_TRANS_ID",dom=*next)
		while rcds

			k$=key(cashtrans_dev,end=*break)
			if pos(key$=k$)<>1 
				break
			endif
			read record (cashtrans_dev,key=k$,knum="CR_TRANS_ID")cashtrans$
			sequence_no=num(cashtrans.sequence_no$)
		wend

		entry_amt=num(callpoint!.getColumnData("<<DISPLAY>>.DISP_BAL"))
		amount_to_apply=entry_amt * (-1)

		cashtrans.firm_id$=firm_id$
		cashtrans.ar_trans_id$=callpoint!.getColumnData("art_cashheader.ar_trans_id")

		rem --- revisit
		cashtrans.sequence_no$=str(sequence_no+1:"000")

		cashtrans.trans_date$=callpoint!.getColumnData("art_cashheader.receipt_date")
		cashtrans.ar_trans_type$="PY"
		cashtrans.ar_invoice_id$=invheader.ar_trans_id$
		cashtrans.cr_trans_id$=cashtrans.ar_trans_id$
		cashtrans.trans_amount$=str(amount_to_apply)
		cashtrans.disc_amount$="0"

		rcd$=field(cashtrans$)
		write record (cashtrans_dev)rcd$


		callpoint!.setColumnData("<<DISPLAY>>.DISP_BAL",str(0),1)
		callpoint!.setColumnData("<<DISPLAY>>.DISP_APPLIED",str(num(callpoint!.getColumnData("ART_CASHHEADER.payment_amt"))),1)
		callpoint!.setStatus("REFGRID")
	endif
return

rem ==================================================================
gl_distribution: rem << Coming from /ALIAS : AOPTS : GLP callpoint >>
rem ==================================================================

	file$="@ART_CASHPOST"
	cashpost_dev=fnget_dev(file$)
	dim cashpost$ : fnget_tpl$(file$)

	gosub check_gl_distribution

	save_gl_applied=gl_applied

	user_id$=stbl("+USER_ID")
	dim dflt_data$[1,1]

	key_pfx$=callpoint!.getColumnData("ART_CASHHEADER.FIRM_ID")+callpoint!.getColumnData("ART_CASHHEADER.AR_TRANS_ID")
	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"ART_CASHPOST",
:		user_id$,
:		"MNT",
:		key_pfx$,
:		table_chans$[all],
:		"",
:		dflt_data$[all]

	gosub check_gl_distribution

	if gl_applied <> save_gl_applied
		callpoint!.setColumnData("<<DISPLAY>>.DISP_BAL",str(num(callpoint!.getColumnData("<<DISPLAY>>.DISP_BAL"))-(save_gl_applied - gl_applied)),1)
		callpoint!.setColumnData("<<DISPLAY>>.DISP_APPLIED",str(num(callpoint!.getColumnData("<<DISPLAY>>.DISP_APPLIED"))+(save_gl_applied - gl_applied)),1)
	endif		

return

rem =============================================
check_gl_distribution:
rem =============================================
rem Routine will check to see if there are any manul GL records and update the Form!.Getcontrol to show there are GL distribution records
	
	file$="@ART_CASHPOST"
	cashpost_dev=fnget_dev(file$)
	dim cashpost$ : fnget_tpl$(file$)
	
rem --- << Now add in GL_DISTRIBUTION >>

	key$=firm_id$+callpoint!.getColumnData("art_cashheader.ar_trans_id")
	more_dtl=1,gl_applied=0,gl_applied$="N"
	read(cashpost_dev,key=key$,dom=*next)
	while more_dtl		
		k$=key(cashpost_dev,end=*break)
		if pos(key$=k$)<>1  then break
		read record(cashpost_dev,end=*break)cashpost$
		if cashpost.gl_trans_type$="M" 
			gl_applied=gl_applied+num(cashpost.trans_amount$)
			gl_applied$="Y"
		endif
	wend

rem	if gl_applied$="Y"
rem		Form!.getControl(num(user_tpl.GLind_id$)).setText(Translate!.getTranslation("AON_*_INCLUDES_GL_DISTRIBUTIONS"))
rem		Form!.getControl(num(user_tpl.GLstar_id$)).setText("*")
rem	else
rem		Form!.getControl(num(user_tpl.GLind_id$)).setText("")
rem		Form!.getControl(num(user_tpl.GLstar_id$)).setText("")
rem	endif
	callpoint!.setStatus("REFRESH")
return


rem =============================
get_cr_bal: 
rem =============================
rem Get current Cash Recript Balance

	file$="@ART_CASHTRANS"
	cashtrans_dev=fnget_dev(file$)
	dim cashtrans$ : fnget_tpl$(file$)

	if cvs(callpoint!.getColumnData("art_cashheader.ar_trans_id") ,3)<>""

		key$=firm_id$+callpoint!.getColumnData("art_cashheader.ar_trans_id") 
		more=1,knum$="CR_TRANS_ID",applied_amt=0
		payment_amt=num(callpoint!.getColumnData("art_cashheader.payment_amt"))
		read  (cashtrans_dev,key=key$,knum=knum$,dom=*next)
		while more
			k$=key(cashtrans_dev,end=*break)
			if pos(key$=k$)<>1
				break
			endif
			read record (cashtrans_dev,key=k$)cashtrans$
			applied_amt=applied_amt+cashtrans.trans_amount 		
		wend

	rem --- << Now add in GL_DISTRIBUTION >>
		rem --- check_gl_distrubution returns gl_applied
		gosub check_gl_distribution


	rem --- << Now display totals >>
		callpoint!.setColumnData("<<DISPLAY>>.DISP_BAL",str(payment_amt+applied_amt+gl_applied))
		callpoint!.setColumnData("<<DISPLAY>>.DISP_APPLIED",str(-(applied_amt+gl_applied)))
	endif

	callpoint!.setStatus("REFRESH")
return


rem ==========================
cr_out_of_bal:
rem ==========================
if remaining_bal<>0 
		msg_id$="CR_IMBAL"
		gosub disp_message
	
	
		switch pos(msg_opt$="O;D")
			case 1; rem << OK - correct balance >>
				callpoint!.setStatus("MODIFIED-ABORT")
			break

			case 2; rem << Delete CR >>
				callpoint!.setStatus("DELETE")
			break
			case default
			break
		swend
	endif
return

rem ==================================================================
delete_cashpost:
rem ==================================================================

	file$="@ART_CASHPOST"
	cashpost_dev=fnget_dev(file$)	
	dim cashpost$:fnget_tpl$(file$)	
	
	cashpost_key$=callpoint!.getColumnData("art_cashheader.firm_id") + callpoint!.getColumnData("art_cashheader.ar_trans_id")
	read (cashpost_dev,key=cashpost_key$,knum="PRIMARY",dom=*next)
	more=1
	while more
		k$=key(cashpost_dev,end=*break)
		if pos(cashpost_key$=k$)<>1 then break
		remove(cashpost_dev,key=k$)
	wend

return

rem =======================================================================
check_if_detail_lines_exist:
rem =======================================================================
rem Check to see if any detail lines exist in CASHTRANS and CASHPOST
rem returns - lines_exist = TRUE if any detail lines exist for that cash receipt

	lines_exist=0

	file$="@ART_CASHTRANS"
	cashtrans_dev=fnget_dev(file$)
	dim cashtrans$ : fnget_tpl$(file$)

	cashtrans_key$=callpoint!.getColumnData("art_cashheader.firm_id")+callpoint!.getColumnData("art_cashheader.ar_trans_id") 
	read  (cashtrans_dev,key=cashtrans_key$,knum="CR_TRANS_ID",dom=*next)
	if pos(cashtrans_key$=key(cashtrans_dev,end=*next))=1 then lines_exist=1

	if lines_exist = 0
		file$="@ART_CASHPOST"
		cashpost_dev=fnget_dev(file$)	
		dim cashpost$:fnget_tpl$(file$)	
		
		cashpost_key$=callpoint!.getColumnData("art_cashheader.firm_id") + callpoint!.getColumnData("art_cashheader.ar_trans_id")
		read (cashpost_dev,key=cashpost_key$,knum="PRIMARY",dom=*next)
		if pos(cashpost_key$=key(cashpost_dev,end=*next))=1 then lines_exist=1
	endif

return

rem ====================================================
update_fields:
rem ====================================================
rem ---updatefields on the form by cr_trans_type

	switch int(pos(switch_var$="  CACHCCAC",2)/2)

	case 0; rem blank
	case 1; rem 'CA'
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA1",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA2",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.AUTH_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_CR_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.POST_TRANS_ID",0)

		callpoint!.setColumnData("ART_CASHHEADER.TRANS_DATA1","")
		callpoint!.setColumnData("ART_CASHHEADER.TRANS_DATA2","")
		
		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA1","")
		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA2","")
		break

	case 2; rem 'CH'
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA1",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA2",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.AUTH_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_CR_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.POST_TRANS_ID",0)

		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA1",Translate!.getTranslation("AON_CHECK_NUMBER","Check Number"))
		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA2",Translate!.getTranslation("AON_BANK_ROUTING_NUMBER","Routing Number"))
		break
	case 3; rem 'CC'		
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA1",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA2",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.AUTH_TRANS_ID",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_TRANS_ID",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_CR_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.POST_TRANS_ID",1)

		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA1",Translate!.getTranslation("AON_CC_NUMBER","CC Number"))
		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA2","")
		break

	case 4; rem 'AC'
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA1",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.TRANS_DATA2",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.AUTH_TRANS_ID",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_TRANS_ID",1)
		callpoint!.setColumnEnabled("ART_CASHHEADER.REV_CR_TRANS_ID",0)
		callpoint!.setColumnEnabled("ART_CASHHEADER.POST_TRANS_ID",1)

		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA1",Translate!.getTranslation("AON_BANK_ACCOUNT_NUMBER","Bank Account Number"))
		x=fnlabelchange("ART_CASHHEADER.TRANS_DATA2",Translate!.getTranslation("AON_BANK_ROUTING_NUMBER","Routing Number"))
		break

	swend

return

rem ---- additional functions

	rem --- change a text label associated with a entry field on the screen
	def fnlabelchange(temp_field$,temp_newtext$)
	            temp_ctl! =callpoint!.getControl(temp_field$)
	            temp_lbl! = sysgui!.getWindow(temp_ctl!.getContextID()).getControl(temp_ctl!.getID()-1000,err=*next)
	            temp_lbl!.setText(temp_newtext$)
		return 1
	fnend
[[ART_CASHHEADER.AWIN]]

rem --- Open/Lock files
use ::ado_util.src::util

rem --- program paths
	pgmdir$=stbl("+DIR_PGM",err=*next) 
	sypdir$=stbl("+DIR_SYP",err=*next) 
	datdir$=stbl("+ADDATA",err=*next) 

rem --- sysinfo
	sysinfo_template$=stbl("+SYSINFO_TPL",err=*next)
    	dim sysinfo$:sysinfo_template$
    	sysinfo$=stbl("+SYSINFO",err=*next)
    	milestone=num(stbl("+MILESTONE",err=*next),err=*next)
    	firm_id$=sysinfo.firm_id$


rem --- setup arrays
	opts$="OTA@",eop=0
	files=20,  open_beg=1,open_end=10, open_batch=0,open_status$=""
	dim open_tables$[files],open_opts$[files],open_chans$[files],open_tpls$[files]
	

	open_tables$[1]="ART_INVHEADER",open_opts$[1]=opts$
	open_tables$[2]="ART_INVTRANS",open_opts$[2]=opts$
	open_tables$[3]="ART_CASHPOST",open_opts$[3]=opts$
	open_tables$[4]="ARM_CUSTDET",open_opts$[4]=opts$
	open_tables$[5]="ART_CASHHEADER",open_opts$[5]=opts$
	open_tables$[6]="ART_CASHTRANS",open_opts$[6]=opts$	
	open_tables$[7]="ART_TRANSACTIONS",open_opts$[7]=opts$	
	open_tables$[8]="ARS_PARAMS",open_opts$[8]=opts$
	open_tables$[9]="GLS_PARAMS",open_opts$[9]=opts$
	open_tables$[10]="ARS_CUSTDFLT",open_opts$[10]=opts$



rem --- open tables
	gosub open_tables


rem --- Dimension misc. string templates
	user_tpl_str$="firm_id:c(2),glint:c(1),glworkfile:c(16), amt_msk:c(15), pymt_dist:c(5), GLind_id:c(5),GLstar_id:c(5),gl_applied:c(10),binp_pay_amt:n(15), existing_dtl:c(5)"
	dim user_tpl$:user_tpl_str$

 
rem --- Additional File Opens
	gl$="N"
	status=0
	source$=pgm(-2)
	call stbl("+DIR_PGM")+"glc_ctlcreate.aon",err=*next,source$,"AR",glw11$,gl$,status
	if status<>0 goto std_exit
	user_tpl.glint$=gl$
	user_tpl.glworkfile$=glw11$
	rem << UserObj!.setItem(num(user_tpl.pymt_dist$),"0")
	if gl$="Y"
		files=11,begfile=10,endfile=11
		dim files$[files],options$[files],chans$[files],templates$[files]
		files$[10]="GLM_ACCT",options$[10]="OTA";rem --- "glm-01"
		files$[11]=glw11$,options$[11]="OTAS";rem --- s means no err if tmplt not found
		rem --- will need alias name, not disk name, when opening work file
		rem --- will also need option to lock/clear file [11]; not using in this pgm for now, so bypassing.CAH
		call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:	                  chans$[all],templates$[all],table_chans$[all],batch,status$
		if status$<>"" then
			bbjAPI!=bbjAPI()
			rdFuncSpace!=bbjAPI!.getGroupNamespace()
			rdFuncSpace!.setValue("+build_task","OFF")
			release
		endif
	endif


rem --- Retrieve parameter data - not keeping any of it here, just make sure params exist

	file$="@ARS_PARAMS"
	ars01_dev=fnget_dev(file$)
	dim ars01$ : fnget_tpl$(file$)	

	ars01a_key$=firm_id$+"AR00"
	find record (ars01_dev,key=ars01a_key$,err=*next) ars01a$
	call stbl("+DIR_PGM")+"adc_getmask.aon","","AR","A",imsk$,omsk$,ilen,olen
	user_tpl.amt_msk$=imsk$

	file$="@GLS_PARAMS"
	gls01_dev=fnget_dev(files$)
	dim gls01$ : fnget_tpl$(file$)

	gls01a_key$=firm_id$+"GL00"
	find record (gls01_dev,key=gls01a_key$,err=*next) gls01a$

rem	nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
rem	Form!.addStaticText(nxt_ctlID+4,660,205,200,26,"")
rem	user_tpl.GLind_id$=str(nxt_ctlID+4)
rem	Form!.getControl(num(user_tpl.GLind_id$)).setText("")
