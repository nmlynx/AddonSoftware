[[GMM_CUSTIMPORT.ACUS]]
rem --- Process custom event

rem This routine is executed when callbacks have been set to run a 'custom event'.
rem Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind of event it is.
rem See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info.

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ctl_ID=dec(gui_event.ID$)

	if gui_event.code$="N"
		notify_base$=notice(gui_dev,gui_event.x%)
		dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
		notice$=notify_base$
	endif

	rem --- Edit app grid
	if ctl_ID=num(callpoint!.getDevObject("importGridCtlID")) then

		e!=SysGUI!.getLastEvent()
		importGrid!=callpoint!.getDevObject("importGrid")
rem wgh ... stopped here
rem wgh ... 		appRowVect!=callpoint!.getDevObject("appRowVect")
rem wgh ... 		app_grid_def_cols=num(callpoint!.getDevObject("app_grid_def_cols"))
rem wgh ... 		index=e!.getRow()*app_grid_def_cols

		switch notice.code
			case 12; rem --- ON_GRID_KEY_PRESS
				rem ---  Allow space-bar toggle of checkboxes
				if (e!.getColumn()=2 or e!.getColumn()=3) and notice.wparam=32 then
					onoff=iff(importGrid!.getCellState(e!.getRow(),e!.getColumn()),0,1)
rem wgh ... 					gosub update_app_grid
				endif
			break
			case 30; rem --- ON_GRID_CHECK_ON and ON_GRID_CHECK_OFF
				rem --- isChecked() is the state when event sent before control is updated,
				rem --- so use !isChecked() to get current state of control
				if e!.getColumn()=2 or e!.getColumn()=3 then
					onoff=!e!.isChecked()
rem wgh ... 					gosub update_app_grid
				endif
			break
		swend
	endif
[[GMM_CUSTIMPORT.ASVA]]
rem --- Make sure we get all entries in the grid by setting focus on some control besides the grid

	ctl!=callpoint!.getControl("GMM_CUSTIMPORT.CSV_FILE")
	ctl!.focus()
[[GMM_CUSTIMPORT.BSHO]]
rem --- Get GoldMine interface client
	use ::gmo_GmInterfaceClient.aon::GmInterfaceClient
	use ::gmo_GmInterfaceClient.aon::SortByCompanyContact
	gmClient!=new GmInterfaceClient()
	callpoint!.setDevObject("gmClient",gmClient!)

rem --- Get background color for not selectable grid rows
	RGB$="231,236,255"
	RGB$=stbl("+GRID_NONEDIT_COLOR",err=*next)
	gosub get_RGB
	callpoint!.setDevObject("notSelectableColor",BBjAPI().getSysGui().makeColor(R,G,B))

rem --- Get RED color
	RGB$="255,0,0"
	gosub get_RGB
	callpoint!.setDevObject("redColor",BBjAPI().getSysGui().makeColor(R,G,B))

rem --- Open/Lock files
	num_files=2
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="GMX_CUSTOMER",open_opts$[1]="OTA"
	open_tables$[2]="ARM_CUSTMAST",open_opts$[2]="OTA"
	gosub open_tables

rem --- Define fields expected in the CSV file
	numFields = 14
	csvFieldNames! = Array.newInstance(Class.forName("java.lang.String"), numFields)
	Array.set(csvFieldNames!, 0, "accountno")
	Array.set(csvFieldNames!, 1, "recid")
	Array.set(csvFieldNames!, 2, "company")
	Array.set(csvFieldNames!, 3, "contact")
	Array.set(csvFieldNames!, 4, "phone1")
	Array.set(csvFieldNames!, 5, "fax")
	Array.set(csvFieldNames!, 6, "ext1")
	Array.set(csvFieldNames!, 7, "address1")
	Array.set(csvFieldNames!, 8, "address2")
	Array.set(csvFieldNames!, 9, "address3")
	Array.set(csvFieldNames!, 10, "city")
	Array.set(csvFieldNames!, 11, "state")
	Array.set(csvFieldNames!, 12, "zip")
	Array.set(csvFieldNames!, 13, "country")
	callpoint!.setDevObject("csvFieldNames",csvFieldNames!)

	jrFields! = Array.newInstance(Class.forName("net.sf.jasperreports.engine.design.JRDesignField"), numFields)
	for i = 0 to numFields - 1
		field! = new JRDesignField()
		field!.setName(Array.get(csvFieldNames!,i))
		field!.setValueClassName("java.lang.String")
		Array.set(jrFields!, i, field!)
	next i
	callpoint!.setDevObject("jrFields",jrFields!)
[[GMM_CUSTIMPORT.ASIZ]]
rem --- Resize grid

	formHeight=Form!.getHeight()
	formWidth=Form!.getWidth()
	importGrid!=callpoint!.getDevObject("importGrid")
	gridYpos=importGrid!.getY()
	gridXpos=importGrid!.getX()
	availableHeight=formHeight-gridYpos
	gridHeight=availableHeight-5

	importGrid!.setSize(formWidth-2*gridXpos,gridHeight)
	importGrid!.setFitToGrid(1)
[[GMM_CUSTIMPORT.<CUSTOM>]]
rem ==========================================================================
format_grid: rem --- Use Barista program to format the grid
rem ==========================================================================
	importGridCols = 20
	importGridRows = 15
	callpoint!.setDevObject("importGridCols",importGridCols)
	callpoint!.setDevObject("importGridRows",importGridRows)

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0] = callpoint!.getColumnAttributeTypes()
	dim attr_grid_col$[importGridCols,len(attr_def_col_str$[0,0])/5]

	rem --- Checkbox 1 - Add new Addon customer
	column_no = 1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="NEW_CUSTOMER"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADD")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="55"
	attr_grid_col$[column_no,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="C"

	rem --- Checkbox 2 - Link to existing Addon customer
	column_no = 2
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="LINK_CUSTOMER"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_LINK")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="65"
	attr_grid_col$[column_no,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="C"

	rem --- Checkbox 3 - Update existing Addon customer+contact
	column_no = 3
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="UPDATE_CONTACT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_UPDATE")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"
	attr_grid_col$[column_no,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="C"

	rem --- GM company
	column_no = 4
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="COMPANY"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_COMPANY")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="225"

	rem --- GM contact
	column_no = 5
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="CONTACT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_CONTACT")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="125"

	rem --- Addon customer_id
	column_no = 6
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="CUSTOMER_ID"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_CUSTOMER")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="95"

	rem --- Addon customer_name
	column_no = 7
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="CUSTOMER_NAME"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_CUSTOMER_NAME")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="225"

	rem --- Addon contact_name
	column_no = 8
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="CONTACT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_CONTACT")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="125"

	rem --- GM phone1
	column_no = 9
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="PHONE1"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_PHONE")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="75"

	rem --- GM ext1
	column_no = 10
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="EXT1"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_EXT_")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

	rem --- GM fax
	column_no = 11
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="FAX"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_FAX")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="75"

	rem --- GM address1
	column_no = 12
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ADDRESS1"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADDRESS_1")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="150"

	rem --- GM address2
	column_no = 13
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ADDRESS2"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADDRESS_2")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="150"

	rem --- GM address3
	column_no = 14
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ADDRESS3"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ADDRESS_3")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="150"

	rem --- GM city
	column_no = 15
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="CITY"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_CITY")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"

	rem --- GM state
	column_no = 16
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="STATE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_STATE")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="55"

	rem --- GM zip
	column_no = 17
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ZIP"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ZIP")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="65"

	rem --- GM country
	column_no = 18
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="COUNTRY"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_COUNTRY")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"

	rem --- GM accountno
	column_no = 19
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ACCOUNTNO"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ACCOUNT_NUMBER")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="175"

	rem --- GM recid
	column_no = 20
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="RECID"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_REC_ID")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="100"

	for curr_attr=1 to importGridCols
		attr_grid_col$[0,1] = attr_grid_col$[0,1] + 
:			pad("GMM_IMPORT." + attr_grid_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
	next curr_attr

	attr_disp_col$=attr_grid_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,importGrid!,"COLH-LINES-LIGHT-AUTO-MULTI-SIZEC",
:	importGridRows,attr_def_col_str$[all],attr_disp_col$,attr_grid_col$[all]

	rem --- Misc other grid inits
	call stbl("+DIR_PGM")+"adc_getmask.aon","CUSTOMER_ID","","","",custIdMask$,0,custIdLen
	importGrid!.setColumnMask(5,custIdMask$)
	importGrid!.setColumnStyle(0,SysGUI!.GRID_STYLE_UNCHECKED)
	importGrid!.setColumnEditable(0,1)
	importGrid!.setColumnStyle(1,SysGUI!.GRID_STYLE_UNCHECKED)
	importGrid!.setColumnEditable(1,1)
	importGrid!.setColumnStyle(2,SysGUI!.GRID_STYLE_UNCHECKED)
	importGrid!.setColumnEditable(2,1)
	importGrid!.setTabAction(SysGUI!.GRID_NAVIGATE_LEGACY)
	importGrid!.setTabActionSkipsNonEditableCells(1)
	importGrid!.setMultipleSelection(1)

	return

rem ==========================================================================
build_csv_rows: rem --- Build vector of csv rows for the grid from cvsFile$
rem ==========================================================================
	csvRows! = SysGUI!.makeVector()

	rem --- Get fields expected in the CSV file
	csvFieldNames! = callpoint!.getDevObject("csvFieldNames")
	jrFields! = callpoint!.getDevObject("jrFields")

	rem --- Parse fields from CSV file
	inStream! = JRLoader.getLocationInputStream(csvFile$)
	ds! = new JRCsvDataSource(inStream!)
	ds!.setRecordDelimiter(System.getProperty("line.separator"))
	ds!.setColumnNames(csvFieldNames!)

	rem --- Start Progress Meter
	process_id$=cvs(sysinfo.task_id$,2)
	title$=Translate!.getTranslation("AON_PARSE_CSV_FILE")
	total_recs=Array.getLength(csvFieldNames!)
	curr_rec=0
	progress! = bbjAPI().getGroupNamespace()
	progress!.setValue("+process_task",process_id$+"^C^"+title$+"^^"+str(total_recs)+"^")
	milestone=num(stbl("+MILESTONE",err=*next),err=*next)
	if milestone>total_recs/10 then
		milestone=int(total_recs/10)
		if milestone<1 then milestone=1
	endif

	rem --- Build csvRow! from parsed fields	
	numCsvFields = Array.getLength(csvFieldNames!)
	while ds!.next()
		rowFields! = SysGUI!.makeVector()
		for j=0 to numCsvFields-1
			rowFields!.addItem(cast(BBjString, ds!.getFieldValue(Array.get(jrFields!, j))))
		next j
		csvRows!.addItem(rowFields!)

		rem --- Update Progress Meter
		curr_rec=curr_rec+1
		if mod(curr_rec,milestone)=0
			progress!.setValue("+process_task",process_id$+"^U^"+str(curr_rec)+"^")
		endif
	wend
	java.util.Collections.sort(csvRows!, new SortByCompanyContact())
	callpoint!.setDevObject("csvRows",csvRows!)

	rem --- Stop/Delete Progress Meter
	progress!.setValue("+process_task",process_id$+"^D^")

	return

rem ==========================================================================
fill_grid: rem --- Fill the grid with data in csvRows! vector
rem ==========================================================================
	importGrid! = callpoint!.getDevObject("importGrid")
	csvRows! = callpoint!.getDevObject("csvRows")

	importGrid!.clearMainGrid()
	rem SysGUI!.setRepaintEnabled(0) ... not availble in BUI
	
	rem --- Start Progress Meter
	process_id$=cvs(sysinfo.task_id$,2)
	title$=Translate!.getTranslation("AON_BUILDING_GRID")
	total_recs=csvRows!.size()
	curr_rec=0
	progress! = bbjAPI().getGroupNamespace()
	progress!.setValue("+process_task",process_id$+"^C^"+title$+"^^"+str(total_recs)+"^")
	milestone=num(stbl("+MILESTONE",err=*next),err=*next)
	if milestone>total_recs/10 then
		milestone=int(total_recs/10)
		if milestone<1 then milestone=1
	endif

	if csvRows!.size() then
		importGrid!.setNumRows(csvRows!.size())

		gmClient!=callpoint!.getDevObject("gmClient")
		notSelectableColor! = callpoint!.getDevObject("notSelectableColor")
		redColor! = callpoint!.getDevObject("redColor")

		gmxCustomer_dev=fnget_dev("GMX_CUSTOMER")
		dim gmxCustomer$:fnget_tpl$("GMX_CUSTOMER")
		armCustmast_dev=fnget_dev("ARM_CUSTMAST")
		dim armCustmast$:fnget_tpl$("ARM_CUSTMAST")

rem wgh ... stopped here
rem wgh ... When the Addon customer does not exist, and there isn’t a GMX_CUSTOMER record, do not allow
rem wgh ... the ADD and/or UPDATE check boxes to be checked multiple times when there is more than one 
rem wgh ... contact for the customer.

		rem --- Get CSV fields for each grid row
		for row=0 to csvRows!.size()-1
			rowFields!=csvRows!.getItem(row)
			customer_id$=""
			customer_name$=""
			contact_name$=""

			rem --- Update Progress Meter
			curr_rec=row
			if mod(curr_rec,milestone)=0
				progress!.setValue("+process_task",process_id$+"^U^"+str(curr_rec)+"^")
			endif

			rem --- Does GMX_CUSTOMER record already exist for this GoldMine customer/contact?
			xrefExists=0
			gmAccountno$=pad(rowFields!.getItem(0),20)
			gmRecid$=pad(rowFields!.getItem(1),15)
			read(gmxCustomer_dev,key=gmAccountno$+gmRecid$,knum="BY_GOLDMINE",dom=*next)
			gmxCustomer_key$=""
			gmxCustomer_key$=key(gmxCustomer_dev,end=*next)
			if pos(gmAccountno$+gmRecid$=gmxCustomer_key$)=1 then
				rem --- Do not allow selecting GoldMine customers/contacts that have an existing GMX_CUSTOMER record. 
				rem --- Indicate them by displaying the row in Barista’s +GRID_NONEDIT_COLOR.
				readrecord(gmxCustomer_dev)gmxCustomer$
				armCustomer_key$=gmxCustomer.firm_id$+gmxCustomer.customer_id$
				readrecord(armCustmast_dev,key=armCustomer_key$,knum="PRIMARY",dom=*next)armCustmast$; xrefExists=1
				if xrefExists then
					customer_id$=armCustmast.customer_id$
					customer_name$=armCustmast.customer_name$
					contact_name$=armCustmast.contact_name$
					importGrid!.setRowBackColor(row, notSelectableColor!)
					importGrid!.setRowEditable(row,0)
				endif
			endif

			rem --- Is there a matching customer and contact in the current firm?
			gmCompany$=rowFields!.getItem(2)
			gmContact$=rowFields!.getItem(3)
			if !xrefExists then
				rem --- First map gmCompany$ to customer_name$, then check arm_custmast
				matchNoXref=0
				aonProp!=gmClient!.mapToAddon("COMPANY",gmCompany$)
				mappedAonCustomerName$=aonProp!.getProperty("value1")
				read(armCustmast_dev,key=firm_id$+mappedAonCustomerName$,knum="AO_NAME_CUST",dom=*next)
				while 1
					rem --- For GoldMine customers/contacts that have a match in the current firm, but no GMX_CUSTOMER 
					rem --- record, show Addon customer_id, customer_name, and contact_name in red. Disable ADD check box.
					armCustomer_key$=key(armCustmast_dev,end=*break)
					if pos(firm_id$+mappedAonCustomerName$=armCustomer_key$)<>1 then break
					readrecord(armCustmast_dev)armCustmast$
					matchNoXref=1
					customer_id$=armCustmast.customer_id$
					customer_name$=mappedAonCustomerName$
					importGrid!.setCellForeColor(row,5,redColor!)
					importGrid!.setCellForeColor(row,6,redColor!)
					importGrid!.setCellEditable(row,0,0)

					rem --- Does the mapped contact match for this customer?
					aonProp!=gmClient!.mapToAddon("CONTACT",gmContact$)
					mappedAonContactName$=aonProp!.getProperty("value1")
					if cvs(armCustmast.contact_name$,2)=cvs(mappedAonContactName$,2) then
						contact_name$=mappedAonContactName$
						importGrid!.setCellForeColor(row,7,redColor!)
					endif
				wend

				rem --- Disable UPDATE check box if Addon customer does not exist.
				if !matchNoXref then
					importGrid!.setCellEditable(row,0,2)
				endif
			endif

			rem --- Set cell text and properties for this grid row
			for cell=0 to importGrid!.getNumColumns()-1
				switch cell
					case 0; rem --- Checkbox 1 - Add new Addon customer
					case 1; rem --- Checkbox 2 - Link to existing Addon customer
					case 2; rem --- Checkbox 3 - Update existing Addon customer+contact
						importGrid!.setCellText(row, cell, "")
						importGrid!.setCellStyle(row, cell, SysGUI!.GRID_STYLE_UNCHECKED)
					break
					case 3; rem --- GM company
						importGrid!.setCellText(row, cell, gmCompany$)
					break
					case 4; rem --- GM contact
						importGrid!.setCellText(row, cell, gmContact$)
					break
					case 5; rem --- Addon customer_id
						importGrid!.setCellText(row, cell, customer_id$)
					break
					case 6; rem ---  Addon customer_name
						importGrid!.setCellText(row, cell, customer_name$)
					break
					case 7; rem --- Addon contact_name
						importGrid!.setCellText(row, cell, contact_name$)
					break
					case 8; rem ---  GM phone1
						importGrid!.setCellText(row, cell, rowFields!.getItem(cell-4))
					break
					case 9; rem --- GM ext1
						importGrid!.setCellText(row, cell, rowFields!.getItem(cell-3))
					break
					case 10; rem --- GM fax
						importGrid!.setCellText(row, cell, rowFields!.getItem(cell-5))
					break
					case 11; rem --- GM address1
					case 12; rem --- GM address2
					case 13; rem --- GM address3
					case 14; rem --- GM city
					case 15; rem --- GM state
					case 16; rem --- GM zip
					case 17; rem --- GM country
						importGrid!.setCellText(row, cell, rowFields!.getItem(cell-4))
					break
					case 18; rem --- GM accountno
						importGrid!.setCellText(row, cell, gmAccountno$)
					break
					case 19; rem --- GM recid
						importGrid!.setCellText(row, cell, gmRecid$)
					break
				swend
			next cell
		next row
	endif

	rem --- Stop/Delete Progress Meter
	progress!.setValue("+process_task",process_id$+"^D^")

	rem SysGUI!.setRepaintEnabled(1) ... not availble in BUI

	return

rem ==========================================================================
get_RGB: rem --- Parse Red, Green and Blue segments from RGB$ string
	rem --- input: RGB$
	rem --- output: R
	rem --- output: G
	rem --- output: B
rem ==========================================================================
	comma1=pos(","=RGB$,1,1)
	comma2=pos(","=RGB$,1,2)
	R=num(RGB$(1,comma1-1))
	G=num(RGB$(comma1+1,comma2-comma1-1))
	B=num(RGB$(comma2+1))

	return

rem ==========================================================================
update_app_grid: rem --- Update app grid row when checkboxes are checked/unchecked
	rem --- input: e!
	rem --- input: importGrid!
	rem --- input: appRowVect!
	rem --- input: onoff
rem ==========================================================================
rem wgh ... stopped here
return; rem wgh ... testing
	rem SysGUI!.setRepaintEnabled(0) ... not availble in BUI
    	app_grid_def_cols=callpoint!.getDevObject("app_grid_def_cols")
	index=e!.getRow()*app_grid_def_cols

	rem --- Install checkbox
	if e!.getColumn()=2 then
		if onoff then
			rem --- Checked
			importGrid!.setCellStyle(e!.getRow(),2,SysGUI!.GRID_STYLE_CHECKED); rem Install
			sourceDir$=appRowVect!.get(index+4)
			importGrid!.setCellText(e!.getRow(),4,sourceDir$); rem Source

			rem --- Update appRowVect! for checked install
			appRowVect!.removeItem(index+2)
			appRowVect!.insertItem(index+2, "y"); rem Install
			appRowVect!.removeItem(index+4)
			appRowVect!.insertItem(index+4, sourceDir$); rem Source
		else
			rem --- Unchecked
			importGrid!.setCellStyle(e!.getRow(),2,SysGUI!.GRID_STYLE_UNCHECKED); rem Install

			rem --- Update appRowVect! for unchecked install
			appRowVect!.removeItem(index+2)
			appRowVect!.insertItem(index+2, "n"); rem Install
		endif
	endif

	rem --- Copy checkbox
	if e!.getColumn()=3 then
		if onoff then
			rem --- Checked
			importGrid!.setCellStyle(e!.getRow(),3,SysGUI!.GRID_STYLE_CHECKED); rem Copy
			sourceDir$=appRowVect!.get(index+4)
			importGrid!.setCellText(e!.getRow(),5,targetDir$); rem Target
			importGrid!.setCellEditable(e!.getRow(),5,1); rem Target

			rem --- Update appRowVect! for checked copy
			appRowVect!.removeItem(index+3)
			appRowVect!.insertItem(index+3, "y"); rem Copy
			appRowVect!.removeItem(index+5)
			appRowVect!.insertItem(index+5, targetDir$); rem Target
		else
			rem --- Unchecked
			importGrid!.setCellStyle(e!.getRow(),3,SysGUI!.GRID_STYLE_UNCHECKED); rem Copy
			importGrid!.setCellText(e!.getRow(),5,""); rem Target
			importGrid!.setCellEditable(e!.getRow(),5,0); rem Target

			rem --- Update appRowVect! for unchecked copy
			appRowVect!.removeItem(index+3)
			appRowVect!.insertItem(index+3, "n"); rem Copy
			appRowVect!.removeItem(index+5)
			appRowVect!.insertItem(index+5, ""); rem Target
		endif
	endif

	rem SysGUI!.setRepaintEnabled(1) ... not availble in BUI

	return
[[GMM_CUSTIMPORT.AWIN]]
rem --- Needed classes
	use ::ado_util.src::util

	use java.lang.reflect.Array

	use net.sf.jasperreports.engine.JRField
	use net.sf.jasperreports.engine.data.JRCsvDataSource
	use net.sf.jasperreports.engine.design.JRDesignField
	use net.sf.jasperreports.engine.util.JRLoader

rem --- Add grid to show customers/contacts in CSV file
	nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
	importGrid! = Form!.addGrid(nxt_ctlID,5,60,1200,300); rem --- ID, x, y, width, height
	callpoint!.setDevObject("importGrid",importGrid!)
	callpoint!.setDevObject("importGridCtlID",nxt_ctlID)

	gosub format_grid

rem --- Set callbacks - processed in ACUS callpoint
	importGrid!.setCallback(importGrid!.ON_GRID_KEY_PRESS,"custom_event")
	importGrid!.setCallback(importGrid!.ON_GRID_MOUSE_UP,"custom_event")
	importGrid!.setCallback(importGrid!.ON_GRID_EDIT_STOP,"custom_event")

rem --- Misc other init
	util.resizeWindow(Form!, SysGui!)
[[GMM_CUSTIMPORT.CSV_FILE.AVAL]]
rem --- Verify CSV file exists
	csvFile$=callpoint!.getUserInput()
	previousCsvFile$=callpoint!.getDevObject("previousCsvFile")
	if csvFile$<>previousCsvFile$ then
		testChan=unt
		success=0
		open(testChan,err=*next)csvFile$; success=1
		if success then
			callpoint!.setDevObject("previousCsvFile",csvFile$)
			close(testChan)
			gosub build_csv_rows
			gosub fill_grid
		else
			msg_id$="AD_FILE_NOT_FOUND"
			dim msg_tokens$[1]
			msg_tokens$[1]=csvFile$
			gosub disp_message
			callpoint!.setStatus("ABORT")
		endif
	endif
[[GMM_CUSTIMPORT.AREC]]
rem --- Initialize firm to current firm
	callpoint!.setColumnData("GMM_CUSTIMPORT.FIRM_ID",firm_id$,1)

rem --- Initialize previous CSV filename
	callpoint!.setDevObject("previousCsvFile","")
