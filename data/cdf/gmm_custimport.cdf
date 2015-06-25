[[GMM_CUSTIMPORT.ASIZ]]
rem --- Resize grid

	formHeight=Form!.getHeight()
	formWidth=Form!.getWidth()
	importGrid!=callpoint!.getDevObject("importGrid")
	gridYpos=importGrid!.getY()
	gridXpos=importGrid!.getX()
	availableHeight=formHeight-gridYpos
	gridHeight=availableHeight-5
rem	appHeight=int((availableHeight-15)/4)

	importGrid!.setSize(formWidth-2*gridXpos,gridHeight)
	importGrid!.setFitToGrid(1)
[[GMM_CUSTIMPORT.<CUSTOM>]]
format_grid: rem --- Use Barista program to format the grid
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

	rem --- Checkbox 2 - Update existing Addon customer
	column_no = 2
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="LINK_CUSTOMER"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_UPDATE")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"
	attr_grid_col$[column_no,fnstr_pos("MAXL",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="C"

	rem --- Checkbox 3 - Primary Addon contact
	column_no = 3
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="THE_CONTACT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_PRIMARY")
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
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="75"

	rem --- GM state
	column_no = 16
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="STATE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_STATE")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="75"

	rem --- GM zip
	column_no = 17
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="ZIP"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ZIP")
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

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


build_CSV_vector: rem --- Build csvVect! vector from cvsFile$ to fill the grid
	csvVect!=SysGUI!.makeVector()

rem wgh ... stopped here
	
	return

fill_grid: rem --- Fill the grid with data in csvVect! vector
	importGrid! = callpoint!.getDevObject("importGrid")

rem wgh ... stopped here
	if csvVect!.size() then
	endif

	return

rem wgh ... CSV file structure
rem 1 accountno
rem 2 recid
rem 3 company
rem 4 contact
rem 5 phone1
rem 6 fax
rem 7 ext1
rem 8 address1
rem 9 address2
rem 10 address3
rem 11 city
rem 12 state
rem 13 zip
rem 14 country
rem wgh ... CSV file structure
[[GMM_CUSTIMPORT.AWIN]]
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
	use ::ado_util.src::util
	util.resizeWindow(Form!, SysGui!)
[[GMM_CUSTIMPORT.CSV_FILE.AVAL]]
rem --- Verify CSV file exists
	csvFile$=callpoint!.getUserInput()
	testChan=unt
	success=0
	open(testChan,err=*next)csvFile$; success=1
	if success then
		gosub build_CSV_vector
		gosub fill_grid
	else
		msg_id$="AD_FILE_NOT_FOUND"
		dim msg_tokens$[1]
		msg_tokens$[1]=csvFile$
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif 
[[GMM_CUSTIMPORT.AREC]]
rem --- Initialize firm to current firm
	callpoint!.setColumnData("GMM_CUSTIMPORT.FIRM_ID",firm_id$,1)
