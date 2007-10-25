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

	attr_inv_col$[0,1]=attr_inv_col$[0,1]+pad("APT_PAY."+attr_inv_col$[curr_attr,
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

	call stbl("+DIR_PGM")+"adc_getmask.aon","VENDOR_ID","","","",m0$,0,vendor_len
	call stbl("+DIR_PGM")+"adc_getmask.aon","","AP","A","",m1$,0,0
	more=1
	read (apt01_dev,key=firm_id$,dom=*next)
	vectInvoices!=SysGUI!.makeVector()
	vectInvoicesSel!=SysGUI!.makeVector()
	rows=0

	while more
		readrecord (apt01_dev,end=*break)apt01a$
		if pos(firm_id$=apt01a$)<>1 then break
		dim apm01a$:fattr(apm01a$)
		readrecord(apm01_dev,key=firm_id$+apt01a.vendor_id$,dom=*next)apm01a$
		readrecord(apt11_dev,key=firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$,dom=*next)
		while more
			readrecord(apt11_dev,end=*break)apt11a$
			if pos(firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$=
:				firm_id$+apt11a.ap_type$+apt11a.vendor_id$+apt11a.ap_inv_no$) <>1 then break
			apt01a.invoice_amt=apt01a.invoice_amt+apt11a.trans_amt+apt11a.trans_disc
		wend
		if apt01a.invoice_amt<>0 then
			vectInvoices!.addItem("")
			vectInvoices!.addItem(apt01a.ap_type$)
			vectInvoices!.addItem(fnmask$(apt01a.vendor_id$(1,vendor_len),m0$))
			vectInvoices!.addItem(apm01a.vendor_name$)
			vectInvoices!.addItem(apt01a.ap_inv_no$)
			vectInvoices!.addItem(fndate$(apt01a.inv_due_date$))
			vectInvoices!.addItem(str(apt01a.invoice_amt:m1$))
			if apt01a.selected_for_pay$="Y"
				vectInvoicesSel!.addItem("Y")
			else
				vectInvoicesSel!.addItem("")
			endif
			rows=rows+1
		endif
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

rem --- fnmask$: Alphanumeric Masking Function (formerly fnf$)

	def fnmask$(q1$,q2$)
		if q2$="" q2$=fill(len(q1$),"0")
		return str(-num(q1$,err=*next):q2$,err=*next)
		q=1
		q0=0
		while len(q2$(q))
			if pos(q2$(q,1)="-()") q0=q0+1 else q2$(q,1)="X"
			q=q+1
		wend
		if len(q1$)>len(q2$)-q0 q1$=q1$(1,len(q2$)-q0)
		return str(q1$:q2$)
	fnend

#include std_missing_params.src
[[APE_PAYSELECT.ASVA]]
rem "update apt-01) -- remove/write -- based on what's checked in the grid

apt01_dev=fnget_dev("APT_INVOICEHDR")
dim apt01a$:fnget_tpl$("APT_INVOICEHDR")
ape04_dev=fnget_dev("APE_CHECKS")
dim ape04a$:fnget_tpl$("APE_CHECKS")
apt11_dev=fnget_dev("APT_INVOICEDET")
dim apt11a$:fnget_tpl$("APT_INVOICEDET")
more=1

gridInvoices!=UserObj!.getItem(num(user_tpl.gridInvoicesOfst$))
gridRows=gridInvoices!.getNumRows()
if gridRows
	call stbl("+DIR_PGM")+"adc_clearpartial.aon","N",ape04_dev,firm_id$,status
	for row=0 to gridRows-1
		apt01_key$=firm_id$+gridInvoices!.getCellText(row,1)+
:						   gridInvoices!.getCellText(row,2)+
:						   gridInvoices!.getCellText(row,4)
		readrecord(apt01_dev,key=apt01_key$)apt01a$
		if gridInvoices!.getCellState(row,0)=0
			apt01a.selected_for_pay$="N"
		else
			apt01a.selected_for_pay$="Y"
			readrecord(apt11_dev,key=firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$,dom=*next)
			while more
				readrecord(apt11_dev,end=*break)apt11a$
				if pos(firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$=
:					firm_id$+apt11a.ap_type$+apt11a.vendor_id$+apt11a.ap_inv_no$) <>1 then break
				apt01a.invoice_amt=apt01a.invoice_amt+apt11a.trans_amt+apt11a.trans_disc
			wend
			dim ape04a$:fattr(ape04a$)
			ape04a.firm_id$=firm_id$
			ape04a.ap_type$=apt01a.ap_type$
			ape04a.vendor_id$=apt01a.vendor_id$
			ape04a.ap_inv_no$=apt01a.ap_inv_no$
			ape04a.reference$=apt01a.reference$
			ape04a.ap_inv_memo$=apt01a.ap_inv_memo$
			ape04a.invoice_date$=apt01a.invoice_date$
			ape04a.disc_date$=apt01a.disc_date$
			ape04a.invoice_amt=apt01a.invoice_amt
			ape04a.discount_amt=apt01a.discount_amt
			ape04a.retention=apt01a.retention
			ape04a$=field(ape04a$)
			write record(ape04_dev,key=firm_id$+ape04a.ap_type$+ape04a.vendor_id$+ape04a.ap_inv_no$)ape04a$
		endif
		apt01a$=field(apt01a$)
		write record(apt01_dev,key=firm_id$+apt01a.ap_type$+apt01a.vendor_id$+apt01a.ap_inv_no$)apt01a$
	next row

endif
[[APE_PAYSELECT.AWIN]]
rem --- Open/Lock files

num_files=4
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

open_tables$[1]="APT_INVOICEHDR",open_opts$[1]="OTA"
open_tables$[2]="APT_INVOICEDET",open_opts$[2]="OTA"
open_tables$[3]="APM_VENDMAST",open_opts$[3]="OTA"
open_tables$[4]="APE_CHECKS",open_opts$[4]="OTA"

gosub open_tables

apt01_dev=num(open_chans$[1]),apt01_tpl$=open_tpls$[1]
apt11_dev=num(open_chans$[2]),apt11_tpl$=open_tpls$[2]
apm01_dev=num(open_chans$[3]),apm01_tpl$=open_tpls$[3]
ape04_dev=num(open_chans$[4]),ape04_tpl$=open_tpls$[4]

rem --- Dimension string templates

    dim apt01a$:apt01_tpl$,apt11a$:apt11_tpl$,apm01a$:apm01_tpl$,ape04a$:ape04_tpl$

rem --- See if we need to clear out ape-04

msg_id$="CLEAR_SEL"
dim msg_tokens$[1]
msg_opt$=""
gosub disp_message
if msg_opt$="Y"
	call stbl("+DIR_PGM")+"adc_clearpartial.aon","N",ape04_dev,firm_id$,status
	read(apt01_dev,key=firm_id$,dom=*next)
	more=1
	while more
		apt01_key$=key(apt01_dev,end=*break)
		if pos(firm_id$=apt01_key$)<>1 break
		readrecord(apt01_dev,key=apt01_key$)apt01a$
		apt01a.selected_for_pay$="N"
		write record(apt01_dev,key=apt01_key$)apt01a$
	wend	
endif

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
UserObj!.addItem(SysGUI!.makeVector());rem vector of recs from Open Invoices
UserObj!.addItem(SysGUI!.makeVector());rem vector of which invoices are selected

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
