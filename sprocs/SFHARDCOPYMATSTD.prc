rem ----------------------------------------------------------------------------
rem Program: SFHARDCOPYOMATSTD.prc
rem Description: Stored Procedure to get the Shop Floor Hard Copy Material info into iReports
rem Used for Hard Copy, Traveler, Work Order Closed Detail and Work Order Detail
rem
rem Author(s): J. Brewer
rem Revised: 04.18.2012
rem
rem AddonSoftware
rem Copyright BASIS International Ltd.
rem ----------------------------------------------------------------------------

seterr sproc_error

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
	report_type$ = sp!.getParameter("REPORT_TYPE")
	item_len = num(sp!.getParameter("ITEM_LEN_PARAM"))
	print_costs$ = sp!.getParameter("PRINT_COSTS")

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
	temp$="REF_NO:C(1*), ITEM:C(1*), OP_SEQ:C(1*), SCRAP:C(1*), DIVISOR:C(1*), FACTOR:C(1*), "
	temp$=temp$+"QTY_REQ:C(1*), UNITS_EA:C(1*), COST_EA:C(1*), UNITS_TOT:C(1*), COST_TOT:C(1*), "
	temp$=temp$+"THIS_IS_TOTAL_LINE:C(1*), COST_EA_RAW:C(1*), COST_TOT_RAW:C(1*) "	
	
	rs! = BBJAPI().createMemoryRecordSet(temp$)

rem --- Get Barista System Program directory

	sypdir$=""
	sypdir$=stbl("+DIR_SYP",err=*next)

rem --- Get masks

rem	x$=stbl("+USER_ID","admin")
rem	call stbl("+DIR_SYP")+"bas_process_beg.bbj",stbl("+USER_ID"),rd_table_chans$[all]

	pgmdir$=stbl("+DIR_PGM",err=*next)

	iv_cost_mask$=fngetmask$("iv_cost_mask","###,##0.0000-",masks$)
	sf_cost_mask$=fngetmask$("sf_cost_mask","###,##0.0000-",masks$)
	sf_amt_mask$=fngetmask$("sf_amt_mask","###,##0.00-",masks$)
	sf_hours_mask$=fngetmask$("sf_hours_mask","#,##0.00",masks$)
	sf_units_mask$=fngetmask$("sf_units_mask","#,##0.00",masks$)
	sf_rate_mask$=fngetmask$("sf_rate_mask","###.00",masks$)
	sf_matlfact_mask$=fngetmask$("sf_matlfact_mask","###.0",masks$)
	

rem --- Init totals and max itemPlusDesc len

	tot_cost_ea=0
	tot_cost_tot=0
	
	max_itemPlusDesc_len=48; rem Max real estate available for lines printing Item and Desc
	                         rem Pgm logic sends item_ID(1,IVParamItemLen) plus as much desc as fits
	itemPlusDesc_fudge=1.4; rem Fudge factor to deal w/the proportional font we use as standard
	
rem --- Open files with adc

    files=5,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]
    files$[1]="ivm-01",ids$[1]="IVM_ITEMMAST"
	files$[2]="arm-01",ids$[2]="ARM_CUSTMAST"
	files$[3]="sfs_params",ids$[3]="SFS_PARAMS"
	files$[4]="sfe-02",ids$[4]="SFE_WOOPRTN"
	
    call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],
:                                   ids$[all],templates$[all],channels[all],batch,status
    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
    ivm_itemmast_dev=channels[1]
	arm_custmast=channels[2]
	sfs_params=channels[3]
	sfe02_dev=channels[4]

rem --- Dimension string templates

	dim ivm_itemmast$:templates$[1]
	dim arm_custmast$:templates$[2]
	dim sfs_params$:templates$[3]
	dim sfe02a$:templates$[4]
	
rem --- Get proper Op Code Maintenance table

	read record (sfs_params,key=firm_id$+"SF00") sfs_params$
	bm$=sfs_params.bm_interface$
	if bm$<>"Y"
		files$[5]="sfm-02",ids$[5]="SFC_OPRTNCOD"
	else
		files$[5]="bmm-08",ids$[5]="BMC_OPCODES"
	endif
    call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],
:                                   ids$[all],templates$[all],channels[all],batch,status
    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
	
	opcode_dev=channels[5]
	dim opcode_tpl$:templates$[5]
	
rem --- generate vector for use with Op Sequence

	SysGUI!=BBjAPI()
	ops_lines!=SysGUI!.makeVector()
	ops_list!=SysGUI!.makeVector()

	read(sfe02_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
	while 1
		read record (sfe02_dev,end=*break) sfe02a$
		if pos(firm_id$+wo_loc$+wo_no$=sfe02a$)<>1 break
		if sfe02a.line_type$<>"S" continue
		dim opcode_tpl$:fattr(opcode_tpl$)
		read record (opcode_dev,key=firm_id$+sfe02a.op_code$,dom=*next)opcode_tpl$
		ops_lines!.addItem(sfe02a.internal_seq_no$)
		op_code_list$=op_code_list$+sfe02a.op_code$
		work_var=pos(sfe02a.op_code$=op_code_list$,len(sfe02a.op_code$),0)
		if work_var>1
			work_var$=sfe02a.op_code$+"("+str(work_var)+")"
		else
			work_var$=sfe02a.op_code$
		endif
REM		ops_list!.addItem(work_var$+" - "+opcode_tpl.code_desc$) ; REM TEMPORARILY REM'D
		ops_list!.addItem(work_var$)		
	wend

rem --- Build SQL statement

	sql_prep$="select wo_ref_num, item_id, oper_seq_ref, scrap_factor, divisor, alt_factor, qty_required, "
	sql_prep$=sql_prep$+"units, unit_cost, total_units, total_cost, line_type, ext_comments "
	sql_prep$=sql_prep$+"from sfe_womatl where firm_id = '"+firm_id$+"' and wo_location = '"+wo_loc$+"' and wo_no = '"+wo_no$+"'"
	
	sql_chan=sqlunt
	sqlopen(sql_chan,mode="PROCEDURE",err=*next)stbl("+DBNAME")
	sqlprep(sql_chan)sql_prep$
	dim read_tpl$:sqltmpl(sql_chan)
	sqlexec(sql_chan)

rem --- Trip Read

	tot_recs=0
	while 1
		read_tpl$ = sqlfetch(sql_chan,end=*break)

		data! = rs!.getEmptyRecordData()

		dim ivm_itemmast$:fattr(ivm_itemmast$)
		read record (ivm_itemmast_dev,key=firm_id$+read_tpl.item_id$,dom=*next) ivm_itemmast$
		
		if read_tpl.line_type$="M"
			rem --- Send data row for Memos
			data!.setFieldValue("ITEM",read_tpl.ext_comments$); rem Note: Memos are allowed more print space
			rs!.insert(data!)
		else
			rem --- Send data row for non-Memos
			data!.setFieldValue("REF_NO",read_tpl.wo_ref_num$)
			
			gosub build_itemfield
			data!.setFieldValue("ITEM",item_n_desc1$); rem From build_itemfield routine
			
			if cvs(read_tpl.oper_seq_ref$,3)<>""
				if ops_lines!.size()
					for x=0 to ops_lines!.size()-1
						if read_tpl.oper_seq_ref$=ops_lines!.getItem(x)
							data!.setFieldValue("OP_SEQ",ops_list!.getItem(x))
						endif
					next x
				endif
			endif
			
			data!.setFieldValue("SCRAP",str(read_tpl.scrap_factor:sf_matlfact_mask$))
			data!.setFieldValue("DIVISOR",str(read_tpl.divisor:sf_matlfact_mask$))
			data!.setFieldValue("FACTOR",str(read_tpl.alt_factor:sf_matlfact_mask$))
			data!.setFieldValue("QTY_REQ",str(read_tpl.qty_required:sf_units_mask$))
			data!.setFieldValue("UNITS_EA",str(read_tpl.units:sf_units_mask$))
			data!.setFieldValue("UNITS_TOT",str(read_tpl.total_units:sf_units_mask$))
			
			if print_costs$="Y"
				data!.setFieldValue("COST_EA",str(read_tpl.unit_cost:sf_cost_mask$))
				data!.setFieldValue("COST_TOT",str(read_tpl.total_cost:sf_amt_mask$))
			endif
			
			rs!.insert(data!)		

			rem --- For non-Travelers, print 2nd line w/rest of the item desc if not all would fit
			if report_type$<>"T"
				if cvs(item_n_desc2$,2)<>""	
					data! = rs!.getEmptyRecordData()
					data!.setFieldValue("ITEM","  "+item_n_desc2$)
					rs!.insert(data!)
				endif
			endif
		endif
		
		tot_recs=tot_recs+1
		tot_cost_ea=tot_cost_ea+read_tpl.unit_cost
		tot_cost_tot=tot_cost_tot+read_tpl.total_cost
	wend

rem --- Output Totals
rem --- Note: The report jasper report definition draws a top line for these totals

	if tot_recs>0 
		data! = rs!.getEmptyRecordData()
		data!.setFieldValue("THIS_IS_TOTAL_LINE","Y")

		if print_costs$="Y"
			data!.setFieldValue("ITEM","Total Materials")
			data!.setFieldValue("COST_EA",str(tot_cost_ea:sf_cost_mask$))
			data!.setFieldValue("COST_TOT",str(tot_cost_tot:sf_amt_mask$))
			data!.setFieldValue("COST_EA_RAW",str(tot_cost_ea))
			data!.setFieldValue("COST_TOT_RAW",str(tot_cost_tot))
		else
			data!.setFieldValue("ITEM","")
			data!.setFieldValue("COST_EA","0")
			data!.setFieldValue("COST_TOT","0")
			data!.setFieldValue("COST_EA_RAW","0")
			data!.setFieldValue("COST_TOT_RAW","0")	
		endif
		
		rs!.insert(data!)
		
	endif
	
rem --- Tell the stored procedure to return the result set.

	sp!.setRecordSet(rs!)
	goto std_exit

build_itemfield: rem --- Build ITEM field for non-Memos: Item plus Desc
rem --   The routine is for non-memos, 
rem --     - The ITEM field is a combo of the item plus as much desc as possible.
rem --     - Space for the item uses the number of chars from IV Params Item Len.
rem --     - As much desc as possible is appended to the ITEM field after the item id.
rem --     - Change the constant, max_itemPlusDesc_len, to allow more desc to print.
rem --     - Non-Travelers, since they aren't printed and number of pages isn't an issue, 
rem --       have a second line of description if the Desc Len IV Param is set to have more
rem --       than prints on the main line.
rem ---  Memos are handled in main code: 
rem --     - The ITEM field is the memo itself.
rem --     - The full memo prints because there are no numeric cols taking space.

	rem --- Build ITEM field based on report type and item len param
		temp_itemPlusDesc$=read_tpl.item_id$(1,item_len)+"  "+cvs(ivm_itemmast.item_desc$,2)
		
	rem --- To fit the form, if temp_itemPlusDesc$ is too long make it two lines
		if len(temp_itemPlusDesc$)>max_itemPlusDesc_len
			item_n_desc1$=temp_itemPlusDesc$(1,max_itemPlusDesc_len)
			item_n_desc2$=fill(int(item_len*itemPlusDesc_fudge)," ")+"  "+temp_itemPlusDesc$(max_itemPlusDesc_len+1)
			if len(item_n_desc2$)>max_itemPlusDesc_len
				item_n_desc2$=item_n_desc2$(1,max_itemPlusDesc_len)
			endif
		else
			item_n_desc1$=temp_itemPlusDesc$
			item_n_desc2$=""
			endif
		endif	

return

	
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

sproc_error:rem --- SPROC error trap/handler
    rd_err_text$="", err_num=err
    if tcb(2)=0 and tcb(5) then rd_err_text$=pgm(tcb(5),tcb(13),err=*next)
    x$=stbl("+THROWN_ERR","TRUE")   
    throw "["+pgm(-2)+"] "+str(tcb(5))+": "+rd_err_text$,err_num

	std_exit:
	
	end
