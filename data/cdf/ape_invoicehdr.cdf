[[APE_INVOICEHDR.AP_INV_NO.BDRL]]
rem --- Allow selecting invoice from the drilldown
	vendor_id$=callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
	ap_type$=callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")

	selected_key$ = ""
	dim filter_defs$[2,2]
	filter_defs$[0,0]="APT_INVOICEHDR.FIRM_ID"
	filter_defs$[0,1]="='"+firm_id$+"'"
	filter_defs$[0,2]="LOCK"
	filter_defs$[1,0]="APT_INVOICEHDR.VENDOR_ID"
	filter_defs$[1,1]="='"+vendor_id$+"'"
	filter_defs$[1,2]="LOCK"
	filter_defs$[2,0]="APT_INVOICEHDR.AP_TYPE"
	filter_defs$[2,1]="='"+ap_type$+"'"
	filter_defs$[2,2]="LOCK"

	dim search_defs$[3]

	call stbl("+DIR_SYP")+"bax_query.bbj",
:		gui_dev,
:		Form!,
:		"AP_INVBYVEND",
:		"",
:		table_chans$[all],
:		selected_key$,
:		filter_defs$[all],
:		search_defs$[all],
:		"",
:		""

	if selected_key$<>""
		call stbl("+DIR_SYP")+"bac_key_template.bbj",
:			"APT_INVOICEHDR",
:			"PRIMARY",
:			aptInvoiceHdr_key$,
:			table_chans$[all],
:			status$
		dim aptInvoiceHdr_key$:aptInvoiceHdr_key$
		aptInvoiceHdr_key$=selected_key$
		callpoint!.setColumnData("APE_INVOICEHDR.AP_INV_NO",aptInvoiceHdr_key.ap_inv_no$,1)
	endif	

callpoint!.setStatus("ACTIVATE-ABORT")
[[APE_INVOICEHDR.AOPT-VIDI]]
rem --- Display invoice images in the browser
	invimage_dev=fnget_dev("1APT_INVIMAGE")
	dim invimage$:fnget_tpl$("1APT_INVIMAGE")
	vendor_id$ = callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
	ap_inv_no$ = callpoint!.getColumnData("APE_INVOICEHDR.AP_INV_NO")

	read record(invimage_dev, key=firm_id$+vendor_id$+ap_inv_no$, dom=*next)
	while 1
		invimage_key$=key(invimage_dev,end=*break)
		if pos(firm_id$+vendor_id$+ap_inv_no$=invimage_key$)<>1 then break
		invimage$=fattr(invimage$)
		read record(invimage_dev)invimage$

		switch (BBjAPI().TRUE)
			case invimage.scan_docs_to$="BDA"
				rem --- Do Barista Doc Archive
				sslReq = BBUtils.isWebServerSSLEnabled()
				url$ = BBUtils.copyFileToWebServer(cvs(invimage.doc_url$,2),"appreviewtemp", sslReq)
				BBjAPI().getThinClient().browse(url$)
				urlVect!=callpoint!.getDevObject("urlVect")
				urlVect!.add(url$)
				callpoint!.setDevObject("urlVect",urlVect!)
				break
			case invimage.scan_docs_to$="GD "
				rem --- Do Google Docs
				BBjAPI().getThinClient().browse(cvs(invimage.doc_url$,2))
				break
			case default
				rem --- Unknown ... skip
				break
		swend
	wend
[[APE_INVOICEHDR.AOPT-LIIM]]
rem --- Select invoice image and upload
	files=2
	dim channels[files],templates$[files]
	channels[1]=fnget_dev("APM_VENDMAST"),templates$[1]=fnget_tpl$("APM_VENDMAST")
	channels[2]=fnget_dev("1APT_INVIMAGE"),templates$[2]=fnget_tpl$("1APT_INVIMAGE")
	ap_type$ = callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")
	vendor_id$ = callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
	ap_inv_no$ = callpoint!.getColumnData("APE_INVOICEHDR.AP_INV_NO")
	man_check$ ="N"
	scan_docs_to$=callpoint!.getDevObject("scan_docs_to")

	call "apc_imageupload.aon", channels[all],templates$[all],ap_type$,vendor_id$,ap_inv_no$,man_check$,scan_docs_to$,status
[[APE_INVOICEHDR.VENDOR_ID.BINQ]]
rem --- Set filter_defs$[] to only show vendors of given AP Type

ap_type$=callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")

dim filter_defs$[2,2]
filter_defs$[0,0]="APM_VENDMAST.FIRM_ID"
filter_defs$[0,1]="='"+firm_id$+"'"
filter_defs$[0,2]="LOCK"

filter_defs$[1,0]="APM_VENDHIST.AP_TYPE"
filter_defs$[1,1]="='"+ap_type$+"'"
filter_defs$[1,2]="LOCK"


call STBL("+DIR_SYP")+"bax_query.bbj",
:		gui_dev, 
:		form!,
:		"AP_VEND_LK",
:		"DEFAULT",
:		table_chans$[all],
:		sel_key$,
:		filter_defs$[all]

if sel_key$<>""
	call stbl("+DIR_SYP")+"bac_key_template.bbj",
:		"APM_VENDMAST",
:		"PRIMARY",
:		apm_vend_key$,
:		table_chans$[all],
:		status$
	dim apm_vend_key$:apm_vend_key$
	apm_vend_key$=sel_key$
	callpoint!.setColumnData("APE_INVOICEHDR.VENDOR_ID",apm_vend_key.vendor_id$,1)
endif	
callpoint!.setStatus("ACTIVATE-ABORT")
[[APE_INVOICEHDR.AWIN]]
rem --- setup utility

	use ::ado_util.src::util
	use ::BBUtils.bbj::BBUtils
[[APE_INVOICEHDR.ARNF]]
if num(stbl("+BATCH_NO"),err=*next)<>0
	rem --- Check if this record exists in a different batch
	tableAlias$=callpoint!.getAlias()
	primaryKey$=callpoint!.getColumnData("APE_INVOICEHDR.FIRM_ID")+
:		callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")+
:		callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")+
:		callpoint!.getColumnData("APE_INVOICEHDR.AP_INV_NO")
	call stbl("+DIR_PGM")+"adc_findbatch.aon",tableAlias$,primaryKey$,Translate!,table_chans$[all],existingBatchNo$,status
	if status or existingBatchNo$<>"" then callpoint!.setStatus("NEWREC")
endif

if user_tpl.multi_dist$<>"Y"
	callpoint!.setColumnData("APE_INVOICEHDR.AP_DIST_CODE",user_tpl.dflt_dist_cd$)
	callpoint!.setStatus("REFRESH")
endif
[[APE_INVOICEHDR.VENDOR_ID.BINP]]
rem --- set devObject with AP Type and a temp vend indicator, so if we decide to set up a temporary vendor from here,
rem --- we'll know which AP type to use, and we can automatically set the temp vendor flag in the vendor master

callpoint!.setDevObject("passed_in_temp_vend","Y")
callpoint!.setDevObject("passed_in_AP_type",callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE"))
[[APE_INVOICEHDR.BEND]]
rem --- remove software lock on batch, if batching

	batch$=stbl("+BATCH_NO",err=*next)
	if num(batch$)<>0
		lock_table$="ADM_PROCBATCHES"
		lock_record$=firm_id$+stbl("+PROCESS_ID")+batch$
		lock_type$="X"
		lock_status$=""
		lock_disp$=""
		call stbl("+DIR_SYP")+"bac_lock_record.bbj",lock_table$,lock_record$,lock_type$,lock_disp$,rd_table_chan,table_chans$[all],lock_status$
	endif

rem --- remove images copied temporarily to web servier for viewing

	urlVect!=callpoint!.getDevObject("urlVect")
	if urlVect!.size()
		for wk=0 to urlVect!.size()-1
			BBUtils.deleteFromWebServer(urlVect!.get(wk))
		next wk
	endif
[[APE_INVOICEHDR.REFERENCE.AVAL]]
callpoint!.setStatus("REFRESH");REM TEST
[[APE_INVOICEHDR.BTBL]]
rem --- Get Batch information

call stbl("+DIR_PGM")+"adc_getbatch.aon",callpoint!.getAlias(),"",table_chans$[all]
callpoint!.setTableColumnAttribute("APE_INVOICEHDR.BATCH_NO","PVAL",$22$+stbl("+BATCH_NO")+$22$)
[[APE_INVOICEHDR.AP_INV_NO.AVAL]]
rem record not in ape-01; is it in apt-01?
rem if so, make sure only pmt grp, terms, hold, 
rem acct dt, due dt, disc dt, adj amount, disc amount
rem reference, memo are enabled...
rem --- Make sure invoice is not in either ape-04 (Check file) or ape-22 (Manual Check detail file)
	ape04_dev=fnget_dev("APE_CHECKS")
	ape22_dev=fnget_dev("APE_MANCHECKDET")
	in_check_file$=""
	ap_type$=callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")
	vendor_id$=callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
	inv_no$=callpoint!.getUserInput()
	read(ape04_dev,key=firm_id$+ap_type$+vendor_id$+inv_no$,dom=check_manual)
	in_check_file$=Translate!.getTranslation("AON_CHECK")
	goto abort_entry
check_manual:
	read(ape22_dev,key=firm_id$+ap_type$+vendor_id$+inv_no$,knum="AO_VEND_INV",dom=*next)
	ape22_key$=key(ape22_dev,end=look_for_invoice)
	if pos(firm_id$+ap_type$+vendor_id$+inv_no$=ape22_key$)<>1 goto look_for_invoice
	in_check_file$=Translate!.getTranslation("AON_MANUAL_CHECK")
	goto abort_entry
abort_entry:
	dim msg_tokens$[1]
	msg_tokens$[1]=in_check_file$
	msg_id$="AP_INV_IN_USE"
	gosub disp_message
	callpoint!.setStatus("ABORT-CLEAR")
	goto end_of_aval
look_for_invoice:
	apt01_dev=fnget_dev("APT_INVOICEHDR")
	dim apt01a$:fnget_tpl$("APT_INVOICEHDR")
	k$=""
	Form!.getControl(num(user_tpl.open_inv_textID$)).setText("")
	apt01_key$=firm_id$+ap_type$+vendor_id$+inv_no$
	read(apt01_dev,key=apt01_key$,dir=0,dom=*next)
	k$=key(apt01_dev,end=*next); read record(apt01_dev)apt01a$

	if cvs(k$,2)="" found_inv=0 else found_inv=1
	if found_inv=1
		if k$=apt01_key$ and cvs(inv_no$,3)<>""
			found_inv=1
		else
			found_inv=0
		endif
	endif
	if found_inv=1
		rem --- not in ape-01, but IS in apt-01
		rem --- disable dist code, inv date, net amt
		user_tpl.inv_in_ape01$="N"
		user_tpl.inv_in_apt01$="Y"
		
		callpoint!.setColumnData("APE_INVOICEHDR.FIRM_ID",apt01a.firm_id$)
		callpoint!.setColumnData("APE_INVOICEHDR.AP_TYPE",apt01a.ap_type$)
		callpoint!.setColumnData("APE_INVOICEHDR.VENDOR_ID",apt01a.vendor_id$)
		callpoint!.setUserInput(apt01a.ap_inv_no$)
		callpoint!.setColumnData("APE_INVOICEHDR.AP_DIST_CODE",apt01a.ap_dist_code$)
		callpoint!.setColumnData("APE_INVOICEHDR.AP_TERMS_CODE",apt01a.ap_terms_code$)
		callpoint!.setColumnData("APE_INVOICEHDR.PAYMENT_GRP",apt01a.payment_grp$)
	 	callpoint!.setColumnData("APE_INVOICEHDR.INVOICE_DATE",apt01a.invoice_date$)
		callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",apt01a.accting_date$)
		callpoint!.setColumnData("APE_INVOICEHDR.INV_DUE_DATE",apt01a.inv_due_date$)
		callpoint!.setColumnData("APE_INVOICEHDR.DISC_DATE",apt01a.disc_date$)
		callpoint!.setColumnData("APE_INVOICEHDR.HOLD_FLAG",apt01a.hold_flag$)
		callpoint!.setColumnData("APE_INVOICEHDR.AP_INV_MEMO",apt01a.ap_inv_memo$)
		callpoint!.setColumnData("APE_INVOICEHDR.REFERENCE",apt01a.reference$)
		callpoint!.setColumnData("APE_INVOICEHDR.MEMO_1024",apt01a.memo_1024$)
		callpoint!.setColumnData("APE_INVOICEHDR.INVOICE_AMT","")
		callpoint!.setColumnData("APE_INVOICEHDR.NET_INV_AMT","")
		callpoint!.setColumnData("APE_INVOICEHDR.RETENTION","")
		callpoint!.setColumnData("<<DISPLAY>>.DIST_BAL","0")
		
		ctl_name$="APE_INVOICEHDR.AP_DIST_CODE"
		ctl_stat$="D"
		gosub disable_fields
		ctl_name$="APE_INVOICEHDR.INVOICE_DATE"
		ctl_stat$="D"
		gosub disable_fields
		ctl_name$="APE_INVOICEHDR.NET_INV_AMT"
		ctl_stat$="D"
		gosub disable_fields

		apt11_dev=fnget_dev("APT_INVOICEDET")
		dim apt11a$:fnget_tpl$("APT_INVOICEDET")
		read(apt11_dev,key=firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$,dom=*next)
		while 1
			readrecord (apt11_dev,end=*break) apt11a$
			if pos(firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$=apt11a$)<>1 break
			apt01a.invoice_amt = apt01a.invoice_amt+apt11a.trans_amt
		wend

		Form!.getControl(num(user_tpl.open_inv_textID$)).setText(Translate!.getTranslation("AON_ADJUST_OPEN_INVOICE:_")+$0A$+fndate$(apt01a.invoice_date$)+
:			",  "+str(num(apt01a.invoice_amt$):user_tpl.amt_msk$))
		callpoint!.setStatus("ABLEMAP-REFRESH-ACTIVATE")
	else
		rem not in ape-01 or apt-01; set up defaults
		if cvs(callpoint!.getColumnUndoData("APE_INVOICEHDR.AP_INV_NO"),3) =""
		
			apm10c_dev=fnget_dev("APC_TERMSCODE")
			dim apm10c$:fnget_tpl$("APC_TERMSCODE")
			
			terms_cd$=user_tpl.dflt_terms_cd$
			invdate$=stbl("+SYSTEM_DATE")
			tmp_inv_date$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_DATE")
			gosub calculate_due_and_discount
			callpoint!.setColumnData("APE_INVOICEHDR.AP_DIST_CODE",user_tpl.dflt_dist_cd$)
			callpoint!.setColumnData("APE_INVOICEHDR.AP_TERMS_CODE",user_tpl.dflt_terms_cd$)
			callpoint!.setColumnData("APE_INVOICEHDR.PAYMENT_GRP",user_tpl.dflt_pymt_grp$)
			callpoint!.setColumnData("APE_INVOICEHDR.INVOICE_DATE",stbl("+SYSTEM_DATE"))
			if cvs(user_tpl.dflt_acct_date$,2)<>""
				callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",user_tpl.dflt_acct_date$)
			else
				callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",stbl("+SYSTEM_DATE"))
			callpoint!.setColumnData("APE_INVOICEHDR.HOLD_FLAG","N")
			user_tpl.inv_in_ape01$="N"
			user_tpl.inv_in_apt01$="N"
			callpoint!.setColumnUndoData("APE_INVOICEHDR.AP_INV_NO",
:				callpoint!.getUserInput())
			
			callpoint!.setStatus("REFRESH")
		endif
		ctl_name$="APE_INVOICEHDR.AP_DIST_CODE"
		if user_tpl.multi_dist$="Y" 
			ctl_stat$=""
		else
			ctl_stat$="D"
		endif
		gosub disable_fields
		ctl_name$="APE_INVOICEHDR.INVOICE_DATE"
		ctl_stat$=""
		gosub disable_fields
		ctl_name$="APE_INVOICEHDR.NET_INV_AMT"
		ctl_stat$=""
		gosub disable_fields
	endif
end_of_aval:
[[APE_INVOICEHDR.ASHO]]
	rem --- get default date
	call stbl("+DIR_SYP")+"bam_run_prog.bbj","APE_INVDATE",stbl("+USER_ID"),"MNT","",table_chans$[all]
	user_tpl.dflt_acct_date$=stbl("DEF_ACCT_DATE")

	
[[APE_INVOICEHDR.INVOICE_DATE.AVAL]]
invdate$=callpoint!.getUserInput()
terms_cd$=callpoint!.getColumnData("APE_INVOICEHDR.AP_TERMS_CODE")
if cvs(terms_cd$,3)="" then terms_cd$=user_tpl.dflt_terms_cd$
if cvs(user_tpl.dflt_acct_date$,2)=""
	callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",callpoint!.getUserInput())
else
	callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",user_tpl.dflt_acct_date$)
endif
tmp_inv_date$=callpoint!.getUserInput()
gosub calculate_due_and_discount
callpoint!.setStatus("REFRESH")
[[APE_INVOICEHDR.AREC]]
Form!.getControl(num(user_tpl.open_inv_textID$)).setText("")
callpoint!.setColumnData("<<DISPLAY>>.comments","")
user_tpl.inv_amt$=""
user_tpl.tot_dist$=""
callpoint!.setColumnData("<<DISPLAY>>.DIST_BAL","0")

rem --- Re-enable disabled fields
ctl_name$="APE_INVOICEHDR.AP_DIST_CODE"
if user_tpl.multi_dist$="Y" 
	ctl_stat$=""
else
	ctl_stat$="D"
endif
gosub disable_fields
ctl_name$="APE_INVOICEHDR.INVOICE_DATE"
ctl_stat$=""
gosub disable_fields
ctl_name$="APE_INVOICEHDR.NET_INV_AMT"
ctl_stat$=""
gosub disable_fields

rem --- if not multi-type then set the defalut AP Type
if user_tpl.multi_types$="N" then
	callpoint!.setColumnData("APE_INVOICEHDR.AP_TYPE",user_tpl.dflt_ap_type$)
endif

rem --- if not multi-dist then set the default AP Distribution Code
if user_tpl.multi_dist$="N" 
	callpoint!.setColumnData("APE_INVOICEHDR.AP_DIST_CODE",user_tpl.dflt_dist_cd$)
	callpoint!.setStatus("REFRESH")
endif
[[APE_INVOICEHDR.BWRI]]
rem --- fully distributed?
gl$=user_tpl.glint$
status=0
acctgdate$=callpoint!.getColumnData("APE_INVOICEHDR.ACCTING_DATE")  
if gl$="Y" 
	call stbl("+DIR_PGM")+"glc_datecheck.aon",acctgdate$,"Y",per$,yr$,status
	if status>99
		callpoint!.setStatus("ABORT")
		ctlContext=num(callpoint!.getTableColumnAttribute("APE_INVOICEHDR.ACCTING_DATE","CTLC"))
		ctlID=num(callpoint!.getTableColumnAttribute("APE_INVOICEHDR.ACCTING_DATE","CTLI"))
		acct_dt!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
		acct_dt!.focus()
	endif
endif

if status<=99
	gosub calc_grid_tots
	gosub disp_dist_bal
	bal_amt=num(callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_AMT"))-num(user_tpl.tot_dist$)
	if bal_amt<>0
		msg_id$="AP_NOT_DIST"
		gosub disp_message
		if msg_opt$="N"
			callpoint!.setStatus("REFRESH-ACTIVATE-ABORT")
			break
		endif
	endif
endif

rem "check vend hist file to be sure this vendor/ap type ok together; also make sure all key fields are entered

dont_write$=""
if cvs(callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID"),3)="" or
:	cvs(callpoint!.getColumnData("APE_INVOICEHDR.AP_INV_NO"),3)="" then dont_write$="Y"

vendor_id$ = callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
gosub get_vendor_history
if vend_hist$="" and user_tpl.multi_types$="Y" then dont_write$="Y"

if dont_write$="Y"
	msg_id$="AP_INVOICEWRITE"
	gosub disp_message
	callpoint!.setStatus("ABORT")
	break
endif


	
[[APE_INVOICEHDR.NET_INV_AMT.AVAL]]
rem re-calc discount amount based on net x disc %
disc_amt=round(num(callpoint!.getUserInput())*(num(user_tpl.disc_pct$)/100),2)
callpoint!.setColumnData("APE_INVOICEHDR.DISCOUNT_AMT",str(disc_amt))
callpoint!.setStatus("REFRESH:APE_INVOICEHDR.DISCOUNT_AMT")
[[APE_INVOICEHDR.PAYMENT_GRP.AVAL]]
if callpoint!.getUserInput()=""
	callpoint!.setUserInput("  ")
	callpoint!.setStatus("REFRESH")
endif
[[APE_INVOICEHDR.AP_DIST_CODE.AVAL]]
if callpoint!.getUserInput()=""
	callpoint!.setUserInput("  ")
	callpoint!.setStatus("REFRESH")
endif
[[APE_INVOICEHDR.AP_TYPE.AVAL]]
user_tpl.dflt_ap_type$=callpoint!.getUserInput()
if user_tpl.dflt_ap_type$=""
	user_tpl.dflt_ap_type$="  "
	callpoint!.setUserInput(user_tpl.dflt_ap_type$)
	callpoint!.setStatus("REFRESH")
endif

apm10_dev=fnget_dev("APC_TYPECODE")
dim apm10a$:fnget_tpl$("APC_TYPECODE")
readrecord (apm10_dev,key=firm_id$+"A"+user_tpl.dflt_ap_type$,dom=*next)apm10a$
if cvs(apm10a$,2)<>""
	user_tpl.dflt_dist_cd$=apm10a.ap_dist_code$
endif
[[APE_INVOICEHDR.VENDOR_ID.AVAL]]
rem "check vend hist file to be sure this vendor/ap type ok and to set some defaults;  display vend cmts
vendor_id$ = callpoint!.getUserInput()
gosub disp_vendor_comments
gosub get_vendor_history
rem "VENDOR INACTIVE - FEATURE"
apm01_dev=fnget_dev("APM_VENDMAST")
apm01_tpl$=fnget_tpl$("APM_VENDMAST")
dim apm01a$:apm01_tpl$
apm01a_key$=firm_id$+vendor_id$
find record (apm01_dev,key=apm01a_key$,err=*break) apm01a$
if apm01a.vend_inactive$="Y" then
   call stbl("+DIR_PGM")+"adc_getmask.aon","VENDOR_ID","","","",m0$,0,vendor_size
   msg_id$="AP_VEND_INACTIVE"
   dim msg_tokens$[2]
   msg_tokens$[1]=fnmask$(apm01a.vendor_id$(1,vendor_size),m0$)
   msg_tokens$[2]=cvs(apm01a.vendor_name$,2)
   gosub disp_message
   callpoint!.setStatus("ACTIVATE-ABORT")
   goto std_exit
endif

if vend_hist$="" and user_tpl.multi_types$="Y"
	msg_id$="AP_VEND_BAD_APTYPE"
	gosub disp_message
	callpoint!.setStatus("CLEAR;NEWREC;ABORT")
endif

[[APE_INVOICEHDR.ACCTING_DATE.AVAL]]
rem make sure accting date is in an appropriate GL period
gl$=user_tpl.glint$
acctgdate$=callpoint!.getUserInput()        
if gl$="Y" 
	call stbl("+DIR_PGM")+"glc_datecheck.aon",acctgdate$,"Y",per$,yr$,status
	if status>99
		callpoint!.setStatus("ABORT")
	else
		user_tpl.glyr$=yr$
		user_tpl.glper$=per$
	endif
endif
[[APE_INVOICEHDR.ADIS]]
rem --- get disc % assoc w/ terms in this rec, and disp distributed bal
	apm10c_dev=fnget_dev("APC_TERMSCODE")
	dim apm10c$:fnget_tpl$("APC_TERMSCODE")
	ap_terms_code$ = callpoint!.getColumnData("APE_INVOICEHDR.AP_TERMS_CODE")
	readrecord(apm10c_dev,key=firm_id$+"C"+ap_terms_code$,dom=*next)apm10c$
	if cvs(apm10c.firm_id$,3) <> "" then 
		user_tpl.disc_pct$=apm10c.disc_percent$
		user_tpl.inv_amt$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_AMT")
		user_tpl.tot_dist$=""
		if user_tpl.glint$="N" then user_tpl.tot_dist$=user_tpl.inv_amt$
		gosub calc_grid_tots
		gosub disp_dist_bal
		user_tpl.inv_in_ape01$="Y"
		user_tpl.inv_in_apt01$="N"
		Form!.getControl(num(user_tpl.open_inv_textID$)).setText("")
		
		vendor_id$ = callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
		gosub disp_vendor_comments
		callpoint!.setStatus("REFRESH")
	else
		rem terms code missing
		rem callpoint!.setStatus("ABORT")
	endif
[[APE_INVOICEHDR.AP_TERMS_CODE.AVAL]]
rem --- re-calc due and discount dates based on terms code

	terms_cd$=callpoint!.getUserInput()	
	invdate$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_DATE")
	tmp_inv_date$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_DATE")
	gosub calculate_due_and_discount
	disc_amt=round(num(callpoint!.getColumnData("APE_INVOICEHDR.NET_INV_AMT"))*(num(user_tpl.disc_pct$)/100),2)
	callpoint!.setColumnData("APE_INVOICEHDR.DISCOUNT_AMT",str(disc_amt))
	callpoint!.setStatus("REFRESH")
[[APE_INVOICEHDR.INVOICE_AMT.AVAL]]
callpoint!.setColumnData("APE_INVOICEHDR.NET_INV_AMT",
:	callpoint!.getUserInput())
user_tpl.inv_amt$=callpoint!.getUserInput()
if user_tpl.glint$="N" user_tpl.tot_dist$=user_tpl.inv_amt$
gosub calc_grid_tots
gosub disp_dist_bal
callpoint!.setStatus("REFRESH")
[[APE_INVOICEHDR.<CUSTOM>]]
#include [+ADDON_LIB]std_functions.aon
rem --------------------------------------------------------------------------------------------------------------
disable_fields:
rem --------------------------------------------------------------------------------------------------------------
	rem --- used to disable/enable controls depending on parameter settings
	rem --- send in control to toggle (format "ALIAS.CONTROL_NAME"), and D or space to disable/enable
	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP-REFRESH")
return

rem --------------------------------------------------------------------------------------------------------------
get_vendor_history:
rem --------------------------------------------------------------------------------------------------------------
	apm02_dev=fnget_dev("APM_VENDHIST")				
	dim apm02a$:fnget_tpl$("APM_VENDHIST")
	vend_hist$ = ""
	ap_type$   = callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")
	readrecord(apm02_dev,key=firm_id$+vendor_id$+ap_type$,dom=*next)apm02a$
	if cvs(apm02a.firm_id$,2) <> "" then
		user_tpl.dflt_dist_cd$    = apm02a.ap_dist_code$
		user_tpl.dflt_gl_account$ = apm02a.gl_account$
		user_tpl.dflt_terms_cd$   = apm02a.ap_terms_code$
		user_tpl.dflt_pymt_grp$   = apm02a.payment_grp$
		vend_hist$="Y"
	endif
return

rem --------------------------------------------------------------------------------------------------------------
disp_vendor_comments:
	rem --- You must pass in vendor_id$ because we don't know whether it's verified or not
rem --------------------------------------------------------------------------------------------------------------
	apm01_dev=fnget_dev("APM_VENDMAST")
	dim apm01a$:fnget_tpl$("APM_VENDMAST")
	readrecord(apm01_dev,key=firm_id$+vendor_id$,dom=*next)apm01a$
	callpoint!.setColumnData("<<DISPLAY>>.comments",apm01a.memo_1024$,1)
return

rem --------------------------------------------------------------------------------------------------------------
calculate_due_and_discount:
rem --------------------------------------------------------------------------------------------------------------
	if cvs(callpoint!.getColumnData("APE_INVOICEHDR.ACCTING_DATE"),2)=""
		callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",user_tpl.dflt_acct_date$)
	endif
	if user_tpl.dflt_acct_date$=""
		callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",
:		tmp_inv_date$)
	endif
	apm10c_dev=fnget_dev("APC_TERMSCODE")
	dim apm10c$:fnget_tpl$("APC_TERMSCODE")
	
	readrecord(apm10c_dev,key=firm_id$+"C"+terms_cd$,dom=*next)apm10c$
	prox_days$=cvs(apm10c.prox_or_days$,3); if prox_days$="" prox_days$="D"
	due_dt$=""
	call stbl("+DIR_PGM")+"adc_duedate.aon",prox_days$,invdate$,num(apm10c.due_days$),due_dt$,status
	callpoint!.setColumnData("APE_INVOICEHDR.INV_DUE_DATE",due_dt$)
	due_dt$=""
	call stbl("+DIR_PGM")+"adc_duedate.aon",prox_days$,invdate$,num(apm10c.disc_days$),due_dt$,status
	callpoint!.setColumnData("APE_INVOICEHDR.DISC_DATE",due_dt$)
	user_tpl.disc_pct$=apm10c.disc_percent$
	callpoint!.setStatus("REFRESH")
return

rem --------------------------------------------------------------------------------------------------------------
calc_grid_tots:
rem --------------------------------------------------------------------------------------------------------------
	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	tdist=0
	if numrecs>0
		for reccnt=0 to numrecs-1
			gridrec$=recVect!.getItem(reccnt)
			if cvs(gridrec.gl_account$,3)<>"" and callpoint!.getGridRowDeleteStatus(reccnt)<>"Y"
				tdist=tdist+num(gridrec.gl_post_amt$)
			endif
		next reccnt
		user_tpl.tot_dist$=str(tdist)
	endif
return

rem --------------------------------------------------------------------------------------------------------------
disp_dist_bal: rem --- get context and ID of display controls, and redisplay w/ amts from calc_grid_tots
rem --------------------------------------------------------------------------------------------------------------
	dist_bal=num(user_tpl.inv_amt$)-num(user_tpl.tot_dist$)
	dist_bal!=UserObj!.getItem(num(user_tpl.dist_bal_ofst$))
	dist_bal!.setValue(dist_bal)
	callpoint!.setColumnData("<<DISPLAY>>.DIST_BAL",str(dist_bal))
return

rem #include fnget_control.src
def fnget_control!(ctl_name$)
ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
get_control!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
return get_control!
fnend
rem #endinclude fnget_control.src
#include [+ADDON_LIB]std_missing_params.aon
[[APE_INVOICEHDR.BSHO]]
rem --- Open/Lock files
files=12,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="APT_INVOICEHDR",options$[1]="OTA"
files$[2]="APT_INVOICEDET",options$[2]="OTA"
rem files$[3]="",options$[3]=""
files$[4]="APM_VENDMAST",options$[4]="OTA"
files$[5]="APM_VENDHIST",options$[5]="OTA"
files$[6]="APS_PARAMS",options$[6]="OTA"
files$[7]="GLS_PARAMS",options$[7]="OTA"
files$[8]="APE_CHECKS",options$[8]="OTA"
files$[9]="APE_MANCHECKDET",options$[9]="OTA"
files$[10]="APS_PAYAUTH",options$[10]="OTA@"
files$[11]="APT_INVIMAGE",options$[11]="OTA[1]"
files$[12]="GLS_CALENDAR",options$[12]="OTA"
call stbl("+DIR_SYP")+"bac_open_tables.bbj",
:	begfile,
:	endfile,
:	files$[all],
:	options$[all],
:	chans$[all],
:	templates$[all],
:	table_chans$[all],
:	batch,
:	status$
if status$<>"" then
	remove_process_bar:
	bbjAPI!=bbjAPI()
	rdFuncSpace!=bbjAPI!.getGroupNamespace()
	rdFuncSpace!.setValue("+build_task","OFF")
	release
endif
aps01_dev=num(chans$[6])
gls01_dev=num(chans$[7])
gls_calendar_dev=num(chans$[12])
dim aps01a$:templates$[6],gls01a$:templates$[7],gls_calendar$:templates$[12]
user_tpl_str$="glint:c(1),glyr:c(4),glper:c(2),gl_tot_pers:c(2),"
user_tpl_str$=user_tpl_str$+"amt_msk:c(15),multi_types:c(1),multi_dist:c(1),ret_flag:c(1),units_flag:c(1),"
user_tpl_str$=user_tpl_str$+"misc_entry:c(1),inv_in_ape01:c(1),inv_in_apt01:c(1),"
user_tpl_str$=user_tpl_str$+"dflt_dist_cd:c(2),dflt_gl_account:c(10),dflt_ap_type:c(2),dflt_terms_cd:c(2),dflt_pymt_grp:c(2),"
user_tpl_str$=user_tpl_str$+"disc_pct:c(5),dist_bal_ofst:c(1),inv_amt:c(10),tot_dist:c(10),open_inv_textID:c(5),"
user_tpl_str$=user_tpl_str$+"dflt_acct_date:c(8)"
dim user_tpl$:user_tpl_str$

rem --- set up UserObj! as vector to store dist bal display control
UserObj!=SysGUI!.makeVector()

rem --- add static label for displaying date/amount if pulling up open invoice
inv_no!=fnget_control!("APE_INVOICEHDR.AP_INV_NO")
cmts!=fnget_control!("<<DISPLAY>>.COMMENTS")
inv_no_x=inv_no!.getX()
inv_no_y=inv_no!.getY()
inv_no_height=inv_no!.getHeight()
inv_no_width=inv_no!.getWidth()
cmts_x=cmts!.getX()
nxt_ctlID=util.getNextControlID()
Form!.addStaticText(nxt_ctlID,inv_no_x+inv_no_width+25,inv_no_y,cmts_x-(inv_no_x+inv_no_width+25),inv_no_height*2,"")
user_tpl.open_inv_textID$=str(nxt_ctlID)

rem --- add the display control holding the distribution balance to userObj!
dist_bal!=fnget_control!("<<DISPLAY>>.DIST_BAL")
user_tpl.dist_bal_ofst$="0"
userObj!.addItem(dist_bal!)

rem --- Additional Init
gl$="N"
status=0
source$=pgm(-2)
call stbl("+DIR_PGM")+"glc_ctlcreate.aon",err=*next,source$,"AP",glw11$,gl$,status
if status<>0 then
	callpoint!.setStatus("EXIT")
	break
endif
user_tpl.glint$=gl$

rem --- Retrieve parameter data
               
aps01a_key$=firm_id$+"AP00"
find record (aps01_dev,key=aps01a_key$,err=std_missing_params) aps01a$
call stbl("+DIR_PGM")+"adc_getmask.aon","","AP","A","",amt_mask$,0,0
user_tpl.amt_msk$=amt_mask$
user_tpl.multi_types$=aps01a.multi_types$
user_tpl.multi_dist$=aps01a.multi_dist$
user_tpl.ret_flag$=aps01a.ret_flag$
user_tpl.misc_entry$=aps01a.misc_entry$
gls01a_key$=firm_id$+"GL00"
find record (gls01_dev,key=gls01a_key$,err=std_missing_params) gls01a$
find record (gls_calendar_dev,key=firm_id$+gls01a.current_year$,err=*next) gls_calendar$
if cvs(gls_calendar.firm_id$,2)="" then
	msg_id$="AD_NO_FISCAL_CAL"
	dim msg_tokens$[1]
	msg_tokens$[1]=gls01a.current_year$
	gosub disp_message
	callpoint!.setStatus("EXIT")
	break
endif
user_tpl.units_flag$=gls01a.units_flag$
user_tpl.glyr$=gls01a.current_year$
user_tpl.glper$=gls01a.current_per$
user_tpl.gl_tot_pers$=gls_calendar.total_pers$
rem --- may need to disable some ctls based on params
if user_tpl.multi_types$="N" 
	user_tpl.dflt_ap_type$=aps01a.ap_type$
	ctl_name$="APE_INVOICEHDR.AP_TYPE"
	ctl_stat$="I"
	gosub disable_fields

	rem --- get default distribution code	
	apc_typecode_dev=fnget_dev("APC_TYPECODE")
	dim apc_typecode$:fnget_tpl$("APC_TYPECODE")
	find record (apc_typecode_dev,key=firm_id$+"A"+user_tpl.dflt_ap_type$,err=*next)apc_typecode$
	if cvs(apc_typecode$,2)<>""
		user_tpl.dflt_dist_cd$=apc_typecode.ap_dist_code$
	endif
endif
if user_tpl.multi_dist$="N" 
	ctl_name$="APE_INVOICEHDR.AP_DIST_CODE"
	ctl_stat$="I"
	gosub disable_fields
endif
if user_tpl.ret_flag$="N" 
	ctl_name$="APE_INVOICEHDR.RETENTION"
	ctl_stat$="I"
	gosub disable_fields
endif
	ctl_name$="<<DISPLAY>>.DIST_BAL"
	ctl_stat$="I"
	gosub disable_fields
rem --- disable some grid columns depending on params
w!=Form!.getChildWindow(1109)
c!=w!.getControl(5900)
if gl$="N" 
	c!.setFocusable(0)
endif

rem --- Get Payment Authorization parameter record

	aps_payauth=num(chans$[10])
	dim aps_payauth$:templates$[10]
	readrecord(aps_payauth,key=firm_id$+"AP00",dom=*next)aps_payauth$
	callpoint!.setDevObject("scan_docs_to",aps_payauth.scan_docs_to$)

rem --- Disable Load Image and View Images options as needed

	if !aps_payauth.use_pay_auth or aps_payauth.scan_docs_to$="NOT" then
			callpoint!.setOptionEnabled("LIIM",0)
			callpoint!.setOptionEnabled("VIDI",0)
	endif

rem --- Init a vector to store urls for viewed images

	urlVect!=BBjAPI().makeVector()
	callpoint!.setDevObject("urlVect",urlVect!)

		
