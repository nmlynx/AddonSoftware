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
files$[1]="APS_PARAMS";rem --- aps-01

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
