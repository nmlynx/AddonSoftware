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

	call stbl("+DIR_PGM")+"adc_getmask.aon","","IV","U","",iv_u_mask$,0,0

	wo_grid_def_cols=callpoint!.getDevObject("wo_grid_def_cols")
	wo_rpts_rows=callpoint!.getDevObject("wo_grid_min_rows")

	dim wo_def_col_str$[0,0]
	wo_def_col_str$[0,0]=callpoint!.getColumnAttributeTypes()

	dim wo_rpts_col$[wo_grid_def_cols,len(wo_def_col_str$[0,0])/5]
	wo_rpts_col$[1,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="CREATE_WO"
	wo_rpts_col$[1,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_create_wo_label$
	wo_rpts_col$[1,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="20"

	wo_rpts_col$[2,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="LINE_NO"
	wo_rpts_col$[2,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_line_no_label$
	wo_rpts_col$[2,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="40"

	wo_rpts_col$[3,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="ITEM_ID"
	wo_rpts_col$[3,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_item_id_label$
	wo_rpts_col$[3,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="115"

	wo_rpts_col$[4,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="ITEM_DESC"
	wo_rpts_col$[4,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_item_desc_label$
	wo_rpts_col$[4,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="345"

	wo_rpts_col$[5,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="QTY_SHIPPED"
	wo_rpts_col$[5,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_qty_shipped_label$
	wo_rpts_col$[5,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="55"
	wo_rpts_col$[5,fnstr_pos("MSKO",wo_def_col_str$[0,0],5)]=iv_u_mask$

	wo_rpts_col$[6,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="EST_SHP_DATE"
	wo_rpts_col$[6,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_est_shp_date_lable$
	wo_rpts_col$[6,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="55"

	wo_rpts_col$[7,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="WO_NO"
	wo_rpts_col$[7,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_wo_no_label$
	wo_rpts_col$[7,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="80"

	wo_rpts_col$[8,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="SCH_PROD_QTY"
	wo_rpts_col$[8,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_sch_prod_qty_label$
	wo_rpts_col$[8,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="55"
	wo_rpts_col$[8,fnstr_pos("MSKO",wo_def_col_str$[0,0],5)]=iv_u_mask$

	wo_rpts_col$[9,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="ESTCMP_DATE"
	wo_rpts_col$[9,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_estcmp_date_label$
	wo_rpts_col$[9,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="55"

	wo_rpts_col$[10,fnstr_pos("DVAR",wo_def_col_str$[0,0],5)]="WARNINGS"
	wo_rpts_col$[10,fnstr_pos("LABS",wo_def_col_str$[0,0],5)]=aon_warnings_label$
	wo_rpts_col$[10,fnstr_pos("CTLW",wo_def_col_str$[0,0],5)]="400"

	for curr_col=1 to wo_grid_def_cols
		wo_rpts_col$[0,1]=wo_rpts_col$[0,1]+pad("CREATEWOS."+wo_rpts_col$[curr_col,
:			fnstr_pos("DVAR",wo_def_col_str$[0,0],5)],40)
	next curr_col

	wo_disp_col$=wo_rpts_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,woGrid!,"COLH-LINES-LIGHT-AUTO-MULTI-SIZEC-HSCROLL",wo_rpts_rows,
:		wo_def_col_str$[all],wo_disp_col$,wo_rpts_col$[all]

	return

rem =========================================================
get_RGB: rem --- Parse Red, Green and Blue segments from RGB$ string
	rem --- input: RGB$
	rem --- output: R
	rem --- output: G
	rem --- output: B
rem =========================================================
	comma1=pos(","=RGB$,1,1)
	comma2=pos(","=RGB$,1,2)
	R=num(RGB$(1,comma1-1))
	G=num(RGB$(comma1+1,comma2-comma1-1))
	B=num(RGB$(comma2+1))
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
[[OPE_CREATEWOS.BEND]]
rem --- Set form exit status for Cancel
	callpoint!.setDevObject("createWOs_status","Cancel")
[[OPE_CREATEWOS.BSHO]]
rem --- Set form's default exit status for OK
	callpoint!.setDevObject("createWOs_status","OK")

rem --- Disable all fields except the custom grid
	callpoint!.setColumnEnabled("OPE_CREATEWOS.CUSTOMER_ID",-1)
	callpoint!.setColumnEnabled("OPE_CREATEWOS.ORDER_NO",-1)

rem --- Initialize woGrid! with info in soCreateWo!
	SysGUI!.setRepaintEnabled(0)
	woGrid!=callpoint!.getDevObject("woGrid")
	soCreateWO!=callpoint!.getDevObject("soCreateWO")
	woList!=soCreateWO!.getWOList()
	if woList!.size()
		rem --- Disable extra grid rows
		if woList!.size()<callpoint!.getDevObject("wo_grid_min_rows") then 
			for row=woList!.size() to callpoint!.getDevObject("wo_grid_min_rows")-1
				woGrid!.setRowEditable(row, 0)
				continue
			next row
		else
			woGrid!.setNumRows(woList!.size())
		endif

		rem --- Get warning highlight color
		RGB$="255,182,193"
		RGB$=stbl("+ENTRY_ERROR_COLOR",err=*next)
		gosub get_RGB
		warningHighlight! = BBjAPI().getSysGui().makeColor(R,G,B)

		rem --- Set cell properties in each grid row
		for row=0 to woList!.size()-1
			woVect! = woList!.get(row)

			rem --- Set WO checkbox
			if woVect!.getItem(soCreateWO!.getCREATE_WO()) then 
				woGrid!.setCellStyle(row, 0, SysGUI!.GRID_STYLE_CHECKED)
			else
				woGrid!.setCellStyle(row, 0, SysGUI!.GRID_STYLE_UNCHECKED)
			endif
			woGrid!.setCellText(row, 0, "")

			rem --- Set SO detail line number
			woGrid!.setCellText(row, 1, woVect!.getItem(soCreateWO!.getSOLINE_NO()))

			rem  --- Set SO detail line item
			woGrid!.setCellText(row, 2, woVect!.getItem(soCreateWO!.getSOLINE_ITEM()))

			rem  --- Set SO detail line item description
			woGrid!.setCellText(row, 3, woVect!.getItem(soCreateWO!.getSOLINE_ITEMDESC()))

			rem  --- Set SO detail line ship quantity
			woGrid!.setCellText(row, 4, str(woVect!.getItem(soCreateWO!.getSOLINE_SHIPQTY())))

			rem  --- Set SO detail line ship date
			shipdate$=woVect!.getItem(soCreateWO!.getSOLINE_SHIPDATE())
			woGrid!.setCellText(row, 5, date(jul(shipdate$,"%Yd%Mz%Dz"):stbl("+DATE_MASK")))

			rem  --- Set WO number
			woGrid!.setCellText(row, 6, woVect!.getItem(soCreateWO!.getWO_NO()))

			rem  --- Set WO scheduled production quantity
			woGrid!.setCellText(row, 7, str(woVect!.getItem(soCreateWO!.getWO_SCHPRODQTY())))

			rem  --- Set WO estimated completion date
			cmpdate$=woVect!.getItem(soCreateWO!.getWO_ESTCMPDATE())
			woGrid!.setCellText(row, 8, date(jul(cmpdate$,"%Yd%Mz%Dz"):stbl("+DATE_MASK")))

			rem  --- Set Warnings
			warnings$=woVect!.getItem(soCreateWO!.getWARNINGS())
			if cvs(warnings$,3)<>"" then
				woGrid!.setCellText(row, 9, warnings$)

				rem --- Highlight row
				woGrid!.setRowBackColor(row, warningHighlight!)
			endif
		next row
	endif
	SysGUI!.setRepaintEnabled(1)
