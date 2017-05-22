[[OPE_CREATEWOS.ASIZ]]
rem --- Resize grids

	formHeight=Form!.getHeight()
	formWidth=Form!.getWidth()
	woGrid!=callpoint!.getDevObject("woGrid")
	woYpos=woGrid!.getY()
	woXpos=woGrid!.getX()
	availableHeight=formHeight-woYpos-40

	rem --- Resize application grid
	woGrid!.setSize(formWidth-2*woXpos,availableHeight)
	woGrid!.setFitToGrid(1)
[[OPE_CREATEWOS.<CUSTOM>]]
format_wo_grid: rem --- Format Work Order grid

	wo_grid_def_cols=callpoint!.getDevObject("wo_grid_def_cols")
	wo_rpts_rows=callpoint!.getDevObject("wo_grid_min_rows")

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0]=callpoint!.getColumnAttributeTypes()

	dim attr_rpts_col$[wo_grid_def_cols,len(attr_def_col_str$[0,0])/5]
	attr_rpts_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="CREATE_WO"
	attr_rpts_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_create_wo_label$
	attr_rpts_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"

	attr_rpts_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="LINE_NO"
	attr_rpts_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_line_no_label$
	attr_rpts_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="40"

	attr_rpts_col$[3,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ITEM_ID"
	attr_rpts_col$[3,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_item_id_label$
	attr_rpts_col$[3,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="115"

	attr_rpts_col$[4,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ITEM_DESC"
	attr_rpts_col$[4,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_item_desc_label$
	attr_rpts_col$[4,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="345"

	attr_rpts_col$[5,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="QTY_SHIPPED"
	attr_rpts_col$[5,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_qty_shipped_label$
	attr_rpts_col$[5,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="55"

	attr_rpts_col$[6,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="EST_SHP_DATE"
	attr_rpts_col$[6,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_est_shp_date_lable$
	attr_rpts_col$[6,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="55"

	attr_rpts_col$[7,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="WO_NO"
	attr_rpts_col$[7,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_wo_no_label$
	attr_rpts_col$[7,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"

	attr_rpts_col$[8,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="SCH_PROD_QTY"
	attr_rpts_col$[8,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_sch_prod_qty_label$
	attr_rpts_col$[8,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="55"

	attr_rpts_col$[9,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ESTCMP_DATE"
	attr_rpts_col$[9,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_estcmp_date_label$
	attr_rpts_col$[9,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="55"

	attr_rpts_col$[10,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="WARNINGS"
	attr_rpts_col$[10,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=aon_warnings_label$
	attr_rpts_col$[10,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="400"

	for curr_attr=1 to wo_grid_def_cols
		attr_rpts_col$[0,1]=attr_rpts_col$[0,1]+pad("CREATEWOS."+attr_rpts_col$[curr_attr,
:			fnstr_pos("DVAR",attr_def_col_str$[0,0],5)],40)
	next curr_attr

	attr_disp_col$=attr_rpts_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,woGrid!,"COLH-LINES-LIGHT-AUTO-MULTI-SIZEC-HSCROLL",wo_rpts_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_rpts_col$[all]

	return
[[OPE_CREATEWOS.AWIN]]
rem --- Add grid to form

	use ::ado_util.src::util

	rem --- Get column headings for grid
	aon_create_wo_label$=Translate!.getTranslation("AON_CREATE")
	aon_line_no_label$=Translate!.getTranslation("AON_LINE_NO")
	aon_item_id_label$=Translate!.getTranslation("AON_ITEM_ID")
	aon_item_desc_label$=Translate!.getTranslation("AON_ITEM_DESCRIPTION")
	aon_qty_shipped_label$=Translate!.getTranslation("AON_QTY")+" "+Translate!.getTranslation("AON_SHIPPED")
	aon_est_shp_date_lable$=Translate!.getTranslation("AON_EST")+" "+Translate!.getTranslation("AON_SHIP")+" "+Translate!.getTranslation("AON_DATE")
	aon_wo_no_label$=Translate!.getTranslation("AON_WO_NO.")
	aon_sch_prod_qty_label$=Translate!.getTranslation("AON_SCH")+" "+Translate!.getTranslation("AON_PROD")+" "+Translate!.getTranslation("AON_QTY")
	aon_estcmp_date_label$=Translate!.getTranslation("AON_EST")+" "+Translate!.getTranslation("AON_COMP")+" "+Translate!.getTranslation("AON_DATE")
	aon_warnings_label$=Translate!.getTranslation("AON_WARNINGS")

	rem --- Add grid to form for candidate Work Orders that could be created
	nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
	woGrid!=Form!.addGrid(nxt_ctlID,10,60,1200,200); rem --- ID, x, y, width, height
	callpoint!.setDevObject("woGrid",woGrid!)
	callpoint!.setDevObject("wo_grid_id",str(nxt_ctlID))
	callpoint!.setDevObject("wo_grid_def_cols",10)
	callpoint!.setDevObject("wo_grid_min_rows",10)
	gosub format_wo_grid
	woGrid!.setColumnStyle(0,SysGUI!.GRID_STYLE_UNCHECKED)
	woGrid!.setColumnEditable(0,1)
	woGrid!.setTabAction(SysGUI!.GRID_NAVIGATE_LEGACY)

	rem --- misc other init
	util.resizeWindow(Form!, SysGui!)

	rem --- set callbacks - processed in ACUS callpoint
	woGrid!.setCallback(woGrid!.ON_GRID_CHECK_ON,"custom_event")
	woGrid!.setCallback(woGrid!.ON_GRID_CHECK_OFF,"custom_event")
	woGrid!.setCallback(woGrid!.ON_GRID_KEY_PRESS,"custom_event")
	rem --- Currently ON_GRID_CELL_EDIT_STOP results in the loss of user input when 
	rem --- they Run Process (F5) before leaving the cell where text was entered.
	woGrid!.setCallback(woGrid!.ON_GRID_EDIT_STOP,"custom_event")
[[OPE_CREATEWOS.BEND]]
rem --- Set form exit status for Cancel
	callpoint!.setDevObject("createWOs_status","Cancel")
[[OPE_CREATEWOS.BSHO]]
rem --- Set form's default exit status for OK
	callpoint!.setDevObject("createWOs_status","OK")

rem --- Disable all fields except the custom grid
	callpoint!.setColumnEnabled("OPE_CREATEWOS.CUSTOMER_ID",-1)
	callpoint!.setColumnEnabled("OPE_CREATEWOS.ORDER_NO",-1)
