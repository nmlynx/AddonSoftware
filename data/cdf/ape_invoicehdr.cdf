[[APE_INVOICEHDR.ADIS]]
vend_key$=callpoint!.getColumnData("APE_INVOICEHDR.FIRM_ID")+callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
rem gosub disp_vend_addr
callpoint!.setColumnData("<<DISPLAY>>.TOT_QTY",str(tqty))
callpoint!.setColumnData("<<DISPLAY>>.TOT_AMT",str(tamt))
callpoint!.setStatus("REFRESH")

if callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_TYPE")="V"
rem 	gosub check_outstanding_inv
	if os_inv$="N"
		msg_id$="AP_VOID_INV"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		if msg_opt$="Y"
			callpoint!.setColumnData("APE_INVOICEHDR.INVOICE_TYPE","I")
			callpoint!.setColumnUndoData("APE_INVOICEHDR.INVOICE_TYPE","I")
			callpoint!.setStatus("MODIFIED-REFRESH")
		else
			callpoint!.setStatus("ABORT")
		endif
	else
		msg_id$="AP_INV_ADJ"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		if msg_opt$="Y"
			callpoint!.setColumnData("APE_INVHDR.INVOICE_TYPE","A")
			callpoint!.setColumnUndoData("APE_INVHDR.INVOICE_TYPE","A")
			callpoint!.setStatus("MODIFIED-REFRESH")
		else
			callpoint!.setStatus("ABORT")
		endif
	endif
endif
[[APE_INVOICEHDR.ADEL]]
rem --- hdr/dtl have been deleted; now write back header w/ "V" flag
ape_invhdr_dev=fnget_dev("APE_INVOICEHDR")
rec_data.invoice_type$="V"
rec_data$=field(rec_data$); write record(ape_invhdr_dev,key=rec_data.firm_id$+rec_data.ap_inv_no$)rec_data$
[[APE_INVOICEHDR.AP_TERMS_CODE.AVAL]]
escape
if cvs(callpoint!.getColumnData("APE_INVOICEHDR.INV_DUE_DATE"),2)="" and
:	cvs(callpoint!.getColumnData("APE_INVOICEHDR.DISC_DATE"),2)=""
	read(apcterms_dev,key=callpoint!.getColumnData("APE_INVOICEHDR.FIRM_ID")+"C"+
:	callpoint!.getUserInput())apcterms$

	termstype$="D", invdate$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_DATE")
	numdays=30;  rem  duedate routine works for D or P type
	discdays=10, discpercent=2
	call pgmdir$+"adc_duedate.aon",termstype$,invdate$,numdays,calcdate$,status
	callpoint!.setColumnData("APE_INVOICEHDR.INV_DUE_DATE",calcdate$)
	
	call pgmdir$+"adc_duedate.aon",termstype$,invdate$,discdays,calcdate$,status
	callpoint!.setColumnData("APE_INVOICEHDR.DISC_DATE",calcdate$)

	callpoint!.setStatus("REFRESH","ACTIVATE")

endif
[[APE_INVOICEHDR.NET_INV_AMT.BINP]]
if num(callpoint!.getColumnData("APE_INVOICEHDR.DISCOUNT_AMT"))=0
	discamt=discpercent*num(callpoint!.getUserInput())
	callpoint!.setColumnData("APE_INVOICEHDR.DISCOUNT_AMT",str(discamt))
	callpoint!.setStatus("REFRESH")
endif
[[APE_INVOICEHDR.INVOICE_AMT.AVAL]]

if num(callpoint!.getColumnData("APE_INVOICEHDR.NET_INV_AMT")) = 0
	callpoint!.setColumnData("APE_INVOICEHDR.NET_INV_AMT",
:	callpoint!.getUserInput())
endif
[[APE_INVOICEHDR.<CUSTOM>]]
#include std_missing_params.src
[[APE_INVOICEHDR.BSHO]]
rem --- Open/Lock files

files=1,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="aps_params";rem --- aps-01

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call stbl("+DIR_SYP")+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$

if status$<>""  goto std_exit

aps01_dev=num(chans$[1])


rem --- init/parameters

aps01a_key$=firm_id$+"AP00"
find record (aps01_dev,key=aps01a_key$,err=std_missing_params) aps01a$

dim info$[20]
