[[APE_INVOICEHDR.AP_INV_NO.AVAL]]
	ctl_name$="APE_INVOICEHDR.AP_DIST_CODE"
	ctl_stat$=""
	gosub disable_fields

	ctl_name$="APE_INVOICEHDR.INVOICE_DATE"
	ctl_stat$=""
	gosub disable_fields

	ctl_name$="APE_INVOICEHDR.NET_INV_AMT"
	ctl_stat$=""
	gosub disable_fields
[[APE_INVOICEHDR.ASHO]]
rem --- get default date
	call stbl("+DIR_SYP")+"bam_run_prog.bbj","APE_ORDDATE",stbl("+USER_ID"),"MNT","",table_chans$[all]
	user_tpl.dflt_acct_date$=stbl("DEF_ACCT_DATE")
[[APE_INVOICEHDR.INVOICE_DATE.AVAL]]
if cvs(callpoint!.getColumnData("APE_INVOICEHDR.ACCTING_DATE"),3)=""
	callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",
:		callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_DATE"))
	callpoint!.setStatus("REFRESH")
endif

invdate$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_DATE")
terms_cd$=user_tpl.dflt_terms_cd$
gosub calculate_due_and_discount
[[APE_INVOICEHDR.AREC]]
Form!.getControl(num(user_tpl.open_inv_textID$)).setText("")
user_tpl.inv_amt$=""
user_tpl.tot_dist$=""

rem --- Re-enable disabled fields
ctl_name$="APE_INVOICEHDR.AP_DIST_CODE"
ctl_stat$=""
gosub disable_fields

ctl_name$="APE_INVOICEHDR.INVOICE_DATE"
ctl_stat$=""
gosub disable_fields

ctl_name$="APE_INVOICEHDR.NET_INV_AMT"
ctl_stat$=""
gosub disable_fields
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
	bal_amt=num(callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_AMT"))-num(user_tpl.tot_dist$)
	if bal_amt<>0
		msg_id$="AP_NOT_DIST"
		gosub disp_message
		if msg_opt$="N"
			callpoint!.setStatus("ABORT")
		endif
	endif
endif
	
[[APE_INVOICEHDR.NET_INV_AMT.AVAL]]
rem re-calc discount amount based on net x disc %

disc_amt=num(callpoint!.getUserInput())*(num(user_tpl.disc_pct$)/100)
callpoint!.setColumnData("APE_INVOICEHDR.DISCOUNT_AMT",str(disc_amt))
callpoint!.setStatus("REFRESH")
[[APE_INVOICEHDR.PAYMENT_GRP.AVAL]]
if callpoint!.getUserInput()=""
	callpoint!.setColumnData("APE_INVOICEHDR.PAYMENT_GRP","  ")
	callpoint!.setStatus("REFRESH")

endif
[[APE_INVOICEHDR.AP_DIST_CODE.AVAL]]
if callpoint!.getUserInput()=""
	callpoint!.setColumnData("APE_INVOICEHDR.AP_DIST_CODE","  ")
	callpoint!.setStatus("REFRESH")

endif
[[APE_INVOICEHDR.AP_TYPE.AVAL]]
if callpoint!.getUserInput()=""
	callpoint!.setColumnData("APE_INVOICEHDR.AP_TYPE","  ")
	callpoint!.setStatus("REFRESH")

endif
[[APE_INVOICEHDR.ARNF]]
rem record not in ape-01; is it in apt-01?
rem if so, make sure only pmt grp, terms, hold, 
rem acct dt, due dt, disc dt, adj amount, disc amount
rem reference, memo are enabled...

apt01_dev=fnget_dev("APT_INVOICEHDR")
dim apt01a$:fnget_tpl$("APT_INVOICEHDR")
k$=""

apt01_key$=firm_id$+callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")+
:	callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")+cvs(callpoint!.getColumnData("APE_INVOICEHDR.AP_INV_NO"),3)

read(apt01_dev,key=apt01_key$,dom=*next)

k$=key(apt01_dev,end=*next); read record(apt01_dev)apt01a$
if k$(1,len(apt01_key$))=apt01_key$

	rem --- not in ape-01, but IS in apt-01
	rem --- disable dist code, inv date, net amt

	user_tpl.inv_in_ape01$="N"
	user_tpl.inv_in_apt01$="Y"
	
	callpoint!.setColumnData("APE_INVOICEHDR.FIRM_ID",apt01a.firm_id$)
	callpoint!.setColumnData("APE_INVOICEHDR.AP_TYPE",apt01a.ap_type$)
	callpoint!.setColumnData("APE_INVOICEHDR.VENDOR_ID",apt01a.vendor_id$)
	callpoint!.setColumnData("APE_INVOICEHDR.AP_INV_NO",apt01a.ap_inv_no$)
	callpoint!.setColumnData("APE_INVOICEHDR.AP_DIST_CODE",apt01a.ap_dist_code$)
	callpoint!.setColumnData("APE_INVOICEHDR.AP_TERMS_CODE",apt01a.ap_terms_code$)
	callpoint!.setColumnData("APE_INVOICEHDR.PAYMENT_GRP",apt01a.payment_grp$)
 	callpoint!.setColumnData("APE_INVOICEHDR.INVOICE_DATE",apt01a.invoice_date$)
	callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",apt01a.accting_date$)
	callpoint!.setColumnData("APE_INVOICEHDR.INV_DUE_DATE",apt01a.inv_due_date$)
	callpoint!.setColumnData("APE_INVOICEHDR.DISC_DATE",apt01a.disc_date$)
	callpoint!.setColumnData("APE_INVOICEHDR.HOLD_FLAG","N")
	callpoint!.setColumnData("APE_INVOICEHDR.AP_INV_MEMO",apt01a.ap_inv_memo$)
	callpoint!.setColumnData("APE_INVOICEHDR.REFERENCE",apt01a.reference$)
	ctl_name$="APE_INVOICEHDR.AP_DIST_CODE"
	ctl_stat$="D"
	gosub disable_fields

	ctl_name$="APE_INVOICEHDR.INVOICE_DATE"
	ctl_stat$="D"
	gosub disable_fields

	ctl_name$="APE_INVOICEHDR.NET_INV_AMT"
	ctl_stat$="D"
	gosub disable_fields

	Form!.getControl(num(user_tpl.open_inv_textID$)).setText("Open Invoice from: "+fndate$(apt01a.invoice_date$)+
:		", for "+str(num(apt01a.invoice_amt$):user_tpl.amt_msk$))

	callpoint!.setStatus("ABLEMAP-REFRESH-ACTIVATE")

else
	rem not in ape-01 or apt-01; set up defaults
	
	apm10c_dev=fnget_dev("APC_TERMSCODE")
	dim apm10c$:fnget_tpl$("APC_TERMSCODE")
	
	terms_cd$=user_tpl.dflt_terms_cd$
	invdate$=stbl("+SYSTEM_DATE")

	gosub calculate_due_and_discount

	callpoint!.setColumnData("APE_INVOICEHDR.AP_DIST_CODE",user_tpl.dflt_dist_cd$)
	callpoint!.setColumnData("APE_INVOICEHDR.AP_TERMS_CODE",user_tpl.dflt_terms_cd$)
	callpoint!.setColumnData("APE_INVOICEHDR.PAYMENT_GRP",user_tpl.dflt_pymt_grp$)
	callpoint!.setColumnData("APE_INVOICEHDR.INVOICE_DATE",stbl("+SYSTEM_DATE"))
	callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",user_tpl.dflt_acct_date$)
	callpoint!.setColumnData("APE_INVOICEHDR.HOLD_FLAG","N")
	user_tpl.inv_in_ape01$="N"
	user_tpl.inv_in_apt01$="N"
	
	callpoint!.setStatus("REFRESH")

endif
[[APE_INVOICEHDR.VENDOR_ID.AVAL]]
rem "check vend hist file to be sure this vendor/ap type ok and to set some defaults;  display vend cmts

gosub display_vendor_comments
gosub get_vendor_history

if vend_hist$=""
	if user_tpl.multi_types$="Y"
		msg_id$="AP_NOHIST"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
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

readrecord(apm10c_dev,key=firm_id$+"C"+callpoint!.getColumnData("APE_INVOICEHDR.AP_TERMS_CODE"),dom=*next)apm10c$
user_tpl.disc_pct$=apm10c.disc_percent$

user_tpl.inv_amt$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_AMT")

gosub calc_grid_tots

dist_bal=num(user_tpl.inv_amt$)-num(user_tpl.tot_dist$)
callpoint!.setColumnData("<<DISPLAY>>.DISP_DISTRIB_BAL",str(dist_bal))

user_tpl.inv_in_ape01$="Y"
user_tpl.inv_in_apt01$="N"

callpoint!.setStatus("REFRESH")
[[APE_INVOICEHDR.AP_TERMS_CODE.AVAL]]
rem re-calc due and discount dates based on terms code

	terms_cd$=callpoint!.getUserInput()
	if terms_cd$="" callpoint!.setColumnData("APE_INVOICEHDR.AP_TERMS_CODE","  ")		
	invdate$=callpoint!.getColumnData("APE_INVOICEHDR.INVOICE_DATE")
	gosub calculate_due_and_discount
	disc_amt=num(callpoint!.getColumnData("APE_INVOICEHDR.NET_INV_AMT"))*(num(user_tpl.disc_pct$)/100)
	callpoint!.setColumnData("APE_INVOICEHDR.DISCOUNT_AMT",str(disc_amt))

	callpoint!.setStatus("REFRESH")

endif
[[APE_INVOICEHDR.INVOICE_AMT.AVAL]]
if num(callpoint!.getColumnData("APE_INVOICEHDR.NET_INV_AMT")) = 0
	callpoint!.setColumnData("APE_INVOICEHDR.NET_INV_AMT",
:	callpoint!.getUserInput())
endif


user_tpl.inv_amt$=callpoint!.getUserInput()

gosub calc_grid_tots

dist_bal=num(user_tpl.inv_amt$)-num(user_tpl.tot_dist$)
callpoint!.setColumnData("<<DISPLAY>>.DISP_DISTRIB_BAL",str(dist_bal))

callpoint!.setStatus("REFRESH")
[[APE_INVOICEHDR.<CUSTOM>]]
disable_fields:
	rem --- used to disable/enable controls depending on parameter settings
	rem --- send in control to toggle (format "ALIAS.CONTROL_NAME"), and D or space to disable/enable

	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP-REFRESH")

return

get_vendor_history:

	apm02_dev=fnget_dev("APM_VENDHIST")				
	dim apm02a$:fnget_tpl$("APM_VENDHIST")
	vend_hist$=""
	readrecord(apm02_dev,key=firm_id$+callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")+
:		callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE"),dom=*next)apm02a$
	if apm02a.firm_id$+apm02a.vendor_id$+apm02a.ap_type$=firm_id$+callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")+
:		callpoint!.getColumnData("APE_INVOICEHDR.AP_TYPE")
			user_tpl.dflt_dist_cd$=apm02a.ap_dist_code$
			user_tpl.dflt_gl_account$=apm02a.gl_account$
			user_tpl.dflt_terms_cd$=apm02a.ap_terms_code$
			user_tpl.dflt_pymt_grp$=apm02a.payment_grp$
			vend_hist$="Y"
	endif

return

display_vendor_comments:

	apm09_dev=fnget_dev("APM_VENDCMTS")
	dim apm09a$:fnget_tpl$("APM_VENDCMTS")
	apm09_key$=firm_id$+callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
	more=1
	read(apm09_dev,key=apm09_key$,dom=*next)
	while more
		readrecord(apm09_dev,end=*break)apm09a$
		if apm09a.firm_id$+apm09a.vendor_id$=firm_id$+callpoint!.getUserInput()
			key_pfx$=firm_id$+callpoint!.getColumnData("APE_INVOICEHDR.VENDOR_ID")
			call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:				gui_dev,
:				Form!,
:				"APM_VENDCMTS",
:				"VIEW",
:				table_chans$[all],
:				key_pfx$,
:				"PRIMARY"
		endif
		break		
	wend

return

calculate_due_and_discount:

	if cvs(callpoint!.getColumnData("APE_INVOICEHDR.ACCTING_DATE"),2)=""
		callpoint!.setColumnData("APE_INVOICEHDR.ACCTING_DATE",user_tpl.dflt_acct_date$)
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

return

calc_grid_tots:

	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	if numrecs>0
		for reccnt=0 to numrecs-1
			gridrec$=recVect!.getItem(reccnt)
			tdist=tdist+num(gridrec.gl_post_amt$)
		next reccnt
		user_tpl.tot_dist$=str(tdist)
	endif
return

#include std_missing_params.src
[[APE_INVOICEHDR.BSHO]]
rem --- Open/Lock files

files=7,begfile=1,endfile=7
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="APT_INVOICEHDR";rem --- "apt-01"
files$[2]="APT_INVOICEDET";rem --- "apt-11"
files$[3]="APM_VENDCMTS";rem --- "apm-09
files$[4]="APM_VENDMAST";rem --- "apm-01"
files$[5]="APM_VENDHIST";rem --- "apm-02"
files$[6]="APS_PARAMS";rem --- "ads-01"
files$[7]="GLS_PARAMS";rem --- "gls-01"

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

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

if status$<>"" goto std_exit

aps01_dev=num(chans$[6])
gls01_dev=num(chans$[7])

dim aps01a$:templates$[6],gls01a$:templates$[7]

user_tpl_str$="glint:c(1),glyr:c(4),glper:c(2),gl_tot_pers:c(2),glworkfile:c(16),"
user_tpl_str$=user_tpl_str$+"amt_msk:c(15),multi_types:c(1),multi_dist:c(1),ret_flag:c(1),units_flag:c(1),"
user_tpl_str$=user_tpl_str$+"misc_entry:c(1),inv_in_ape01:c(1),inv_in_apt01:c(1),"
user_tpl_str$=user_tpl_str$+"dflt_dist_cd:c(2),dflt_gl_account:c(10),dflt_terms_cd:c(2),dflt_pymt_grp:c(2),"
user_tpl_str$=user_tpl_str$+"disc_pct:c(5),dist_bal_ofst:c(1),inv_amt:c(10),tot_dist:c(10),open_inv_textID:c(5),"
user_tpl_str$=user_tpl_str$+"dflt_acct_date:c(8)"

dim user_tpl$:user_tpl_str$

rem --- set up UserObj! as vector to store tot invoice amt and dist bal 
UserObj!=SysGUI!.makeVector()

rem --- store inv amount and distrib. bal control in UserObj! for easy update from grid
ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_DISTRIB_BAL","CTLC"))
ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_DISTRIB_BAL","CTLI"))
dist_bal!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

UserObj!.addItem(dist_bal!)
user_tpl.dist_bal_ofst$="0"

rem --- add static label for displaying date/amount if pulling up open invoice
nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
Form!.addStaticText(nxt_ctlID,225,55,250,18,"")
user_tpl.open_inv_textID$=str(nxt_ctlID)

rem --- Additional File Opens

gl$="N"
status=0
source$=pgm(-2)
call stbl("+DIR_PGM")+"glc_ctlcreate.aon",err=*next,source$,"AP",glw11$,gl$,status
if status<>0 goto std_exit
user_tpl.glint$=gl$
user_tpl.glworkfile$=glw11$

if gl$="Y"
   files=2,begfile=1,endfile=2
   dim files$[files],options$[files],chans$[files],templates$[files]
   files$[1]="GLM_ACCT",options$[1]="OTA";rem --- "glm-01"
   files$[2]=glw11$,options$[2]="OTAS";rem --- s means no err if tmplt not found


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

if status$<>"" goto std_exit

endif

rem --- Retrieve parameter data
               
aps01a_key$=firm_id$+"AP00"
find record (aps01_dev,key=aps01a_key$,err=std_missing_params) aps01a$
user_tpl.amt_msk$=aps01a.amount_mask$
user_tpl.multi_types$=aps01a.multi_types$
user_tpl.multi_dist$=aps01a.multi_dist$
user_tpl.ret_flag$=aps01a.ret_flag$
user_tpl.misc_entry$=aps01a.misc_entry$

gls01a_key$=firm_id$+"GL00"
find record (gls01_dev,key=gls01a_key$,err=std_missing_params) gls01a$
user_tpl.units_flag$=gls01a.units_flag$
user_tpl.glyr$=gls01a.current_year$
user_tpl.glper$=gls01a.current_per$
user_tpl.gl_tot_pers$=gls01a.total_pers$

rem --- may need to disable some ctls based on params

if user_tpl.multi_types$="N" 
	apm10_dev=fnget_dev("APC_TYPECODE")
	dim apm10a$:fnget_tpl$("APC_TYPECODE")
	readrecord (apm10_dev,key=firm_id$+"  ",dom=*next)apm10a$
	user_tpl.dflt_dist_cd$=apm10a.ap_dist_code$
	ctl_name$="APE_INVOICEHDR.AP_TYPE"
	ctl_stat$="I"
	gosub disable_fields
endif

if user_tpl.multi_dist$="N" 
	ctl_name$="APE_INVOICEHDR.AP_DIST_CD"
	ctl_stat$="I"
	gosub disable_fields
endif

if user_tpl.ret_flag$="N" 
	ctl_name$="APE_INVOICEHDR.RETENTION"
	ctl_stat$="I"
	gosub disable_fields
endif

ctl_name$="<<DISPLAY>>.DISP_DISTRIB_BAL"
ctl_stat$="I"
gosub disable_fields

rem --- disable some grid columns depending on params

w!=Form!.getChildWindow(1109)
c!=w!.getControl(5900)
if gl$="N" c!.setColumnEditable(0,0)
if user_tpl.misc_entry$="N" c!.setColumnEditable(2,0)
if user_tpl.units_flag$="N" c!.setColumnEditable(4,0)

			
