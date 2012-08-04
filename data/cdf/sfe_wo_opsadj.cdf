[[SFE_WO_OPSADJ.ARAR]]
rem --- Display Work Order Number

	wo_no$=callpoint!.getDevObject("wo_no")
	callpoint!.setColumnData("SFE_WO_OPSADJ.WO_NO",wo_no$,1)
[[SFE_WO_OPSADJ.ASVA]]
rem --- Now write the Adjustment Entry records out

	vectOps! = UserObj!.getItem(num(user_tpl.vectOpsOfst$))
	vectOpsMaster! = UserObj!.getItem(num(user_tpl.vectOpsMasterOfst$))

	sfe_opsadj=fnget_dev("SFE_WOOPRADJ")
	dim sfe_opsadj$:fnget_tpl$("SFE_WOOPRADJ")

	cols=num(user_tpl.gridOpsCols$)
	mast=0
	wo_no$=callpoint!.getDevObject("wo_no")
	wo_loc$=callpoint!.getDevObject("wo_loc")

	if vectOps!.size()
		for x=0 to vectOps!.size()-1 step cols
			tran_date$=vectOps!.getItem(x)
			tran_seq$=vectOpsMaster!.getItem(mast)
			old_dir_rate=num(vectOps!.getItem(x+4))
			new_dir_rate=num(vectOps!.getItem(x+5))
			old_ovr_rate=num(vectOps!.getItem(x+6))
			new_ovr_rate=num(vectOps!.getItem(x+7))
			old_set_hrs=num(vectOps!.getItem(x+8))
			new_set_hrs=num(vectOps!.getItem(x+9))
			old_units=num(vectOps!.getItem(x+10))
			new_units=num(vectOps!.getItem(x+11))
			old_qty_comp=num(vectOps!.getItem(x+14))
			new_qty_comp=num(vectOps!.getItem(x+15))
			new_wo$=vectOps!.getItem(x+16)
			if cvs(new_wo$,2)="" new_wo$=wo_no$
			new_date$=vectOps!.getItem(x+17)
			if cvs(new_date$,2)="" new_date$=trans_date$

			if tran_date$<>new_date$ or
:			   old_dir_rate<>new_dir_rate or
:			   old_ovr_rate<>new_ovr_rate or
:			   old_set_hrs<>new_set_hrs or
:			   old_units<>new_units or
:			   old_qty_comp<>new_qty_comp or
:			   wo_no$<>new_wo$
rem --- Write entry Record
				sfe_opsadj.firm_id$=firm_id$
				sfe_opsadj.wo_location$=wo_loc$
				sfe_opsadj.wo_no$=wo_no$
				sfe_opsadj.trans_date$=tran_date$
				sfe_opsadj.trans_seq$=tran_seq$
				sfe_opsadj.new_wo_no$=new_wo$
				sfe_opsadj.new_trn_date$=new_date$
				sfe_opsadj.new_units=new_units
				sfe_opsadj.new_dir_rate=new_dir_rate
				sfe_opsadj.new_ovr_rate=new_ovr_rate
				sfe_opsadj.new_set_hrs=new_set_hrs
				sfe_opsadj.new_qty_comp=new_qty_comp
				sfe_opsadj$=field(sfe_opsadj$)
				write record (sfe_opsadj) sfe_opsadj$
			else
rem --- Remove Entry Record
				remove (sfe_opsadj,key=firm_id$+wo_loc$+wo_no$+tran_date$+tran_seq$,dom=*next)
			endif
			mast=mast+1
		next x
	endif
[[SFE_WO_OPSADJ.ASIZ]]
rem --- Resize the grid

	if UserObj!<>null() then
		gridOps!=UserObj!.getItem(num(user_tpl.gridOpsOfst$))
		gridOps!.setSize(Form!.getWidth()-(gridOps!.getX()*2),Form!.getHeight()-(gridOps!.getY()+10))
		gridOps!.setFitToGrid(1)
	endif
[[SFE_WO_OPSADJ.ACUS]]
rem --- Process custom event
rem --- Select/de-select checkboxes in grid and edit payment and discount amounts

rem This routine is executed when callbacks have been set to run a 'custom event'.
rem Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind of event it is.
rem See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info.

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ctl_ID=dec(gui_event.ID$)

rem	if ctl_ID <> num(user_tpl.gridOpsCtlID$) then break; rem --- exit callpoint

	if gui_event.code$="N"
		notify_base$=notice(gui_dev,gui_event.x%)
		dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
		notice$=notify_base$
	endif

	gridOps! = UserObj!.getItem(num(user_tpl.gridOpsOfst$))
	numcols = gridOps!.getNumColumns()
	vectOps! = UserObj!.getItem(num(user_tpl.vectOpsOfst$))
	vectOpsMaster! = UserObj!.getItem(num(user_tpl.vectOpsMasterOfst$))
	curr_row = dec(notice.row$);rem 0 based
	curr_col = dec(notice.col$);rem 0 based
	grid_ctx=gridOps!.getContextID()

	if callpoint!.getDevObject("new_row")="Y"
		sfe_woopradj=fnget_dev("SFE_WOOPRADJ")
		callpoint!.setDevObject("new_rec","Y")
		wo_no$=callpoint!.getDevObject("wo_no")
		wo_loc$=callpoint!.getDevObject("wo_loc")
		trans_date$=vectOps!.getItem(curr_row*(num(user_tpl.gridOpsCols$)-1));rem Make sure x is correct for the current row * jpb
		trans_seq$=vectOpsMaster!.getItem(curr_row);rem Make sure mast is correct for the current row * jpb
		while 1
			read (sfe_woopradj,key=firm_id$+wo_loc$+wo_no$+trans_date$+trans_seq$,dom=*break)
			callpoint!.setDevObject("new_rec","N")
			break
		wend
	endif

	switch notice.code

		case 19; rem new row

rem			if callpoint!.setDevObject("new_row")="Y" and
rem :			   callpoint!.setDevObject("new_rec")="Y"
rem				notice.buf$=gridOps!.getCellText(curr_row,4)
rem				gridOps!.setCellText(curr_row,curr_col,notice.buf$)
rem				notice.buf$=gridOps!.getCellText(curr_row,6)
rem				gridOps!.setCellText(curr_row,curr_col,notice.buf$)
rem				notice.buf$=gridOps!.getCellText(curr_row,8)
rem				gridOps!.setCellText(curr_row,curr_col,notice.buf$)
rem				notice.buf$=gridOps!.getCellText(curr_row,10)
rem				gridOps!.setCellText(curr_row,curr_col,notice.buf$)
rem				callpoint!.setDevObject("new_row","N")
rem			endif
		break

		case 32; rem grid cell validation
rem --- New Work Order Number

			if curr_col=16
				wo_no$=notice.buf$
				wo_no$=str(num(wo_no$):callpoint!.getDevObject("wo_no_mask"))
				sfe_womast=fnget_dev("SFE_WOMASTR")
				dim sfe_womast$:fnget_tpl$("SFE_WOMASTR")
				if num(wo_no$)<>0
					found=0
					while 1
						read record (sfe_womast,key=firm_id$+sfe_womast.wo_location$+wo_no$,dom=*break) sfe_womast$
						found=1
						break
					wend
					if found=0
						gridOps!.setCellText(curr_row,16,"")
						msg_id$="INPUT_ERR_DATA"
						gosub disp_message
						gridOps!.focus()
						sysgui!.setContext(grid_ctx)
						gridOps!.accept(0)
						gridOps!.startEdit(curr_row,curr_col)
						break
					endif
					if sfe_womast.wo_status$="C"
						gridOps!.setCellText(curr_row,16,"")
						msg_id$="WO_CLOSED"
						gosub disp_message
						gridOps!.focus()
						sysgui!.setContext(grid_ctx)
						gridOps!.accept(0)
						gridOps!.startEdit(curr_row,curr_col)
						break
					endif
				else
					wo_no$=callpoint!.getDevObject("wo_no")
				endif

				vectOps!.setItem((curr_row*num(user_tpl.gridOpsCols$))+16,wo_no$)
				gridOps!.accept(1)
				gridOps!.setCellText(curr_row,16,wo_no$)
				break
			endif

rem --- Rates or Units

			if curr_col = 5 or curr_col=7  or curr_col=9 or curr_col=11 then
				if curr_col=5
					dir=num(notice.buf$)
					ohd=num(gridOps!.getCellText(curr_row,7))
					setup=num(gridOps!.getCellText(curr_row,9))
					units=num(gridOps!.getCellText(curr_row,11))
				endif
				if curr_col=7
					dir=num(gridOps!.getCellText(curr_row,5))
					ohd=num(notice.buf$)
					setup=num(gridOps!.getCellText(curr_row,9))
					units=num(gridOps!.getCellText(curr_row,11))
				endif
				if curr_col=9
					dir=num(gridOps!.getCellText(curr_row,5))
					ohd=num(gridOps!.getCellText(curr_row,7))
					setup=num(notice.buf$)
					units=num(gridOps!.getCellText(curr_row,11))
				endif
				if curr_col=11
					dir=num(gridOps!.getCellText(curr_row,5))
					ohd=num(gridOps!.getCellText(curr_row,7))
					setup=num(gridOps!.getCellText(curr_row,9))
					units=num(notice.buf$)
				endif
				tot_ext=(units+setup)*(dir+ohd)
				gridOps!.setCellText(curr_row,13,str(tot_ext))
				vectOps!.setItem((curr_row*num(user_tpl.gridOpsCols$))+5,str(dir))
				vectOps!.setItem((curr_row*num(user_tpl.gridOpsCols$))+7,str(ohd))
				vectOps!.setItem((curr_row*num(user_tpl.gridOpsCols$))+9,str(setup))
				vectOps!.setItem((curr_row*num(user_tpl.gridOpsCols$))+11,str(units))
				gridOps!.accept(1)
				break
			endif

rem --- New Qty Complete
			if curr_col=15
				vectOps!.setItem((curr_row*num(user_tpl.gridOpsCols$))+15,notice.buf$)
				gridOps!.accept(1)
				break
			endif

rem --- New Tran Date
			if curr_col=17
				tran_date$=notice.buf$
				input_value$=tran_date$
				gosub validate_date
				if len(msg_id$)>0
					dim msg_tokens$[1]
					msg_tokens$[1]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_DATE")
					gosub disp_message
					gridOps!.focus()
					sysgui!.setContext(grid_ctx)
					gridOps!.accept(0)
					gridOps!.startEdit(curr_row,curr_col)
					break
				endif
				tran_date$=temp_date$
				if len(cvs(tran_date$,2))=0
					tran_date$=gridOps!.getCellText(curr_row,0)
					input_value$=vectOps!.getItem((curr_row*num(user_tpl.gridOpsCols$)))
				endif
				vectOps!.setItem((curr_row*num(user_tpl.gridOpsCols$))+17,input_value$)
				gridOps!.setCellText(curr_row,curr_col,input_value$)
			endif
			gridOps!.accept(1)
		break
	swend

	UserObj!.setItem(num(user_tpl.vectOpsOfst$),vectOps!)
	UserObj!.setItem(num(user_tpl.vectOpsMasterOfst$),vectOpsMaster!)
[[SFE_WO_OPSADJ.AWIN]]
rem --- Open/Lock files

	use ::ado_util.src::util
	use ::ado_func.src::func

	num_files=5
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	open_tables$[1]="SFT_OPNOPRTR",open_opts$[1]="OTA"
rem	open_tables$[2]="APM_VENDMAST",open_opts$[2]="OTA"
	open_tables$[3]="SFS_PARAMS",open_opts$[3]="OTA"
	open_tables$[4]="SFE_WOOPRADJ",open_opts$[4]="OTA"
	open_tables$[5]="SFE_WOMASTR",open_opts$[5]="OTA"

	gosub open_tables

	sft01_dev=num(open_chans$[1]),sft01_tpl$=open_tpls$[1]
rem	apm01_dev=num(open_chans$[2]),apm01_tpl$=open_tpls$[2]
	sfs_params=num(open_chans$[3]),sfs_params_tpl$=open_tpls$[3]

rem --- Dimension string templates

	dim sft01a$:sft01_tpl$
rem	dim apm01a$:apm01_tpl$
	dim sfs_params$:sfs_params_tpl$

rem --- Get parameter record

	readrecord(sfs_params,key=firm_id$+"SF00")sfs_params$

rem --- Add grid to store invoices, with checkboxes for user to select one or more

	user_tpl_str$ = "gridOpsOfst:c(5), " +
:		"gridOpsCols:c(5), " +
:		"gridOpsRows:c(5), " +
:		"gridOpsCtlID:c(5)," +
:		"vectOpsOfst:c(5), " +
:		"vectOpsMasterOfst:c(5)"

	dim user_tpl$:user_tpl_str$

	UserObj! = BBjAPI().makeVector()
	vectOps! = BBjAPI().makeVector()
	vectOpsMaster! = BBjAPI().makeVector()
	nxt_ctlID = util.getNextControlID()

	gridOps! = Form!.addGrid(nxt_ctlID,5,40,2000,250); rem --- ID, x, y, width, height

	user_tpl.gridOpsCtlID$ = str(nxt_ctlID)
	user_tpl.gridOpsCols$ = "18"
	user_tpl.gridOpsRows$ = "10"
	callpoint!.setDevObject("new_row","Y")
	callpoint!.setDevObject("new_rec","Y")
	callpoint!.setDevObject("wo_no_len",len(sft01a.wo_no$))
	callpoint!.setDevObject("wo_no_mask",fill(len(sft01a.wo_no$),"0"))

	gosub format_grid
	util.resizeWindow(Form!, SysGui!)

	UserObj!.addItem(gridOps!)
	user_tpl.gridOpsOfst$="0"

	UserObj!.addItem(vectOps!); rem --- vector of Open Ops
	user_tpl.vectOpsOfst$="1"

	UserObj!.addItem(vectOpsMaster!); rem --- vector of Master Open Ops
	user_tpl.vectOpsMasterOfst$="2"

rem --- Misc other init

	gridOps!.setColumnEditable(5,1)
	gridOps!.setColumnEditable(7,1)
	gridOps!.setColumnEditable(9,1)
	gridOps!.setColumnEditable(11,1)
	gridOps!.setColumnEditable(15,1)
	gridOps!.setColumnEditable(16,1)
	gridOps!.setColumnEditable(17,1)
	gridOps!.setTabAction(SysGUI!.GRID_NAVIGATE_LEGACY)
	gridOps!.setTabAction(gridOps!.GRID_NAVIGATE_GRID)
	gridOps!.setTabActionSkipsNonEditableCells(1)
	gridOps!.setEnterAsTab(1)

	gosub create_reports_vector
	gosub fill_grid

rem --- Set callbacks - processed in ACUS callpoint

	gridOps!.setCallback(gridOps!.ON_GRID_CELL_VALIDATION,"custom_event")
	gridOps!.setCallback(gridOps!.ON_GRID_SELECT_COLUMN,"custom_event")
	gridOps!.setCallback(gridOps!.ON_GRID_SELECT_ROW,"custom_event")
[[SFE_WO_OPSADJ.<CUSTOM>]]
rem ==========================================================================
format_grid: rem --- Use Barista program to format the grid
rem ==========================================================================

	call stbl("+DIR_PGM")+"adc_getmask.aon","","SF","A","",m1$,0,0

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0] = callpoint!.getColumnAttributeTypes()
	def_ops_cols = num(user_tpl.gridOpsCols$)
	num_rpts_rows = num(user_tpl.gridOpsRows$)
	dim attr_ops_col$[def_ops_cols,len(attr_def_col_str$[0,0])/5]

	attr_ops_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_TRANS_DATE"
	attr_ops_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_TRANSACTION_DATE")
	attr_ops_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="40"
	attr_ops_col$[1,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="D"
	attr_ops_col$[1,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"
	attr_ops_col$[1,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=stbl("+DATE_MASK")
	attr_ops_col$[1,fnstr_pos("MSKI",attr_def_col_str$[0,0],5)]=stbl("+DATE_MASK")

	attr_ops_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="EMP_ID"
	attr_ops_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_EMPLOYEE")
	attr_ops_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

	attr_ops_col$[3,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="EMP_NAME"
	attr_ops_col$[3,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_NAME")
	attr_ops_col$[3,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="180"

	attr_ops_col$[4,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="OP_CODE"
	attr_ops_col$[4,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_OP_CODE")
	attr_ops_col$[4,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="75"

	attr_ops_col$[5,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_DIRECT"
	attr_ops_col$[5,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_DIRECT")
	attr_ops_col$[5,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[5,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[5,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[6,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_DIRECT"
	attr_ops_col$[6,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_DIRECT")
	attr_ops_col$[6,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[6,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[6,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[7,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_OVHD"
	attr_ops_col$[7,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_OVHD")
	attr_ops_col$[7,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[7,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[7,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[8,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_OVHD"
	attr_ops_col$[8,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_OVHD")
	attr_ops_col$[8,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[8,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[8,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[9,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_SETUP"
	attr_ops_col$[9,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_SETUP")
	attr_ops_col$[9,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[9,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[9,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[10,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_SETUP"
	attr_ops_col$[10,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_SETUP")
	attr_ops_col$[10,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[10,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[10,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[11,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_UNITS"
	attr_ops_col$[11,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_UNITS")
	attr_ops_col$[11,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[11,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[11,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[12,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_UNITS"
	attr_ops_col$[12,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_UNITS")
	attr_ops_col$[12,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[12,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[12,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[13,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_EXT"
	attr_ops_col$[13,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_TOTAL")
	attr_ops_col$[13,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[13,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[13,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[14,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_EXT"
	attr_ops_col$[14,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_TOTAL")
	attr_ops_col$[14,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[14,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[14,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[15,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ORIG_COMPLETE"
	attr_ops_col$[15,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ORIG")+" "+Translate!.getTranslation("AON_COST")
	attr_ops_col$[15,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[15,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[15,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[16,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_COMPLETE"
	attr_ops_col$[16,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_COST")
	attr_ops_col$[16,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_ops_col$[16,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[16,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_ops_col$[17,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_WO"
	attr_ops_col$[17,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_WO")
	attr_ops_col$[17,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="C"
	attr_ops_col$[17,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[17,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=callpoint!.getDevObject("wo_no_mask")
	attr_ops_col$[17,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]=str(callpoint!.getDevObject("wo_no_len"))
	attr_ops_col$[17,fnstr_pos("DTAB",attr_def_col_str$[0,0],5)]="SFE_WOMASTR"
	attr_ops_col$[17,fnstr_pos("DCOL",attr_def_col_str$[0,0],5)]="DESC"

	attr_ops_col$[18,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_DATE"
	attr_ops_col$[18,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADJUST")+" "+Translate!.getTranslation("AON_DATE")
	attr_ops_col$[18,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_ops_col$[18,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="D"
	attr_ops_col$[18,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"

	for curr_attr=1 to def_ops_cols
		attr_ops_col$[0,1] = attr_ops_col$[0,1] + 
:			pad("SFE_WO_OPSADJ." + attr_ops_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
	next curr_attr

	attr_disp_col$=attr_ops_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,gridOps!,"COLH-LINES-LIGHT-SIZEC-DATES",num_rpts_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_ops_col$[all]

	return

rem ==========================================================================
fill_grid: rem --- Fill the grid with data in vectOps!
rem ==========================================================================

	SysGUI!.setRepaintEnabled(0)
	gridOps! = UserObj!.getItem(num(user_tpl.gridOpsOfst$))
	minrows = num(user_tpl.gridOpsRows$)

	if vectOps!.size() then
		numrow = vectOps!.size() / gridOps!.getNumColumns()
		gridOps!.clearMainGrid()
		gridOps!.setNumRows(numrow)
		gridOps!.setCellText(0,0,vectOps!)
	else
		gridOps!.clearMainGrid()
		gridOps!.setNumRows(0)
	endif

	SysGUI!.setRepaintEnabled(1)

	return

rem ==========================================================================
create_reports_vector: rem --- Create a vector from the file to fill the grid
rem ==========================================================================

	sfe_opsadj=fnget_dev("SFE_WOOPRADJ")

	call stbl("+DIR_PGM")+"adc_getmask.aon","VENDOR_ID","","","",m0$,0,vendor_len
	more=1
	wo_loc$=callpoint!.getDevObject("wo_loc")
	wo_no$=callpoint!.getDevObject("wo_no")
	read (sft01_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)

	while more
		read record (sft01_dev, end=*break) sft01a$
		if pos(firm_id$=sft01a$)<>1 then break
		if wo_no$<>sft01a.wo_no$ break
rem jpb		dim apm01a$:fattr(apm01a$)
rem jpb		read record(apm01_dev, key=firm_id$+sft31a.vendor_id$, dom=*next) apm01a$
		dim sfe_opsadj$:fnget_tpl$("SFE_WOOPRADJ")
		found=0
		while 1
			read record (sfe_opsadj,key=firm_id$+wo_loc$+wo_no$+sft01a.trans_date$+sft01a.trans_seq$,dom=*break)sfe_opsadj$
			found=1
			break
		wend

	rem --- Now fill vectors

		vectOps!.addItem(sft01a.trans_date$); rem 0
		vectOps!.addItem(func.alphaMask(sft01a.employee_no$(1,vendor_len),m0$)); rem 1
		vectOps!.addItem("");rem prm01a.emp_name$); rem 2
		vectOps!.addItem(sft01a.op_code$); rem 3
		vectOps!.addItem(str(sft01a.direct_rate)); rem 4
		if found=1
			vectOps!.addItem(str(sfe_opsadj.new_dir_rate)); rem 5
		else
			vectOps!.addItem(str(sft01a.direct_rate)); rem 5
		endif
		vectOps!.addItem(str(sft01a.ovhd_rate)); rem 6
		if found=1
			vectOps!.addItem(str(sfe_opsadj.new_ovr_rate)); rem 7
		else
			vectOps!.addItem(str(sft01a.ovhd_rate)); rem 7
		endif
		vectOps!.addItem(str(sft01a.setup_time)); rem 8
		if found=1
			vectOps!.addItem(str(sfe_opsadj.new_set_hrs)); rem 9
		else
			vectOps!.addItem(str(sft01a.setup_time)); rem 9
		endif
		vectOps!.addItem(str(sft01a.units)); rem 10
		if found=1
			vectOps!.addItem(str(sfe_opsadj.new_units)); rem 11
		else
			vectOps!.addItem(str(sft01a.units)); rem 11
		endif
		vectOps!.addItem(str(sft01a.ext_cost)); rem 12
		if found=1
			vectOps!.addItem(str((sfe_opsadj.new_set_hrs+sfe_opsadj.new_units)*(sfe_opsadj.new_dir_rate+sfe_opsadj.new_ovr_rate))); rem 13
		else
			vectOps!.addItem(str(sft01a.ext_cost)); rem 13
		endif
		vectOps!.addItem(str(sft01a.complete_qty)); rem 14
		if found=1
			vectOps!.addItem(str(sfe_opsadj.new_qty_comp)); rem 15
			vectOps!.addItem(sfe_opsadj.new_wo_no$); rem 16
			vectOps!.addItem(sfe_opsadj.new_trn_date$); rem 17
		else
			vectOps!.addItem(str(sft01a.complete_qty)); rem 15
			vectOps!.addItem(wo_no$); rem 16
			vectOps!.addItem(sft01a.trans_date$); rem 17
		endif

		vectOpsMaster!.addItem(sft01a.trans_seq$);rem keep track of sequence

	wend

	callpoint!.setStatus("REFRESH")
	
	return

rem ==========================================================
validate_date:rem --- YYYYMMDD
rem input_value$: input and output (anything in, ccyymmdd out)
rem msg_id$: output (blank if valid date, INPUT_ERR_DATE if invalid)
rem temp_date$: output (mm/dd/ccyy)
rem ==========================================================

	if cvs(input_value$,2)="" return
	if num(input_value$,err=*next)<=0 input_value$=""; return 

	date_value$="",temp_date$="",input_value_sav$=input_value$
	date_mask$=stbl("+DATE_MASK")
	msg_id$="INPUT_ERR_DATE"

rem --- expand entered value as needed and do validity check based on JUL() function
	if len(input_value$)<>7 or input_value$<"2000000" or input_value$>"2999999"
		date_value$=str(jul(input_value$,date_mask$,err=*next))
	else
		date_value$=input_value$
	endif

	if date_value$="" or date_value$="-1"
		input_value$=input_value_sav$
		return
	endif

rem --- re-display extended, validated value in localized format, store "on disk" format in input var
	temp_date$=date(num(date_value$),date_mask$)
	if rdEventCtl!<>null() rdEventCtl!.setText(temp_date$)
	input_value$=date(num(date_value$):"%Yd%Mz%Dz")

	msg_id$=""

	return
