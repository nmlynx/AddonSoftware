[[ARE_DATECHANGE.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ART_INVHDR",open_opts$[1]="OTA"
gosub open_tables
dim aon_tpl$:"art_invhdr_tpl:c("+str(len(open_tpls$[1]))+"*),art_invhdr_chn:n(3*)"
aon_tpl.art_invhdr_chn=num(open_chans$[1])
aon_tpl.art_invhdr_tpl$=open_tpls$[1]
[[ARE_DATECHANGE.AR_INV_NO_VER.AVAL]]
if rec_data$[1,0](1,1)="A" or fnget_rec$(callpoint.callpoint_dvar$)="" or fnget_rec$(callpoint.callpoint_dvar$)<>fnget_rec_orig$(callpoint.callpoint_dvar$)
	callpoint.callpoint_msg$="AR_INV_NO"
	dim art_invhdr$:aon_tpl.art_invhdr_tpl$
	temp_firm_id$=fnget_rec$("ARE_DATECHANGE.FIRM_ID")
	temp_ar_type$=fnget_rec$("ARE_DATECHANGE.AR_TYPE")
	temp_customer_id$=fnget_rec$("ARE_DATECHANGE.CUSTOMER_ID")
	readrecord(aon_tpl.art_invhdr_chn,key=temp_firm_id$+temp_ar_type$+temp_customer_id$+callpoint.callpoint_data$+"00",dom=*break)art_invhdr$
	callpoint.callpoint_msg$=""
	rec_data$[fnstr_pos("ARE_DATECHANGE.AR_TERMS_CODE",rec_data$[0,0],40),0]=art_invhdr.ar_terms_code$
	rec_data$[fnstr_pos("ARE_DATECHANGE.DISCOUNT_AMT",rec_data$[0,0],40),0]=str(art_invhdr.disc_allowed)
	rec_data$[fnstr_pos("ARE_DATECHANGE.DISC_DATE",rec_data$[0,0],40),0]=art_invhdr.disc_date$
	rec_data$[fnstr_pos("ARE_DATECHANGE.INVOICE_AMT",rec_data$[0,0],40),0]=str(art_invhdr.invoice_amt)
	rec_data$[fnstr_pos("ARE_DATECHANGE.INVOICE_DATE",rec_data$[0,0],40),0]=art_invhdr.invoice_date$
	rec_data$[fnstr_pos("ARE_DATECHANGE.INVOICE_TYPE",rec_data$[0,0],40),0]=art_invhdr.invoice_type$
	rec_data$[fnstr_pos("ARE_DATECHANGE.INV_DUE_DATE",rec_data$[0,0],40),0]=art_invhdr.inv_due_date$
	rec_data$[fnstr_pos("ARE_DATECHANGE.AR_INV_NO_VER",rec_data$[0,0],40),1]=fnget_rec$("ARE_DATECHANGE.AR_INV_NO_VER")
	callpoint.callpoint_stat$="REFRESH"
endif
