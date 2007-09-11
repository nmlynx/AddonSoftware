[[APE_MANCHECKHDR.AOPT-OINV]]
rem -- call inquiry program to view open invoices this vendor
key_pfx$=callpoint!.getColumnData("APE_MANCHECKHDR.FIRM_ID")+callpoint!.getColumnData("APE_MANCHECKHDR.AP_TYPE")+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")
call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"APT_INVOICEHDR",
:	"VIEW",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY"
[[APE_MANCHECKHDR.AOPT-OCHK]]
rem -- call inquiry program to view open check file; plug check#/vendor id if those fields are still blank on form

key_pfx$=callpoint!.getColumnData("APE_MANCHECKHDR.FIRM_ID")+callpoint!.getColumnData("APE_MANCHECKHDR.AP_TYPE")
selected_key$=""
call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"APT_CHECKHISTORY",
:	"",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	selected_key$

if selected_key$<>""
	if cvs(callpoint!.getColumnData("APE_MANCHECKHDR.CHECK_NO"),3)="" and cvs(callpoint!.getColumnData("APE_MANCHECKHDR.CHECK_DATE"),3)="" and
:		cvs(callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID"),3)=""
		callpoint!.setColumnData("APE_MANCHECKHDR.CHECK_NO",selected_key$(len(key_pfx$)+1,7))
		callpoint!.setColumnData("APE_MANCHECKHDR.VENDOR_ID",selected_key$(len(key_pfx$)+8,6))
		callpoint!.setStatus("REFRESH")
	endif
endif
[[APE_MANCHECKHDR.<CUSTOM>]]
clear_vendor:

	callpoint!.setColumnData("APE_MANCHECKHDR.VENDOR_ID","")
	callpoint!.setColumnData("<<DISPLAY>>.DISP_ADDR1","")
	callpoint!.setColumnData("<<DISPLAY>>.DISP_ADDR2","")
	callpoint!.setColumnData("<<DISPLAY>>.DISP_CTSTZIP","")

return

display_vendor_address:
	apm01_dev=fnget_dev("APM_VENDMAST")
	dim apm01a$:fnget_tpl$("APM_VENDMAST")
	readrecord(apm01_dev,key=firm_id$+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID"),dom=*next)apm01a$
	if apm01a.firm_id$+apm01a.vendor_id$=firm_id$+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID") and 
:		cvs(callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID"),3)<>""
		callpoint!.setColumnData("<<DISPLAY>>.DISP_ADDR1",apm01a.addr_line_1$)
		callpoint!.setColumnData("<<DISPLAY>>.DISP_ADDR2",apm01a.addr_line_2$)
		callpoint!.setColumnData("<<DISPLAY>>.DISP_CTSTZIP",cvs(apm01a.city$,2)+
:			  ", "+apm01a.state_code$+"  "+apm01a.zip_code$)
	endif

return

display_vendor_comments:

	apm_vendcmts_dev=fnget_dev("APM_VENDCMTS")
	dim apm09a$:fnget_tpl$("APM_VENDCMTS")
	apm09ak1$=firm_id$+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")

	read(apm_vendcmts_dev,key=apm09ak1$,dom=*next)
	readrecord(apm_vendcmts_dev,end=*next)apm09a$
	if apm09a$(1,len(apm09ak1$))=apm09ak1$
		key_pfx$=callpoint!.getColumnData("APE_MANCHECKHDR.FIRM_ID")+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")
		call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:			gui_dev,
:			Form!,
:			"APM_VENDCMTS",
:			"VIEW",
:			table_chans$[all],
:			key_pfx$,
:			"PRIMARY"
	
	endif

return

disable_grid:

	w!=Form!.getChildWindow(1109)
	c!=w!.getControl(5900)
	c!.setEnabled(0)

return

enable_grid:

	w!=Form!.getChildWindow(1109)
	c!=w!.getControl(5900)
	c!.setEnabled(1)

return

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

calc_tots:

	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	tinv=0,tdisc=0,tret=0
	if numrecs>0
		for reccnt=0 to numrecs-1
			gridrec$=recVect!.getItem(reccnt)
			tinv=tinv+num(gridrec.invoice_amt$)
			tdisc=tdisc+num(gridrec.discount_amt$)
			tret=tret+num(gridrec.retention$)
		next reccnt
	endif


return

disp_tots:

    rem --- get context and ID of display controls for totals, and redisplay w/ amts from calc_tots
    
    tinv!=AONObj!.getItem(num(user_tpl.tinv_vpos$))
    tinv!.setValue(tinv)

    tdisc!=AONObj!.getItem(num(user_tpl.tdisc_vpos$))
    tdisc!.setValue(tdisc)

    tret!=AONObj!.getItem(num(user_tpl.tret_vpos$))
    tret!.setValue(tret)

    tchk!=AONObj!.getItem(num(user_tpl.tchk_vpos$))
    tchk!.setValue(tinv-tdisc-tret)

    return

get_vendor_history:

	apm02_dev=fnget_dev("APM_VENDHIST")				
	dim apm02a$:fnget_tpl$("APM_VENDHIST")

	readrecord(apm02_dev,key=firm_id$+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")+
:		callpoint!.getColumnData("APE_MANCHECKHDR.AP_TYPE"),dom=*next)apm02a$
	if apm02a.firm_id$+apm02a.vendor_id$+apm02a.ap_type$=firm_id$+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")+
:		callpoint!.getColumnData("APE_MANCHECKHDR.AP_TYPE")
		user_tpl.dflt_dist_cd$=apm02a.ap_dist_code$
		user_tpl.dflt_gl_account$=apm02a.gl_account$
		pfx$="GLNS",nm$="GL Dist"
		GLNS!=BBjAPI().getNamespace(pfx$,nm$,1)
		GLNS!.setValue("dflt_gl",apm02a.gl_account$)

return

#include std_missing_params.src
[[APE_MANCHECKHDR.VENDOR_ID.AVAL]]
if cvs(callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID"),3)<>"" 
:	and callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")<>
:	callpoint!.getColumnUndoData("APE_MANCHECKHDR.VENDOR_ID")	

	gosub display_vendor_address					
	gosub display_vendor_comments

	callpoint!.setColumnUndoData("APE_MANCHECKHDR.VENDOR_ID",
:		callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID"))

	callpoint!.setStatus("REFRESH")

	gosub get_vendor_history

	if cvs(apm02a$,3)=""
		if user_tpl.multi_types$="Y"
			msg_id$="AP_NOHIST"
			gosub disp_message
			callpoint!.setStatus("ABORT")
		endif
	endif

endif
[[APE_MANCHECKHDR.TRANS_TYPE.AVAL]]
if callpoint!.getColumnData("APE_MANCHECKHDR.TRANS_TYPE")="R"
	msg_id$="AP_REUSE_ERR"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif

if callpoint!.getColumnData("APE_MANCHECKHDR.TRANS_TYPE")="V"
	ctl_name$="APE_MANCHECKHDR.VENDOR_ID"
	ctl_stat$="D"
	gosub clear_vendor
	gosub disable_fields
	gosub disable_grid							
endif
						
if callpoint!.getColumnData("APE_MANCHECKHDR.TRANS_TYPE")="M"
	ctl_name$="APE_MANCHECKHDR.VENDOR_ID"
	ctl_stat$=" "
	gosub disable_fields
	gosub enable_grid							
endif
[[APE_MANCHECKHDR.CHECK_DATE.AVAL]]
gl$=user_tpl.glint$
ckdate$=callpoint_data$        
if gl$="Y" 
	call dir_pgm$+"glc_datecheck.aon",ckdate$,"Y",per$,yr$,status
	if status>99
		callpoint!.setStatus("ABORT")
	else
		user_tpl.glyr$=yr$
		user_tpl.glper$=per$
	endif
endif
[[APE_MANCHECKHDR.AOPT-VCMT]]
key_pfx$=callpoint!.getColumnData("APE_MANCHECKHDR.FIRM_ID")+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")
call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"APM_VENDCMTS",
:	"VIEW",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY"
[[APE_MANCHECKHDR.AOPT-AVEN]]
user_id$=stbl("+USER_ID")
dim dflt_data$[1,1]
key_pfx$=callpoint!.getColumnData("APE_MANCHECKHDR.FIRM_ID")+callpoint!.getColumnData("APE_MANCHECKHDR.VENDOR_ID")
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:	"APM_VENDMAST",
:	user_id$,
:	"MNT",
:	key_pfx$,
:	table_chans$[all],
:	"",
:	dflt_data$[all]
[[APE_MANCHECKHDR.BSHO]]
rem --- disable ap type control if param for multi-types is N
rem --- user_tpl.multi_types$="N";rem --- temp for testing.CAH
if user_tpl.multi_types$="N" 
	ctl_name$="APE_MANCHECKHDR.AP_TYPE"
	ctl_stat$="I"
	gosub disable_fields
endif
			
rem --- disable some grid columns
w!=Form!.getChildWindow(1109)
c!=w!.getControl(5900)
c!.setColumnEditable(6,0)
c!.setColumnEditable(7,0)
if user_tpl.multi_types$="N" c!.setColumnEditable(2,0)
[[APE_MANCHECKHDR.AWIN]]
rem --- Open/Lock files

files=30,begfile=1,endfile=11
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="APE_MANCHECKHDR";rem --- "ape-02"
files$[2]="APE_MANCHECKDIST";rem --- "ape-12"
files$[3]="APE_MANCHECKDET";rem --- "ape-22"
files$[4]="APM_VENDMAST";rem --- "apm-01"
files$[5]="APM_VENDHIST";rem --- "apm-02"
files$[6]="APT_INVOICEHDR";rem --- "apt-01"
files$[7]="APT_INVOICEDET";rem --- "apt-11"
files$[8]="APT_CHECKHISTORY";rem --- "apt-05
files$[9]="APC_TYPECODE";rem --- "apm-10A"
files$[10]="APM_VENDCMTS";rem --- "apm-09
files$[11]="APS_PARAMS";rem --- "ads-01"

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call dir_pgm$+"bac_open_tables.bbj",
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
ads01_dev=num(chans$[11])


rem -- Retrieve miscellaneous templates

files=2,begfile=1,endfile=files
dim ids$[files],templates$[files]
ids$[1]="aps-01A"
ids$[2]="gls-01A"
call dir_pgm$+"adc_template.aon",
:	begfile,
:	endfile,
:	ids$[all],
:	templates$[all],
:	status
if status goto std_exit

rem --- Dimension miscellaneous string templates

dim aps01a$:templates$[1],gls01a$:templates$[2]
user_tpl_str$="firm_id:c(2),glint:c(1),glyr:c(4),glper:c(2),glworkfile:c(16),"
user_tpl_str$=user_tpl_str$+"amt_msk:c(15),multi_types:c(1),multi_dist:c(1),ret_flag:c(1),"
user_tpl_str$=user_tpl_str$+"misc_entry:c(1),post_closed:c(1),units_flag:c(1),"
user_tpl_str$=user_tpl_str$+"existing_tran:c(1),open_check:c(1),existing_invoice:c(1),reuse_chk:c(1),"
user_tpl_str$=user_tpl_str$+"dflt_dist_cd:c(2),dflt_gl_account:c(10),"
user_tpl_str$=user_tpl_str$+"tinv_vpos:c(1),tdisc_vpos:c(1),tret_vpos:c(1),tchk_vpos:c(1),"
user_tpl_str$=user_tpl_str$+"ap_type_vpos:c(1),vendor_id_vpos:c(1)"

dim user_tpl$:user_tpl_str$
user_tpl.firm_id$=firm_id$

rem --- set up AONObj! as vector
	AONObj!=SysGUI!.makeVector()
	
	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_INV","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_INV","CTLI"))
	tinv!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_DISC","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_DISC","CTLI"))
	tdisc!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_RETEN","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_RETEN","CTLI"))
	tret!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_CHECK","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DISP_TOT_CHECK","CTLI"))
	tchk!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	ctlContext=num(callpoint!.getTableColumnAttribute("APE_MANCHECKHDR.AP_TYPE","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("APE_MANCHECKHDR.AP_TYPE","CTLI"))
	ap_type!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	ctlContext=num(callpoint!.getTableColumnAttribute("APE_MANCHECKHDR.VENDOR_ID","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("APE_MANCHECKHDR.VENDOR_ID","CTLI"))
	vendor_id!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	AONObj!.addItem(tinv!)
	user_tpl.tinv_vpos$="0"
	AONObj!.addItem(tdisc!)
	user_tpl.tdisc_vpos$="1"
	AONObj!.addItem(tret!)
	user_tpl.tret_vpos$="2"
	AONObj!.addItem(tchk!)
	user_tpl.tchk_vpos$="3"
	AONObj!.addItem(ap_type!)
	user_tpl.ap_type_vpos$="4"
	AONObj!.addItem(vendor_id!)
	user_tpl.vendor_id_vpos$="5"

rem --- Additional File Opens

gl$="N"
status=0
source$=pgm(-2)
call dir_pgm$+"glc_ctlcreate.aon",err=*next,source$,"AR",glw11$,gl$,status
if status<>0 goto std_exit
user_tpl.glint$=gl$
user_tpl.glworkfile$=glw11$

if gl$="Y"
	files=21,begfile=20,endfile=21
   dim files$[files],options$[files],chans$[files],templates$[files]
   files$[20]="GLM_ACCT",options$[20]="OTA";rem --- "glm-01"
   files$[21]=glw11$,options$[21]="OTAS";rem --- s means no err if tmplt not found
   rem --- will need alias name, not disk name, when opening work file
	rem --- will also need option to lock/clear file [21]; not using in this pgm for now, so bypassing.CAH

	call dir_pgm$+"bac_open_tables.bbj",
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
find record (ads01_dev,key=aps01a_key$,err=std_missing_params) aps01a$
user_tpl.amt_msk$=aps01a.amount_mask$
user_tpl.multi_types$=aps01a.multi_types$
user_tpl.multi_dist$=aps01a.multi_dist$
user_tpl.ret_flag$=aps01a.ret_flag$
user_tpl.misc_entry$=aps01a.misc_entry$
user_tpl.post_closed$=aps01a.post_closed$

gls01a_key$=firm_id$+"GL00"
find record (ads01_dev,key=gls01a_key$,err=std_missing_params) gls01a$
user_tpl.units_flag$=gls01a.units_flag$
user_tpl.units_flag$="N";rem --- for testing

pfx$="GLNS",nm$="GL Dist"
GLNS!=BBjAPI().getNamespace(pfx$,nm$,1)
GLNS!.setValue("GLMisc",user_tpl.misc_entry$)
GLNS!.setValue("GLUnits",user_tpl.units_flag$)
GLNS!.setValue("dist_amt","")
GLNS!.setValue("dflt_gl","")
[[APE_MANCHECKHDR.ARNF]]
if user_tpl.open_check$<>"Y" or callpoint!.getColumnData("APE_MANCHECKHDR.TRANS_TYPE")<>"R" and cvs(callpoint!.getColumnData("APE_MANCHECKHDR.CHECK_NO"),3)<>""
	apt_checkhistory_dev=fnget_dev("APT_CHECKHISTORY")
	dim apt05a$:fnget_tpl$("APT_CHECKHISTORY")
	apt05k1$=firm_id$+callpoint!.getColumnData("APE_MANCHECKHDR.AP_TYPE")+callpoint!.getColumnData("APE_MANCHECKHDR.CHECK_NO")
	apt05klen=len(apt05k1$)

	read (apt_checkhistory_dev,key=apt05k1$,dom=*next)
	readrecord (apt_checkhistory_dev,end=*break)apt05a$
	if apt05a$(1,apt05klen)=apt05k1$
		user_tpl.open_check$="Y"
		if pos(apt05a.trans_type$="CM")
			msg_id$="AP_REVERSE"
			msg_opt$=""
			gosub disp_message
			if msg_opt$="Y"
				callpoint!.setColumnData("APE_MANCHECKHDR.TRANS_TYPE","R")
				callpoint!.setColumnUndoData("APE_MANCHECKHDR.TRANS_TYPE","R")
				ctl_name$="APE_MANCHECKHDR.TRANS_TYPE"
				ctl_stat$="D"
				gosub disable_fields
				ctl_name$="APE_MANCHECKHDR.VENDOR_ID"
				gosub disable_fields
				callpoint!.setColumnData("APE_MANCHECKHDR.CHECK_DATE",apt05a.check_date$)
				callpoint!.setColumnData("APE_MANCHECKHDR.VENDOR_ID",apt05a.vendor_id$)
				gosub display_vendor_address
				gosub display_vendor_comments
				gosub disable_grid
			else
				callpoint!.setStatus("ABORT")
			endif
		else
			msg_id$="AP_OPEN_CHK"
			msg_opt$=""
			gosub disp_message
			if msg_opt$="Y"
				user_tpl.reuse_chk$="Y"
				callpoint!.setColumnData("APE_MANCHECKHDR.TRANS_TYPE","M")
				callpoint!.setStatus("REFRESH")
			else
				callpoint!.setStatus("ABORT")
			endif
		endif
	endif
endif
[[APE_MANCHECKHDR.AREC]]
user_tpl.reuse_chk$=""
user_tpl.open_check$=""
user_tpl.dflt_dist_cd$=""
user_tpl.dflt_gl_account$=""

rem --- enable/disable grid cells
w!=Form!.getChildWindow(1109)
c!=w!.getControl(5900)
c!.setColumnEditable(0,1)
c!.setColumnEditable(1,1)
c!.setColumnEditable(6,0)
c!.setColumnEditable(7,0)
if user_tpl.multi_dist$="N" c!.setColumnEditable(2,0)
[[APE_MANCHECKHDR.AREA]]
user_tpl.existing_tran$="Y"
user_tpl.open_check$=""
user_tpl.reuse_chk$=""
[[APE_MANCHECKHDR.ADIS]]
user_tpl.existing_tran$="Y"
user_tpl.open_check$=""
user_tpl.reuse_chk$=""

ctl_name$="APE_MANCHECKHDR.TRANS_TYPE"
ctl_stat$="D"
gosub disable_fields
ctl_name$="APE_MANCHECKHDR.VENDOR_ID"
gosub disable_fields

if callpoint!.getColumnData("APE_MANCHECKHDR.TRANS_TYPE")="M"
	gosub calc_tots
	callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_INV",str(tinv))
   	callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_DISC",str(tdisc))
	callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_RETEN",str(tret))
	callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_CHECK",str(tinv-tdisc-tret))
else
	ctl_name$="APE_MANCHECKHDR.CHECK_DATE"
	ctl_stat$="D"
	gosub disable_fields
	gosub disable_grid
endif
rem --- disable inv#/date/dist code cells corres to existing data -- only allow change on inv/disc cols
curr_rows!=GridVect!.getItem(0)
curr_rows=curr_rows!.size()

if curr_rows
gosub enable_grid
dtlGrid!=Form!.getChildWindow(1109).getControl(5900)
	for wk=0 to curr_rows-1
		dtlGrid!.setCellEditable(wk,0,0)
		dtlGrid!.setCellEditable(wk,1,0)
		dtlGrid!.setCellEditable(wk,2,0)
	next wk
endif

gosub display_vendor_address
rem --- doing in vendor id aval...gosub get_vendor_history
[[APE_MANCHECKHDR.ARNF]]
				if user_tpl.open_check$<>"Y" or callpoint!.getColumnData("APE_MANCHECKHDR.TRANS_TYPE")<>"R"
					ape_openchecks_dev=fnget_dev("APE_OPENCHECKS")
					dim ape05a$:fnget_tpl$("APE_OPENCHECKS")
					ape05k1$=firm_id$+callpoint!.getColumnData("APE_MANCHECKHDR.AP_TYPE")+callpoint!.getColumnData("APE_MANCHECKHDR.CHECK_NO")
					ape05klen=len(ape05k1$)

					read (ape_openchecks_dev,key=ape05k1$,dom=*next)
					readrecord (ape_openchecks_dev,end=*break)ape05a$
					if ape05a$(1,ape05klen)=ape05k1$
						user_tpl.open_check$="Y"
						if pos(ape05a.check_type$="CM")
							msg_id$="AP_REVERSE"
							msg_opt$=""
							gosub disp_message
							if msg_opt$="Y"
								callpoint!.setColumnData("APE_MANCHECKHDR.TRANS_TYPE","R")
								callpoint!.setColumnUndoData("APE_MANCHECKHDR.TRANS_TYPE","R")
								ctl_name$="APE_MANCHECKHDR.TRANS_TYPE"
								ctl_stat$="D"
								gosub disable_fields
								ctl_name$="APE_MANCHECKHDR.VENDOR_ID"
								gosub disable_fields
								callpoint!.setColumnData("APE_MANCHECKHDR.CHECK_DATE",ape05a.check_date$)
								callpoint!.setColumnData("APE_MANCHECKHDR.VENDOR_ID",ape05a.vendor_id$)
								gosub display_vendor_address
								gosub display_vendor_comments
								gosub disable_grid
							else
								callpoint!.setStatus("ABORT")
							endif
						else
							msg_id$="AP_OPEN_CHK"
							msg_opt$=""
							gosub disp_message
							if msg_opt$="Y"
								user_tpl.reuse_chk$="Y"
								callpoint!.setColumnData("APE_MANCHECKHDR.TRANS_TYPE","M")
								callpoint!.setStatus("REFRESH")
							else
								callpoint!.setStatus("ABORT")
							endif
						endif
					endif
				endif
[[APE_MANCHECKHDR.AREC]]
				user_tpl.reuse_chk$=""
				user_tpl.open_check$=""
[[APE_MANCHECKHDR.AREA]]
				user_tpl.existing_tran$="Y"
				user_tpl.open_check$=""
				user_tpl.reuse_chk$=""
[[APE_MANCHECKHDR.ADIS]]
				user_tpl.existing_tran$="Y"
				user_tpl.open_check$=""
				user_tpl.reuse_chk$=""

				gosub display_vendor_address
				gosub display_vendor_comments

				ctl_name$="APE_MANCHECKHDR.TRANS_TYPE"
				ctl_stat$="D"
				gosub disable_fields
				ctl_name$="APE_MANCHECKHDR.VENDOR_ID"
				gosub disable_fields

				if callpoint!.getColumnData("APE_MANCHECKHDR.TRANS_TYPE")="M"

					gosub calc_tots

					callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_INV",str(tinv))
					callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_DISC",str(tdisc))
					callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_RETEN",str(tret))
					callpoint!.setColumnData("<<DISPLAY>>.DISP_TOT_CHECK",str(tinv-tdisc-tret))
				else
					ctl_name$="APE_MANCHECKHDR.CHECK_DATE"
					ctl_stat$="D"
					gosub disable_fields
					gosub disable_grid
				endif
