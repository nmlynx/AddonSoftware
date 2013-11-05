[[<<DISPLAY>>.INVOICE_DATE.BINP]]
rem --- code only exists until barista issue fixed

if cvs(callpoint!.getColumnData("<<DISPLAY>>.INVOICE_NO"),3)="" 
	callpoint!.setFocus("<<DISPLAY>>.INVOICE_NO")
endif
[[ART_CASHTRANS.AGRN]]

[[<<DISPLAY>>.DISC_AMT.BINP]]
if cvs(callpoint!.getColumnData("<<DISPLAY>>.INVOICE_NO"),3)="" 
	callpoint!.setFocus("<<DISPLAY>>.INVOICE_NO")
[[<<DISPLAY>>.ENTRY_AMT.BINP]]
if cvs(callpoint!.getColumnData("<<DISPLAY>>.INVOICE_NO"),3)="" 
	callpoint!.setFocus("<<DISPLAY>>.INVOICE_NO")
[[ART_CASHTRANS.ADEL]]
rem -- remove deleted line from header totals

	change_amt = -num(callpoint!.getColumnData("ART_CASHTRANS.TRANS_AMOUNT"))
	gosub update_header_totals
[[ART_CASHTRANS.AUDE]]
rem -- re-add undeleted line to header data

	change_amt = num(callpoint!.getColumnData("ART_CASHTRANS.TRANS_AMOUNT"))
	gosub update_header_totals
[[ART_CASHTRANS.AREC]]
rem --- on a new record set specific values

	callpoint!.setColumnData("art_cashtrans.ar_trans_type","PY")	
	callpoint!.setColumnData("art_cashtrans.cr_trans_id",callpoint!.getHeaderColumnData("art_cashheader.ar_trans_id"))
	callpoint!.setColumnData("art_cashtrans.trans_date",callpoint!.getHeaderColumnData("art_cashheader.receipt_date"))
[[ART_CASHTRANS.AGRE]]

	
[[<<DISPLAY>>.ENTRY_AMT.AVAL]]
rem --- reminer the entry_amt is postive and the stored trans_amount is negative
	
	trans_amount=(-num(callpoint!.getUserInput()))
	old_trans_amount = num(callpoint!.getColumnData("art_cashtrans.trans_amount"))

	rem -- only update line detail and headers if disc amt changes
	if trans_amount - old_trans_amount <> 0
		callpoint!.setColumnData("art_cashtrans.trans_amount",str(trans_amount))
		end_inv_bal = num(callpoint!.getColumnData("<<DISPLAY>>.END_INV_BAL"))
		change_amt = trans_amount - old_trans_amount
		callpoint!.setColumnData("<<DISPLAY>>.END_INV_BAL",str(end_inv_bal+change_amt),1)
		gosub update_header_totals
	endif
[[ART_CASHTRANS.BGDR]]

	ar_invoice_id$=callpoint!.getColumnData("art_cashtrans.ar_invoice_id")

rem --- << only get invoice info if (1) we have an invoice #  in the cur. rcd AND (2) the <<DISPLAY>> has not been set yet >>
rem --- << Found that during grid display, it attempts to diplay empty row - last row+1 - so it errors out getting empty inv #.
	if cvs(ar_invoice_id$,3)>""
		if cvs(callpoint!.getColumnData("<<DISPLAY>>.INVOICE_NO"),3)=""
			file$="@ART_INVHEADER"
			invheader_dev=fnget_dev(file$)
			dim invheader$ : fnget_tpl$(file$)

			knum$="PRIMARY"
			hdrkey$=firm_id$+ar_invoice_id$
			read record (invheader_dev,key=hdrkey$,knum=knum$,dom=*next) invheader$

			callpoint!.setColumnData("<<DISPLAY>>.INVOICE_NO",invheader.invoice_no$,1)
			callpoint!.setColumnData("<<DISPLAY>>.INVOICE_AMT",invheader.invoice_amt$,1)
			callpoint!.setColumnData("<<DISPLAY>>.INVOICE_DATE",invheader.invoice_date$,1)
		
			disc_amount=num(callpoint!.getColumnData("art_cashtrans.disc_amount"))
			callpoint!.setColumnData("<<DISPLAY>>.DISC_AMT",str(-disc_amount),1)

			trans_amount=num(callpoint!.getColumnData("art_cashtrans.trans_amount"))
			callpoint!.setColumnData("<<DISPLAY>>.ENTRY_AMT",str(-trans_amount),1)

			invoice_bal = fngetinvoicebalance(firm_id$,ar_invoice_id$)

			callpoint!.setColumnData("<<DISPLAY>>.BEG_INV_BAL",str(invoice_bal-trans_amount-disc_amount),1)
			callpoint!.setColumnData("<<DISPLAY>>.END_INV_BAL",str(invoice_bal),1)
		endif
	endif
	
[[<<DISPLAY>>.DISC_AMT.AVAL]]
rem --- reminder that the disc_amt is postive but stored as a negative number in the table

	disc_amount=(-num(callpoint!.getUserInput()))
	old_disc_amount = num(callpoint!.getColumnData("art_cashtrans.disc_amount"))

	rem -- only update line detail and headers if disc amt changes
	if disc_amount-old_disc_amount  <> 0
		callpoint!.setColumnData("art_cashtrans.disc_amount",str(disc_amount))
		end_inv_bal = num(callpoint!.getColumnData("<<DISPLAY>>.END_INV_BAL"))
		change_amt = disc_amount - old_disc_amount
		callpoint!.setColumnData("<<DISPLAY>>.END_INV_BAL",str(end_inv_bal+change_amt),1)
	endif
[[<<DISPLAY>>.INVOICE_NO.AVAL]]

	invoice_no$=callpoint!.getUserInput()

	rem --- because of barista limitations, we allow a blank invoice_no and trap it at the two other entry fields on the line
	if cvs(invoice_no$,3)<>"" and cvs(invoice_no$,3)<>cvs(callpoint!.getColumnData("<<DISPLAY>>.INVOICE_NO"),3)
		file$="@ART_INVHEADER"
		invheader_dev=fnget_dev(file$)
		dim invheader$ : fnget_tpl$(file$)

		knum$="CUST_INVNO"
		customer_id$=callpoint!.getHeaderColumnData("art_cashheader.customer_id")
		invheader_key$=firm_id$+customer_id$+invoice_no$

		read record (invheader_dev,key=invheader_key$,knum=knum$,dom=*next) invheader$
		
		if cvs(invheader.ar_trans_id$,3)=""
			msg_id$="AR_INV_NO"
			gosub DISP_MESSAGE
			callpoint!.setStatus("ABORT")
		else
			rem --- check to see if Invoice Number has changed
			if invheader.ar_trans_id$ <> callpoint!.getColumnData("art_cashtrans.ar_invoice_id")
				callpoint!.setColumnData("<<DISPLAY>>.INVOICE_NO",INVHEADER.INVOICE_NO$,1)
				callpoint!.setColumnData("<<DISPLAY>>.INVOICE_AMT",INVHEADER.INVOICE_AMT$,1)
				callpoint!.setColumnData("<<DISPLAY>>.INVOICE_DATE",INVHEADER.INVOICE_DATE$,1)
				callpoint!.setColumnData("art_cashtrans.ar_invoice_id",invheader.ar_trans_id$)		
				
				beg_inv_bal = fngetinvoicebalance(firm_id$,invheader.ar_trans_id$)

				callpoint!.setColumnData("<<DISPLAY>>.BEG_INV_BAL",str(beg_inv_bal),1)
				callpoint!.setColumnData("<<DISPLAY>>.END_INV_BAL",str(beg_inv_bal),1)

				callpoint!.setColumnData("ART_CASHTRANS.TRANS_AMOUNT","0")
				callpoint!.setColumnData("ART_CASHTRANS.DISC_AMOUNT","0")
				callpoint!.setColumnData("<<DISPLAY>>.ENTRY_AMT","0",1)
				callpoint!.setColumnData("<<DISPLAY>>.DISC_AMT","0",1)

				rem --- do a cash application as if the payment and balance signs are equal otherwise autoapply
				if sgn(beg_inv_bal) = sgn(payment_amt) or payment_amt = 0
					amount_to_apply = min(beg_inv_bal,disp_bal)
				else
					amount_to_apply = beg_inv_bal
				
				if amount_to_apply <> 0
					callpoint!.setColumnData("<<DISPLAY>>.ENTRY_AMT",str(amount_to_apply),1)
					callpoint!.setColumnData("ART_CASHTRANS.TRANS_AMOUNT",str(-amount_to_apply))
					callpoint!.setColumnData("<<DISPLAY>>.END_INV_BAL",str(invoice_bal-amount_to_apply),1)
					change_amt = -amount_to_apply
					gosub update_header_totals
				endif
			endif
		endif
	endif
[[<<DISPLAY>>.INVOICE_NO.BINQ]]
	from_binq=1
	gosub custom_invoice_query
	from_binq=0
	callpoint!.setStatus("ACTIVATE-ABORT"); rem << Needed to prevent system from running stock query triggered by magnifying glass >>
	
	
[[ART_CASHTRANS.AOPT-ILU]]

	from_aopt=1
	gosub custom_invoice_query
	from_aopt=0
[[ART_CASHTRANS.INVOICE_NO.BINQ]]

	from_binq=1
	gosub custom_invoice_query
	from_binq=0

	 
	
[[ART_CASHTRANS.INVOICE_NO.AINP]]
rem ================
rem --- See ART_CASHTRANS.<CUSTOM>/custom_invoice_query:" callpoint(cp) note for info.
rem ================ 
	this_row = callpoint!.getValidationRow()
	mask$="0000000"
	invoice_no$=callpoint!.getUserInput()
	if len(invoice_no$)<len(mask$)
		invoice_no$=mask$(1,len(mask$)-len(invoice_no$))+invoice_no$
	endif
	callpoint!.setColumnData("art_cashtrans.invoice_no",invoice_no$)
 
	gosub verify_invoice_no
 
	if bad_invoice=0
				ar_trans_id$=invheader.ar_trans_id$
				callpoint!.setColumnData("art_cashtrans.ar_invoice_id",ar_trans_id$)
				trans_date$=callpoint!.getHeaderColumnData("art_cashheader.receipt_date")
				callpoint!.setColumnData("art_cashtrans.trans_date",trans_date$)				
				invoice_date$=invheader.invoice_date$
				callpoint!.setColumnData("<<DISPLAY>>.INVOICE_DATE",invoice_date$,1)
				callpoint!.setColumnData("art_cashtrans.invoice_no",invoice_no$,1)	
				invoice_amt$=str(invheader.invoice_amt)
				callpoint!.setColumnData("<<DISPLAY>>.INVOICE_AMT",invoice_amt$,1)
			endif

	if bad_invoice
		callpoint!.setFocus(this_row,"art_cashtrans.invoice_no",1)
	endif
[[ART_CASHTRANS.<CUSTOM>]]
rem ===========================
update_header_totals:
rem ===========================
rem --- update header total columns if change
rem --- Required Variable:  change_amt

rem ---  change_amt is a representation of how much more was applied to the order.  so it comes in as a postive number

	orig_disp_bal=num(callpoint!.getHeaderColumnData("<<DISPLAY>>.DISP_BAL"))
	disp_bal!=callpoint!.getDevObject("disp_bal")
	disp_bal!.setText(str(orig_disp_bal+change_amt))
	callpoint!.setHeaderColumnData("<<DISPLAY>>.DISP_BAL",str(orig_disp_bal+change_amt))

	rem --- note that we invert the change_amt because the applied amount ascends as the balance decends
	orig_disp_applied=num(callpoint!.getHeaderColumnData("<<DISPLAY>>.DISP_APPLIED"))
	disp_applied!=callpoint!.getDevObject("disp_applied")
	disp_applied!.setText(str(orig_disp_applied-change_amt))
	callpoint!.setHeaderColumnData("<<DISPLAY>>.DISP_APPLIED",str(orig_disp_applied-change_amt))
	
	callpoint!.setStatus("REFRESH") 

return

rem ===========================
custom_invoice_query:
rem ===========================
rem --- call custom inquiry to allow user to lookup invoices using primary key and filters. System generated query ASSUMES that (1) any validated field is part of the key
rem --- and (2) all segments of the key exist in the row we're in.  Custom query gets around this.   
	
	file$="@ART_CASHTRANS"
	cashtrans_dev=fnget_dev(file$)
	dim cashtrans$ : fnget_tpl$(file$)
							
	file$="@ART_INVHEADER"
	invheader_dev=fnget_dev(file$)
	dim invheader$ : fnget_tpl$(file$)

	msg_id$="OPEN_OR_CLOSED"
	gosub DISP_MESSAGE

	if msg_opt$="O" 
		BBjAPI().getNamespace("ART_INVHEADER","flags",1).setValue("openbalance","Y")
	else
		BBjAPI().getNamespace("ART_INVHEADER","flags",1).setValue("openbalance","N")
	endif
	
	queryname$="ART_INVHEADER_M"
	
	call stbl("+DIR_SYP")+"bac_key_template.bbj","ART_INVHEADER","PRIMARY",key_tpl$,rd_table_chans$[all],status$
	dim invheader_key$:key_tpl$
	numfilters=2
	dim search_defs$[numfilters]
	dim filter_defs$[numfilters-1,3]
	filter_defs$[0,0]="ART_INVHEADER.FIRM_ID"
	filter_defs$[0,1]="='"+firm_id$ +"'"
	filter_defs$[0,2]="LOCK"

	filter_defs$[1,0]="ART_INVHEADER.CUSTOMER_ID"
	filter_defs$[1,1]="='"+callpoint!.getHeaderColumnData("ART_CASHHEADER.CUSTOMER_ID")+"'"
	filter_defs$[1,2]="LOCK"


	call stbl("+DIR_SYP")+"bax_query.bbj",gui_dev,form!,queryname$,"MULTISEL",table_chans$[all],key_str$,filter_defs$[all],search_defs$[all],"","PRIMARY"
	
	BBjAPI().getNamespace("ART_INVHEADER","flags",1).setValue("openbalance","N")

	fld_sep$="^", strlen=pos(fld_sep$=key_str$),keylen=strlen-1,key_str$=key_str$+" ",orig_key_str$=key_str$
	if cvs(key_str$,3)<>"" 
		
		rem << Setup starting sequence_no$ >>
		seq_no=0
		key$=firm_id$+callpoint!.getHeaderColumnData("art_cashheader.ar_trans_id"),more=1,knum$="PRI"
		read  (cashtrans_dev,key=key$,knum=knum$,dom=*next)
		while more
			k$=key(cashtrans_dev,end=*break);if pos(key$=k$)=0 break
			read (cashtrans_dev,key=k$)
			seq_no=num(k$(11,3))
		wend
	

		payment_amt=num(callpoint!.getHeaderColumnData("ART_CASHHEADER.PAYMENT_AMT"))
		disp_bal=num(callpoint!.getHeaderColumnData("<<DISPLAY>>.DISP_BAL"))
		save_disp_bal = disp_bal

		rem --- << Build & write each rcds pulled in from lookup + auto apply cash >>
		while cvs(key_str$,3)>""
			pos1=pos("^"=key_str$)
			invheader_key$=key_str$(1,pos1-1)
			seq_no=seq_no+1
			file$="@ART_INVHEADER"
			invheader_dev=fnget_dev(file$)
			dim invheader$ : fnget_tpl$(file$)

			knum$="PRIMARY"
			read record (invheader_dev,key=invheader_key$,knum=knum$,dom=*continue) invheader$
			ar_invoice_id$=invheader.ar_trans_id$

			beg_inv_bal = fngetinvoicebalance(firm_id$,ar_invoice_id$)

			rem --- do a cash application as if the payment and balance signs are equal otherwise autoapply
			if sgn(beg_inv_bal) = sgn(payment_amt) or payment_amt = 0
				amount_to_apply = min(beg_inv_bal,disp_bal)
			else
				amount_to_apply = beg_inv_bal
			endif

			cashtrans.firm_id$=firm_id$
			cashtrans.ar_trans_id$=callpoint!.getHeaderColumnData("art_cashheader.ar_trans_id")
			cashtrans.sequence_no$=str(seq_no:"000")
			cashtrans.trans_date$=callpoint!.getHeaderColumnData("art_cashheader.receipt_date")
			cashtrans.ar_trans_type$="PY"
			cashtrans.ar_invoice_id$=ar_invoice_id$
			cashtrans.cr_trans_id$=cashtrans.ar_trans_id$
			cashtrans.trans_amount$=str(-amount_to_apply)
			cashtrans.disc_amount$="0"
			
			write record (cashtrans_dev) field(cashtrans$)

			key_str$=key_str$(strlen+1)
			disp_bal = disp_bal - amount_to_apply
		wend

		change_amt = disp_bal - save_disp_bal
		gosub update_header_totals
		callpoint!.setStatus("REFGRID")	
	endif
	callpoint!.setStatus("ABORT"); rem << Needed to prevent system from running stock query triggered by magnifying glass >>
return


rem ===============================================
verify_invoice_no: rem << Using ART_CASHTRANS.INVOICE_NO field entered manually
rem ===============================================

	file$="@ART_INVHEADER"
	invheader_dev=fnget_dev(file$)
	dim invheader$ : fnget_tpl$(file$)

	knum$="CUST_INVNO"
	customer_id$=callpoint!.getHeaderColumnData("art_cashheader.customer_id")
	invheader_key$=firm_id$+customer_id$+invoice_no$
	       
	bad_invoice=0
	read record (invheader_dev,key=invheader_key$,knum=knum$,dom=*next) invheader$
		
	if cvs(invheader.ar_trans_id$,3)=""
		msg_id$="AR_INV_NO"
		gosub DISP_MESSAGE
		bad_invoice=1
	else
		callpoint!.setColumnData("<<DISPLAY>>.INVOICE_NO",INVHEADER.INVOICE_NO$,1)
		callpoint!.setColumnData("<<DISPLAY>>.INVOICE_AMT",INVHEADER.INVOICE_AMT$,1)
		callpoint!.setColumnData("<<DISPLAY>>.INVOICE_DATE",INVHEADER.INVOICE_DATE$,1)
	endif	
return

rem ===================
get_invoice_bal: 
rem ===================
rem --- Returns a balance that does not include the current line 
rem --- no input variables
rem --- output:  total_trans, trans_amount, and disc_amount

	file$="@ART_CASHTRANS"
	cashtrans_dev=fnget_dev(file$)
	dim cashtrans$ : fnget_tpl$(file$)
 
	total_trans=0,more=1

	trans_amount = num(callpoint!.getColumnData("ART_CASHTRANS.TRANS_AMOUNT"))
	disc_amount = num(callpoint!.getColumnData("ART_CASHTRANS.DISC_AMOUNT"))

	cashtrans_key$=firm_id$+callpoint!.getColumnData("art_cashtrans.ar_invoice_id")
	knum$="AR_INVOICE_ID" 

	read (cashtrans_dev,key=cashtrans_key$,knum=knum$,dom=*next)
	while more
		k$=key(cashtrans_dev,end=*break)
		if pos(cashtrans_key$=k$)<>1 
			break
		endif
                	read record (cashtrans_dev,key=k$) cashtrans$
		total_trans=total_trans+num(cashtrans.trans_amount$)+num(cashtrans.disc_amount$)
	wend
	
	callpoint!.setColumnData("<<DISPLAY>>.BEG_INV_BAL",str(total_trans-trans_amount-disc_amount),1)
	callpoint!.setColumnData("<<DISPLAY>>.END_INV_BAL",str(total_trans),1)

return


rem =======================
auto_apply_cash:
rem =======================

	disp_bal=num(callpoint!.getHeaderColumnData("<<DISPLAY>>.DISP_BAL"))
	beg_inv_bal=num(callpoint!.getColumnData("<<DISPLAY>>.BEG_INV_BAL"))


	rem --- only auto apply if signs of totals are equal
	if sgn(beg_inv_bal) = sgn(disp_bal)
		amount_to_apply = min(beg_inv_bal,disp_bal)
	else
		amount_to_apply = 0
	endif

return


rem ==================================================================
delete_cash_receipt:
rem ==================================================================
	file$="@ART_CASHTRANS"
	cashtrans_dev=fnget_dev(file$)
	dim cashtrans$ : fnget_tpl$(file$)
							
	file$="@ART_CASHHEADER"
	cashheader_dev=fnget_dev(file$)
	dim cashheader$ : fnget_tpl$(file$)

	more=1
	key$=firm_id$+callpoint!.getColumnData("art_cashheader.ar_trans_id")
	read (cashtrans_dev,key=key$,dom=*next)
	while more
		k$=key(cashtrans_dev,end=*break)
		if pos(key$=k$)=0
			break
		endif
		read record (cashtrans_dev,key=k$)cashtrans$
		if pos(key$=k$)=1
			remove (cashtrans_dev,key=k$)
		endif
	wend

	remove (cashheader_dev,key=key$)
	
return

rem ====== functions

rem pull blance from ART_TRANSACTIONS
def fngetinvoicebalance(t_firm_id$,t_ar_invoice_id$)

	file$="@ART_CASHTRANS"
	t_cashtrans_dev=fnget_dev(file$)
	dim t_cashtrans$ : fnget_tpl$(file$)
 
	t_total_trans=0

	t_pk$=t_firm_id$+t_ar_invoice_id$

	read (t_cashtrans_dev,key=t_pk$,knum="AR_INVOICE_ID",dom=*next)
	while 1
		t_k$=key(t_cashtrans_dev,end=*break)
		if pos(t_pk$=t_k$)<>1 
			break
		endif
                	read record (t_cashtrans_dev,key=t_k$) t_cashtrans$
		t_total_trans=t_total_trans+t_cashtrans.trans_amount+t_cashtrans.disc_amount
	wend
	return t_total_trans
fnend
