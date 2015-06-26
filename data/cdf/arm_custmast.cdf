[[ARM_CUSTMAST.BWRI]]
rem --- If GM installed, update GoldMine database as necessary
	if user_tpl.gm_installed$="Y" then
		customer_id$=callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_ID")
		customer_name$=callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_NAME")
		contact_name$=callpoint!.getColumnData("ARM_CUSTMAST.CONTACT_NAME")

		rem --- Initialize new queue record for this customer/contact
		dim gmqCustomer$:fnget_tpl$("GMQ_CUSTOMER")
		dim initQueueRecord$:fattr(gmqCustomer$)
		gmqCustomer.firm_id$=firm_id$
		gmqCustomer.customer_id$=customer_id$
		rem gmqCustomer.gm_accountno$
		rem gmqCustomer.gm_recid$
		gmqCustomer.customer_name$=customer_name$
		gmqCustomer.contact_name$=contact_name$
		gmqCustomer.phone_no$=callpoint!.getColumnData("ARM_CUSTMAST.PHONE_NO")
		gmqCustomer.phone_exten$=callpoint!.getColumnData("ARM_CUSTMAST.PHONE_EXTEN")
		gmqCustomer.fax_no$=callpoint!.getColumnData("ARM_CUSTMAST.FAX_NO")
		gmqCustomer.addr_line_1$=callpoint!.getColumnData("ARM_CUSTMAST.ADDR_LINE_1")
		gmqCustomer.addr_line_2$=callpoint!.getColumnData("ARM_CUSTMAST.ADDR_LINE_2")
		gmqCustomer.addr_line_3$=callpoint!.getColumnData("ARM_CUSTMAST.ADDR_LINE_3")
		gmqCustomer.city$=callpoint!.getColumnData("ARM_CUSTMAST.CITY")
		gmqCustomer.state_code$=callpoint!.getColumnData("ARM_CUSTMAST.STATE_CODE")
		gmqCustomer.zip_code$=callpoint!.getColumnData("ARM_CUSTMAST.ZIP_CODE")
		gmqCustomer.cntry_id$=callpoint!.getColumnData("ARM_CUSTMAST.CNTRY_ID")
		gmqCustomer.country$=callpoint!.getColumnData("ARM_CUSTMAST.COUNTRY")
		initQueueRecord$=gmqCustomer$

		rem --- Check if this is a new GoldMine contact
		declare GmInterfaceClient gmClient!
		gmClient!=new GmInterfaceClient()
		gmqCustomer_dev=fnget_dev("GMQ_CUSTOMER")
		if !gmClient!.isGmContact(firm_id$,customer_id$,customer_name$,contact_name$) then
			rem --- Add new contact to GoldMine database
			writerecord(gmqCustomer_dev)gmqCustomer$
		else
			rem --- Update changed info for existing imported GoldMine contact(s) for this Addon customer
			rem --- Do NOT update existing un-imported GoldMine contact(s)
			gmxCustomer_dev=fnget_dev("GMX_CUSTOMER")
			dim gmxCustomer$:fnget_tpl$("GMX_CUSTOMER")
			read(gmxCustomer_dev,key=firm_id$+customer_id$,dom=*next)
			while 1
				gmxCustomer_key$=key(gmxCustomer_dev,end=*break)
				if pos(firm_id$+customer_id$=gmxCustomer_key$)<>1 then break
				readrecord(gmxCustomer_dev)gmxCustomer$

				rem --- Initialize new queue record for this customer/contact
				dim gmqCustomer$:fattr(gmqCustomer$)
				gmqCustomer$=initQueueRecord$
				gmqCustomer.gm_accountno$=gmxCustomer.gm_accountno$
				gmqCustomer.gm_recid$=gmxCustomer.gm_recid$

				rem --- Get current GoldMine data for this contact
				contactInfo!=gmClient!.getGmContactInfo(gmxCustomer.gm_accountno$,gmxCustomer.gm_recid$)
				if !contactInfo!.isEmpty() then
					rem --- If Barista's Undo data does NOT match the current GoldMine data, then do NOT add it to the queue
					gmProps!=gmClient!.mapToGoldMine("customer_name",callpoint!.getColumnUndoData("ARM_CUSTMAST.CUSTOMER_NAME"))
					if cvs(gmqCustomer.customer_name$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.CUSTOMER_NAME"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("COMPANY"),2) then
						gmqCustomer.customer_name$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("contact_name",callpoint!.getColumnUndoData("ARM_CUSTMAST.CONTACT_NAME"))
					if cvs(gmqCustomer.contact_name$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.CONTACT_NAME"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("CONTACT"),2) then
						gmqCustomer.contact_name$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("phone_no",callpoint!.getColumnUndoData("ARM_CUSTMAST.PHONE_NO"))
					if cvs(gmqCustomer.phone_no$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.PHONE_NO"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("PHONE1"),2) then
						gmqCustomer.phone_no$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("phone_exten",callpoint!.getColumnUndoData("ARM_CUSTMAST.PHONE_EXTEN"))
					if cvs(gmqCustomer.phone_exten$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.PHONE_EXTEN"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("EXT1"),2) then
						gmqCustomer.phone_exten$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("fax_no",callpoint!.getColumnUndoData("ARM_CUSTMAST.FAX_NO"))
					if cvs(gmqCustomer.fax_no$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.FAX_NO"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("FAX"),2) then
						gmqCustomer.fax_no$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("addr_line_1",callpoint!.getColumnUndoData("ARM_CUSTMAST.ADDR_LINE_1"))
					if cvs(gmqCustomer.addr_line_1$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.ADDR_LINE_1"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("ADDRESS1"),2) then
						gmqCustomer.addr_line_1$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("addr_line_2",callpoint!.getColumnUndoData("ARM_CUSTMAST.ADDR_LINE_2"))
					if cvs(gmqCustomer.addr_line_2$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.ADDR_LINE_2"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("ADDRESS2"),2) then
						gmqCustomer.addr_line_2$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("addr_line_3",callpoint!.getColumnUndoData("ARM_CUSTMAST.ADDR_LINE_3"))
					if cvs(gmqCustomer.addr_line_3$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.ADDR_LINE_3"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("ADDRESS3"),2) then
						gmqCustomer.addr_line_3$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("city",callpoint!.getColumnUndoData("ARM_CUSTMAST.CITY"))
					if cvs(gmqCustomer.city$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.CITY"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("CITY"),2) then
						gmqCustomer.city$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("state_code",callpoint!.getColumnUndoData("ARM_CUSTMAST.STATE_CODE"))
					if cvs(gmqCustomer.state_code$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.STATE_CODE"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("STATE"),2) then
						gmqCustomer.state_code$=""
					endif

					gmProps!=gmClient!.mapToGoldMine("zip_code",callpoint!.getColumnUndoData("ARM_CUSTMAST.ZIP_CODE"))
					if cvs(gmqCustomer.zip_code$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.ZIP_CODE"),2) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("ZIP"),2) then
						gmqCustomer.zip_code$=""
					endif

					gmProps!=gmClient!.mapToGoldMineCountry(callpoint!.getColumnUndoData("ARM_CUSTMAST.COUNTRY"),callpoint!.getColumnUndoData("ARM_CUSTMAST.CNTRY_ID"))
					if (cvs(gmqCustomer.cntry_id$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.CNTRY_ID"),2) and
:					cvs(gmqCustomer.country$,2)=cvs(callpoint!.getColumnUndoData("ARM_CUSTMAST.COUNTRY"),2)) or
:					cvs(gmProps!.getProperty("value1"),2)<>cvs(contactInfo!.getProperty("COUNTRY"),2) then
						gmqCustomer.cntry_id$=""
						gmqCustomer.country$=""
					endif
				endif

				rem --- Write record to the queue if something has changed
				if cvs(gmqCustomer.customer_name$,2)<>"" or
:				cvs(gmqCustomer.contact_name$,2)<>"" or
:				cvs(gmqCustomer.phone_no$,2)<>"" or
:				cvs(gmqCustomer.phone_exten$,2)<>"" or
:				cvs(gmqCustomer.fax_no$,2)<>"" or
:				cvs(gmqCustomer.addr_line_1$,2)<>"" or
:				cvs(gmqCustomer.addr_line_2$,2)<>"" or
:				cvs(gmqCustomer.addr_line_3$,2)<>"" or
:				cvs(gmqCustomer.city$,2)<>"" or
:				cvs(gmqCustomer.state_code$,2)<>"" or
:				cvs(gmqCustomer.zip_code$,2)<>"" or
:				cvs(gmqCustomer.cntry_id$,2)<>"" or
:				cvs(gmqCustomer.country$,2)<>"" then
					rem --- This arm_custmast record may have been updated again before the queue was processed
					dim queueRecord$:fattr(gmqCustomer$)
					extractrecord(gmqCustomer_dev,key=gmqCustomer.firm_id$+gmqCustomer.customer_id$+gmqCustomer.gm_accountno$+gmqCustomer.gm_recid$,dom=*next)queueRecord$

					if cvs(queueRecord.customer_name$,2)<>"" and cvs(gmqCustomer.customer_name$,2)="" then gmqCustomer.customer_name$=queueRecord.customer_name$
					if cvs(queueRecord.contact_name$,2)<>"" and cvs(gmqCustomer.contact_name$,2)="" then gmqCustomer.contact_name$=queueRecord.contact_name$
					if cvs(queueRecord.phone_no$,2)<>"" and cvs(gmqCustomer.phone_no$,2)="" then gmqCustomer.phone_no$=queueRecord.phone_no$
					if cvs(queueRecord.phone_exten$,2)<>"" and cvs(gmqCustomer.phone_exten$,2)="" then gmqCustomer.phone_exten$=queueRecord.phone_exten$
					if cvs(queueRecord.fax_no$,2)<>"" and cvs(gmqCustomer.fax_no$,2)="" then gmqCustomer.fax_no$=queueRecord.fax_no$
					if cvs(queueRecord.addr_line_1$,2)<>"" and cvs(gmqCustomer.addr_line_1$,2)="" then gmqCustomer.addr_line_1$=queueRecord.addr_line_1$
					if cvs(queueRecord.addr_line_2$,2)<>"" and cvs(gmqCustomer.addr_line_2$,2)="" then gmqCustomer.addr_line_2$=queueRecord.addr_line_2$
					if cvs(queueRecord.addr_line_3$,2)<>"" and cvs(gmqCustomer.addr_line_3$,2)="" then gmqCustomer.addr_line_3$=queueRecord.addr_line_3$
					if cvs(queueRecord.city$,2)<>"" and cvs(gmqCustomer.city$,2)="" then gmqCustomer.city$=queueRecord.city$
					if cvs(queueRecord.state_code$,2)<>"" and cvs(gmqCustomer.state_code$,2)="" then gmqCustomer.state_code$=queueRecord.state_code$
					if cvs(queueRecord.zip_code$,2)<>"" and cvs(gmqCustomer.zip_code$,2)="" then gmqCustomer.zip_code$=queueRecord.zip_code$
					if cvs(queueRecord.cntry_id$,2)<>"" and cvs(gmqCustomer.cntry_id$,2)="" then gmqCustomer.cntry_id$=queueRecord.cntry_id$
					if cvs(queueRecord.country$,2)<>"" and cvs(gmqCustomer.country$,2)="" then gmqCustomer.country$=queueRecord.country$

					writerecord(gmqCustomer_dev)gmqCustomer$
				endif
			wend
		endif

		rem --- Start scheduled GoldMine interface client, and close this instance
		gmClient!.startClient()
		gmClient!.close()
	endif
[[ARM_CUSTMAST.ASHO]]
rem --- Create/embed dashboard to show aged balance

	use ::ado_util.src::util
	use ::dashboard/widget.bbj::EmbeddedWidgetFactory
	use ::dashboard/widget.bbj::EmbeddedWidget
	use ::dashboard/widget.bbj::EmbeddedWidgetControl
	use ::dashboard/widget.bbj::BarChartWidget

	ctl_name$="ARM_CUSTDET.AGING_FUTURE"
	ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
	ctl1!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	ctl_name$="<<DISPLAY>>.DSP_BALANCE"
	ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
	ctl2!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	ctl_name$="ARM_CUSTPMTS.NMTD_SALES"
	ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
	ctl3!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

	childWin!=SysGUI!.getWindow(ctlContext).getControl(0)
	save_ctx=SysGUI!.getContext()
	SysGUI!.setContext(ctlContext)

rem --- Create either a pie chart or bar chart - the latter if any of the aging buckets are negative

	rem --- pie
	name$="CUSTAGNG_PIE"
	title$ = Translate!.getTranslation("AON_AGING","Customer Aging",1)
	chartTitle$ = ""
	flat = 0
	legend=0
	numSlices=6
	widgetX=ctl3!.getX()
	widgetY=ctl1!.getY()
	widgetHeight=ctl2!.getY()+ctl2!.getHeight()-ctl1!.getY()
	widgetWidth=widgetHeight+widgetHeight*.5

	agingDashboardPieWidget! = EmbeddedWidgetFactory.createPieChartEmbeddedWidget(name$,title$,chartTitle$,flat,legend,numSlices)
  	agingPieWidget! = agingDashboardPieWidget!.getWidget()
	
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_FUTURE","Future",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_CURRENT","Current",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_30_DAYS","30 Days",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_60_DAYS","60 days",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_90_DAYS","90 days",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_120_DAYS","120 days",1), 0)
	agingPieWidget!.setFontScalingFactor(1.2)

	agingPieWidgetControl! = new EmbeddedWidgetControl(agingDashboardPieWidget!,childWin!,widgetX,widgetY,widgetWidth,widgetHeight,$$)
	agingPieWidgetControl!.setVisible(0)

	rem --- bar
	name$="CUSTAGNG_BAR"
	title$ = Translate!.getTranslation("AON_AGING","Customer Aging",1)
	chartTitle$ = ""
	domainTitle$ = ""
	rangeTitle$ = Translate!.getTranslation("AON_BALANCE","Balance",1)
	flat = 0
	orientation=BarChartWidget.getORIENTATION_VERTICAL() 
	legend=1

	agingDashboardBarWidget! = EmbeddedWidgetFactory.createBarChartEmbeddedWidget(name$,title$,chartTitle$,domainTitle$,rangeTitle$,flat,orientation,legend)
	agingBarWidget! = agingDashboardBarWidget!.getWidget()

	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_FUT","Fut",1), "",0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_CUR","Cur",1), "", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_30","30",1),"", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_60","60",1), "", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_90","90",1), "", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_120","120",1), "", 0)

	agingBarWidgetControl! = new EmbeddedWidgetControl(agingDashboardBarWidget!,childWin!,widgetX,widgetY,widgetWidth,widgetHeight,$$)
	agingBarWidgetControl!.setVisible(0)

	callpoint!.setDevObject("dbPieWidget",agingDashboardPieWidget!)
	callpoint!.setDevObject("dbPieWidgetControl",agingPieWidgetControl!)
	callpoint!.setDevObject("dbBarWidget",agingDashboardBarWidget!)
	callpoint!.setDevObject("dbBarWidgetControl",agingBarWidgetControl!)

	SysGUI!.setContext(save_ctx)
[[ARM_CUSTMAST.ADIS]]
rem --- retrieve dashboard pie or bar chart widget and refresh for current customer/balances
rem --- pie if all balances >=0, bar if any negatives, hide if all bals are 0

	bal_fut=num(callpoint!.getColumnData("ARM_CUSTDET.AGING_FUTURE"))
	bal_cur=num(callpoint!.getColumnData("ARM_CUSTDET.AGING_CUR"))
	bal_30=num(callpoint!.getColumnData("ARM_CUSTDET.AGING_30"))
	bal_60=num(callpoint!.getColumnData("ARM_CUSTDET.AGING_60"))
	bal_90=num(callpoint!.getColumnData("ARM_CUSTDET.AGING_90"))
	bal_120=num(callpoint!.getColumnData("ARM_CUSTDET.AGING_120"))

	if !bal_fut and !bal_cur and !bal_30 and !bal_60 and !bal_90 and !bal_120

		agingPieWidgetControl!=callpoint!.getDevObject("dbPieWidgetControl")
		agingPieWidgetControl!.setVisible(0)
		agingBarWidgetControl!=callpoint!.getDevObject("dbBarWidgetControl")
		agingBarWidgetControl!.setVisible(0)

	else

		if bal_fut<0 or bal_cur<0 or bal_30<0 or bal_60<0 or bal_90<0 or bal_120<0

			agingDashboardBarWidget!=callpoint!.getDevObject("dbBarWidget")
			agingBarWidget! = agingDashboardBarWidget!.getWidget()
			agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_FUT","Fut",1), "",bal_fut)
			agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_CUR","Cur",1), "", bal_cur)
			agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_30","30",1),"", bal_30)
			agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_60","60",1), "", bal_60)
			agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_90","90",1), "", bal_90)
			agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_120","120",1), "", bal_120)
			agingBarWidget!.refresh()

			agingPieWidgetControl!=callpoint!.getDevObject("dbPieWidgetControl")
			agingPieWidgetControl!.setVisible(0)
			agingBarWidgetControl!=callpoint!.getDevObject("dbBarWidgetControl")
			agingBarWidgetControl!.setVisible(1)

		else

			agingDashboardPieWidget!=callpoint!.getDevObject("dbPieWidget")
			agingPieWidget! = agingDashboardPieWidget!.getWidget()
			agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_FUTURE","Future",1), bal_fut)
			agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_CURRENT","Current",1), bal_cur)
			agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_30_DAYS","30 Days",1), bal_30 )
			agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_60_DAYS","60 days",1), bal_60)
			agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_90_DAYS","90 days",1), bal_90)
			agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_120_DAYS","120 days",1), bal_120)
			agingPieWidget!.refresh()

			agingPieWidgetControl!=callpoint!.getDevObject("dbPieWidgetControl")
			agingPieWidgetControl!.setVisible(1)
			agingBarWidgetControl!=callpoint!.getDevObject("dbBarWidgetControl")
			agingBarWidgetControl!.setVisible(0)

		endif
	
	endif



	
[[ARM_CUSTMAST.AOPT-HCPY]]
rem --- Go run the Hard Copy form

	callpoint!.setDevObject("cust_id",callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_ID"))
	cust$=callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_ID")

	dim dflt_data$[2,1]
	dflt_data$[1,0]="CUSTOMER_ID_1"
	dflt_data$[1,1]=cust$
	dflt_data$[2,0]="CUSTOMER_ID_2"
	dflt_data$[2,1]=cust$

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"ARR_DETAIL",
:		stbl("+USER_ID"),
:		"MNT",
:		"",
:		table_chans$[all],
:		"",
:		dflt_data$[all]
[[ARM_CUSTMAST.AOPT-STMT]]
rem On Demand Statement

cp_cust_id$=callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_ID")
user_id$=stbl("+USER_ID")
key_pfx$=cp_cust_id$

dim dflt_data$[2,1]
dflt_data$[1,0]="CUSTOMER_ID"
dflt_data$[1,1]=cp_cust_id$
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "ARR_STMT_DEMAND",
:                       user_id$,
:                   	"",
:                       key_pfx$,
:                       table_chans$[all],
:                       "",
:                       dflt_data$[all]
[[ARM_CUSTMAST.BDEL]]
rem  --- Check for Open AR Invoices
	delete_msg$=""
	cust$=callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_ID")
	read(user_tpl.art01_dev,key=firm_id$+"  "+cust$,dom=*next)
	art01_key$=key(user_tpl.art01_dev,end=check_op_ord)
	if pos(firm_id$+"  "+cust$=art01_key$)<>1 goto check_op_ord
	delete_msg$=Translate!.getTranslation("AON_OPEN_INVOICES_EXIST_-_CUSTOMER_DELETION_NOT_ALLOWED")
	goto done_checking	

check_op_ord:
	if user_tpl.op_installed$<>"Y" goto done_checking
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="OPT_INVHDR",open_opts$[1]="OTA"
	gosub open_tables
	opt01_dev=num(open_chans$[1])
	dim opt01_tpl$:open_tpls$[1]

	read (opt01_dev,key=firm_id$+"  "+cust$,dom=*next)
	opt01_key$=key(opt01_dev,end=done_checking)              
	if pos(firm_id$+"  "+cust$=opt01_key$)<>1 goto done_checking
	readrecord(opt01_dev)opt01_tpl$
	if opt01_tpl.trans_status$="U"
		delete_msg$=Translate!.getTranslation("AON_HISTORICAL_INVOICES_EXIST_-_CUSTOMER_DELETION_NOT_ALLOWED")
	else
		delete_msg$=Translate!.getTranslation("AON_OPEN_ORDERS_EXIST_-_CUSTOMER_DELETION_NOT_ALLOWED")
	endif

done_checking:
	if delete_msg$<>""
		callpoint!.setMessage("NO_DELETE:"+delete_msg$)
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- If GM installed, remove cross reference(s) to GoldMine
	if user_tpl.gm_installed$="Y" then
		gmxCustomer_dev=fnget_dev("GMX_CUSTOMER")
		dim gmxCustomer$:fnget_tpl$("GMX_CUSTOMER")
		read(gmxCustomer_dev,key=firm_id$+customer_id$,dom=*next)
		while 1
			gmxCustomer_key$=key(gmxCustomer_dev,end=*break)
			if pos(firm_id$+customer_id$=gmxCustomer_key$)<>1 then break
			remove(gmxCustomer_dev,key=gmxCustomer_key$)
	endif
[[ARM_CUSTMAST.CUSTOMER_NAME.AVAL]]
rem --- Set Alternate Sequence for new customers
	if user_tpl.new_cust$="Y"
		callpoint!.setColumnData("ARM_CUSTMAST.ALT_SEQUENCE",callpoint!.getUserInput())
		callpoint!.setStatus("REFRESH")
	endif
[[ARM_CUSTMAST.AREA]]
rem --- Set New Customer flag
	user_tpl.new_cust$="N"
[[ARM_CUSTMAST.BREC]]
rem --- Set New Customer flag
	user_tpl.new_cust$="Y"
[[ARM_CUSTMAST.CUSTOMER_ID.AVAL]]
rem --- Validate Customer Number
	if num(callpoint!.getUserInput(),err=*next)=0 callpoint!.setStatus("ABORT")
[[ARM_CUSTMAST.AOPT-IDTL]]
rem Invoice Dtl Inquiry
cp_cust_id$=callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_ID")
user_id$=stbl("+USER_ID")
dim dflt_data$[2,1]
dflt_data$[1,0]="CUSTOMER_ID"
dflt_data$[1,1]=cp_cust_id$
call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                       "ARR_INVDETAIL",
:                       user_id$,
:                   	"",
:                       "",
:                       table_chans$[all],
:                       "",
:                       dflt_data$[all]
[[ARM_CUSTMAST.AOPT-ORIV]]
rem Order/Invoice History Inq
rem --- assume this should only run if OP installed...
	if user_tpl.op_installed$="Y"
		cp_cust_id$=callpoint!.getColumnData("ARM_CUSTMAST.CUSTOMER_ID")
		user_id$=stbl("+USER_ID")
		dim dflt_data$[2,1]
		dflt_data$[1,0]="CUSTOMER_ID"
		dflt_data$[1,1]=cp_cust_id$
		call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:                           "ARR_ORDINVHIST",
:                           user_id$,
:                   	    "",
:                           "",
:                           table_chans$[all],
:                           "",
:                           dflt_data$[all]
	else
		msg_id$="AD_NO_OP"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
	endif
	callpoint!.setStatus("ACTIVATE")
[[ARM_CUSTMAST.AREC]]
rem --- notes about defaults, other init:
rem --- if cm$ installed, and ars01c.hold_new$ is "Y", then default arm02a.cred_hold$ to "Y"
rem --- default arm02a.slspsn_code$,ar_terms_code$,disc_code$,ar_dist_code$,territory$,tax_code$
rem --- and inv_hist_flg$ per defaults in ops10d
dim ars10d$:user_tpl.cust_dflt_tpl$
ars10d$=user_tpl.cust_dflt_rec$
callpoint!.setColumnData("ARM_CUSTDET.AR_TERMS_CODE",ars10d.ar_terms_code$)
callpoint!.setColumnUndoData("ARM_CUSTDET.AR_TERMS_CODE",ars10d.ar_terms_code$)
callpoint!.setColumnData("ARM_CUSTDET.AR_DIST_CODE",ars10d.ar_dist_code$)
callpoint!.setColumnUndoData("ARM_CUSTDET.AR_DIST_CODE",ars10d.ar_dist_code$)
callpoint!.setColumnData("ARM_CUSTDET.SLSPSN_CODE",ars10d.slspsn_code$)
callpoint!.setColumnUndoData("ARM_CUSTDET.SLSPSN_CODE",ars10d.slspsn_code$)
callpoint!.setColumnData("ARM_CUSTDET.DISC_CODE",ars10d.disc_code$)
callpoint!.setColumnUndoData("ARM_CUSTDET.DISC_CODE",ars10d.disc_code$)
callpoint!.setColumnData("ARM_CUSTDET.TERRITORY",ars10d.territory$)
callpoint!.setColumnUndoData("ARM_CUSTDET.TERRITORY",ars10d.territory$)
callpoint!.setColumnData("ARM_CUSTDET.TAX_CODE",ars10d.tax_code$)
callpoint!.setColumnUndoData("ARM_CUSTDET.TAX_CODE",ars10d.tax_code$)
callpoint!.setColumnData("ARM_CUSTDET.INV_HIST_FLG","Y")
callpoint!.setColumnUndoData("ARM_CUSTDET.INV_HIST_FLG","Y")
callpoint!.setColumnData("ARM_CUSTMAST.OPENED_DATE",date(0:"%Yd%Mz%Dz"))
callpoint!.setColumnData("ARM_CUSTMAST.RETAIN_CUST","Y")
if user_tpl.cm_installed$="Y" and user_tpl.dflt_cred_hold$="Y" 
	callpoint!.setColumnData("ARM_CUSTDET.CRED_HOLD","Y")
	callpoint!.setColumnUndoData("ARM_CUSTDET.CRED_HOLD","Y")
endif

rem --- clear out the contents of the widgets

	agingDashboardPieWidget!=callpoint!.getDevObject("dbPieWidget")
	agingPieWidget! = agingDashboardPieWidget!.getWidget()
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_FUTURE","Future",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_CURRENT","Current",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_30_DAYS","30 Days",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_60_DAYS","60 days",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_90_DAYS","90 days",1), 0)
	agingPieWidget!.setDataSetValue(Translate!.getTranslation("AON_120_DAYS","120 days",1), 0)
	agingPieWidget!.refresh()

	agingDashboardBarWidget!=callpoint!.getDevObject("dbBarWidget")
	agingBarWidget! = agingDashboardBarWidget!.getWidget()
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_FUT","Fut",1), "",0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_CUR","Cur",1), "", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_30","30",1),"", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_60","60",1), "", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_90","90",1), "", 0)
	agingBarWidget!.setDataSetValue(Translate!.getTranslation("AON_120","120",1), "", 0)
	agingBarWidget!.refresh()

	agingPieWidgetControl!=callpoint!.getDevObject("dbPieWidgetControl")
	agingPieWidgetControl!.setVisible(0)
	agingBarWidgetControl!=callpoint!.getDevObject("dbBarWidgetControl")
	agingBarWidgetControl!.setVisible(0)
[[ARM_CUSTMAST.BSHO]]
rem --- Class declarations
	use ::gmo_GmInterfaceClient.aon::GmInterfaceClient

rem --- Open/Lock files
	dir_pgm$=stbl("+DIR_PGM")
	sys_pgm$=stbl("+DIR_SYP")
	num_files=7

	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="GLS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="ARS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="ARS_CUSTDFLT",open_opts$[3]="OTA"
	open_tables$[4]="ARS_CREDIT",open_opts$[4]="OTA"
	open_tables$[5]="ARM_CUSTDET",open_opts$[5]="OTA"
	open_tables$[6]="ART_INVHDR",open_opts$[6]="OTA"
	open_tables$[7]="ART_INVDET",open_opts$[7]="OTA"
	gosub open_tables

	gls01_dev=num(open_chans$[1])
	ars01_dev=num(open_chans$[2])
	ars10_dev=num(open_chans$[3])
	ars01c_dev=num(open_chans$[4])
	arm02_dev=num(open_chans$[5])

rem --- Dimension miscellaneous string templates

	dim gls01a$:open_tpls$[1],ars01a$:open_tpls$[2],ars10d$:open_tpls$[3],ars01c$:open_tpls$[4]
	dim arm02_tpl$:open_tpls$[5]

rem --- Retrieve parameter data
	dim info$[20]
	ars01a_key$=firm_id$+"AR00"
	find record (ars01_dev,key=ars01a_key$,err=std_missing_params) ars01a$ 
	ars01c_key$=firm_id$+"AR01"
	find record (ars01c_dev,key=ars01c_key$,err=std_missing_params) ars01c$                
	cm$=ars01c.sys_install$
	dflt_cred_hold$=ars01c.hold_new$
	gls01a_key$=firm_id$+"GL00"
	find record (gls01_dev,key=gls01a_key$,err=std_missing_params) gls01a$ 
	find record (ars10_dev,key=firm_id$+"D",err=std_missing_params) ars10d$
	call stbl("+DIR_PGM")+"adc_application.aon","GL",info$[all]
	gl$=info$[20]
	call stbl("+DIR_PGM")+"adc_application.aon","OP",info$[all]
	op$=info$[20]
	call stbl("+DIR_PGM")+"adc_application.aon","IV",info$[all]
	iv$=info$[20]
	call stbl("+DIR_PGM")+"adc_application.aon","SA",info$[all]
	sa$=info$[20]
	call stbl("+DIR_PGM")+"adc_application.aon","GM",info$[all]
	gm$=info$[20]
	dim user_tpl$:"app:c(2),gl_installed:c(1),op_installed:c(1),sa_installed:c(1),iv_installed:c(1),gm_installed:c(1),"+
:		"cm_installed:c(1),dflt_cred_hold:c(1),cust_dflt_tpl:c(1024),cust_dflt_rec:c(1024),new_cust:c(1),"+
:		"art01_dev:n(5)"
	user_tpl.app$="AR"
	user_tpl.gl_installed$=gl$
	user_tpl.op_installed$=op$
	user_tpl.iv_installed$=iv$
	user_tpl.sa_installed$=sa$
	user_tpl.gm_installed$=gm$
	user_tpl.cm_installed$=cm$
	user_tpl.dflt_cred_hold$=dflt_cred_hold$
	user_tpl.cust_dflt_tpl$=fattr(ars10d$)
	user_tpl.cust_dflt_rec$=ars10d$
	user_tpl.art01_dev=num(open_chans$[6])
	dim dctl$[17]
	if user_tpl.cm_installed$="Y"
 		dctl$[1]="ARM_CUSTDET.CREDIT_LIMIT"              
	endif
	if user_tpl.sa_installed$<>"Y" or user_tpl.op_installed$<>"Y"
 		dctl$[2]="ARM_CUSTDET.SA_FLAG"
	endif
	if ars01a.inv_hist_flg$="N"
		dctl$[3]="ARM_CUSTDET.INV_HIST_FLG"
	endif
	if user_tpl.op_installed$<>"Y"
		dctl$[3]="ARM_CUSTDET.INV_HIST_FLG"
		dctl$[4]="ARM_CUSTDET.TAX_CODE"
		dctl$[5]="ARM_CUSTDET.FRT_TERMS"
		dctl$[6]="ARM_CUSTDET.MESSAGE_CODE"
		dctl$[7]="ARM_CUSTDET.DISC_CODE"
		dctl$[8]="ARM_CUSTDET.PRICING_CODE"
	endif
	dctl$[9]="<<DISPLAY>>.DSP_BALANCE"
	dctl$[10]="<<DISPLAY>>.DSP_MTD_PROFIT"
	dctl$[11]="<<DISPLAY>>.DSP_YTD_PROFIT"
	dctl$[12]="<<DISPLAY>>.DSP_PRI_PROFIT"
	dctl$[13]="<<DISPLAY>>.DSP_NXT_PROFIT"
	dctl$[14]="<<DISPLAY>>.DSP_MTD_PROF_PCT"
	dctl$[15]="<<DISPLAY>>.DSP_YTD_PROF_PCT"
	dctl$[16]="<<DISPLAY>>.DSP_PRI_PROF_PCT"
	dctl$[17]="<<DISPLAY>>.DSP_NXT_PROF_PCT"
	gosub disable_ctls

rem --- Disable Option for Jobs if OP not installed or Job flag not set
	if op$<>"Y" or ars01a.job_nos$<>"Y"
		callpoint!.setOptionEnabled("OPM_CUSTJOBS",0)
	endif

rem --- Additional/optional opens
	if user_tpl.gm_installed$="Y" then
		num_files=2
		dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
		open_tables$[1]="GMQ_CUSTOMER",open_opts$[1]="OTA"
		open_tables$[2]="GMX_CUSTOMER",open_opts$[2]="OTA"
		gosub open_tables
	endif
[[ARM_CUSTMAST.<CUSTOM>]]

rem ===================================
disable_ctls:rem --- disable selected control
rem ===================================

    for dctl=1 to 17
        dctl$=dctl$[dctl]
        if dctl$<>""
            wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
	 wmap$=callpoint!.getAbleMap()
            wpos=pos(wctl$=wmap$,8)
            wmap$(wpos+6,1)="I"
	 callpoint!.setAbleMap(wmap$)
            callpoint!.setStatus("ABLEMAP")
        endif
    next dctl
    return

#include std_missing_params.src
