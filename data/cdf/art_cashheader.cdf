[[ART_CASHHEADER.AWRI]]
	if cvs(art_cashheader.status$,3)="" 
		callpoint!.setColumnData("ART_CASHHEADER.STATUS","O")
	endif
[[ART_CASHHEADER.CUSTOMER_ID.AVAL]]
tmp_cust_id$=callpoint!.getUserInput()
rem << usr_tmpl.cust_id$=tmp_cust_id$

callpoint!.setStatus("REFRESH")
[[ART_CASHHEADER.<CUSTOM>]]
rem ==================================================================
get_customer_balance:
rem ==================================================================
	rem --- tmp_cust_id$ being set prior to gosub
	arm_custdet_dev=fnget_dev("ARM_CUSTDET")
	dim arm02a$:fnget_tpl$("ARM_CUSTDET")
	arm02a.firm_id$=firm_id$,arm02a.customer_id$=tmp_cust_id$,arm02a.ar_type$="  "
	readrecord(arm_custdet_dev,key=arm02a.firm_id$+arm02a.customer_id$+arm02a.ar_type$,err=*next)arm02a$
	callpoint!.setColumnData("<<DISPLAY>>.DISP_CUST_BAL",
:		str(num(arm02a.aging_future$)+num(arm02a.aging_cur$)+num(arm02a.aging_30$)+
:       num(arm02a.aging_60$)+num(arm02a.aging_90$)+num(arm02a.aging_120$)))
return

REM ==============================
GET_INVOICE:
rem ==============================
return


apply_on_acct:
gl_distribution:
[[ART_CASHHEADER.AWIN]]
escape
rem --- Open/Lock files
use ::ado_util.src::util
files=9,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="ART_CASHHEADER"
files$[2]="ART_CASHTRANS"
files$[3]="ART_CASHPOST";rem ---  
files$[4]="ARE_CASHBAL";rem --- "are-31"
files$[5]="ART_INVHEADER";rem ---  
files$[6]="";rem ---  
files$[7]="ARM_CUSTMAST";rem --- "arm-01"
files$[8]="ARM_CUSTDET";rem --- "arm-02
files$[9]="ARC_CASHCODE";rem --- "arm-10C"

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx
call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                   chans$[all],templates$[all],table_chans$[all],batch,status$
if status$<>"" then
	remove_process_bar:
	bbjAPI!=bbjAPI()
	rdFuncSpace!=bbjAPI!.getGroupNamespace()
	rdFuncSpace!.setValue("+build_task","OFF")
	release
endif

rem *******************************************
set_devs:
rem *******************************************
cashhdr_dev=num(chans$[1])
cashtrans_dev=num(chans$[2])
cashpost_dev=num(chans$[3])
cashbal_dev=num(chans$[4])
invhdr_dev=num(chans$[5])
invtrans_dev=num(chans$[6])
custmast_dev=num(chans$[7])
custdet_dev=num(chans$[8])
cashcode_dev=num(chans$[9])

rem *******************************************
rem --- Dimension miscellaneous string templates
rem *******************************************
dim cashheader$:templates$[1], cashtrans$:templates$[2], cashpost$:templates$[3], invheader$:templates$[5], invtrans$:templates$[6]
user_tpl_str$="firm_id:c(2),cust_id:c(6),invoice_no:c(7),applied_amt:c(8),disc_taken:c(8),new_bal:c(5),invoice_bal:c(8),ar_trans_id:c(12)"

dim user_tpl$:user_tpl_str$
user_tpl.firm_id$=firm_id$
user_tpl.invoice_no$="123999"
source$=pgm(-2)
 
[[ART_CASHHEADER.AOPT-GLP]]
rem --- call up GL Dist grid if GL installed
if user_tpl.glint$="Y"
	gosub gl_distribution
else
	msg_id$="AR_NO_GL"
	gosub disp_message							
endif
[[ART_CASHHEADER.AOPT-AOA]]
gosub apply_on_acct
