rem ----------------------------------------------------------------------------
rem Program: SFHARDCOPYCOSTSUM.prc
rem Description: Stored Procedure to get the Shop Floor Hard Copy Cost Summary info into iReports
rem Used for Hard Copy, Traveler, Work Order Closed Detail and Work Order Detail
rem
rem Author(s): J. Brewer
rem Revised: 04.26.2012
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
	masks$ = sp!.getParameter("MASKS")
	prod_qty = num(sp!.getParameter("PROD_QTY"))
	
rem --- masks$ will contain pairs of fields in a single string mask_name^mask|

	if len(masks$)>0
		if masks$(len(masks$),1)<>"|"
			masks$=masks$+"|"
		endif
	endif
	
	sv_wd$=dir("")
	chdir barista_wd$

rem --- Create a memory record set to hold results.
rem --- Columns for the record set are defined using a string template
	temp$="OP_CODE:C(1*), DESC:C(1*), STD_HRS:C(1*), ACT_HRS:C(1*), VAR_HRS:C(1*), VAR_HRS_PCT:C(1*), "
	temp$=temp$+"STD_AMT:C(1*), ACT_AMT:C(1*), VAR_AMT:C(1*), VAR_AMT_PCT:C(1*) "

	rs! = BBJAPI().createMemoryRecordSet(temp$)

rem --- Get Barista System Program directory

	sypdir$=""
	sypdir$=stbl("+DIR_SYP",err=*next)

rem --- Get masks

	pgmdir$=stbl("+DIR_PGM",err=*next)

	iv_cost_mask$=fngetmask$("iv_cost_mask","###,##0.0000-",masks$)
	sf_hours_mask$=fngetmask$("sf_hours_mask","#,##0.00",masks$)
	sf_pct_mask$=fngetmask$("sf_pct_mask","###.00",masks$)
	
rem --- Init totals

	tot_std_dir=0
	tot_std_oh=0
	tot_act_dir=0
	tot_act_oh=0
	wo_tot_std_hrs=0
	wo_tot_act_hrs=0
	wo_tot_std_amt=0
	wo_tot_act_amt=0

rem --- Open files with adc

    files=2,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]
	files$[1]="sfs_params",ids$[1]="SFS_PARAMS"

    call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],
:                                   ids$[all],templates$[all],channels[all],batch,status
    if status goto std_exit

	sfs_params=channels[1]

rem --- Dimension string templates

	dim sfs_params$:templates$[1]
	
goto no_bac_open
rem --- Open Files    
    num_files = 2
    dim open_tables$[1:num_files], open_opts$[1:num_files], open_chans$[1:num_files], open_tpls$[1:num_files]

	open_tables$[1]="SFS_PARAMS",     open_opts$[1] = "OTA"
	
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

	sfs_params = num(open_chans$[1])
	
	dim sfs_params$:open_tpls$[1]

no_bac_open:

rem --- Get proper Op Code Maintenance table

	read record (sfs_params,key=firm_id$+"SF00") sfs_params$
	bm$=sfs_params.bm_interface$
	if bm$<>"Y"
		files$[2]="sfm-02",ids$[2]="SFC_OPRTNCOD"
rem		open_tables$[5]="SFC_OPRTNCOD",open_opts$[5]="OTA"
	else
		files$[2]="bmm-08",ids$[2]="BMC_OPCODES"
rem		open_tables$[5]="BMC_OPCODES",open_opts$[5]="OTA"
	endif
    call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],
:                                   ids$[all],templates$[all],channels[all],batch,status
    if status goto std_exit
	
	opcode_dev=channels[2]
	dim opcode_tpl$:templates$[2]

rem --- Build SQL statement

rem	sql_prep$="select * from vw_sfx_wotranxr as vw_trans where vw_trans.firm_id = '"+firm_id$+"' and "
rem	sql_prep$=sql_prep$+"record_id = 'O' and wo_no = '"+wo_no$+"'"

	sql_prep$="select op_code, total_time, tot_std_cost, direct_rate, ovhd_rate "
	sql_prep$=sql_prep$+"from sfe_wooprtn where firm_id = '"+firm_id$+"' and wo_no = '"+wo_no$+"' and line_type = 'S'"
	
	sql_chan=sqlunt
	sqlopen(sql_chan,err=*next)stbl("+DBNAME")
	sqlprep(sql_chan)sql_prep$
	dim read_tpl$:sqltmpl(sql_chan)
	sqlexec(sql_chan)

rem --- Trip Read

	while 1
		read_tpl$ = sqlfetch(sql_chan,end=*break)

		data! = rs!.getEmptyRecordData()

		dim opcode_tpl$:fattr(opcode_tpl$)
		read record (opcode_dev,key=firm_id$+read_tpl.op_code$,dom=*next) opcode_tpl$
		data!.setFieldValue("OP_CODE",read_tpl.op_code$)
		data!.setFieldValue("DESC",opcode_tpl.code_desc$)
		data!.setFieldValue("STD_HRS",str(read_tpl.total_time:sf_hours_mask$))
rem		data!.setFieldValue("ACT_HRS",str(read_tpl.pcs_per_hour:sf_hours_mask$))
rem		data!.setFieldValue("VAR_HRS",str(read_tpl.direct_rate:sf_hours_mask$))
rem		data!.setFieldValue("VAR_HRS_PCT",str(read_tpl.ovhd_rate:sf_pct_mask$))
		data!.setFieldValue("STD_AMT",str(read_tpl.tot_std_cost:iv_cost_mask$))
rem		data!.setFieldValue("ACT_AMT",str(read_tpl.unit_cost:iv_cost_mask$))
rem		data!.setFieldValue("VAR_AMT",str(read_tpl.setup_time:iv_cost_mask$))
rem		data!.setFieldValue("VAR_AMT_PCT",str(read_tpl.total_time:sf_pct_mask$))

		rs!.insert(data!)

		tot_std_dir=tot_std_dir+read_tpl.total_time*read_tpl.direct_rate
		tot_std_oh=tot_std_oh+read_tpl.total_time*read_tpl.ovhd_rate
		tot_act_dir=0
		tot_act_oh=0
		wo_tot_std_hrs=wo_tot_std_hrs+read_tpl.total_time
		wo_tot_act_hrs=wo_tot_act_hrs+0
		wo_tot_std_amt=wo_tot_std_amt+read_tpl.tot_std_cost
		wo_tot_act_amt=wo_tot_act_amt+0

	wend

rem --- Output Totals

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("STD_AMT",fill(20,"_"))
	data!.setFieldValue("ACT_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT_PCT",fill(20,"_"))
	rs!.insert(data!)
	
	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("DESC","Direct Total")
	data!.setFieldValue("STD_AMT",str(tot_std_dir:iv_cost_mask$))
rem	data!.setFieldValue("ACT_AMT",str(tot_cost_ea:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT",str(tot_units_tot:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT_PCT",str(tot_cost_tot:sf_rate_mask$))
	rs!.insert(data!)

		data! = rs!.getEmptyRecordData()
	data!.setFieldValue("DESC","Overhead Total")
	data!.setFieldValue("STD_AMT",str(tot_std_oh:iv_cost_mask$))
rem	data!.setFieldValue("ACT_AMT",str(tot_cost_ea:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT",str(tot_units_tot:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT_PCT",str(tot_cost_tot:sf_rate_mask$))
	rs!.insert(data!)
	
	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("STD_AMT",fill(20,"_"))
	data!.setFieldValue("ACT_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT_PCT",fill(20,"_"))
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("DESC","Labor Total")
	data!.setFieldValue("STD_AMT",str(tot_std_dir+tot_std_oh:iv_cost_mask$))
rem	data!.setFieldValue("ACT_AMT",str(tot_cost_ea:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT",str(tot_units_tot:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT_PCT",str(tot_cost_tot:sf_rate_mask$))
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("DESC","Materials")
rem	data!.setFieldValue("STD_AMT",str(tot_units_ea:iv_cost_mask$))
rem	data!.setFieldValue("ACT_AMT",str(tot_cost_ea:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT",str(tot_units_tot:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT_PCT",str(tot_cost_tot:sf_rate_mask$))
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("DESC","Subcontracts")
rem	data!.setFieldValue("STD_AMT",str(tot_units_ea:iv_cost_mask$))
rem	data!.setFieldValue("ACT_AMT",str(tot_cost_ea:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT",str(tot_units_tot:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT_PCT",str(tot_cost_tot:sf_rate_mask$))
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("STD_HRS",fill(20,"_"))
	data!.setFieldValue("ACT_HRS",fill(20,"_"))
	data!.setFieldValue("VAR_HRS",fill(20,"_"))
	data!.setFieldValue("VAR_HRS_PCT",fill(20,"_"))
	data!.setFieldValue("STD_AMT",fill(20,"_"))
	data!.setFieldValue("ACT_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT_PCT",fill(20,"_"))
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("DESC","WO Totals")
	data!.setFieldValue("STD_HRS",str(wo_tot_std_hrs:iv_cost_mask$))
rem	data!.setFieldValue("ACT_HRS",str(tot_cost_ea:iv_cost_mask$))
rem	data!.setFieldValue("VAR_HRS",str(tot_units_tot:iv_cost_mask$))
rem	data!.setFieldValue("VAR_HRS_PCT",str(tot_cost_tot:sf_rate_mask$))
	data!.setFieldValue("STD_AMT",str(wo_tot_std_amt:iv_cost_mask$))
rem	data!.setFieldValue("ACT_AMT",str(tot_cost_ea:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT",str(tot_units_tot:iv_cost_mask$))
rem	data!.setFieldValue("VAR_AMT_PCT",str(tot_cost_tot:sf_rate_mask$))
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("STD_HRS",fill(20,"_"))
	data!.setFieldValue("ACT_HRS",fill(20,"_"))
	data!.setFieldValue("VAR_HRS",fill(20,"_"))
	data!.setFieldValue("VAR_HRS_PCT",fill(20,"_"))
	data!.setFieldValue("STD_AMT",fill(20,"_"))
	data!.setFieldValue("ACT_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT",fill(20,"_"))
	data!.setFieldValue("VAR_AMT_PCT",fill(20,"_"))
	rs!.insert(data!)

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("DESC","Per Unit Totals")
	if prod_qty<>0
		data!.setFieldValue("STD_HRS",str(wo_tot_std_hrs/prod_qty:iv_cost_mask$))
rem		data!.setFieldValue("ACT_HRS",str(tot_cost_ea:iv_cost_mask$))
rem		data!.setFieldValue("VAR_HRS",str(tot_units_tot:iv_cost_mask$))
rem		data!.setFieldValue("VAR_HRS_PCT",str(tot_cost_tot:sf_rate_mask$))
		data!.setFieldValue("STD_AMT",str(wo_tot_std_amt/prod_qty:iv_cost_mask$))
rem		data!.setFieldValue("ACT_AMT",str(tot_cost_ea:iv_cost_mask$))
rem		data!.setFieldValue("VAR_AMT",str(tot_units_tot:iv_cost_mask$))
rem		data!.setFieldValue("VAR_AMT_PCT",str(tot_cost_tot:sf_rate_mask$))
	endif
	rs!.insert(data!)

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

	def fngetmask$(q1$,q2$,q3$)
		rem --- q1$=mask name, q2$=default mask if not found in mask string, q3$=mask string from parameters
		q$=q2$
		if len(q1$)=0 return q$
		if q1$(len(q1$),1)<>"^" q1$=q1$+"^"
		q=pos(q1$=q3$)
		if q=0 return q$
		q$=q3$(q)
		q=pos("^"=q$)
		q$=q$(q+1)
		q=pos("|"=q$)
		q$=q$(1,q-1)
		return q$
	fnend


	std_exit:
	
	end
