[[SFE_WO_SUBADJ.ASIZ]]
rem --- Resize the grid

	if UserObj!<>null() then
		gridSubs!=UserObj!.getItem(num(user_tpl.gridSubsOfst$))
		gridSubs!.setSize(Form!.getWidth()-(gridSubs!.getX()*2),Form!.getHeight()-(gridSubs!.getY()+10))
		gridSubs!.setFitToGrid(1)
	endif
[[SFE_WO_SUBADJ.ACUS]]
rem --- Process custom event
rem --- Select/de-select checkboxes in grid and edit payment and discount amounts

rem This routine is executed when callbacks have been set to run a 'custom event'.
rem Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind of event it is.
rem See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info.

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ctl_ID=dec(gui_event.ID$)

	if ctl_ID <> num(user_tpl.gridSubsCtlID$) then break; rem --- exit callpoint

	if gui_event.code$="N"
		notify_base$=notice(gui_dev,gui_event.x%)
		dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
		notice$=notify_base$
	endif

	gridSubs! = UserObj!.getItem(num(user_tpl.gridSubsOfst$))
	numcols = gridSubs!.getNumColumns()
	vectSubs! = UserObj!.getItem(num(user_tpl.vectSubsOfst$))
rem	vectSubsMaster! = UserObj!.getItem(num(user_tpl.vectSubsMasterOfst$))
	curr_row = dec(notice.row$);rem 0 based
	curr_col = dec(notice.col$);rem 0 based

	switch notice.code
		case 12; rem --- grid_key_press
rem			if notice.wparam=32 gosub switch_value
			break

		case 14; rem --- grid_mouse_up
rem			if notice.col=0 gosub switch_value
			break

		case 7; rem --- edit stop

rem --- Units or Cost

		if curr_col = 5 or curr_col=7 then
			units=num(gridSubs!.getCellText(curr_row,5))
			cost=num(gridSubs!.getCellText(curr_row,7))
			tot_ext=units*cost
			gridSubs!.setCellText(curr_row,9,str(tot_ext))
rem				gosub get_master_offset
		endif

rem --- New Work Order Number

			if curr_col=10
				wo_no$=str(num(gridSubs!.getCellText(cur_row,10)):callpoint!.getDevObject("wo_no_mask"))
				sfe_womast=fnget_dev("SFE_WOMASTR")
				found=0
				while 1
					read (sfe_womast,key=firm$+"  "+wo_no$,dom=*break)
					found=1
					break
				wend
				if found=0
					msg_id$="INPUT_ERR_DATA"
					gosub disp_message
					
					callpoint!.setStatus("ABORT")
					break
				endif
rem				gosub get_master_offset
				gridSubs!.setCellText(curr_row,10,wo_no$)

rem				inv_amt = orig_inv_amt -  (abs(retent_amt) + abs(disc_amt) + abs(pmt_amt)) * sgn(orig_inv_amt)
rem				gridSubs!.setCellText(curr_row,8,str(inv_amt))
rem				vectSubs!.setItem(curr_row*num(user_tpl.gridSubsCols$)+9,str(disc_amt))
rem				vectSubs!.setItem(curr_row*num(user_tpl.gridSubsCols$)+10,str(pmt_amt))
rem			endif
		break
	swend
[[SFE_WO_SUBADJ.ASHO]]
rem --- Display Work Order Number

	wo_no$=callpoint!.getDevObject("wo_no")
	callpoint!.setColumnData("SFE_WO_SUBADJ.NEW_WO_NO",wo_no$,1)
[[SFE_WO_SUBADJ.AWIN]]
rem --- Open/Lock files

	use ::ado_util.src::util
	use ::ado_func.src::func

	num_files=5
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	open_tables$[1]="SFT_OPNSUBTR",open_opts$[1]="OTA"
	open_tables$[2]="APM_VENDMAST",open_opts$[2]="OTA"
	open_tables$[3]="SFS_PARAMS",open_opts$[3]="OTA"
	open_tables$[4]="SFE_WOSUBADJ",open_opts$[4]="OTA"
	open_tables$[5]="SFE_WOMASTR",open_opts$[5]="OTA"

	gosub open_tables

	sft31_dev=num(open_chans$[1]),sft31_tpl$=open_tpls$[1]
	apm01_dev=num(open_chans$[2]),apm01_tpl$=open_tpls$[2]
	sfs_params=num(open_chans$[3]),sfs_params_tpl$=open_tpls$[3]

rem --- Dimension string templates

	dim sft31a$:sft31_tpl$
	dim apm01a$:apm01_tpl$
	dim sfs_params$:sfs_params_tpl$

rem --- Get parameter record

	readrecord(sfs_params,key=firm_id$+"SF00")sfs_params$

rem --- Add grid to store invoices, with checkboxes for user to select one or more

	user_tpl_str$ = "gridSubsOfst:c(5), " +
:		"gridSubsCols:c(5), " +
:		"gridSubsRows:c(5), " +
:		"gridSubsCtlID:c(5)," +
:		"vectSubsOfst:c(5)"
	dim user_tpl$:user_tpl_str$

	UserObj! = BBjAPI().makeVector()
	vectSubs! = BBjAPI().makeVector()
	nxt_ctlID = util.getNextControlID()

	gridSubs! = Form!.addGrid(nxt_ctlID,5,40,900,300); rem --- ID, x, y, width, height

	user_tpl.gridSubsCtlID$ = str(nxt_ctlID)
	user_tpl.gridSubsCols$ = "12"
	user_tpl.gridSubsRows$ = "10"
	callpoint!.setDevObject("wo_no_len",len(sft31a.wo_no$))
	callpoint!.setDevObject("wo_no_mask",fill(len(sft31a.wo_no$),"0"))

	gosub format_grid
	util.resizeWindow(Form!, SysGui!)

	UserObj!.addItem(gridSubs!)
	user_tpl.gridSubsOfst$="0"

	UserObj!.addItem(vectSubs!); rem --- vector of Open Subs
	user_tpl.vectSubsOfst$="1"

rem --- Misc other init

	gridSubs!.setColumnEditable(5,1)
	gridSubs!.setColumnEditable(7,1)
	gridSubs!.setColumnEditable(10,1)
	gridSubs!.setColumnEditable(11,1)
	gridSubs!.setTabAction(SysGUI!.GRID_NAVIGATE_LEGACY)
	gridSubs!.setTabAction(gridSubs!.GRID_NAVIGATE_GRID)
	gridSubs!.setTabActionSkipsNonEditableCells(1)

	gosub create_reports_vector
	gosub fill_grid

rem --- Set callbacks - processed in ACUS callpoint

	gridSubs!.setCallback(gridSubs!.ON_GRID_KEY_PRESS,"custom_event")
	gridSubs!.setCallback(gridSubs!.ON_GRID_MOUSE_UP,"custom_event")
	gridSubs!.setCallback(gridSubs!.ON_GRID_EDIT_STOP,"custom_event")
[[SFE_WO_SUBADJ.<CUSTOM>]]
rem ==========================================================================
format_grid: rem --- Use Barista program to format the grid
rem ==========================================================================

	call stbl("+DIR_PGM")+"adc_getmask.aon","","SF","A","",m1$,0,0

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0] = callpoint!.getColumnAttributeTypes()
	def_sub_cols = num(user_tpl.gridSubsCols$)
	num_rpts_rows = num(user_tpl.gridSubsRows$)
	dim attr_sub_col$[def_sub_cols,len(attr_def_col_str$[0,0])/5]

	attr_sub_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_TRANS_DATE"
	attr_sub_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_TRANSACTION_DATE")
	attr_sub_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="40"

	attr_sub_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="VEND_ID"
	attr_sub_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_VENDOR")
	attr_sub_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

	attr_sub_col$[3,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="VEND_NAME"
	attr_sub_col$[3,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_NAME")
	attr_sub_col$[3,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="180"

	attr_sub_col$[4,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="PO_NO"
	attr_sub_col$[4,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_PO_NO")
	attr_sub_col$[4,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="75"

	attr_sub_col$[5,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_UNITS"
	attr_sub_col$[5,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_UNITS")
	attr_sub_col$[5,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_sub_col$[5,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[5,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_sub_col$[6,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_UNITS"
	attr_sub_col$[6,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_UNITS")
	attr_sub_col$[6,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_sub_col$[6,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[6,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_sub_col$[7,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_COST"
	attr_sub_col$[7,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_COST")
	attr_sub_col$[7,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_sub_col$[7,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[7,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_sub_col$[8,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_COST"
	attr_sub_col$[8,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_COST")
	attr_sub_col$[8,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_sub_col$[8,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[8,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_sub_col$[9,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_EXT"
	attr_sub_col$[9,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_TOTAL")
	attr_sub_col$[9,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_sub_col$[9,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[9,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_sub_col$[10,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_EXT"
	attr_sub_col$[10,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_TOTAL")
	attr_sub_col$[10,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_sub_col$[10,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[10,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_sub_col$[11,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_WO"
	attr_sub_col$[11,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_WO")
	attr_sub_col$[11,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="C"
	attr_sub_col$[11,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[11,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=callpoint!.getDevObject("wo_no_mask")
	attr_sub_col$[11,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]=str(callpoint!.getDevObject("wo_no_len"))
	attr_sub_col$[11,fnstr_pos("DTAB",attr_def_col_str$[0,0],5)]="SFE_WOMASTR"
	attr_sub_col$[11,fnstr_pos("DCOL",attr_def_col_str$[0,0],5)]="DESC"

	attr_sub_col$[12,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_DATE"
	attr_sub_col$[12,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_DATE")
	attr_sub_col$[12,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_sub_col$[12,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="5"
	attr_sub_col$[12,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"

	for curr_attr=1 to def_sub_cols
		attr_sub_col$[0,1] = attr_sub_col$[0,1] + 
:			pad("SFE_WO_SUBADJ." + attr_sub_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
	next curr_attr

	attr_disp_col$=attr_sub_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,gridSubs!,"COLH-LINES-LIGHT-SIZEC-DATES",num_rpts_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_sub_col$[all]

	return

rem ==========================================================================
fill_grid: rem --- Fill the grid with data in vectSubs!
rem ==========================================================================

	SysGUI!.setRepaintEnabled(0)
	gridSubs! = UserObj!.getItem(num(user_tpl.gridSubsOfst$))
	minrows = num(user_tpl.gridSubsRows$)

	if vectSubs!.size() then
		numrow = vectSubs!.size() / gridSubs!.getNumColumns()
		gridSubs!.clearMainGrid()
		gridSubs!.setNumRows(numrow)
		gridSubs!.setCellText(0,0,vectSubs!)
	else
		gridSubs!.clearMainGrid()
		gridSubs!.setNumRows(0)
	endif

	SysGUI!.setRepaintEnabled(1)

	return

rem ==========================================================================
create_reports_vector: rem --- Create a vector from the file to fill the grid
rem ==========================================================================

	sfe_subadj=fnget_dev("SFE_WOSUBADJ")

	call stbl("+DIR_PGM")+"adc_getmask.aon","VENDOR_ID","","","",m0$,0,vendor_len
	more=1
	wo_loc$=callpoint!.getDevObject("wo_loc")
	wo_no$=callpoint!.getDevObject("wo_no")
	read (sft31_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)

	while more
		read record (sft31_dev, end=*break) sft31a$
		if pos(firm_id$=sft31a$)<>1 then break
		if wo_no$<>sft31a.wo_no$ break
		dim apm01a$:fattr(apm01a$)
		read record(apm01_dev, key=firm_id$+sft31a.vendor_id$, dom=*next) apm01a$
		dim sfe_subadj$:fnget_tpl$("SFE_WOSUBADJ")
		read record (sfe_subadj,key=firm_id$+wo_loc$+wo_no$+sft31a.trans_date$+sft31a.trans_seq$,dom=*next)sfe_subadj$

	rem --- Now fill vectors

		vectSubs!.addItem(fndate$(sft31a.trans_date$)); rem 0
		vectSubs!.addItem(func.alphaMask(sft31a.vendor_id$(1,vendor_len),m0$)); rem 1
		vectSubs!.addItem(apm01a.vendor_name$); rem 2
		vectSubs!.addItem(sft31a.po_no$); rem 3
		vectSubs!.addItem(str(sft31a.units)); rem 4
		vectSubs!.addItem(str(sfe_subadj.new_units)); rem 5
		vectSubs!.addItem(str(sft31a.unit_cost)); rem 6
		vectSubs!.addItem(str(sfe_subadj.new_unit_cst)); rem 7
		vectSubs!.addItem(str(sft31a.ext_cost)); rem 8
		vectSubs!.addItem(str(sfe_subadj.new_units*sfe_subadj.new_unit_cst)); rem 9
		vectSubs!.addItem(sfe_subadj.new_trn_date$); rem 10
		vectSubs!.addItem(sfe_subadj.new_trn_date$); rem 11
	wend

	callpoint!.setStatus("REFRESH")
	
	return
