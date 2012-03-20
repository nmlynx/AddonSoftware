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

	num_files=7
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	open_tables$[1]="SFE_WOMASTR",open_opts$[1]="OTA"
	open_tables$[2]="SFE_WOOPRTN",open_opts$[2]="OTA"
	open_tables$[3]="SFE_WOSCHDL",open_opts$[3]="OTA"
	open_tables$[4]="SFM_OPCALNDR",open_opts$[4]="OTA"
	open_tables$[5]="SFT_OPNOPRTR",open_opts$[5]="OTA"
	open_tables$[6]="SFS_PARAMS",open_opts$[6]="OTA"
	open_tables$[7]="IVM_ITEMMAST",open_opts$[7]="OTA"

	gosub open_tables

	sfe01_dev=num(open_chans$[1]),sfe01_tpl$=open_tpls$[1]
	sfe02_dev=num(open_chans$[2]),sfe02_tpl$=open_tpls$[2]
	sfm05_dev=num(open_chans$[3]),sfm05_tpl$=open_tpls$[3]
	sfm04_dev=num(open_chans$[4]),sfm04_tpl$=open_tpls$[4]
	sft01_dev=num(open_chans$[5]),sft01_tpl$=open_tpls$[5]
	sfs_params=num(open_chans$[6]),sfs_params_tpl$=open_tpls$[6]
	ivm01_dev=num(open_chans$[7])
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
rem op_code$:		input
rem status$:		input
rem pri_code$:		input
rem begdate$:		input
rem enddate$:		input
rem ==========================================================================
return
	woe02_dev=fnget_dev("SFE_WOOPRTN")
	dim woe02a$:fnget_tpl$("SFE_WOOPRTN")
	wot01_dev=fnget_dev("SFT_OPNOPRTR")
	dim wot01a$:fnget_tpl$("SFT_OPNOPRTR")
	wom05_dev=fnget_dev("SFE_WOSCHDL")
	dim wom05a$:fnget_tpl$("SFE_WOSCHDL")
	woe01a_dev=fnget_dev("SFE_WOMASTR")
	dim woe01a$:fnget_tpl$("SFE_WOMASTR")
	ivm01a_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm01a$:fnget_tpl$("IVM_ITEMMAST")

	call stbl("+DIR_PGM")+"adc_getmask.aon","","SF","H","",m1$,0,0
	more=1
	read (woe02_dev,key=firm_id$+woe02a.wo_location$+op_code$,knum="AO_LOC_CD_DT_WO",dom=*next)
	rows=0

	while more
		read record (woe02_dev, end=*break) woe02a$
		if pos(firm_id$+woe02a.wo_location$=woe02a$)<>1 then break
		if woe02a.op_code$<>op_code$ break

		read(wot01_dev,key=firm_id$+woe02a.wo_location$+woe02a.wo_no$,dom=*next)
		while 1
			read record (wot01_dev,end=*break) wot01a$
			if pos(firm_id$+woe02a.wo_location$+woe02a.wo_no$=wot01a$)<>1 break
			if wot01a.op_code$<>op_code$ continue
			units=units+wot01a.units
			setup=setup+wot01a.setup_time
		wend

		if units=0 and setup=0 continue
		wostr$=wostr$+woe02a.wo_no$+str(units:m1$)+str(setup:m1$)
		units=0
		setup=0
	wend

rem --- Position Schedul Detail file
	totset=0
	totrun=0
	dim woe01a$:fattr(woe01a$)
	read (wom05_dev,key=firm_id$+op_code$,dom=*next)
	while 1
		runtime=0
		setup=0
		movetime=0
		read record (wom05_dev,end=*break) wom05a$
		if pos(firm_id$+op_code$=wom05a$)<>1 break
		this_seq$=wom05a.oper_seq_ref$
		this_wo$=wom05a.wo_no$

rem --- Retrieve sfe-02 operations record

		read record (sfe02_dev,key=firm_id$+sfe02a.wo_location$+wom05a.wo_no$+wom05a.internal_seq_no$,knum="AO_OP_SEQ",dom=*continue)sfe02a$
		this_code$=sfe02a.op_code$

rem --- Work order still open?

		if sfe02a.wo_no$<>sfe01a.wo_no$
			movetime=0
			find record(sfe01_dev,key=firm_id$+sfe02a.wo_location$+sfe02a.wo_no$,dom=*continue) woe01a$
		endif
		if woe01a.wo_status$="P" and pos("P"=status$)>0 goto include_it
		if woe01a.wo_status$="Q" and pos("Q"=status$)>0 goto include_it
		if woe01a.wo_status$="O" and pos("O"=status$)>0 goto include_it
		continue

include_it:

rem jpb wazzup with the next lines???
		desc$=cvs(ivm01a.item_desc$,2)
		if woe01a.wo_category$="I" desc$=cvs(woe01a.item_id$,2)+" "+desc$
		movetime=wom05a.move_time
rem --- Shall we print it?
		gosub  calc_actual
		gosub calc_remaining
		if runtime=0 and setup=0 and movetime=0 continue
		if woe01a.priority$>pri_code$ continue
		if cvs(begdate$,2)<>"" if wom05a.sched_date$<begdate$ continue
		if cvs(enddate$,2)<>"" if wom05a.sched_date$>enddate$ continue
		v3=0
rem --- Add to vector
		vectDispatch!.addItem(wom05a.sched_date$)
		vectDispatch!.addItem(sfe01a.priority$)
		vectDispatch!.addItem(sfe01a.wo_category$)
		vectDispatch!.addItem(sfe01a.wo_no$)
		vectDispatch!.addItem(desc$)
		vectDispatch!.addItem(at$)
		vectDispatch!.addItem(from$)
		vectDispatch!.addItem(str(setup))
		vectDispatch!.addItem(str(runtime))
		vectDispatch!.addItem(str(movetime))

		totset=totset+setup
		totrun=totrun+runtime

	wend

rem jpb now grab paragraph 3000

	callpoint!.setStatus("REFRESH")
	
	return

rem ==========================================================================
calc_actual:
rem ==========================================================================
return
rem --- Initialize WO ---
	DIM RUNTIM[OPNMAX],SETUP[OPNMAX],ACTRUN[OPNMAX],ACTSET[OPNMAX]
	opnseq$=""
	opncod$=""
	x0=0
	now=0
	at$=""
	from$=""
	setup=0
	runtime=0
	read (sfe02_dev,key=firm_id$+sfe01a.wo_location$+sfe01a.wo_no$,dom=*next)
rem jpb
	while 1
		read record (sfe02a_dev,end=*break) sfe02a$
		if pos(firm_id$+sfe01a.wo_location$+sfe01a.wo_no$=sfe02a$)<>1 break
		if sfe02a.line_type$<>"S" continue
		opnseq$=opnseq$+B0$(13,3)
		opncod$=opncod$+B1$(1,3)
		runtim[X0]=L[2]
		setup[X0]=L[1]
		x0=x0+1
	wend

6400 REM " --- Calculate Actual ---"
6405 DIM W0$(18),W1$(40),W[11]
6410 READ (WOT01_DEV,KEY=A0$(1,11),DOM=6420)
6420 LET WOTKEY$=KEY(WOT01_DEV,END=6600)
6430 IF POS(A0$(1,11)=WOTKEY$)<>1 THEN GOTO 6600
6440 READ (WOT01_DEV)IOL=WOT01A
6450 IF W0$(15,1)<>"O" THEN GOTO 6420
6460 LET SEQ$=W1$(1,3),COD$=W1$(4,3),INDX=POS(SEQ$=OPNSEQ$,3)
6470 IF INDX=0 THEN LET OPNSEQ$=OPNSEQ$+SEQ$,OPNCOD$=OPNCOD$+COD$; GOTO 6460
6480 LET INDX=INT(INDX/3),ACTSET[INDX]=ACTSET[INDX]+W[6],ACTRUN[INDX]=ACTRUN[INDX]+W[0]
6490 IF NOW<INDX THEN LET NOW=INDX
6500 GOTO 6420
6600 REM "---- This operation? ---"
6610 LET AT$=OPNCOD$(NOW*3+1,3)
6620 LET THISINDX=POS(THISSEQ$=OPNSEQ$,3)
6630 IF THISINDX=0 THEN GOTO 6700
6640 LET THISINDX=INT(THISINDX/3),XFROM=THISINDX-1; IF XFROM<0 THEN LET XFROM=0
6650 LET FROM$=OPNCOD$(XFROM*3+1,3)
6660 LET RUNT=RUNTIM[THISINDX],SET=SETUP[THISINDX]
	return

rem ==========================================================================
calc_remaining:
rem ==========================================================================

rem --- Calculate Remaining Units
rem --- umask$ = PARAMETER UNIT MASK, UMASK = LEN(UMASK$)
	unitrun=0
	unitset=0
	wopos=pos(woe01a.wo_no$=wostr$)
	if wopos<>0
		unitrun=num(wostr$(wopos+7,umask))
		unitset=num(wostr$(wopos+7+umask,umask))
		runtime=runtime-unitrun
		setup=setup-unitset
		if runtime>=0
			wostr$(wopos+7,umask)=str(0:umask$)
		else
			unitrun=-runtime
			wostr$(wopos+7,umask)=str(unitrun:umask$)
			runtime=0
		endif
		if setup>=0
			wostr$(wopos+7+umask,umask)=str(0:umask$)
		else
			unitset=-unitset
			wostr$(wopos+7+umask,umask)=str(unitset:umask$)
			setup=0
		endif
	endif
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
