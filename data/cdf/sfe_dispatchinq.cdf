[[SFE_DISPATCHINQ.OP_CODE.AVAL]]
rem --- Get Queue Time and Pieces per Hour

	opcode=callpoint!.getDevObject("opcode_chan")
	dim opcode$:callpoint!.getDevObject("opcode_tpl")

	read record (opcode,key=firm_id$+callpoint!.getUserInput(),dom=*next) opcode$
	callpoint!.setColumnData("<<DISPLAY>>.PCS_PER_HOUR",str(opcode.pcs_per_hour),1)
	callpoint!.setColumnData("<<DISPLAY>>.QUEUE_TIME",str(opcode_queue_time),1)
[[SFE_DISPATCHINQ.AWIN]]
rem --- Open/Lock files

	use ::ado_util.src::util

	num_files=6
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	open_tables$[1]="SFE_WOMASTR",open_opts$[1]="OTA"
	open_tables$[2]="SFE_WOOPRTN",open_opts$[2]="OTA"
	open_tables$[3]="SFE_WOSCHDL",open_opts$[3]="OTA"
	open_tables$[4]="SFM_OPCALNDR",open_opts$[4]="OTA"
	open_tables$[5]="SFT_OPNOPRTR",open_opts$[5]="OTA"
	open_tables$[6]="SFS_PARAMS",open_opts$[6]="OTA"

	gosub open_tables

	sfe01_dev=num(open_chans$[1]),sfe01_tpl$=open_tpls$[1]
	sfe02_dev=num(open_chans$[2]),sfe02_tpl$=open_tpls$[2]
	sfm05_dev=num(open_chans$[3]),sfm05_tpl$=open_tpls$[3]
	sfm04_dev=num(open_chans$[4]),sfm04_tpl$=open_tpls$[4]
	sft01_dev=num(open_chans$[5]),sft01_tpl$=open_tpls$[5]
	sfs_params=num(open_chans$[6]),sfs_params_tpl$=open_tpls$[6]

rem --- Dimension string templates

	dim sfe01a$:sfe01_tpl$,sfe02a$:sfe02_tpl$,sfm05a$:sfm05_tpl$
	dim sfm04a$:sfm04_tpl$,sft01a$:sft01_tpl$,sfs_params$:sfs_params_tpl$

rem --- Get parameter record

	readrecord(sfs_params,key=firm_id$+"SF00",dom=std_missing_params)sfs_params$
	bm$=sfs_params.bm_interface$

rem --- Figure out which Op Code Maintenance file to open
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	if bm$<>"Y"
		call stbl("+DIR_PGM")+"adc_application.aon","BM",info$[all]
		bm$=info$[20]
		open_tables$[1]="SFC_OPRTNCOD",open_opts$[1]="OTA"
	else
		open_tables$[1]="BMC_OPCODES",open_opts$[1]="OTA"
	endif
	callpoint!.setDevObject("bm",bm$)
	x$=stbl("bm",bm$)

	gosub open_tables

	callpoint!.setDevObject("opcode_chan",num(open_chans$[1]))
	callpoint!.setDevObject("opcode_tpl",open_tpls$[1])

rem --- Add grid to show Dispatch records

	user_tpl_str$ = "gridDispatchOffset:c(5), " +
:		"gridDispatchCols:c(5), " +
:		"gridDispatchRows:c(5), " +
:		"gridDispatchCtlID:c(5)," +
:		"vectDispatchOffset:c(5)"
	dim user_tpl$:user_tpl_str$

	UserObj! = BBjAPI().makeVector()
	vectDispatch! = BBjAPI().makeVector()
	nxt_ctlID = util.getNextControlID()

	gridDispatch! = Form!.addGrid(nxt_ctlID,5,140,800,300); rem --- ID, x, y, width, height

	user_tpl.gridDispatchCtlID$ = str(nxt_ctlID)
	user_tpl.gridDispatchCols$ = "10"
	user_tpl.gridDispatchRows$ = "14"

	gosub format_grid
	util.resizeWindow(Form!, SysGui!)

	UserObj!.addItem(gridDispatch!)
	user_tpl.gridDispatchOffset$="0"

	UserObj!.addItem(vectDispatch!); rem --- vector of filtered recs
	user_tpl.vectDispatchOffset$="1"

	gosub create_reports_vector
	gosub fill_grid
[[SFE_DISPATCHINQ.<CUSTOM>]]
rem ==========================================================================
format_grid: rem --- Use Barista program to format the grid
rem ==========================================================================

	call stbl("+DIR_PGM")+"adc_getmask.aon","","SF","H","",m1$,0,0

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0] = callpoint!.getColumnAttributeTypes()
	def_inv_cols = num(user_tpl.gridDispatchCols$)
	num_rpts_rows = num(user_tpl.gridDispatchRows$)
	dim attr_inv_col$[def_inv_cols,len(attr_def_col_str$[0,0])/5]

	attr_inv_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="DATE_REQ"
	attr_inv_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Date Req'd"
	attr_inv_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_inv_col$[1,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="5"
	attr_inv_col$[1,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"

	attr_inv_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="PRI_CODE"
	attr_inv_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Priority Code"
	attr_inv_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

	attr_inv_col$[3,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="WO_STAT"
	attr_inv_col$[3,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="WO Status"
	attr_inv_col$[3,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

	attr_inv_col$[4,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="WO_NO"
	attr_inv_col$[4,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_WORK_ORDER")
	attr_inv_col$[4,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="30"

	attr_inv_col$[5,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="DESC"
	attr_inv_col$[5,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_DESCRIPTION")
	attr_inv_col$[5,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="150"

	attr_inv_col$[6,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="AT_OP"
	attr_inv_col$[6,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="At Oper"
	attr_inv_col$[6,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

	attr_inv_col$[7,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="FROM_OP"
	attr_inv_col$[7,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="From Op"
	attr_inv_col$[7,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

	attr_inv_col$[8,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="SETUP_TIME"
	attr_inv_col$[8,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_SETUP")+"^"+Translate!.getTranslation("AON_TIME")
	attr_inv_col$[8,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="25"
	attr_inv_col$[8,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_inv_col$[9,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="RUN_TIME"
	attr_inv_col$[9,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_RUN")+"^"+Translate!.getTranslation("AON_TIME")
	attr_inv_col$[9,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_inv_col$[9,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="25"
	attr_inv_col$[9,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_inv_col$[10,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="MOVE_TIME"
	attr_inv_col$[10,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_MOVE")+"^"+Translate!.getTranslation("AON_TIME")
	attr_inv_col$[10,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_inv_col$[10,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="25"
	attr_inv_col$[10,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	for curr_attr=1 to def_inv_cols
		attr_inv_col$[0,1] = attr_inv_col$[0,1] + 
:			pad("SFE_DISPATCH." + attr_inv_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
	next curr_attr

	attr_disp_col$=attr_inv_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,gridDispatch!,"COLH-LINES-LIGHT-AUTO-MULTI-SIZEC-CHECKS-DATES",num_rpts_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_inv_col$[all]

	return

rem ==========================================================================
fill_grid: rem --- Fill the grid with data in vectDispatch!
rem ==========================================================================
return
	SysGUI!.setRepaintEnabled(0)
	gridDispatch! = UserObj!.getItem(num(user_tpl.gridDispatchOffset$))
	minrows = num(user_tpl.gridDispatchRows$)

	if vectDispatch!.size() then
		numrow = vectDispatch!.size() / gridDispatch!.getNumColumns()
		gridDispatch!.clearMainGrid()
		gridDispatch!.setColumnStyle(0,SysGUI!.GRID_STYLE_UNCHECKED)
		gridDispatch!.setNumRows(numrow)
		gridDispatch!.setCellText(0,0,vectDispatch!)

		for wk=0 to vectDispatch!.size()-1 step gridDispatch!.getNumColumns()
			if vectDispatch!.getItem(wk) = "Y" then 
				gridDispatch!.setCellStyle(wk / gridDispatch!.getNumColumns(), 0, SysGUI!.GRID_STYLE_CHECKED)
			endif
			gridDispatch!.setCellText(wk / gridDispatch!.getNumColumns(), 0, "")
		next wk

		gridDispatch!.resort()
	else
		gridDispatch!.clearMainGrid()
		gridDispatch!.setColumnStyle(0, SysGUI!.GRID_STYLE_UNCHECKED)
		gridDispatch!.setNumRows(0)
	endif

	SysGUI!.setRepaintEnabled(1)

	return

rem ==========================================================================
create_reports_vector: rem --- Create a vector from the file to fill the grid
rem ==========================================================================
return
	call stbl("+DIR_PGM")+"adc_getmask.aon","VENDOR_ID","","","",m0$,0,vendor_len
	more=1
	read (apt01_dev,key=firm_id$,dom=*next)
	rows=0

	while more
		read record (apt01_dev, end=*break) apt01a$
		if pos(firm_id$=apt01a$)<>1 then break
		read (ape01_dev, key=firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$, dom=*next); continue
		dim apm01a$:fattr(apm01a$)
		read record(apm01_dev, key=firm_id$+apt01a.vendor_id$, dom=*next) apm01a$
		read record(apt11_dev, key=firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$, dom=*next)

		while more
			readrecord(apt11_dev,end=*break)apt11a$

			if pos(firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$ =
:				    firm_id$+apt11a.ap_type$+apt11a.vendor_id$+apt11a.ap_inv_no$) <> 1 
:			then 
				break
			endif

			apt01a.invoice_amt = apt01a.invoice_amt + apt11a.trans_amt
			apt01a.discount_amt = apt01a.discount_amt + apt11a.trans_disc
		wend
		if apt01a.discount_amt<0 then apt01a.discount_amt=0

	rem --- override discount and payment amounts if already in ape04 (computer checks)

		disc_amt=apt01a.discount_amt
		pymnt_amt=0
		dim ape04a$:fattr(ape04a$)
		read record(ape04_dev, key=firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$, dom=*next) ape04a$

		if cvs(ape04a.firm_id$,2)<>""
			disc_amt  = ape04a.discount_amt
			pymnt_amt = ape04a.invoice_amt
		endif

	rem --- Now fill vectors
	rem --- Items 1 thru n+1 in DispatchMaster must equal items 0 thru n in Dispatch

		if apt01a.invoice_amt<>0 then
			vectDispatch!.addItem(apt01a.selected_for_pay$); rem 0
			vectDispatch!.addItem(apt01a.payment_grp$); rem 1
			vectDispatch!.addItem(apt01a.ap_type$); rem 2
			vectDispatch!.addItem(func.alphaMask(apt01a.vendor_id$(1,vendor_len),m0$)); rem 3
			vectDispatch!.addItem(apm01a.vendor_name$); rem 4
			vectDispatch!.addItem(apt01a.ap_inv_no$); rem 5
			vectDispatch!.addItem(date(jul(apt01a.inv_due_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID"))); rem 6
			vectDispatch!.addItem(date(jul(apt01a.disc_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID"))); rem 7
			vectDispatch!.addItem(str(apt01a.invoice_amt - apt01a.retention - disc_amt - pymnt_amt)); rem 8
			vectDispatch!.addItem(str(disc_amt)); rem 9
			vectDispatch!.addItem(str(pymnt_amt)); rem 10
			vectDispatch!.addItem(apt01a.retention$); rem 11

			vectDispatchMaster!.addItem("Y"); rem 0
			vectDispatchMaster!.addItem(apt01a.selected_for_pay$); rem 1
			vectDispatchMaster!.addItem(apt01a.payment_grp$); rem 2
			vectDispatchMaster!.addItem(apt01a.ap_type$); rem 3
			vectDispatchMaster!.addItem(func.alphaMask(apt01a.vendor_id$(1,vendor_len),m0$)); rem 4
			vectDispatchMaster!.addItem(apm01a.vendor_name$); rem 5
			vectDispatchMaster!.addItem(apt01a.ap_inv_no$); rem 6
			vectDispatchMaster!.addItem(date(jul(apt01a.inv_due_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID"))); rem 7
			vectDispatchMaster!.addItem(date(jul(apt01a.disc_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID"))); rem 8
			vectDispatchMaster!.addItem(str(apt01a.invoice_amt - apt01a.retention - disc_amt - pymnt_amt)); rem 9
			vectDispatchMaster!.addItem(str(disc_amt)); rem 10
			vectDispatchMaster!.addItem(str(pymnt_amt)); rem 11
			vectDispatchMaster!.addItem(apt01a.retention$); rem 12
			vectDispatchMaster!.addItem(apt01a.inv_due_date$); rem 13
			vectDispatchMaster!.addItem(apt01a.vendor_id$); rem 14
			vectDispatchMaster!.addItem(apt01a.disc_date$); rem 15
			vectDispatchMaster!.addItem(apt01a.invoice_amt$); rem 16
			rows=rows+1
		endif
	wend

	callpoint!.setStatus("REFRESH")
	
	return

rem ==========================================================================
#include std_missing_params.src
rem ==========================================================================
[[SFE_DISPATCHINQ.ASIZ]]
rem --- Resize the grid

	if UserObj!<>null() then
		gridDispatch!=UserObj!.getItem(num(user_tpl.gridDispatchOffset$))
		gridDispatch!.setColumnWidth(0,25)
		gridDispatch!.setColumnWidth(1,50)
		gridDispatch!.setSize(Form!.getWidth()-(gridDispatch!.getX()*2),Form!.getHeight()-(gridDispatch!.getY()+10))
		gridDispatch!.setFitToGrid(1)
	endif
