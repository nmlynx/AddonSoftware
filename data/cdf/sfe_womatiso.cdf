[[SFE_WOMATISO.QTY_TO_ISSUE.AVAL]]
rem wgh ... add display field to show how many left to be issued
[[SFE_WOMATISO.ACUS]]
rem --- Process custom event

rem This routine is executed when callbacks have been set to run a 'custom event'.
rem Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind of event it is.
rem See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info.

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ctl_ID=dec(gui_event.ID$)

	if ctl_ID <> num(callpoint!.getDevObject("stbl_grid_id")) then break; rem --- exit callpoint

	if gui_event.code$="N"
		notify_base$=notice(gui_dev,gui_event.x%)
		dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
		notice$=notify_base$
	endif

	switch notice.code
		case 12;rem grid_key_press
			if notice.wparam=32 then gosub switch_value
			break
		case 14;rem grid_mouse_up
			if notice.col=0 then gosub switch_value
			break
	swend
[[SFE_WOMATISO.<CUSTOM>]]
format_grid: rem --- Format grid

	def_rpts_cols=5
	num_rpts_rows=0

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0]=callpoint!.getColumnAttributeTypes()

rem wgh ... where does check mark come from?
	dim attr_rpts_col$[def_rpts_cols,len(attr_def_col_str$[0,0])/5]
	attr_rpts_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="SELECT"
	attr_rpts_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=""
	attr_rpts_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="25"
	attr_rpts_col$[1,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]="1"
	attr_rpts_col$[1,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="C"

rem wgh ... Seq
	attr_rpts_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="STBL"
	attr_rpts_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="STBL"
	attr_rpts_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="100"

rem wgh ... Op Code
	attr_rpts_col$[3,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="STBL_SOURCE"
	attr_rpts_col$[3,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_SOURCE")
	attr_rpts_col$[3,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="100"

rem wgh ... Description
	attr_rpts_col$[4,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="STBL_TARGET"
	attr_rpts_col$[4,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_TARGET")
	attr_rpts_col$[4,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="300"

rem wgh ... Internal Seq Num ... don't display it
	attr_rpts_col$[5,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="INTERNAL_SEQ_NO"
	attr_rpts_col$[5,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Internal Seq Num"
	attr_rpts_col$[5,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="150"

	for curr_attr=1 to def_rpts_cols
		attr_rpts_col$[0,1]=attr_rpts_col$[0,1]+pad("OPS."+attr_rpts_col$[curr_attr,
:			fnstr_pos("DVAR",attr_def_col_str$[0,0],5)],40)
	next curr_attr

	attr_disp_col$=attr_rpts_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,gridOps!,"COLH-LINES-LIGHT-AUTO-MULTI-SIZEC",num_rpts_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_rpts_col$[all]

	return

switch_value: rem --- Switch checkbox values

	SysGUI!.setRepaintEnabled(0)
	gridOps!=callpoint!.getDevObject("gridOps")
	TempRows!=gridOps!.getSelectedRows()
	if TempRows!.size()>0
		for curr_row=1 to TempRows!.size()
			if gridOps!.getCellState(TempRows!.getItem(curr_row-1),0)=0
				gridOps!.setCellState(TempRows!.getItem(curr_row-1),0,1)
			else
				gridOps!.setCellState(num(TempRows!.getItem(curr_row-1)),0,0)
			endif
		next curr_row
	endif

	SysGUI!.setRepaintEnabled(1)

	return

fill_grid: rem --- Fill the grid with data

	sfe_wooprtn_dev=fnget_dev("SFE_WOOPRTN")
	dim sfe_wooprtn$:fnget_tpl$("SFE_WOOPRTN")

	vectRows!=SysGUI!.makeVector()
rem wgh ... stopped here
rem wgh ... this needs to be sorted by op_seq
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	read(sfe_wooprtn_dev,key=sfe_womatish_key$,knum="AO_DISP_SEQ",dom=*next)
	while 1
		sfe_wooprtn_key$=key(sfe_wooprtn_dev,knum="AO_DISP_SEQ",end=*break)
		if pos(sfe_womatish_key$=sfe_wooprtn_key$)<>1 then break
		readrecord(sfe_wooprtn_dev,key=sfe_wooprtn_key$,knum="AO_DISP_SEQ")sfe_wooprtn$

		vectRows!.addItem("")
		vectRows!.addItem(sfe_wooprtn.op_seq$)
		vectRows!.addItem(sfe_wooprtn.op_code$)
		vectRows!.addItem(sfe_wooprtn.code_desc$)
		vectRows!.addItem(sfe_wooprtn.internal_seq_no$)
	wend

	SysGUI!.setRepaintEnabled(0)
	gridStbls!=callpoint!.getDevObject("gridStbls")
	if vectRows!.size()
		numrow=vectRows!.size()/gridStbls!.getNumColumns()
		gridStbls!.clearMainGrid()
		gridStbls!.setNumRows(numrow)
		gridStbls!.setCellText(0,0,vectRows!)
		gridStbls!.resort()
		gridStbls!.setSelectedRow(0)
	endif
	SysGUI!.setRepaintEnabled(1)

	return
[[SFE_WOMATISO.AWIN]]
rem --- Add grid to form for selecting Operations

	use ::ado_util.src::util

	nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
	gridOps!=Form!.addGrid(nxt_ctlID,10,40,500,260); rem --- ID, x, y, width, height
	callpoint!.setDevObject("gridOps",gridOps!)
	callpoint!.setDevObject("ops_grid_id",str(nxt_ctlID))

	gosub format_grid

	util.resizeWindow(Form!, SysGui!)

	rem --- set callbacks - processed in ACUS callpoint
	gridOps!.setCallback(gridOps!.ON_GRID_KEY_PRESS,"custom_event")		
	gridOps!.setCallback(gridOps!.ON_GRID_MOUSE_UP,"custom_event")
