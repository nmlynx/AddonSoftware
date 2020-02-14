[[ARE_CCPMT_CSTHST.ACUS]]
rem --- Process custom event -- used in this pgm to select/de-select checkboxes in grid
rem --- See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info
rem --- This routine is executed when callbacks have been set to run a 'custom event'
rem --- Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind
rem --- of event it is... in this case, we're toggling checkboxes on/off in form grid control

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ev!=BBjAPI().getLastEvent()

	ctl_ID=dec(gui_event.ID$)
	if ctl_ID=num(callpoint!.getDevObject("openInvoicesGridId"))
		if gui_event.code$="N"
			notify_base$=notice(gui_dev,gui_event.x%)
			dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
			notice$=notify_base$
			curr_row = dec(notice.row$)
			curr_col = dec(notice.col$)
		endif
		switch notice.code
			case 7;rem edit stop - can only edit pay col
				if curr_col=num(callpoint!.getDevObject("pay_col")) then
					vectInvoices!=callpoint!.getDevObject("vectInvoices")
					openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
					grid_cols = num(callpoint!.getDevObject("grid_cols"))
					inv_bal_col=num(callpoint!.getDevObject("inv_bal_col"))
					disc_col=num(callpoint!.getDevObject("disc_col"))
					pay_col=num(callpoint!.getDevObject("pay_col"))
					end_bal_col=num(callpoint!.getDevObject("end_bal_col"))
					tot_pay=num(callpoint!.getColumnData("<<DISPLAY>>.DISP_APPLY_AMT"))
					vect_pay_amt=num(vectInvoices!.get(curr_row*grid_cols+pay_col))
					vect_inv_bal=num(vectInvoices!.get(curr_row*grid_cols+inv_bal_col))
					grid_pay_amt = num(openInvoicesGrid!.getCellText(curr_row,pay_col))
					grid_disc_taken = num(openInvoicesGrid!.getCellText(curr_row,disc_col))
					if grid_pay_amt<0 then grid_pay_amt=0
					vectInvoices!.set(curr_row*grid_cols+pay_col,str(grid_pay_amt))
					vectInvoices!.set(curr_row*grid_cols+disc_col,str(grid_disc_taken))
					vectInvoices!.set(curr_row*grid_cols+end_bal_col,str(vect_inv_bal-grid_pay_amt-grid_disc_taken))
					openInvoicesGrid!.setCellText(curr_row,end_bal_col,str(vect_inv_bal-grid_pay_amt-grid_disc_taken))
					tot_pay=tot_pay-vect_pay_amt+grid_pay_amt
					callpoint!.setColumnData("<<DISPLAY>>.DISP_APPLY_AMT",str(tot_pay),1)
					if grid_pay_amt>0
						vectInvoices!.set(curr_row*grid_cols,"Y")
						openInvoicesGrid!.setCellState(curr_row,0,1)
					else
						vectInvoices!.set(curr_row*grid_cols,"")
						openInvoicesGrid!.setCellState(curr_row,0,0)
					endif
					callpoint!.setDevObject("vectInvoices",vectInvoices!)
					callpoint!.setDevObject("openInvoicesGrid",openInvoicesGrid!)
				endif
			break
			case 12;rem grid_key_press
				if notice.wparam=32 gosub switch_value
			break
			case 14;rem grid_mouse_up
				if notice.col=0 gosub switch_value
			break
			case default
			break
		swend
	endif
		

[[ARE_CCPMT_CSTHST.AOPT-SUBM]]
rem --- process the selected invoices for payment

gosub process_payment

[[ARE_CCPMT_CSTHST.ARER]]
rem --- load up form fields from customer rec

	dim arm_custmast$:fnget_tpl$("ARM_CUSTMAST")

	arm_custmast$=callpoint!.getDevObject("arm_custmast")

[[ARE_CCPMT_CSTHST.ASIZ]]
rem --- Resize grids

	formHeight=Form!.getHeight()
	formWidth=Form!.getWidth()
	openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
	gridYpos=openInvoicesGrid!.getY()
	gridXpos=openInvoicesGrid!.getX()
	availableHeight=formHeight-gridYpos

	openInvoicesGrid!.setSize(formWidth-2*gridXpos,availableHeight-8)
	openInvoicesGrid!.setFitToGrid(1)

[[ARE_CCPMT_CSTHST.ASVA]]
rem --- process the selected invoices for payment

gosub process_payment

[[ARE_CCPMT_CSTHST.AWIN]]
rem --- Declare classes used

	use java.io.File
	use java.math.BigDecimal
	use java.math.RoundingMode
	use java.net.URLEncoder
	use java.util.Iterator
	use java.util.UUID

	use org.json.JSONObject

	use com.tranxactive.j2pay.gateways.parameters.Customer
	use com.tranxactive.j2pay.gateways.parameters.CustomerCard
	use com.tranxactive.j2pay.gateways.parameters.Currency
	use com.tranxactive.j2pay.gateways.parameters.Country

	use com.tranxactive.j2pay.gateways.core.Gateway
	use com.tranxactive.j2pay.gateways.core.GatewayFactory
	use com.tranxactive.j2pay.gateways.core.AvailableGateways
	use com.tranxactive.j2pay.gateways.core.GatewaySampleParameters

	use com.tranxactive.j2pay.net.HTTPResponse
	use com.tranxactive.j2pay.net.JSONHelper

	use net.authorize.Environment
	use net.authorize.api.contract.v1.MerchantAuthenticationType
	use net.authorize.api.contract.v1.TransactionRequestType
	use net.authorize.api.contract.v1.SettingType
	use net.authorize.api.contract.v1.ArrayOfSetting
	use net.authorize.api.contract.v1.MessageTypeEnum
	use net.authorize.api.contract.v1.TransactionTypeEnum
	use net.authorize.api.contract.v1.GetHostedPaymentPageRequest
	use net.authorize.api.contract.v1.GetHostedPaymentPageResponse
	use net.authorize.api.contract.v1.GetTransactionDetailsRequest
	use net.authorize.api.contract.v1.OrderType
	use net.authorize.api.controller.base.ApiOperationBase
	use net.authorize.api.controller.GetHostedPaymentPageController
	use net.authorize.api.controller.GetTransactionDetailsController

	use ::ado_util.src::util	
	use ::ado_file.src::FileObject
	use ::sys/prog/bao_encryptor.bbj::Encryptor

	use ::REST/BBWebClient.bbj::BBWebClient
	use ::REST/BBWebClient.bbj::BBWebRequest
	use ::REST/BBWebClient.bbj::BBWebResponse

rem --- set devObjects
	call stbl("+DIR_PGM")+"adc_getmask.aon","","AR","A","",ar_a_mask$,0,0
	callpoint!.setDevObject("ar_a_mask",ar_a_mask$)
	callpoint!.setDevObject("vectInvoices",BBjAPI().makeVector())

rem --- Open files

	num_files=15
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ART_INVHDR",open_opts$[1]="OTA"
	open_tables$[2]="ART_RESPHDR",open_opts$[2]="OTA"
	open_tables$[3]="ART_RESPDET",open_opts$[3]="OTA"	
	open_tables$[4]="ARE_CASHHDR",open_opts$[4]="OTA"
	open_tables$[5]="ARE_CASHDET",open_opts$[5]="OTA"
	open_tables$[6]="ARE_CASHBAL",open_opts$[6]="OTA"
	open_tables$[7]="ARS_CC_CUSTPMT",open_opts$[7]="OTA"
	open_tables$[8]="ARS_GATEWAYDET",open_opts$[8]="OTA"
	open_tables$[9]="ARS_PARAMS",open_opts$[9]="OTA"
	open_tables$[10]="ARE_DEPOSIT",open_opts$[10]="OTA"
	open_tables$[11]="ARC_CASHCODE",open_opts$[11]="OTA"
	open_tables$[12]="ARM_CUSTMAST",open_opts$[12]="OTA"
	open_tables$[13]="ADM_PROCMASTER",open_opts$[13]="OTA"
	open_tables$[14]="ADM_PROCBATCHES",open_opts$[14]="OTA"
	open_tables$[15]="DDM_SYSTEMS",open_opts$[15]="OTA"

	gosub open_tables

rem --- other init
	for curr_argv=1 to argc-1
		temp_argv$=argv(curr_argv)
		if pos("-k"=temp_argv$)=1 cust_id$=temp_argv$(3);break;rem get cust_id$ passed in from login
	next curr_argv

	arm_custmast=fnget_dev("ARM_CUSTMAST")
	dim arm_custmast$:fnget_tpl$("ARM_CUSTMAST")

	readrecord(arm_custmast,key=firm_id$+cust_id$,dom=*next)arm_custmast$
	if arm_custmast.customer_id$<>cust_id$
		msg_id$="PROCESS_ABORT"
		gosub disp_message

		gosub open_log
		print(log_dev)date(0:"%Yd-%Mz-%Dz @ %Hz:%mz:%sz")
		print(log_dev)pgm(-2)
		print(log_dev)"arm_custmast (arm-01) record not found"
		print(log_dev)"firm_id="+firm_id$
		print(log_dev)"customer_id="+cust_id$
		print(log_dev)

		release
	else
		callpoint!.setTableColumnAttribute("ARE_CCPMT_CSTHST.CUSTOMER_ID","DFLT",arm_custmast.customer_id$)
		callpoint!.setDevObject("arm_custmast",arm_custmast$)
	endif

	callpoint!.setDevObject("customer_id",cust_id$)
	recpt_date$=date(0:"%Yd%Mz%Dz")
	
rem --- read ars_cc_custpmt to get cash_rec_cd used for customer payments (only one record allowed at present)

	ars_cc_custpmt=fnget_dev("ARS_CC_CUSTPMT")
	dim ars_cc_custpmt$:fnget_tpl$("ARS_CC_CUSTPMT")

	readrecord(ars_cc_custpmt,key=firm_id$,dom=*next)
	callpoint!.setDevObject("cash_rec_cd","")
	while 1
		readrecord(ars_cc_custpmt,end=*break)ars_cc_custpmt$
		if ars_cc_custpmt.firm_id$<>firm_id$ then break
		if ars_cc_custpmt.allow_cust_cc$="Y"
			callpoint!.setDevObject("cash_rec_cd",ars_cc_custpmt.cash_rec_cd$)
			break
		endif
	wend
	if callpoint!.getDevObject("cash_rec_cd")=""
		msg_id$="PROCESS_ABORT"
		gosub disp_message

		gosub open_log
		print(log_dev)date(0:"%Yd-%Mz-%Dz @ %Hz:%mz:%sz")
		print(log_dev)pgm(-2)
		print(log_dev)"Online Customer Credit Card Parameters not setup for credit card payments."
		print(log_dev)

		release
	endif

rem --- Interface to gl?
	gl$="N"
	status=0
	call stbl("+DIR_PGM")+"glc_ctlcreate.aon",err=*next,"ARE_CASHHDR","AR",glw11$,gl$,status
	if status<>0 
		msg_id$="PROCESS_ABORT"
		gosub disp_message

		gosub open_log
		print(log_dev)date(0:"%Yd-%Mz-%Dz @ %Hz:%mz:%sz")
		print(log_dev)pgm(-2)
		print(log_dev)"Failed to create GL Posting Control for ARE_CASHHDR."
		print(log_dev)"status="+str(status)
		print(log_dev)

		release
	else
		callpoint!.setDevObject("gl_interface",gl$)
		if gl$="Y"
			call stbl("+DIR_PGM")+"glc_datecheck.aon",recpt_date$,"N",per$,yr$,status
			if status>99
				msg_id$="PROCESS_ABORT"
				gosub disp_message

				gosub open_log
				print(log_dev)date(0:"%Yd-%Mz-%Dz @ %Hz:%mz:%sz")
				print(log_dev)pgm(-2)
				print(log_dev)"Receipt date failed GL transaction date verification."
				print(log_dev)"recpt_date$="+recpt_date$
				print(log_dev)"status="+str(status)
				print(log_dev)

				release
			endif
		endif
	endif

rem --- Get current or new batch for "AR Csh Rcp" process if applicable
	adm_procmaster=fnget_dev("ADM_PROCMASTER")
	dim adm_procmaster$:fnget_tpl$("ADM_PROCMASTER")
	adm_procmaster.process_id$="AR Csh Rcp"
	readrecord(adm_procmaster,key=firm_id$+adm_procmaster.process_id$,dom=*next)adm_procmaster$
	if adm_procmaster.batch_entry$="Y" then
		rem --- "AR Csh Rcp" process is batched
		need_new_batch=0
		ars_cc_custpmt=fnget_dev("ARS_CC_CUSTPMT")
		dim ars_cc_custpmt$:fnget_tpl$("ARS_CC_CUSTPMT")
		ars_cc_custpmt.cash_rec_cd$=callpoint!.getDevObject("cash_rec_cd")
		extractrecord(ars_cc_custpmt,key=firm_id$+ars_cc_custpmt.cash_rec_cd$)ars_cc_custpmt$; rem --- something wrong if record is missing here
		if cvs(ars_cc_custpmt.last_batch_no$,2)="" then
			rem --- Batch for credit card payments doesn't exit yet
			need_new_batch=1
		else
			rem --- Batch for credit card payments exists. Verify it is current.
			adm_procbatches=fnget_dev("ADM_PROCBATCHES")
			dim adm_procbatches$:fnget_tpl$("ADM_PROCBATCHES")
			readrecord(adm_procbatches,key=firm_id$+adm_procmaster.process_id$+ars_cc_custpmt.last_batch_no$,dom=*next)adm_procbatches$

			today$=date(0:"%Yd%Mz%Dz")
			if adm_procbatches.date_opened$<>today$ then
				rem --- Batch for credit card payments is out of date
				need_new_batch=1
			endif
		endif

		rem --- Create new credit card payment batch for "AR Csh Rcp" process
		if need_new_batch then
			call stbl("+DIR_SYP")+"bas_sequences.bbj","BATCH_NO",next_batchno$,table_chans$[all],"QUIET"

			adm_procbatches=fnget_dev("ADM_PROCBATCHES")
			dim adm_procbatches$:fnget_tpl$("ADM_PROCBATCHES")
			adm_procbatches.firm_id$=firm_id$
			adm_procbatches.process_id$=adm_procmaster.process_id$
			adm_procbatches.batch_no$=next_batchno$
			adm_procbatches.user_id$=sysinfo.user_id$
			today$=date(0:"%Yd%Mz%Dz")
			adm_procbatches.date_opened$=today$
			now$=date(0:"%hz%mz")
			adm_procbatches.time_opened$=now$
			adm_procbatches.lstuse_date$=today$
			adm_procbatches.lstuse_time$=now$
			description$=iff(ars_cc_custpmt.batch_desc$<>"",ars_cc_custpmt.batch_desc$,adm_procmaster.description$)
			adm_procbatches.description$=description$
			writerecord(adm_procbatches)adm_procbatches$

			ars_cc_custpmt.last_batch_no$=next_batchno$
			ars_cc_custpmt.batch_desc$=description$
			writerecord(ars_cc_custpmt)ars_cc_custpmt$
		else
			rem --- Update last used time stamp
			adm_procbatches=fnget_dev("ADM_PROCBATCHES")
			dim adm_procbatches$:fnget_tpl$("ADM_PROCBATCHES")
			extractrecord(adm_procbatches,key=firm_id$+adm_procmaster.process_id$+ars_cc_custpmt.last_batch_no$,dom=*next)adm_procbatches$
			if cvs(adm_procbatches.process_id$,2)<>"" then
				now$=date(0:"%hz%mz")
				adm_procbatches.lstuse_time$=now$
				writerecord(adm_procbatches)adm_procbatches$
			else
				read(adm_procbatches)
			endif

			rem --- Remove temporary lock on record
			read(ars_cc_custpmt,end=*next)
		endif
	else
		rem --- "AR Csh Rcp" process is not batched
		ars_cc_custpmt=fnget_dev("ARS_CC_CUSTPMT")
		dim ars_cc_custpmt$:fnget_tpl$("ARS_CC_CUSTPMT")
		ars_cc_custpmt.cash_rec_cd$=callpoint!.getDevObject("cash_rec_cd")
		extractrecord(ars_cc_custpmt,key=firm_id$+ars_cc_custpmt.cash_rec_cd$)ars_cc_custpmt$; rem --- something wrong if record is missing here

		ars_cc_custpmt.last_batch_no$="0000000"
		ars_cc_custpmt.batch_desc$=""
		writerecord(ars_cc_custpmt)ars_cc_custpmt$
	endif

rem --- Get current or new Deposit ID if applicable
	ars_params=fnget_dev("ARS_PARAMS")
	dim ars_params$:fnget_tpl$("ARS_PARAMS")
	ars_params.br_interface$="N"
	readrecord(ars_params,key=firm_id$+"AR00",dom=*next)ars_params$
	if ars_params.br_interface$="Y" then
		rem --- Interfacing with Bank Reconsiliation, so use Deposit ID
		need_new_depositID=0
		ars_cc_custpmt=fnget_dev("ARS_CC_CUSTPMT")
		dim ars_cc_custpmt$:fnget_tpl$("ARS_CC_CUSTPMT")
		ars_cc_custpmt.cash_rec_cd$=callpoint!.getDevObject("cash_rec_cd")
		extractrecord(ars_cc_custpmt,key=firm_id$+ars_cc_custpmt.cash_rec_cd$)ars_cc_custpmt$; rem --- something wrong if record is missing here
		if cvs(ars_cc_custpmt.last_deposit_id$,2)="" then
			rem --- Deposit ID for credit card payments doesn't exit yet
			need_new_depositID=1
		else
			rem --- Deposit ID for credit card payments exists. Verify it is current.
			are_deposit=fnget_dev("ARE_DEPOSIT")
			dim are_deposit$:fnget_tpl$("ARE_DEPOSIT")
			readrecord(are_deposit,key=firm_id$+ars_cc_custpmt.last_deposit_id$,dom=*next)are_deposit$

			today$=date(0:"%Yd%Mz%Dz")
			if are_deposit.created_date$<>today$ then
				rem --- Batch for credit card payments is out of date
				need_new_depositID=1
			endif
		endif

		rem --- Create new credit card payment Deposit ID
		if need_new_depositID then
			call stbl("+DIR_SYP")+"bas_sequences.bbj","DEPOSIT_ID",next_depositID$,table_chans$[all],"QUIET"

			are_deposit=fnget_dev("ARE_DEPOSIT")
			dim are_deposit$:fnget_tpl$("ARE_DEPOSIT")
			are_deposit.firm_id$=firm_id$
			are_deposit.deposit_id$=next_depositID$
			today$=date(0:"%Yd%Mz%Dz")
			are_deposit.deposit_date$=today$
			description$=iff(ars_cc_custpmt.deposit_desc$<>"",ars_cc_custpmt.deposit_desc$,"Customer CC Pymt")
			are_deposit.description$=description$
			are_deposit.cash_rec_cd$=ars_cc_custpmt.cash_rec_cd$
			are_deposit.created_user$=sysinfo.user_id$
			are_deposit.created_date$=today$
			now$=date(0:"%hz%mz")
			are_deposit.created_time$=now$
			are_deposit.mod_user$=sysinfo.user_id$
			are_deposit.mod_date$=today$
			are_deposit.mod_time$=now$
			are_deposit.trans_status$="E"
			are_deposit.arc_user$=""
			are_deposit.arc_date$=""
			are_deposit.arc_time$=""
			are_deposit.batch_no$=ars_cc_custpmt.last_batch_no$
			are_deposit.audit_number=0
			are_deposit.tot_deposit_amt=0
			writerecord(are_deposit)are_deposit$

			ars_cc_custpmt.last_deposit_id$=next_depositID$
			ars_cc_custpmt.deposit_desc$=description$
			writerecord(ars_cc_custpmt)ars_cc_custpmt$
		else
			rem --- Update last used time stamp
			are_deposit=fnget_dev("ARE_DEPOSIT")
			dim are_deposit$:fnget_tpl$("ARE_DEPOSIT")
			extractrecord(are_deposit,key=firm_id$+ars_cc_custpmt.last_deposit_id$,dom=*next)are_deposit$
			if cvs(are_deposit.deposit_id$,2)<>"" then
				now$=date(0:"%hz%mz")
				are_deposit.mod_time$=now$
				writerecord(are_deposit)are_deposit$
			else
				read(are_deposit,end=*next)
			endif

			rem --- Remove temporary lock on record
			read(ars_cc_custpmt,end=*next)
		endif
	else
		rem --- Not interfacing with Bank Reconsiliation, so don't use Deposit ID
		ars_cc_custpmt=fnget_dev("ARS_CC_CUSTPMT")
		dim ars_cc_custpmt$:fnget_tpl$("ARS_CC_CUSTPMT")
		ars_cc_custpmt.cash_rec_cd$=callpoint!.getDevObject("cash_rec_cd")
		extractrecord(ars_cc_custpmt,key=firm_id$+ars_cc_custpmt.cash_rec_cd$)ars_cc_custpmt$; rem --- something wrong if record is missing here

		ars_cc_custpmt.last_deposit_id$=""
		ars_cc_custpmt.deposit_desc$=""
		writerecord(ars_cc_custpmt)ars_cc_custpmt$
	endif

rem --- Get Bank Rec interface flag
	ars_params=fnget_dev("ARS_PARAMS")
	dim ars_params$:fnget_tpl$("ARS_PARAMS")
	readrecord(ars_params,key=firm_id$+"AR00",dom=std_missing_params)ars_params$
	callpoint!.setDevObject("br_interface",ars_params.br_interface$)
	callpoint!.setDevObject("deposit_id","")

rem --- Add open invoice grid to form
	nxt_ctlID = util.getNextControlID()
	tmpCtl!=callpoint!.getControl("<<DISPLAY>>.DISP_APPLY_AMT")
	grid_y=tmpCtl!.getY()+tmpCtl!.getHeight()+5
	grid_width=tmpCtl!.getX()+tmpCtl!.getWidth()+400

	openInvoicesGrid! = Form!.addGrid(nxt_ctlID,5,grid_y,grid_width,125); rem --- ID, x, y, width, height
	callpoint!.setDevObject("openInvoicesGrid",openInvoicesGrid!)
	callpoint!.setDevObject("openInvoicesGridId",str(nxt_ctlID))
	callpoint!.setDevObject("grid_cols","9")
	callpoint!.setDevObject("grid_rows","10")
	callpoint!.setDevObject("disc_col","5")
	callpoint!.setDevObject("inv_bal_col","6")
	callpoint!.setDevObject("pay_col","7")
	callpoint!.setDevObject("end_bal_col","8")
	callpoint!.setDevObject("interface_tp","")

	gosub format_grid

	openInvoicesGrid!.setTabAction(SysGUI!.GRID_NAVIGATE_GRID)
	openInvoicesGrid!.setTabActionSkipsNonEditableCells(1)
	openInvoicesGrid!.setColumnEditable(7,1)

rem --- set callbacks - processed in ACUS callpoint
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_KEY_PRESS,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_MOUSE_UP,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_EDIT_STOP,"custom_event")

rem --- get cash receipts code/params, verify config
	arc_cashcode=fnget_dev("ARC_CASHCODE")
	are_cashhdr=fnget_dev("ARE_CASHHDR")

	dim arc_cashcode$:fnget_tpl$("ARC_CASHCODE")
	dim are_cashhdr$:fnget_tpl$("ARE_CASHHDR")

	cash_cd$=callpoint!.getDevObject("cash_rec_cd")
	readrecord(arc_cashcode,key=firm_id$+"C"+cash_cd$,dom=std_missing_params)arc_cashcode$

	gateway_id$=ars_cc_custpmt.gateway_id$
	gosub get_gateway_config
	if msg_id$<>"" then break; rem --- 'token' string found in config; needs to be substituted for legit value before continuing

	callpoint!.setDevObject("ars_cc_custpmt",ars_cc_custpmt$)
	callpoint!.setDevObject("interface_tp",ars_cc_custpmt.interface_tp$)

	rem --- for hosted, make sure expected config attributes exist
	config_attribs!=BBjAPI().makeVector()
	if gateway_id$="PAYFLOWPRO"
		config_attribs!.add("PARTNER")
		config_attribs!.add("VENDOR")
		config_attribs!.add("USER")
		config_attribs!.add("PWD")
		config_attribs!.add("testMode")
		config_attribs!.add("server")
		config_attribs!.add("requestTokenURL")
		config_attribs!.add("launchURL")
		config_attribs!.add("silentPostServlet")
		config_attribs!.add("silentPostFailureServlet")
		config_attribs!.add("silentPostFailureServlet")
	else
		config_attribs!.add("name")
		config_attribs!.add("transactionKey")
		config_attribs!.add("server")
		config_attribs!.add("launchPage")
		config_attribs!.add("gatewayURL")
		config_attribs!.add("confirmationPage")
		config_attribs!.add("webhookServlet")
		config_attribs!.add("environment")
		config_attribs!.add("testMode")
	endif
	for wk=0 to config_attribs!.size()-1
		if gw_config!.get(config_attribs!.get(wk))=null()
			dim msg_tokens$[1]
			msg_tokens$[0]=Translate!.getTranslation("AON_MISSING_GATEWAY_CONFIG","One or more configuration values for the payment gateway are missing.",1)+$0A$+"("+gateway_id$+")"
			msg_id$="GENERIC_WARN"
			gosub disp_message
			callpoint!.setStatus("EXIT")
			break
		endif
	next wk

	rem --- load up open invoices

	gosub get_open_invoices
	gosub fill_grid
[[ARE_CCPMT_CSTHST.BEND]]
rem --- if vectInvoices! contains any selected items, get confirmation that user really wants to exit

	vectInvoices!=callpoint!.getDevObject("vectInvoices")
	grid_cols = num(callpoint!.getDevObject("grid_cols"))
	selected=0
	if vectInvoices!.size(err=*endif)
		for wk=0 to vectInvoices!.size()-1 step grid_cols
			selected=selected+iff(vectInvoices!.get(wk)="Y",1,0)
		next wk
	endif

	if selected
		msg_id$="GENERIC_WARN_CANCEL"
		dim msg_tokens$[1]
		msg_tokens$[0]=Translate!.getTranslation("AON_EXIT_WITHOUT_PROCESSING_THIS_PAYMENT","Exit without processing this payment?",1)+$0A$+Translate!.getTranslation("AON_SELECT_OK_OR_CANCEL","Select OK to exit, or Cancel to return to the form.",1)
		gosub disp_message
		if msg_opt$<>"O" then callpoint!.setStatus("ABORT")
	endif

[[ARE_CCPMT_CSTHST.BFMC]]
x$=stbl("+GUI_SCALE","1.5")

[[ARE_CCPMT_CSTHST.<CUSTOM>]]
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
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

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
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="15"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="AVAIL_DISC"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_AVAIL_DISC")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="15"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="BALANCE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_BALANCE")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="15"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="PAY_AMOUNT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_PAYMENT_AMT")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="END_BALANCE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_END_BALANCE")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	for curr_attr=1 to grid_cols
		attr_grid_col$[0,1] = attr_grid_col$[0,1] + 
:			pad("ARE_CCPMT_CSTHST." + attr_grid_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
	next curr_attr

	attr_disp_col$=attr_grid_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,openInvoicesGrid!,"COLH-LINES-LIGHT-AUTO-SIZEC-MULTI-DATES-CHECKS",grid_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_grid_col$[all]

	return

rem ==========================================================================
get_open_invoices: rem --- create vector of invoices with bal>0, taking into account anything entered but not yet posted
rem ==========================================================================

	art_invhdr=fnget_dev("ART_INVHDR")
	dim art_invhdr$:fnget_tpl$("ART_INVHDR")
	are_cashbal=fnget_dev("ARE_CASHBAL")
	dim are_cashbal$:fnget_tpl$("ARE_CASHBAL")

	cust_id$=callpoint!.getDevObject("customer_id")
	ar_type$=art_invhdr.ar_type$;rem --- ar_type always '  '

	vectInvoices!=BBjAPI().makeVector()

	read (art_invhdr,key=firm_id$+ar_type$+cust_id$,dom=*next)

	while 1
		invky$=key(art_invhdr,end=*break)
		if pos(firm_id$+ar_type$+cust_id$=invky$)<>1 then break
		readrecord(art_invhdr)art_invhdr$
		inv_bal=num(art_invhdr.invoice_bal$)
		if inv_bal and arc_cashcode.disc_flag$="Y" and stbl("+SYSTEM_DATE")<= pad(art_invhdr.disc_date$,8) 
			disc_amt=art_invhdr.disc_allowed-art_invhdr.disc_taken
			if disc_amt<0 then disc_amt=0
		else
			disc_amt=0
		endif

		rem --- applied but not yet posted
		redim are_cashbal$
		read record(are_cashbal,key=firm_id$+ar_type$+are_cashbal.reserved_str$+cust_id$+art_invhdr.ar_inv_no$,dom=*next)are_cashbal$
		if arc_cashcode.disc_flag$="Y" then disc_amt=disc_amt-num(are_cashbal.discount_amt$)
		inv_bal=inv_bal-num(are_cashbal.apply_amt$)-disc_amt

		if inv_bal<=0 then continue
		vectInvoices!.add("")
		vectInvoices!.add(art_invhdr.ar_inv_no$)
		vectInvoices!.add(date(jul(art_invhdr.invoice_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(date(jul(art_invhdr.inv_due_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(art_invhdr.invoice_amt$)
		vectInvoices!.add(str(disc_amt))
		vectInvoices!.add(str(inv_bal))
		vectInvoices!.add("0")
		vectInvoices!.add(str(inv_bal))
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
	inv_bal_col=num(callpoint!.getDevObject("inv_bal_col"))
	disc_col=num(callpoint!.getDevObject("disc_col"))
	pay_col=num(callpoint!.getDevObject("pay_col"))
	end_bal_col=num(callpoint!.getDevObject("end_bal_col"))

	TempRows!=openInvoicesGrid!.getSelectedRows()
	tot_pay=num(callpoint!.getColumnData("<<DISPLAY>>.DISP_APPLY_AMT"))

	if TempRows!.size()>0
		for curr_row=1 to TempRows!.size()
			if openInvoicesGrid!.getCellState(TempRows!.getItem(curr_row-1),0)=0
				openInvoicesGrid!.setCellState(TempRows!.getItem(curr_row-1),0,1)
				inv_pay=num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+inv_bal_col))
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"Y")
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+pay_col,str(inv_pay))
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+end_bal_col,"0")
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),pay_col,str(inv_pay))
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),end_bal_col,"0")
				tot_pay=tot_pay+inv_pay
			else
				openInvoicesGrid!.setCellState(num(TempRows!.getItem(curr_row-1)),0,0)
				inv_pay=num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+pay_col))
				inv_bal=num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+inv_bal_col))
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"")
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+pay_col,"0")
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+end_bal_col,str(inv_bal))
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),pay_col,"0")
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),end_bal_col,str(inv_bal))
				tot_pay=tot_pay-inv_pay
			endif
		next curr_row
		callpoint!.setDevObject("openInvoicesGrid",openInvoicesGrid!)
		callpoint!.setDevObject("vectInvoices",vectInvoices!)

	endif

	callpoint!.setColumnData("<<DISPLAY>>.DISP_APPLY_AMT",str(tot_pay),1)

	if info(3,6)<>"5" then SysGUI!.setRepaintEnabled(1)

	return

rem ==========================================================================
get_gateway_config:rem --- get config for specified gateway
rem --- in: gateway_id$; out: hashmap gw_config! containing config entries
rem ==========================================================================

	ars_gatewaydet=fnget_dev("ARS_GATEWAYDET")
	dim ars_gatewaydet$:fnget_tpl$("ARS_GATEWAYDET")

	encryptor! = new Encryptor()
	config_id$ = "GATEWAY_AUTH"
	encryptor!.setConfiguration(config_id$)

	read(ars_gatewaydet,key=firm_id$+gateway_id$,knum=0,dom=*next)
	gw_config!=new java.util.HashMap()

	while 1
		readrecord(ars_gatewaydet,end=*break)ars_gatewaydet$
		if pos(firm_id$+gateway_id$=ars_gatewaydet$)<>1 then break
		if gw_config!.get("gateway_id")=null() then gw_config!.put("gateway_id",gateway_id$)
		cfg_value$=encryptor!.decryptData(cvs(ars_gatewaydet.config_value$,3))
		if pos("token>"=cfg_value$) or cvs(cfg_value$,3)=""
			dim msg_tokens$[1]
			msg_tokens$[0]=Translate!.getTranslation("AON_INVALID_GATEWAY_CONFIG","One or more configuration values for the payment gateway are invalid.",1)+$0A$+"("+gateway_id$+")"
			msg_id$="GENERIC_WARN"
			gosub disp_message
			callpoint!.setStatus("EXIT")
			break
		else
			msg_id$=""
			gw_config!.put(cvs(ars_gatewaydet.config_attr$,3),cfg_value$)
		endif
	wend

	callpoint!.setDevObject("gw_config",gw_config!)

	return

rem =====================================================================
process_payment: rem --- user has clicked green run process arrow, or Submit button
rem =====================================================================
rem --- if using J2Pay (interface_tp$='A'), check for mandatory data, confirm, then process

	interface_tp$=callpoint!.getDevObject("interface_tp");rem always H in this form

	rem --- interface_tp$="H" (hosted page), check to make sure one or more invoices selected, confirm, then process

	apply_amt!=cast(BBjNumber, num(callpoint!.getColumnData("<<DISPLAY>>.DISP_APPLY_AMT")))
	masked_amt$=cvs(str(num(callpoint!.getColumnData("<<DISPLAY>>.DISP_APPLY_AMT")):callpoint!.getDevObject("ar_a_mask")),3)

	if apply_amt!=0
		dim msg_tokens$[1]
		msg_tokens$[0]=Translate!.getTranslation("AON_PLEASE_MAKE_A_SELECTION","Please make a selection.",1)
		msg_id$="GENERIC_WARN"
		gosub disp_message
		callpoint!.setStatus("ABORT-ACTIVATE")
		return
	endif

	msg_id$="CONF_CC_PAYMENT"
	msg_opt$=""
	dim msg_tokens$[1]
	msg_tokens$[0]=masked_amt$
	gosub disp_message

	if msg_opt$<>"Y"
		callpoint!.setStatus("ABORT-ACTIVATE")
	else

		dim ars_cc_custpmt$:fnget_tpl$("ARS_CC_CUSTPMT")
		ars_cc_custpmt$=callpoint!.getDevObject("ars_cc_custpmt")
		gateway_id$=ars_cc_custpmt.gateway_id$
		gw_config!=callpoint!.getDevObject("gw_config")


		vectServlet!=BBjAPI().makeVector()
		vectInvoices!=callpoint!.getDevObject("vectInvoices")
		cust_id$=callpoint!.getDevObject("customer_id")
		cash_rec_cd$=callpoint!.getDevObject("cash_rec_cd")

		vectServlet!.add(BBjAPI().getFileSystem().resolvePath(dir(""))+"/")
		vectServlet!.add(stbl("+USER_ID"))
		vectServlet!.add(cust_id$)
		vectServlet!.add(cash_rec_cd$)
		vectServlet!.add(vectInvoices!)
		vectServlet!.add(callpoint!.getDevObject("grid_cols"))
		vectServlet!.add(callpoint!.getDevObject("pay_col"))

			rem --- using Authorize.net or PayPal hosted page
			switch gateway_id$
			case "PAYFLOWPRO"

				rem --- get random number to send when requesting secure token
				rem --- set namespace variable using that number
				rem --- PayPal returns that number in the response, so can match number in response to number we're sending to be sure we're processing our payment and not someone else's (multi-user)
				sid!=UUID.randomUUID()
				sid$=sid!.toString()
				callpoint!.setDevObject("sid",sid$)
				global_ns!=BBjAPI().getGlobalNamespace()
				global_ns!.setValue("PAYFLOWPRO"+sid$,vectServlet!)
			   
				rem --- use BBj's REST API to send sid$ and receive back secure token
				client!=new BBWebClient()
				request!=new BBWebRequest()
				request!.setURI(gw_config!.get("requestTokenURL"))
				request!.setMethod("POST")
				request!.setContent("PARTNER="+gw_config!.get("PARTNER")+"&VENDOR="+gw_config!.get("VENDOR")+"&USER="+gw_config!.get("USER")+"&PWD="+gw_config!.get("PWD")+"&TRXTYPE=S&AMT="+str(apply_amt!:"###,###.00")+"&CREATESECURETOKEN=Y&SECURETOKENID="+sid!.toString())
				response! = client!.sendRequest(request!) 
				content!=response!.getBody()
				response!.close()

				tokenID!=content!.substring(content!.indexOf("SECURETOKEN=")+11)
				tokenID$=tokenID!.substring(1,tokenID!.indexOf("&"))

				rem --- If successful in getting secure token, launch hosted page.
				rem --- PayPal Silent Post configuration will contain return URL that runs a BBJSP servlet once payment is completed (or declined).
				rem --- Servlet updates namespace variable sid$ with response text.
				rem --- Registered callback for namespace variable change will cause PayPal response routine in ACUS to get executed,
				rem --- which will record response in art_response and post cash receipt, if applicable.

				if content!.contains("RESULT=0")
					rem --- set devObject to indicate 'payment' status - check when exiting and warn if still in "payment" status (i.e., no response received yet)
					callpoint!.setDevObject("cust_payment_status","payment")
			rem		returnCode=scall("bbj "+$22$+"are_hosted.aon"+$22$+" - -g"+gateway_id$+" -t"+tokenID$+" -s"+sid$+" -l"+gw_config!.get("launchURL"))
					callpoint!.setStatus("EXIT")
					BBjAPI().getThinClient().browse(gw_config!.get("launchURL")+"?SECURETOKENID="+sid$+"&SECURETOKEN="+tokenID$,"_self","")
				else
					trans_msg$=Translate!.getTranslation("AON_UNABLE_TO_ACQUIRE_SECURE_TOKEN")+$0A$+content!
					dim msg_tokens$[1]
					msg_tokens$[0]=trans_msg$
					msg_id$="GENERIC_WARN"
					gosub disp_message
					callpoint!.setStatus("EXIT")
				endif
			break
			case "AUTHORIZE "

				rem --- Create the order object to add to transaction request
				rem --- Currently filling with unique ID so we can link this auth-capture to returned response
				rem --- Authorize.net next API version should allow refID to be passed that will be returned in Webhook, obviating need for unique ID in order

				sid!=UUID.randomUUID()
				sid$=sid!.toString()
				callpoint!.setDevObject("sid",sid$)
				global_ns!=BBjAPI().getGlobalNamespace()
				global_ns!.setValue("AUTHORIZE"+sid$,vectServlet!)
				global_ns!.setValue("AUTHORIZEgw_config",gw_config!)
				order! = new OrderType()
				order!.setInvoiceNumber(cust_id$)
				order!.setDescription(sid$)

				confirmation_page$=fnbuildURL$(gw_config!.get("confirmationPage"))
				embed_info$="sid="+sid$
				confirmation_page$=confirmation_page$+"?"+URLEncoder.encode(embed_info$, "UTF-8")
				launch_page$=fnbuildURL$(gw_config!.get("launchPage"))

				ApiOperationBase.setEnvironment(Environment.valueOf(gw_config!.get("environment")))

				merchantAuthenticationType!  = new MerchantAuthenticationType() 
				merchantAuthenticationType!.setName(gw_config!.get("name"))
				merchantAuthenticationType!.setTransactionKey(gw_config!.get("transactionKey"))
				ApiOperationBase.setMerchantAuthentication(merchantAuthenticationType!)

				rem Create the payment transaction request
				txnRequest! = new TransactionRequestType()
				txnRequest!.setTransactionType(TransactionTypeEnum.AUTH_CAPTURE_TRANSACTION.value())
				txnRequest!.setAmount(new BigDecimal(apply_amt!).setScale(2,RoundingMode.HALF_EVEN))
				txnRequest!.setOrder(order!)

				setting1! = new SettingType()
				setting1!.setSettingName("hostedPaymentButtonOptions")
				setting1!.setSettingValue("{"+$22$+"text"+$22$+": "+$22$+"Pay"+$22$+"}")
						
				setting2! = new SettingType()
				setting2!.setSettingName("hostedPaymentOrderOptions")
				setting2!.setSettingValue("{"+$22$+"show"+$22$+": false}")

				setting3! = new SettingType()
				setting3!.setSettingName("hostedPaymentReturnOptions")
				setting3!.setSettingValue("{"+$22$+"showReceipt"+$22$+": true, "+$22$+"url"+$22$+": "+$22$+confirmation_page$+$22$+", "+$22$+"urlText"+$22$+": "+$22$+"Continue"+$22$+"}")

				setting4! = new SettingType()
				setting4!.setSettingName("hostedPaymentPaymentOptions")
				setting4!.setSettingValue("{"+$22$+"showBankAccount"+$22$+": false}")

				alist! = new ArrayOfSetting()
				alist!.getSetting().add(setting1!)
				alist!.getSetting().add(setting2!)
				alist!.getSetting().add(setting3!)
				alist!.getSetting().add(setting4!)

				apiRequest! = new GetHostedPaymentPageRequest()
				apiRequest!.setTransactionRequest(txnRequest!)
				apiRequest!.setHostedPaymentSettings(alist!)

				controller! = new GetHostedPaymentPageController(apiRequest!)
				controller!.execute()

				authResponse! = new GetHostedPaymentPageResponse()
				authResponse! = controller!.getApiResponse()

				rem --- if GetHostedPaymentPageResponse() indicates success, launch our 'starter' page.
				rem --- 'starter' page gets passed the token, and has a 'proceed to checkout' button, which does a POST to https://test.authorize.net/payment/payment, passing along the token.
				rem --- Authorize.net is configured with Webhook for the auth-capture transaction. Webhook contains URL that runs our BBJSP servlet.
				rem --- Servlet updates namespace variable 'authresp' with response text
				rem --- registered callback for variable change will cause authorize_response routine to get executed
				rem --- authorize_response will parse trans_id from the webhook, then send a getTransactionDetailsRequest
				rem --- returned getTransactionDetailsResponse should contain order with our sid$ in the order description
				rem --- if sid$ matches saved_sid$, then this is our response (and not someone else's who might also be processing payments)
				rem --- assuming this is our response, record the Webhook response in art_response and create cash receipt, if applicable

				if authResponse!.getMessages().getResultCode()=MessageTypeEnum.OK
					callpoint!.setStatus("EXIT")
					BBjAPI().getThinClient().browse(launch_page$+"?authtoken="+authResponse!.getToken()+"&gatewayURL="+gw_config!.get("gatewayURL")+"&amount="+masked_amt$,"_self","")
				else
					trans_msg$=Translate!.getTranslation("AON_UNABLE_TO_ACQUIRE_SECURE_TOKEN")+$0a$+authResponse!.getMessages().getMessage().get(0).getCode()+$0a$+authResponse!.getMessages().getMessage().get(0).getText()
					dim msg_tokens$[1]
					msg_tokens$[0]=trans_msg$
					msg_id$="GENERIC_WARN"
					gosub disp_message
					callpoint!.setStatus("EXIT")
				endif
			break
			case default
				rem --- shouldn't get here unless new hosted gateway is specified in params, added to adc_gatewayhdr, and no case has been built for handling it
			break
		swend
	endif

	return

rem =====================================================================
open_log: rem --- Open log file
rem =====================================================================

	if log_dev=0 then
		rem --- Get this installation's location
		ddm_systems=fnget_dev("DDM_SYSTEMS")
		dim ddm_systems$:fnget_tpl$("DDM_SYSTEMS")
		readrecord(ddm_systems,key=pad("ADDON",16),knum="SYSTEM_ID")ddm_systems$
		location$=ddm_systems.mount_dir$
 
		rem --- Create logs directory at installation location
		logDir$ = FileObject.fixPath(location$ + "/logs", "/")
		FileObject.makeDirs(new File(logDir$))

		rem --- Create and/or open log file
		log$ = logDir$+"/online_ccpmt_issues.log"
		new_log=0
		string log$,err=*next; new_log=1
		log_dev=unt
		open(log_dev)log$

		if new_log then
			rem --- Write header info for new log
			print(log_dev)"Online Customer Credit Card Payment issues log started: " + date(0:"%Yd-%Mz-%Dz @ %Hz:%mz:%sz")
			print(log_dev)
		else
			rem --- Move to end of existing log
			log_fin$=fin(log_dev)
			log_size=dec($00$+log_fin$(1,4))
			read(log_dev,ind=log_size,end=*next)
		endif
	endif

	return

rem =====================================================================
rem functions
rem =====================================================================

def fnbuildURL$(config_value$)

	wkURL$="https://"+gw_config!.get("server")
	wkURL$=iff(wkURL$(len(wkURL$),1)="/",wkURL$,wkURL$+"/")
	wkURL$=wkURL$+cvs(stbl("+DBNAME_API"),11)+"/"+config_value$
	return wkURL$
	fnend

#include std_missing_params.src

