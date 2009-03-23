[[IVC_ITEMLOOKUP.AWIN]]
rem --- open files

	use ::ado_util.src::util

	num_files=4
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVM_ITEMMAST", open_opts$[1]="OTA"
	open_tables$[2]="IVM_ITEMVEND", open_opts$[2]="OTA"
	open_tables$[3]="IVM_ITEMSYN",   open_opts$[3]="OTA"

	gosub open_tables

	ivm_itemmast_dev=num(open_chans$[1]); dim ivm_itemmast$:open_tpls$[1]
	ivm_itemvend_dev=num(open_chans$[2]); dim ivm_itemvend$:open_tpls$[2]
	ivm_itemsyn_dev=num(open_chans$[3]);   dim ivm_itemsyn$:open_tpls$[3]

rem ---  Set up grid

	dims_tmpl$ = "x:u(2),y:u(2),w:u(2),h:u(2)"
	dim g$:dims_tmpl$
	g.x = 10, g.y = 75, g.w = 400, g.h = 220
	callpoint!.setDevObject("dims_tmpl", dims_tmpl$)
	callpoint!.setDevObject("grid_dims", g$)

	nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
	gridSearch!=Form!.addGrid(nxt_ctlID, g.x, g.y, g.w, g.h)
	gridSearch!.setTabAction(SysGUI!.GRID_NAVIGATE_LEGACY)

	gridSearch!.setColumnEditable(0,0)
	gridSearch!.setColumnEditable(1,0)

	gridSearch!.setCallback(gridSearch!.ON_GRID_MOUSE_UP,"custom_event")
	gridSearch!.setCallback(gridSearch!.ON_GRID_SELECT_ROW,"custom_event")

	callpoint!.setDevObject("gridSearch",gridSearch!)

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0]=callpoint!.getColumnAttributeTypes()
	def_grid_cols=3
	num_rows=10
	dim attr_grid_col$[def_grid_cols,len(attr_def_col_str$[0,0])/5]

	dvar_pos = fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)
	labs_pos = fnstr_pos("LABS", attr_def_col_str$[0,0], 5)
	ctlw_pos = fnstr_pos("CTLW", attr_def_col_str$[0,0], 5)
	
	attr_grid_col$[1,dvar_pos]="SEARCH_KEY"
	attr_grid_col$[1,labs_pos]="Search Key"
	attr_grid_col$[1,ctlw_pos]="125"

	attr_grid_col$[2,dvar_pos]="ITEM_NO"
	attr_grid_col$[2,labs_pos]="Item"
	attr_grid_col$[2,ctlw_pos]="125"	

	attr_grid_col$[3,dvar_pos]="DESC"
	attr_grid_col$[3,labs_pos]="Description"
	attr_grid_col$[3,ctlw_pos]="125"	
	
	for curr_attr=1 to def_grid_cols
		attr_grid_col$[0,1] = attr_grid_col$[0,1] + 
:			pad( "IVC_ITEMLOOKUP." + attr_grid_col$[curr_attr, dvar_pos], 40 )
	next curr_attr

	attr_disp_col$=attr_grid_col$[0,1]
	
	call stbl("+DIR_SYP")+"bam_grid_init.bbj",
:		gui_dev,
:		gridSearch!,
:		"LINES-COLH",
:		num_rows,
:		attr_def_col_str$[all],
:		attr_disp_col$,
:		attr_grid_col$[all]

rem --- Create Item Information window			
		
	dim w$:dims_tmpl$
	w.x = 420, w.y = 65, w.w = 420, w.h = 225
	callpoint!.setDevObject("child_window_dims", w$)

	cxt=SysGUI!.getAvailableContext()
	infoWin!=form!.addChildWindow(15000, w.x, w.y, w.w, w.h, "", $00000800$, cxt)
	SysGUI!.setContext(cxt)

	infoWin!.addGroupBox(15999,5,5,415,220,"Inventory Detail",$$)
	
	infoWin!.addStaticText(15001,10,25,75,15,"Product Type:",$8000$)

	infoWin!.addStaticText(15003,10,65,75,15,"Unit of Sale:",$8000$)
	infoWin!.addStaticText(15004,10,85,75,15,"Weight:",$8000$)

	infoWin!.addStaticText(15005,200,25,75,15,"Alt/Super:",$8000$)
	infoWin!.addStaticText(15006,200,45,75,15,"Last Receipt:",$8000$)
	infoWin!.addStaticText(15007,200,65,75,15,"Last Issue:",$8000$)
	infoWin!.addStaticText(15008,200,85,75,15,"Lot/Serialized?:",$8000$)

	infoWin!.addStaticText(15009,10,125,75,15,"On hand:",$8000$)
	infoWin!.addStaticText(15010,10,145,75,15,"Committed:",$8000$)
	infoWin!.addStaticText(15011,10,165,75,15,"Available:",$8000$)
	infoWin!.addStaticText(15012,10,185,75,15,"On Order:",$8000$)

	rem --- above labels, now data (sample only -- need to fix)
	rem callpoint!.setDevObject("vendor_id",  str(15101))
	rem infoWin!.addStaticText(15101,95,25,175,15,"",$0000$)

	callpoint!.setDevObject("infoWin",infoWin!)			

	if !util.alreadyResized() then 
		util.resizeWindow(Form!, SysGui!)
	endif
	
[[IVC_ITEMLOOKUP.LOTS_TO_DISP.AVAL]]
rem -- user changed lot type -- re-read/display selected lot type

	lots_to_disp$=callpoint!.getUserInput()
	gosub read_and_display_lot_grid
[[IVC_ITEMLOOKUP.ACUS]]
rem --- Process custom event -- used in this pgm to select lot and display info.
rem
rem --- See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info.
rem
rem --- This routine is executed when callbacks have been set to run a "custom event".
rem
rem --- Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind
rem --- of event it is... in this case, we're toggling checkboxes on/off in form grid control.

rem --- Get the control ID of the event

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ctl_ID=dec(gui_event.ID$)

	rem --- Get Grid's ID

	gridSearch!=callpoint!.getDevObject("gridSearch")
	wctl=gridSearch!.getID()
	
	rem --- This is a grid event

	if ctl_ID=wctl
	
		if gui_event.code$="N"
			notify_base$=notice(gui_dev,gui_event.x%)
			dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
			notice$=notify_base$
		endif
		
		numcols=gridSearch!.getNumColumns()
		vectLots!=callpoint!.getDevObject("vectLots")
		curr_row=dec(notice.row$)
		curr_col=dec(notice.col$)
		
		switch notice.code
			case 19; rem grid_key_press
			case 14; rem grid_mouse_up
				callpoint!.setDevObject("selected_lot",gridSearch!.getCellText(curr_row,0))				
				gosub get_lot_info
				break
		swend
	endif
[[IVC_ITEMLOOKUP.<CUSTOM>]]
rem ==========================================================================
read_and_display_lot_grid:
rem ==========================================================================

rem --- Position ivm-07 file

	vectLots!=SysGUI!.makeVector()
	ivm_lsmaster_dev=fnget_dev("IVM_LSMASTER")
	dim ivm_lsmaster$:fnget_tpl$("IVM_LSMASTER")
	
	whse_id$ = callpoint!.getColumnData("IVC_ITEMLOOKUP.WAREHOUSE_ID")
	item_id$ = callpoint!.getColumnData("IVC_ITEMLOOKUP.ITEM_ID")
	
	read (ivm_lsmaster_dev,key=firm_id$+whse_id$+item_id$,dom=*next)

	while 1 
		read record (ivm_lsmaster_dev,end=*break) ivm_lsmaster$
		
		if ivm_lsmaster.firm_id$<>firm_id$ 
:			or ivm_lsmaster$.warehouse_id$<>whse_id$
:			or ivm_lsmaster.item_id$<>item_id$
:		then break

		if lots_to_disp$="O" and ivm_lsmaster.closed_flag$<>" " then continue
		if lots_to_disp$="C" and ivm_lsmaster.closed_flag$<>"C" then continue
		if lots_to_disp$="Z" and (ivm_lsmaster.qty_on_hand-ivm_lsmaster.qty_commit<=0 or ivm_lsmaster.closed_flag$="C") then continue
		
		switch pos(ivm_lsmaster.closed_flag$=" CL")
			case 1
				desc$="Open"
			break
			case 2
				desc$="Closed"
			break
			case 3
				desc$="Locked"
			break
			case default
				desc$="not found"
			break
		swend		
		
		vectLots!.addItem(ivm_lsmaster.lotser_no$)
		vectLots!.addItem(desc$)
	wend

	gridSearch!=callpoint!.getDevObject("gridSearch")

	if vectLots!.size()
		numrows=vectLots!.size()/gridSearch!.getNumColumns()
		gridSearch!.clearMainGrid()
		gridSearch!.setNumRows(numrows)
		gridSearch!.setCellText(0,0,vectLots!)
		gridSearch!.resort()
		gridSearch!.deselectAllCells()
	else
		gridSearch!.clearMainGrid()
		gridSearch!.setNumRows(0)
	endif

	callpoint!.setDevObject("vectLots",vectLots!)

return

rem ==========================================================================
get_lot_info:
rem ==========================================================================

	ivm_lsmaster_dev=fnget_dev("IVM_LSMASTER")
	apm_vendmast_dev=fnget_dev("APM_VENDMAST")

	dim ivm_lsmaster$:fnget_tpl$("IVM_LSMASTER")
	dim apm_vendmast$:fnget_tpl$("APM_VENDMAST")

	whse_id$ = callpoint!.getColumnData("IVC_ITEMLOOKUP.WAREHOUSE_ID")
	item_id$ = callpoint!.getColumnData("IVC_ITEMLOOKUP.ITEM_ID")

	get_lot$=callpoint!.getDevObject("selected_lot")

	rem --- added knum=0 to below, because if user typed their own lot#, Barista validation logic would
	rem --- have used knum=3...
	read (ivm_lsmaster_dev,key=firm_id$+whse_id$+item_id$+cvs(get_lot$,3),knum=0,dom=*next)

	infoWin!=callpoint!.getDevObject("lotInfo")	

	while 1
		readrecord(ivm_lsmaster_dev,end=*break) ivm_lsmaster$
		
		if ivm_lsmaster.firm_id$<>firm_id$ 
:			or ivm_lsmaster$.warehouse_id$<>whse_id$
:			or ivm_lsmaster.item_id$<>item_id$
:			or ivm_lsmaster.lotser_no$<>get_lot$ 
:	   then break

		callpoint!.setDevObject("selected_lot_loc",ivm_lsmaster.ls_location$)
		callpoint!.setDevObject("selected_lot_cmt",ivm_lsmaster.ls_comments$)
		callpoint!.setDevObject("selected_lot_avail",str(ivm_lsmaster.qty_on_hand-ivm_lsmaster.qty_commit))

		rem --- Retrieve vendor name

		vendor$=""
		vendor_id = num( callpoint!.getDevObject("vendor_id") )
		
		if callpoint!.getDevObject("ap_installed") = "Y"
			vendor$=ivm_lsmaster.vendor_id$
			disp_vendor$="(unknown)"
				if cvs(vendor$,2)<>""
					find record (apm_vendmast_dev,key=firm_id$+vendor$,dom=*next) apm_vendmast$
					disp_vendor$=apm_vendmast.vendor_id$+" "+cvs(apm_vendmast.vendor_name$,2)
				endif
			w!=infoWin!.getControl(vendor_id)
			w!.setText(disp_vendor$)
		endif

		rem --- Display grid info
		
		w!=infoWin!.getControl( num( callpoint!.getDevObject("comment_id") ) )
		w!.setText(ivm_lsmaster.ls_comments$)
		receipt$=fn_date$(fnlatest$(ivm_lsmaster.lstrec_date$,ivm_lsmaster.lstblt_date$))
		issue$=fn_date$(fnlatest$(ivm_lsmaster.lstsal_date$,ivm_lsmaster.lstiss_date$))
		w!=infoWin!.getControl( num( callpoint!.getDevObject("receipt_id") ) )
		w!.setText(receipt$)
		w!=infoWin!.getControl( num( callpoint!.getDevObject("issued_id") ) )
		w!.setText(issue$)
		w!=infoWin!.getControl( num( callpoint!.getDevObject("cost_id") ) )
		w!.setText(ivm_lsmaster.unit_cost$);rem need mask
		w!=infoWin!.getControl( num( callpoint!.getDevObject("location_id") ) )
		w!.setText(ivm_lsmaster.ls_location$)
		w!=infoWin!.getControl( num( callpoint!.getDevObject("onhand_id") ) )
		w!.setText(ivm_lsmaster.qty_on_hand$)
		w!=infoWin!.getControl( num( callpoint!.getDevObject("committed_id") ) )
		w!.setText(ivm_lsmaster.qty_commit$)
		w!=infoWin!.getControl( num( callpoint!.getDevObject("available_id") ) )
		w!.setText(str(ivm_lsmaster.qty_on_hand-ivm_lsmaster.qty_commit))

	wend

return

rem ==========================================================================
rem --- Functions
rem ==========================================================================

rem --- Return the later of two dates

	def fnlatest$(q1$,q2$)
		q3$=""
		if cvs(q1$,2)<>"" then let q3$=q1$
		if cvs(q2$,2)<>"" then if q2$>q3$ then let q3$=q2$
		return q3$
	fnend

rem --- Format date from YYYYMMDD to MM/DD/YY

    def fn_date$(q$)
        q1$=""
        q1$=date( jul( num(q$(1,4)), num(q$(5,2)), num(q$(7,2)),err=*next ),err=*next )
        if q1$="" then q1$=q$
        return q1$
    fnend

rem ==========================================================================
#include std_missing_params.src
rem ==========================================================================
