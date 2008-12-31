[[OPE_CREDMNT.AOPT-CMTS]]
rem --- Comment Maintenance
cust_id$=callpoint!.getColumnData("OPE_CREDMNT.CUSTOMER_ID")
user_id$=stbl("+USER_ID")
dim dflt_data$[2,1]
dflt_data$[1,0]="CUSTOMER_ID"
dflt_data$[1,1]=cust_id$
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "ARM_CUSTCMTS",
:                       user_id$,
:                   	"MNT",
:                       firm_id$+cust_id$,
:                       table_chans$[all],
:                       "",
:                       dflt_data$[all]

gosub disp_cust_comments
[[OPE_CREDMNT.AOPT-IDTL]]
rem Invoice Dtl Inquiry
cp_cust_id$=callpoint!.getColumnData("OPE_CREDMNT.CUSTOMER_ID")
user_id$=stbl("+USER_ID")
dim dflt_data$[2,1]
dflt_data$[1,0]="CUSTOMER_ID"
dflt_data$[1,1]=cp_cust_id$
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "ARR_INVDETAIL",
:                       user_id$,
:                   	"",
:                       "",
:                       table_chans$[all],
:                       "",
:                       dflt_data$[all]
[[OPE_CREDMNT.AOPT-ORIV]]
rem Order/Invoice History Inq
	cp_cust_id$=callpoint!.getColumnData("OPE_CREDMNT.CUSTOMER_ID")
	user_id$=stbl("+USER_ID")
	dim dflt_data$[2,1]
	dflt_data$[1,0]="CUSTOMER_ID"
	dflt_data$[1,1]=cp_cust_id$
	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"ARR_ORDINVHIST",
:		user_id$,
:		"",
:		"",
:		table_chans$[all],
:		"",
:		dflt_data$[all]
[[OPE_CREDMNT.ADIS]]
rem --- show customer comments

cust_id$=callpoint!.getColumnData("OPE_CREDMNT.CUSTOMER_ID")
gosub disp_cust_comments
[[OPE_CREDMNT.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARM_CUSTCMTS",open_opts$[1]="OTA"
gosub open_tables
arm05_dev=num(open_chans$[1])

rem --- Enable 2 credit fields
ctl_name$="ARM_CUSTDET.CREDIT_LIMIT"
ctl_stat$=" "
gosub disable_fields
ctl_name$="ARM_CUSTDET.CRED_HOLD"
gosub disable_fields
[[OPE_CREDMNT.<CUSTOM>]]
disable_fields:
	rem --- used to disable/enable controls
	rem --- ctl_name$ sent in with name of control to enable/disable (format "ALIAS.CONTROL_NAME")
	rem --- ctl_stat$ sent in as D or space, meaning disable/enable, respectively

	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP-REFRESH-ACTIVATE")

return

disp_cust_comments:
	
rem --- You must pass in cust_id$ because we don't know whether it's verified or not
	cmt_text$=""
	arm05_dev=fnget_dev("ARM_CUSTCMTS")
	dim arm05a$:fnget_tpl$("ARM_CUSTCMTS")
	arm05_key$=firm_id$+cust_id$
	more=1
	read(arm05_dev,key=arm05_key$,dom=*next)
	while more
		readrecord(arm05_dev,end=*break)arm05a$
		 
		if arm05a.firm_id$ = firm_id$ and arm05a.customer_id$ = cust_id$ then
			cmt_text$ = cmt_text$ + cvs(arm05a.std_comments$,3)+$0A$
		endif				
	wend
	callpoint!.setColumnData("<<DISPLAY>>.comments",cmt_text$)
	callpoint!.setStatus("REFRESH")
return
