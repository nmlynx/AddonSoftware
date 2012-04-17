rem ----------------------------------------------------------------------------
rem Program: SFHARDCOPYOPSTD.prc
rem Description: Stored Procedure to get the Shop Floor Hard Copy Operation info into iReports
rem Used for Hard Copy, Traveler, Work Order Closed Detail and Work Order Detail
rem
rem Author(s): J. Brewer
rem Revised: 04.13.2012
rem
rem AddonSoftware
rem Copyright BASIS International Ltd.
rem ----------------------------------------------------------------------------

rem --- Set of utility methods

	use ::ado_func.src::func

rem --- Declare some variables ahead of time

	declare BBjStoredProcedureData sp!
	declare BBjRecordSet rs!
	declare BBjRecordData data!

rem --- Get the infomation object for the Stored Procedure

	sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem --- Get the IN parameters used by the procedure

	firm_id$ = sp!.getParameter("FIRM_ID")
	wo_loc$  = sp!.getParameter("WO_LOCATION")
	wo_no$ = sp!.getParameter("WO_NO")
	barista_wd$ = sp!.getParameter("BARISTA_WD")
	
	sv_wd$=dir("")
	chdir barista_wd$

rem --- Create a memory record set to hold results.
rem --- Columns for the record set are defined using a string template
	temp$="OP_CODE:C(1*), REQ_DATE:C(1*), HOURS:C(1*), PC_HR:C(1*), DIRECT:C(1*), OVHD:C(1*), "
	temp$=temp$+"UNITS_EA:C(1*), COST_EA:C(1*), SETUP:C(1*), UNITS_TOT:C(1*), COST_TOT:C(1*)"

	rs! = BBJAPI().createMemoryRecordSet(temp$)

rem --- Get Barista System Program directory

	sypdir$=""
	sypdir$=stbl("+DIR_SYP",err=*next)

rem --- Get masks

rem	pgmdir$=stbl("+DIR_PGM",err=*next)
rem	call pgmdir$+"adc_getmask.aon","","SF","U","",m1$,0,m1
rem	call pgmdir$+"adc_getmask.aon","","AR","I","",custmask$,0,custmask
	m1$="#,###.00-"
	cust_mask$="00-0000"
	pct_mask$="##0.0%"
	
rem --- Open files with adc

    files=3,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]
    files$[1]="ivm-01",ids$[1]="IVM_ITEMMAST"
	files$[2]="sfm-10",ids$[2]="SFC_WOTYPECD"
	files$[3]="arm-01",ids$[3]="ARM_CUSTMAST"

    call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],
:                                   ids$[all],templates$[all],channels[all],batch,status
    if status goto std_exit
    ivm_itemmast_dev=channels[1]
	sfc_type_dev=channels[2]
	arm_custmast=channels[3]

rem --- Dimension string templates

	dim ivm_itemmast$:templates$[1]
	dim sfc_type$:templates$[2]
	dim arm_custmast$:templates$[3]

goto no_bac_open
rem --- Open Files    
    num_files = 3
    dim open_tables$[1:num_files], open_opts$[1:num_files], open_chans$[1:num_files], open_tpls$[1:num_files]

	open_tables$[1]="IVM_ITEMMAST",   open_opts$[1] = "OTA"
	open_tables$[2]="SFC_WOTYPECD",   open_opts$[2] = "OTA"
	open_tables$[3]="ARM_CUSTMAST",   open_opts$[3] = "OTA"

call sypdir$+"bac_open_tables.bbj",
:       open_beg,
:		open_end,
:		open_tables$[all],
:		open_opts$[all],
:		open_chans$[all],
:		open_tpls$[all],
:		table_chans$[all],
:		open_batch,
:		open_status$

	ivm_itemmast_dev  = num(open_chans$[1])
	sfc_type_dev = num(open_chans$[2])
	arm_custmast = num(open_chans$[3])
	
	dim ivm_itemmast$:open_tpls$[1]
	dim sfc_type$:open_tpls$[2]
	dim arm_custmast$:open_tpls$[3]

no_bac_open:

rem --- Build SQL statement

rem	sql_prep$="select * from vw_sfx_wotranxr as vw_trans where vw_trans.firm_id = '"+firm_id$+"' and "
rem	sql_prep$=sql_prep$+"record_id = 'O' and wo_no = '"+wo_no$+"'"

	sql_prep$="select op_code, require_date, runtime_hrs, pcs_per_hour, direct_rate, ovhd_rate, setup_time "
	sql_prep$=sql_prep$+"from sfe_wooprtn where firm_id = '"+firm_id$+"' and wo_no = '"+wo_no$+"'"
	
	sql_chan=sqlunt
	sqlopen(sql_chan,err=*next)stbl("+DBNAME")
	sqlprep(sql_chan)sql_prep$
	dim read_tpl$:sqltmpl(sql_chan)
	sqlexec(sql_chan)

rem --- Trip Read

	while 1
		read_tpl$ = sqlfetch(sql_chan,end=*break)

		data! = rs!.getEmptyRecordData()

		data!.setFieldValue("OP_CODE",read_tpl.op_code$)
		data!.setFieldValue("REQ_DATE",fndate$(read_tpl.require_date$))
		data!.setFieldValue("HOURS",str(read_tpl.runtime_hrs))
		data!.setFieldValue("PC_HR",str(read_tpl.pcs_per_hour))
		data!.setFieldValue("DIRECT",str(read_tpl.direct_rate))
		data!.setFieldValue("OVHD",str(read_tpl.ovhd_rate))
rem		data!.setFieldValue("UNITS_EA",read_tpl.item_id$)
rem		data!.setFieldValue("COST_EA",fndate$(read_tpl.opened_date$))
		data!.setFieldValue("SETUP",str(read_tpl.setup_time))
rem		data!.setFieldValue("UNITS_TOT",sfc_type.code_desc$)
rem		data!.setFieldValue("COST_TOT",read_tpl.priority$)
		rs!.insert(data!)
	wend
	
rem --- Tell the stored procedure to return the result set.

	sp!.setRecordSet(rs!)
	goto std_exit

rem --- Functions

    def fndate$(q$)
        q1$=""
        q1$=date(jul(num(q$(1,4)),num(q$(5,2)),num(q$(7,2)),err=*next),err=*next)
        if q1$="" q1$=q$
        return q1$
    fnend

rem --- fnmask$: Alphanumeric Masking Function (formerly fnf$)

    def fnmask$(q1$,q2$)
        if q2$="" q2$=fill(len(q1$),"0")
        return str(-num(q1$,err=*next):q2$,err=*next)
        q=1
        q0=0
        while len(q2$(q))
              if pos(q2$(q,1)="-()") q0=q0+1 else q2$(q,1)="X"
              q=q+1
        wend
        if len(q1$)>len(q2$)-q0 q1$=q1$(1,len(q2$)-q0)
        return str(q1$:q2$)
    fnend


	std_exit:
	
	end
