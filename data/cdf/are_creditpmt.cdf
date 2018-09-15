[[ARE_CREDITPMT.AREC]]
rem --- load up open invoices

	gosub get_open_invoices
	gosub fill_grid
[[ARE_CREDITPMT.CARD_NO.AVAL]]
rem ==============================================
rem -- mod10_check; see if card number field contains valid cc# format
rem ==============================================

	cc_digits$ = ""
	cc_curr_digit = 0
	cc_card$=callpoint!.getUserInput()

	for cc_temp = len(cc_card$) to 1 step -1
	cc_curr_digit = cc_curr_digit + 1
	cc_no = num(cc_card$(cc_temp,1)) * iff(mod(cc_curr_digit,2)=0, 2, 1)
	cc_digits$ = str(cc_no) + cc_digits$
	next cc_temp

	cc_total = 0
	for cc_temp = 1 to len(cc_digits$)
	cc_total = cc_total + num(cc_digits$(cc_temp, 1))
	next cc_temp

	if mod(cc_total, 10) <> 0
		callpoint!.setMessage("INVALID_CREDIT_CARD")
		callpoint!.setStatus("ABORT")
	endif
[[ARE_CREDITPMT.ASVA]]
rem --- check for mandatory data, confirm, then process

	if cvs(callpoint!.getColumnData("ARE_CREDITPMT.ADDRESS_LINE_1"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.CARD_NO"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.CITY"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.CNTRY_ID"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.CUSTOMER_ID"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.EMAIL_ADDR"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.FIRM_ID"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.MONTH"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.NAME_FIRST"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.NAME_LAST"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.PHONE_NO"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.SECURITY_CD"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.STATE_CODE"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.YEAR"),3)="" or
:		cvs(callpoint!.getColumnData("ARE_CREDITPMT.ZIP_CODE"),3)="" or
:		num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT"))=0

		dim msg_tokens$[1]
		msg_tokens$[0]="Please fill in all required fields."
		msg_id$="GENERIC_WARN"
		gosub disp_message
		callpoint!.setStatus("ABORT-ACTIVATE")
		break
	endif

	msg_id$="CONF_CC_PAYMENT"
	msg_opt$=""
	dim msg_tokens$[1]
	msg_tokens$[0]=callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT")
	gosub disp_message
	if msg_opt$<>"Y"
		callpoint!.setStatus("ABORT-ACTIVATE")
	endif
[[ARE_CREDITPMT.ACUS]]
rem --- Process custom event -- used in this pgm to select/de-select checkboxes in grid
rem --- See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info
rem --- This routine is executed when callbacks have been set to run a 'custom event'
rem --- Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind
rem --- of event it is... in this case, we're toggling checkboxes on/off in form grid control

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ctl_ID=dec(gui_event.ID$)
	if ctl_ID=num(callpoint!.getDevObject("openInvoicesGridId"))
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
[[ARE_CREDITPMT.CUSTOMER_ID.AVAL]]
rem --- load up open invoices
escape;rem getting here?
	gosub get_open_invoices
	gosub fill_grid
[[ARE_CREDITPMT.ASIZ]]
rem --- Resize grids
	formHeight=Form!.getHeight()
	formWidth=Form!.getWidth()
	openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
	gridYpos=openInvoicesGrid!.getY()
	gridXpos=openInvoicesGrid!.getX()
	availableHeight=formHeight-gridYpos

	openInvoicesGrid!.setSize(formWidth-2*gridXpos,availableHeight-8)
	openInvoicesGrid!.setFitToGrid(1)
[[ARE_CREDITPMT.AWIN]]
rem --- Declare classes used
	use ::ado_util.src::util

rem --- get/store mask
	call stbl("+DIR_PGM")+"adc_getmask.aon","","AR","A","",ar_a_mask$,0,0
	callpoint!.setDevObject("ar_a_mask",ar_a_mask$)

rem --- Open files

num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ART_INVHDR",open_opts$[1]="OTA"
gosub open_tables


rem --- Add open invoice grid to form
	nxt_ctlID = util.getNextControlID()
	tmpCtl!=callpoint!.getControl("ARE_CREDITPMT.EMAIL_ADDR")
	grid_y=tmpCtl!.getY()+tmpCtl!.getHeight()+5
	openInvoicesGrid! = Form!.addGrid(nxt_ctlID,5,grid_y,895,125); rem --- ID, x, y, width, height
	callpoint!.setDevObject("openInvoicesGrid",openInvoicesGrid!)
	callpoint!.setDevObject("openInvoicesGridId",str(nxt_ctlID))
	callpoint!.setDevObject("grid_cols","6")
	callpoint!.setDevObject("grid_rows","10")

	gosub format_grid

	openInvoicesGrid!.setTabAction(SysGUI!.GRID_NAVIGATE_GRID)
	openInvoicesGrid!.setTabActionSkipsNonEditableCells(1)

rem --- set callbacks - processed in ACUS callpoint
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_KEY_PRESS,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_MOUSE_UP,"custom_event")
[[ARE_CREDITPMT.<CUSTOM>]]
rem ==========================================================================
format_grid: rem --- Let Barista create/format the grid
rem ==========================================================================

	ar_a_mask$=callpoint!.getDevObject("ar_a_mask")

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0] = callpoint!.getColumnAttributeTypes()
	grid_cols = num(callpoint!.getDevObject("grid_cols"))
	grid_rows = num(callpoint!.getDevObject("grid_rows"))
	dim attr_grid_col$[grid_cols,len(attr_def_col_str$[0,0])/5]

	column_no = 1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="SELECT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_PAY")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="C"
	attr_grid_col$[column_no,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="5"

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="INVOICE_NO"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_INVOICE_NO")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="C"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="15"

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="INVOICE_DATE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_INVOICE_DATE")
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="5"
	attr_grid_col$[column_no,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="15"

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="DUE_DATE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_DUE_DATE")
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="5"
	attr_grid_col$[column_no,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="15"

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="AMOUNT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_AMOUNT")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="BALANCE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_BALANCE")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	for curr_attr=1 to grid_cols
		attr_grid_col$[0,1] = attr_grid_col$[0,1] + 
:			pad("ARE_CREDITPMT." + attr_grid_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
	next curr_attr

	attr_disp_col$=attr_grid_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,openInvoicesGrid!,"COLH-LINES-LIGHT-AUTO-SIZEC-MULTI-DATES-CHECKS",grid_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_grid_col$[all]

	return

rem ==========================================================================
get_open_invoices: rem --- create vector of unpaid invoices this customer
rem ==========================================================================

	art_invhdr=fnget_dev("ART_INVHDR")
	dim art_invhdr$:fnget_tpl$("ART_INVHDR")

	cust_id$=callpoint!.getColumnData("ARE_CREDITPMT.CUSTOMER_ID")
	ar_type$=art_invhdr.ar_type$;rem --- ar_type always '  '

	vectInvoices!=BBjAPI().makeVector()

	read (art_invhdr,key=firm_id$+ar_type$+cust_id$,dom=*next)

	while 1
		invky$=key(art_invhdr,end=*break)
		if pos(firm_id$+ar_type$+cust_id$=invky$)<>1 then break
		readrecord(art_invhdr)art_invhdr$
		if art_invhdr.invoice_bal=0 then continue
		vectInvoices!.add("")
		vectInvoices!.add(art_invhdr.ar_inv_no$)
		vectInvoices!.add(date(jul(art_invhdr.invoice_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(date(jul(art_invhdr.inv_due_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(art_invhdr.invoice_amt$)
		vectInvoices!.add(art_invhdr.invoice_bal$)
	wend

	callpoint!.setDevObject("vectInvoices",vectInvoices!)

	return

rem ==========================================================================
fill_grid: rem --- fill grid with vector of unpaid invoices
rem ==========================================================================
	if info(3,6)<>"5" then SysGUI!.setRepaintEnabled(0)
	openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
	if vectInvoices!.size()

		numrow=vectInvoices!.size()/openInvoicesGrid!.getNumColumns()
		openInvoicesGrid!.clearMainGrid()
		openInvoicesGrid!.setColumnStyle(0,SysGUI!.GRID_STYLE_UNCHECKED)
		openInvoicesGrid!.setNumRows(numrow)
		openInvoicesGrid!.setCellText(0,0,vectInvoices!)
		openInvoicesGrid!.resort()
	endif
	if info(3,6)<>"5" then SysGUI!.setRepaintEnabled(1)
return

rem ==========================================================================
switch_value:rem --- Switch Check Values
rem ==========================================================================
	if info(3,6)<>"5" then SysGUI!.setRepaintEnabled(0)
	openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
	vectInvoices!=callpoint!.getDevObject("vectInvoices")
	grid_cols=num(callpoint!.getDevObject("grid_cols"))
	TempRows!=openInvoicesGrid!.getSelectedRows()
	tot_pay=num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT"))

	if TempRows!.size()>0
		for curr_row=1 to TempRows!.size()
			if openInvoicesGrid!.getCellState(TempRows!.getItem(curr_row-1),0)=0
				openInvoicesGrid!.setCellState(TempRows!.getItem(curr_row-1),0,1)
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"Y")
				tot_pay=tot_pay+num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+5))
			else
				openInvoicesGrid!.setCellState(num(TempRows!.getItem(curr_row-1)),0,0)
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"")
				tot_pay=tot_pay-num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+5))
			endif
		next curr_row
	endif

	callpoint!.setColumnData("<<DISPLAY>>.APPLY_AMT",str(tot_pay),1)

	if info(3,6)<>"5" then SysGUI!.setRepaintEnabled(1)

	return
