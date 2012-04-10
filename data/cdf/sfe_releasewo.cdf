[[SFE_RELEASEWO.<CUSTOM>]]
rem =====================================================
format_grid: rem --- format the grid that will display component shortages

rem =====================================================

	call stbl("+DIR_PGM")+"adc_getmask.aon","","IV","U","",m1$,0,0

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0]=callpoint!.getColumnAttributeTypes()
	def_cols=7
	num_rows=0
	dim attr_col$[def_cols,len(attr_def_col_str$[0,0])/5]

	attr_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ITEM"
	attr_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ITEM_ID")
	attr_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="100"

	attr_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="DESC"
	attr_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_DESCRIPTION")
	attr_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="200"

	attr_col$[3,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="REQ"
	attr_col$[3,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_REQUIRED")
	attr_col$[3,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_col$[3,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_col$[4,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="OH"
	attr_col$[4,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ON_HAND")
	attr_col$[4,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_col$[4,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_col$[5,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="COMM"
	attr_col$[5,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_COMMITTED")
	attr_col$[5,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_col$[5,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_col$[6,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="AVAIL"
	attr_col$[6,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_AVAILABLE")
	attr_col$[6,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_col$[6,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	attr_col$[7,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="OO"
	attr_col$[7,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ON_ORDER")
	attr_col$[7,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"
	attr_col$[7,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	for curr_attr=1 to def_cols

		attr_col$[0,1]=attr_col$[0,1]+pad("FILES."+attr_col$[curr_attr,
:			fnstr_pos("DVAR",attr_def_col_str$[0,0],5)],40)

	next curr_attr

	attr_disp_col$=attr_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,gridAvail!,"COLH-LINES-LIGHT-AUTO",num_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_col$[all]

	rem -- size grid on form
	gridAvail!=callpoint!.getDevObject("avail_grid")

	gridAvail!.setSize(Form!.getWidth()-(gridAvail!.getX()*2),Form!.getHeight()-(gridAvail!.getY()+40))
	gridAvail!.setFitToGrid(1)



	return

rem =====================================================
load_grid: rem --- create vector of availability info and load grid

rem =====================================================

	sfe22_dev=fnget_dev("SFE_WOMATL")
	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	ivm02_dev=fnget_dev("IVM_ITEMWHSE")

	dim sfe_womatl$:fnget_tpl$("SFE_WOMATL")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
	dim ivm_itemwhse$:fnget_tpl$("IVM_ITEMWHSE")

	vectAvail!=SysGUI!.makeVector()

	wo_loc$=callpoint!.getDevObject("wo_loc")
	wo_no$=callpoint!.getDevObject("wo_no")
	allow_release$="Y"

	read (sfe22_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)

	while 1
		sfe22_key$=key(sfe22_dev,end=*break)
		read record (sfe22_dev)sfe_womatl$
		if pos(firm_id$+wo_loc$+wo_no$=sfe_womatl$)<>1 then break
		if sfe_womatl.line_type$="M" then continue
		read record (ivm02_dev,key=firm_id$+sfe_womatl.warehouse_id$+sfe_womatl.item_id$,dom=*next)ivm_itemwhse$
		if cvs(ivm_itemwhse.item_id$,3)="" 
			at_whse$=" - Not at warehouse!"
			allow_release$="N"
			callpoint!.setColumnEnabled("SFE_RELEASEWO.RELEASE",0)
		else
			at_whse$=""
			callpoint!.setColumnEnabled("SFE_RELEASEWO.RELEASE",1)
		endif
		read record (ivm01_dev,key=firm_id$+sfe_womatl.item_id$,dom=*next)ivm_itemmast$
		vectAvail!.addItem(sfe_womatl.item_id$)
		vectAvail!.addItem(cvs(ivm_itemmast.item_desc$,3)+at_whse$)
		vectAvail!.addItem(sfe_womatl.total_units$)
		vectAvail!.addItem(ivm_itemwhse.qty_on_hand$)
		vectAvail!.addItem(ivm_itemwhse.qty_commit$)
		vectAvail!.addItem(str(num(ivm_itemwhse.qty_on_hand$)-num(ivm_itemwhse.qty_commit$)))
		vectAvail!.addItem(ivm_itemwhse.qty_on_order$)
	wend

	gridAvail!=callpoint!.getDevObject("avail_grid")
	if vectAvail!.size()
		numrow=vectAvail!.size()/gridAvail!.getNumColumns()
		gridAvail!.clearMainGrid()
		gridAvail!.setNumRows(numrow)
		gridAvail!.setCellText(0,0,vectAvail!)
	endif

	if allow_release$="N"
		callpoint!.setColumnEnabled("SFE_RELEASEWO.RELEASE",-1)
	else
		callpoint!.setColumnEnabled("SFE_RELEASEWO.RELEASE",1)
	endif


	return
[[SFE_RELEASEWO.ARAR]]
rem --- Set defaults

	if callpoint!.getDevObject("wo_status")="O"
		callpoint!.setColumnData("SFE_RELEASEWO.RELEASE","Y",1)
	endif
[[SFE_RELEASEWO.ASVA]]
rem --- Process information

	wo_no$=callpoint!.getDevObject("wo_no")

	if callpoint!.getColumnData("SFE_RELEASEWO.PRINT_TRAVEL")="Y"
		opened_wo=fnget_dev("SFE_OPENEDWO")
		dim opened_wo$:fnget_tpl$("SFE_OPENEDWO")
		opened_wo.firm_id$=firm_id$
		opened_wo.wo_no$=wo_no$
		opened_wo$=field(opened_wo$)
		write record (opened_wo) opened_wo$
	endif
[[SFE_RELEASEWO.BSHO]]
rem --- Open needed tables

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFE_OPENEDWO",open_opts$[1]="OTA"
	gosub open_tables

rem --- create grid to display shortages

	nxt_ctlID = num(stbl("+CUSTOM_CTL"))
	callpoint!.setDevObject("grid_ctlID",str(nxt_ctlID))
	wctl!=callpoint!.getControl("SFE_RELEASEWO.PRINT_PICK")
	gridAvail!=Form!.addGrid(nxt_ctlID,10,num(wctl!.getX())+75,700,200)
	callpoint!.setDevObject("avail_grid",gridAvail!)
	
	gosub format_grid
	gosub load_grid
