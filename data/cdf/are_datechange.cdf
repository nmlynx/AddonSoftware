[[ARE_DATECHANGE.AWIN]]
rem --- Open/Lock files

files=1,begfile=1,endfile=1
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="ARE_DATECHANGE";rem --- "are-06"

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                   chans$[all],templates$[all],table_chans$[all],batch,status$
if status$<>"" goto std_exit

are_datechange_dev=num(chans$[1])
[[ARE_DATECHANGE.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ART_INVHDR",open_opts$[1]="OTA"
gosub open_tables
dim user_tpl$:"art_invhdr_tpl:c("+str(len(open_tpls$[1]))+"*),art_invhdr_chn:n(3*)"
user_tpl.art_invhdr_chn=num(open_chans$[1])
user_tpl.art_invhdr_tpl$=open_tpls$[1]
[[ARE_DATECHANGE.AR_INV_NO_VER.AVAL]]
rem if rec_data$[1,0](1,1)="A" or fnget_rec$(callpoint.callpoint_dvar$)="" or fnget_rec$(callpoint.callpoint_dvar$)<>fnget_rec_orig$(callpoint.callpoint_dvar$)
	msg_id$="AR_INV_NO"
	dim msg_tokens$[1]
	msg_opt$=""
	are_datechange_dev=fnget_dev("ARE_DATECHANGE")
	read record(are_datechange_dev,key=firm_id$+"  "+callpoint!.getColumnData("ARE_DATECHANGE.CUSTOMER_ID")+
:		callpoint!.getColumnData("ARE_DATECHANGE.AR_INV_NO_VER"),dom=*next);goto invalid_inv

	dim art_invhdr$:user_tpl.art_invhdr_tpl$
	temp_firm_id$=callpoint!.getColumnData("ARE_DATECHANGE.FIRM_ID")
	temp_ar_type$=callpoint!.getColumnData("ARE_DATECHANGE.AR_TYPE")
	temp_customer_id$=callpoint!.getColumnData("ARE_DATECHANGE.CUSTOMER_ID")
	readrecord(user_tpl.art_invhdr_chn,key=temp_firm_id$+temp_ar_type$+temp_customer_id$+callpoint!.getColumnData("ARE_DATECHANGE.AR_INV_NO_VER")+"00",dom=invalid_inv)art_invhdr$
	msg_id$=""
	callpoint!.setColumnData("ARE_DATECHANGE.AR_TERMS_CODE",art_invhdr.ar_terms_code$)
	callpoint!.setColumnData("ARE_DATECHANGE.DISCOUNT_AMT",str(art_invhdr.disc_allowed))
	callpoint!.setColumnData("ARE_DATECHANGE.DISC_DATE",art_invhdr.disc_date$)
	callpoint!.setColumnData("ARE_DATECHANGE.INVOICE_AMT",str(art_invhdr.invoice_amt))
	callpoint!.setColumnData("ARE_DATECHANGE.INVOICE_DATE",art_invhdr.invoice_date$)
	callpoint!.setColumnData("ARE_DATECHANGE.INVOICE_TYPE",art_invhdr.invoice_type$)
	callpoint!.setColumnData("ARE_DATECHANGE.INV_DUE_DATE",art_invhdr.inv_due_date$)
rem 	callpoint!.setColumnData("ARE_DATECHANGE.AR_INV_NO_VER",fnget_rec$("ARE_DATECHANGE.AR_INV_NO_VER"))
	callpoint!.setStatus("ABLEMAP")
rem endif

invalid_inv:

	if msg_id$<>"" then
		gosub disp_message
		
	endif
