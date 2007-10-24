[[APE_PAYSELECT.<CUSTOM>]]
format_grid:

dim attr_def_col_str$[0,0]
attr_def_col_str$[0,0]=callpoint!.getColumnAttributeTypes()
def_inv_cols=num(user_tpl.gridInvoicesCols$)
num_rpts_rows=num(user_tpl.gridInvoicesRows$)
dim attr_inv_col$[def_inv_cols,len(attr_def_col_str$[0,0])/5]
attr_inv_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="SELECT"
attr_inv_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=""
attr_inv_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="25"
attr_inv_col$[1,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]="1"
attr_inv_col$[1,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="C"

attr_inv_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="AP_TYPE"
attr_inv_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="A/P Type"
attr_inv_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="25"

attr_inv_col$[3,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="VEND_ID"
attr_inv_col$[3,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Vendor"
attr_inv_col$[3,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

attr_inv_col$[4,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="VEND_NAME"
attr_inv_col$[4,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Name"
attr_inv_col$[4,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="150"

attr_inv_col$[5,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="INVOICE_NO"
attr_inv_col$[5,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Invoice"
attr_inv_col$[5,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

attr_inv_col$[6,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="DUE_DATE"
attr_inv_col$[6,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Due Date"
attr_inv_col$[6,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

attr_inv_col$[7,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="AMT_DUE"
attr_inv_col$[7,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]="Amount Due"
attr_inv_col$[7,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

for curr_attr=1 to def_inv_cols

	attr_inv_col$[0,1]=attr_inv_col$[0,1]+pad("APE_PAY."+attr_inv_col$[curr_attr,
:		fnstr_pos("DVAR",attr_def_col_str$[0,0],5)],40)

next curr_attr

attr_disp_col$=attr_inv_col$[0,1]

call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,gridInvoices!,"COLH-LINES-LIGHT-AUTO-MULTI-SIZEC-DATES-CHECKS",num_rpts_rows,
:	attr_def_col_str$[all],attr_disp_col$,attr_inv_col$[all]

return

fill_grid:

	SysGUI!.setRepaintEnabled(0)
	gridInvoices!=UserObj!.getItem(num(user_tpl.gridInvoicesOfst$))
	minrows=num(user_tpl.gridInvoicesRows$)
	if vectInvoices!.size()

		numrow=vectInvoices!.size()/gridInvoices!.getNumColumns()
		gridInvoices!.clearMainGrid()
		gridInvoices!.setColumnStyle(0,SysGUI!.GRID_STYLE_UNCHECKED)
		gridInvoices!.setNumRows(numrow)
		gridInvoices!.setCellText(0,0,vectInvoices!)
		if vectInvoicesSel!.size()
			for wk=0 to vectInvoicesSel!.size()-1
				if vectInvoicesSel!.getItem(wk)="Y"
					gridInvoices!.setCellStyle(wk,0,SysGUI!.GRID_STYLE_CHECKED)
				endif
			next wk
		endif
		gridInvoices!.resort()
		rem gridInvoices!.setSelectedRow(0)
		rem gridInvoices!.setSelectedColumn(1)
	endif
	SysGUI!.setRepaintEnabled(1)
return

create_reports_vector:

	more=1
	read (ape01_dev,key=firm_id$,dom=*next)
	vectInvoices!=SysGUI!.makeVector()
	vectInvoicesSel!=SysGUI!.makeVector()
	rows=0

	while more
		readrecord (ape01_dev,end=*break)ape01a$
		if pos(firm_id$=ape01a$)<>1 then break
		vectInvoices!.addItem("")
		vectInvoices!.addItem(ape01a.ap_type$)
		vectInvoices!.addItem(ape01a.vendor_id$)
		vectInvoices!.addItem("Chris")
		vectInvoices!.addItem(ape01a.ap_inv_no$)
		vectInvoices!.addItem(ape01a.inv_due_date$)
		vectInvoices!.addItem(ape01a.invoice_amt$)
		if ape01a.selected_for_pay$="Y"
			vectInvoicesSel!.addItem("Y")
		else
			vectInvoicesSel!.addItem("")
		endif
		rows=rows+1
	wend
	callpoint!.setStatus("REFRESH")
	
return

switch_value:rem --- Switch Check Values

	SysGUI!.setRepaintEnabled(0)
	gridInvoices!=UserObj!.getItem(num(user_tpl.gridInvoicesOfst$))
	TempRows!=gridInvoices!.getSelectedRows()
	if TempRows!.size()>0
		for curr_row=1 to TempRows!.size()
			if gridInvoices!.getCellState(TempRows!.getItem(curr_row-1),0)=0
				gridInvoices!.setCellState(TempRows!.getItem(curr_row-1),0,1)
				else
				gridInvoices!.setCellState(num(TempRows!.getItem(curr_row-1)),0,0)
			endif
		next curr_row
	endif

	SysGUI!.setRepaintEnabled(1)

	return
		
#include std_missing_params.src
[[APE_PAYSELECT.ASVA]]
rem "update ape-01) -- remove/write -- based on what's checked in the grid

ape01_dev=fnget_dev("APE_INVOICEHDR")
dim ape01a$:fnget_tpl$("APE_INVOICEHDR")

gridInvoices!=UserObj!.getItem(num(user_tpl.gridInvoicesOfst$))
gridRows=gridInvoices!.getNumRows()
if gridRows
	for row=0 to gridRows-1
		ape01_key$=firm_id$+gridInvoices!.getCellText(row,1)+
:						   gridInvoices!.getCellText(row,2)+
:						   gridInvoices!.getCellText(row,4)
		readrecord(ape01_dev,key=ape01_key$)ape01a$
		if gridInvoices!.getCellState(row,0)=0
			ape01a.selected_for_pay$="N"
		else
			ape01a.selected_for_pay$="Y"
		endif
		ape01a$=field(ape01a$)
		write record(ape01_dev,key=firm_id$+ape01a.ap_type$+ape01a.vendor_id$+ape01a.ap_inv_no$)ape01a$
	next row

endif
[[APE_PAYSELECT.AWIN]]
rem --- Open/Lock files

num_files=2
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

open_tables$[1]="APE_INVOICEHDR",open_opts$[1]="OTA"
open_tables$[2]="APE_INVOICEDET",open_opts$[2]="OTA"

gosub open_tables

ape01_dev=num(open_chans$[1]),ape01_tpl$=open_tpls$[1]
ape11_dev=num(open_chans$[2]),ape11_tpl$=open_tpls$[2]

rem --- Dimension string templates

    dim ape01a$:ape01_tpl$,ape11a$:ape11_tpl$

rem --- add grid to store report master records, with checkboxes for user to select one or more reports

user_tpl_str$="gridInvoicesOfst:c(5),gridInvoicesCols:c(5),gridInvoicesRows:c(5),gridInvoicesCtlID:c(5)," +
:		    	"vectInvoicesOfst:c(5),vectInvoicesSelOfst:c(5)"
dim user_tpl$:user_tpl_str$

UserObj!=SysGUI!.makeVector()
nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))

gridInvoices!=Form!.addGrid(nxt_ctlID,5,100,400,200)
user_tpl.gridInvoicesCtlID$=str(nxt_ctlID)
user_tpl.gridInvoicesCols$="7"
user_tpl.gridInvoicesRows$="8"
user_tpl.gridInvoicesOfst$="0"
user_tpl.vectInvoicesOfst$="1"
user_tpl.vectInvoicesSelOfst$="2"

gosub format_grid

UserObj!.addItem(gridInvoices!)
UserObj!.addItem(SysGUI!.makeVector());rem vector of recs from Fin Rpt Master
UserObj!.addItem(SysGUI!.makeVector());rem vector of which reports are selected

rem --- misc other init
gridInvoices!.setColumnEditable(0,1)
gridInvoices!.setTabAction(SysGUI!.GRID_NAVIGATE_LEGACY)

gosub create_reports_vector
gosub fill_grid

rem --- set callbacks - processed in ACUS callpoint
gridInvoices!.setCallback(gridInvoices!.ON_GRID_KEY_PRESS,"custom_event")
gridInvoices!.setCallback(gridInvoices!.ON_GRID_MOUSE_UP,"custom_event")
[[APE_PAYSELECT.ASIZ]]
if UserObj!<>null()
	gridInvoices!=UserObj!.getItem(num(user_tpl.gridInvoicesOfst$))
	gridInvoices!.setColumnWidth(0,25)
	gridInvoices!.setColumnWidth(1,50)
	gridInvoices!.setSize(Form!.getWidth()-(gridInvoices!.getX()*2),Form!.getHeight()-(gridInvoices!.getY()+40))
	gridInvoices!.setFitToGrid(1)

endif
[[APE_PAYSELECT.ACUS]]
rem process custom event -- used in this pgm to select/de-select checkboxes in grid
rem see basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info
rem this routine is executed when callbacks have been set to run a "custom event"
rem analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind
rem of event it is... in this case, we're toggling checkboxes on/off in form grid control

dim gui_event$:tmpl(gui_dev)
dim notify_base$:noticetpl(0,0)
gui_event$=SysGUI!.getLastEventString()
ctl_ID=dec(gui_event.ID$)
if ctl_ID=num(user_tpl.gridInvoicesCtlID$)
	if gui_event.code$="N"
		notify_base$=notice(gui_dev,gui_event.x%)
		dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
		notice$=notify_base$
	endif
	switch notice.code
		case 12;rem grid_key_press
			if notice.wparam=32 gosub switch_value
		break
		case 14;rem grid_mouse_up
			if notice.col=0 gosub switch_value
		break
	swend
endif
