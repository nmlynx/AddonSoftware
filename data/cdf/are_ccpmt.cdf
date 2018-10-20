[[ARE_CCPMT.CASH_REC_CD.AVAL]]
rem --- get cash rec code and associated credit card params; if hosted, disable data collection fields

	ars_cc_custsvc=fnget_dev("ARS_CC_CUSTSVC")
	arc_cashcode=fnget_dev("ARC_CASHCODE")

	dim ars_cc_custsvc$:fnget_tpl$("ARS_CC_CUSTSVC")
	dim arc_cashcode$:fnget_tpl$("ARC_CASHCODE")

	cash_cd$=callpoint!.getUserInput()

	readrecord(arc_cashcode,key=firm_id$+"C"+cash_cd$,dom=std_missing_params)arc_cashcode$
	readrecord(ars_cc_custsvc,key=firm_id$+cash_cd$,dom=std_missing_params)ars_cc_custsvc$
	callpoint!.setDevObject("interface_tp",ars_cc_custsvc.interface_tp$)
	if ars_cc_custsvc.interface_tp$="A"
		enable_flag=1
	else
		enable_flag=0
		callpoint!.setColumnData("ARE_CCPMT.CARD_NO","",1)
		callpoint!.setColumnData("ARE_CCPMT.SECURITY_CD","",1)
		callpoint!.setColumnData("ARE_CCPMT.NAME_FIRST","",1)
		callpoint!.setColumnData("ARE_CCPMT.NAME_LAST","",1)
		callpoint!.setColumnData("ARE_CCPMT.MONTH","",1)
		callpoint!.setColumnData("ARE_CCPMT.YEAR","",1)
	endif
	callpoint!.setColumnEnabled("ARE_CCPMT.ADDRESS_LINE_1",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.ADDRESS_LINE_2",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.CARD_NO",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.CITY",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.CNTRY_ID",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.EMAIL_ADDR",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.MONTH",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.NAME_FIRST",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.NAME_LAST",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.PHONE_NO",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.SECURITY_CD",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.STATE_CODE",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.YEAR",enable_flag)
	callpoint!.setColumnEnabled("ARE_CCPMT.ZIP_CODE",enable_flag)

rem --- load up open invoices

	gosub get_open_invoices
	gosub fill_grid
[[ARE_CCPMT.CASH_REC_CD.BINQ]]
rem --- restrict inquiry to cash rec codes associated with credit card payments

	dim filter_defs$[1,2]
	filter_defs$[0,0]="ARC_CASHCODE.FIRM_ID"
	filter_defs$[0,1]="='"+firm_id$+"'"
	filter_defs$[0,2]="LOCK"
	filter_defs$[1,0]="ARS_CC_CUSTSVC.USE_CUSTSVC_CC"
	filter_defs$[1,1]="='Y'"
	filter_defs$[1,2]="LOCK"

	dim search_defs$[3]

	call stbl("+DIR_SYP")+"bax_query.bbj",
:		gui_dev,
:		Form!,
:		"AR_CREDIT_CODES",
:		"",
:		table_chans$[all],
:		selected_keys$,
:		filter_defs$[all],
:		search_defs$[all],
:		"",
:		""

	if selected_keys$<>""
		call stbl("+DIR_SYP")+"bac_key_template.bbj",
:			"ARC_CASHCODE",
:			"PRIMARY",
:			apc_cashcode_key$,
:			table_chans$[all],
:			status$
		dim apc_cashcode_key$:apc_cashcode_key$
		apc_cashcode_key$=selected_keys$
		callpoint!.setColumnData("ARE_CCPMT.CASH_REC_CD",apc_cashcode_key.cash_rec_cd$,1)
	endif

	callpoint!.setDevObject("cash_rec_cd",selected_keys$)
	callpoint!.setStatus("ACTIVATE-ABORT")

[[ARE_CCPMT.ZIP_CODE.AVAL]]
gosub reset_timer
[[ARE_CCPMT.YEAR.AINV]]
gosub reset_timer
[[ARE_CCPMT.STATE_CODE.AVAL]]
gosub reset_timer
[[ARE_CCPMT.SECURITY_CD.AVAL]]
gosub reset_timer
[[ARE_CCPMT.PHONE_NO.AVAL]]
gosub reset_timer
[[ARE_CCPMT.NAME_LAST.AVAL]]
gosub reset_timer
[[ARE_CCPMT.NAME_FIRST.AVAL]]
gosub reset_timer
[[ARE_CCPMT.MONTH.AVAL]]
rem --- validate month

	month$=cvs(callpoint!.getUserInput(),3)

	if month$<>""
		if num(month$)<1 or num(month$)>12 then callpoint!.setStatus("ABORT")
	endif

	gosub reset_timer
[[ARE_CCPMT.EMAIL_ADDR.AVAL]]
gosub reset_timer
[[ARE_CCPMT.CNTRY_ID.AVAL]]
gosub reset_timer
[[ARE_CCPMT.ADDRESS_LINE_2.AVAL]]
gosub reset_timer
[[ARE_CCPMT.ADDRESS_LINE_1.AVAL]]
gosub reset_timer
[[ARE_CCPMT.BEND]]
rem --- if vectInvoices! contains any selected items, get confirmation that user really wants to exit

	vectInvoices!=callpoint!.getDevObject("vectInvoices")
	grid_cols = num(callpoint!.getDevObject("grid_cols"))
	selected=0
	if vectInvoices!.size()
		for wk=0 to vectInvoices!.size()-1 step grid_cols
			selected=selected+iff(vectInvoices!.get(wk)="Y",1,0)
		next wk
	endif

	if selected
		msg_id$="GENERIC_WARN_CANCEL"
		dim msg_tokens$[1]
		msg_tokens$[0]="Exit without processing this payment?"+$0A$+"Select OK to exit, or Cancel to return to the form."
		gosub disp_message
		if msg_opt$<>"O" then callpoint!.setStatus("ABORT")
	endif
[[ARE_CCPMT.AREC]]

[[ARE_CCPMT.CARD_NO.AVAL]]
rem ==============================================
rem -- mod10_check; see if card number field contains valid cc# format
rem ==============================================

	cc_digits$ = ""
	cc_curr_digit = 0
	cc_card$=callpoint!.getUserInput()

	if cvs(cc_card$,3)<>""
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
	endif

	gosub reset_timer
[[ARE_CCPMT.ASVA]]
rem --- if using J2Pay (interface_tp$='A'), check for mandatory data, confirm, then process

	interface_tp$=callpoint!.getDevObject("interface_tp")
	if interface_tp$="A"
		if cvs(callpoint!.getColumnData("ARE_CCPMT.ADDRESS_LINE_1"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.CARD_NO"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.CITY"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.CNTRY_ID"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.CUSTOMER_ID"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.EMAIL_ADDR"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.FIRM_ID"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.MONTH"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.NAME_FIRST"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.NAME_LAST"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.PHONE_NO"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.SECURITY_CD"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.STATE_CODE"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.YEAR"),3)="" or
:			cvs(callpoint!.getColumnData("ARE_CCPMT.ZIP_CODE"),3)="" or
:			num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT"))=0

			dim msg_tokens$[1]
			msg_tokens$[0]=Translate!.getTranslation("AON_PLEASE_FILL_IN_ALL_REQUIRED_FIELDS")
			msg_id$="GENERIC_WARN"
			gosub disp_message
			callpoint!.setStatus("ABORT-ACTIVATE")
			break
		endif

		curr$=date(0:"%Yd%Mz")
		if curr$>callpoint!.getColumnData("ARE_CCPMT.YEAR")+callpoint!.getColumnData("ARE_CCPMT.MONTH")
			dim msg_tokens$[1]
			msg_tokens$[0]=Translate!.getTranslation("AON_ACCORDING_TO_MONTH_AND_YEAR_ENTERED_THIS_CARD_HAS_EXPIRED")
			msg_id$="GENERIC_WARN"
			gosub disp_message
			callpoint!.setStatus("ABORT-ACTIVATE")
			break
		endif

		msg_id$="CONF_CC_PAYMENT"
		msg_opt$=""
		dim msg_tokens$[1]
		msg_tokens$[0]=cvs(str(num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT")):callpoint!.getDevObject("ar_a_mask")),3)
		gosub disp_message
		if msg_opt$<>"Y" then callpoint!.setStatus("ABORT-ACTIVATE")
		
		art_resphdr=fnget_dev("ART_RESPHDR")
		art_respdet=fnget_dev("ART_RESPDET")
		are_cashhdr=fnget_dev("ARE_CASHHDR")
		are_cashdet=fnget_dev("ARE_CASHDET")
		are_cashbal=fnget_dev("ARE_CASHBAL")
		ars_cc_custsvc=fnget_dev("ARS_CC_CUSTSVC")
		arc_gatewaydet=fnget_dev("ARC_GATEWAYDET")

		dim art_resphdr$:fnget_tpl$("ART_RESPHDR")
		dim art_respdet$:fnget_tpl$("ART_RESPDET")
		dim are_cashhdr$:fnget_tpl$("ARE_CASHHDR")
		dim are_cashdet$:fnget_tpl$("ARE_CASHDET")
		dim are_cashbal$:fnget_tpl$("ARE_CASHBAL")
		dim ars_cc_custsvc$:fnget_tpl$("ARS_CC_CUSTSVC")
		dim arc_gatewaydet$:fnget_tpl$("ARC_GATEWAYDET")

		encryptor! = new Encryptor()
		config_id$ = "GATEWAY_AUTH"
		encryptor!.setConfiguration(config_id$)

		readrecord(ars_cc_custsvc,key=firm_id$+callpoint!.getColumnData("ARE_CCPMT.CASH_REC_CD"),dom=std_missing_params)ars_cc_custsvc$
		gateway$=ars_cc_custsvc.gateway_id$

		vectInvoices!=callpoint!.getDevObject("vectInvoices")
		apply_amt!=cast(BBjNumber, num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT")))
		cust_id$=callpoint!.getColumnData("ARE_CCPMT.CUSTOMER_ID")

		rem --- Use J2Pay library
		gw! = new GatewayFactory()
		apiSampleParameters! = new JSONObject()
	
		gateway! = gw!.getGateway(AvailableGateways.valueOf(cvs(gateway$,3)))
		apiSampleParameters! = gateway!.getApiSampleParameters()
		paramKeys! = apiSampleParameters!.keys()

		while paramKeys!.hasNext()
			gw_attrib$=paramKeys!.next()
			read record (arc_gatewaydet,key=firm_id$+gateway$+pad(gw_attrib$,len(arc_gatewaydet.config_attr$)),knum="AO_ATTRIBUTE",err=std_missing_params)arc_gatewaydet$
			apiSampleParameters!.put(gw_attrib$,encryptor!.decryptData(cvs(arc_gatewaydet.config_value$,3)))
		wend
		redim arc_gatewaydet$
		readrecord (arc_gatewaydet,key=firm_id$+gateway$+pad("ip",len(arc_gatewaydet.config_attr$)),knum="AO_ATTRIBUTE",err=*next)arc_gatewaydet$
		if cvs(arc_gatewaydet.config_value$,3)=""
			ip$="127.0.0.1"
		else
			ip$=encryptor!.decryptData(cvs(arc_gatewaydet.config_value$,3))
		endif
		readrecord(arc_gatewaydet,key=firm_id$+gateway$+pad("testMode",len(arc_gatewaydet.config_attr$)),knum="AO_ATTRIBUTE",err=*next)arc_gatewaydet$
		gateway!.setTestMode(Boolean.valueOf(encryptor!.decryptData(cvs(arc_gatewaydet.config_value$,3))))

		customer! = new Customer()
		customer!.setFirstName(cvs(callpoint!.getColumnData("ARE_CCPMT.NAME_FIRST"),3))
		customer!.setLastName(cvs(callpoint!.getColumnData("ARE_CCPMT.NAME_LAST"),3))
		customer!.setCountry(Country.valueOf(cvs(callpoint!.getColumnData("ARE_CCPMT.CNTRY_ID"),3)))
		customer!.setState(cvs(callpoint!.getColumnData("ARE_CCPMT.STATE_CODE"),3))
		customer!.setCity(cvs(callpoint!.getColumnData("ARE_CCPMT.CITY"),3))
		customer!.setAddress(cvs(callpoint!.getColumnData("ARE_CCPMT.ADDRESS_LINE_1"),3)+" "+cvs(callpoint!.getColumnData("ARE_CCPMT.ADDRESS_LINE_2"),3))
		customer!.setZip(cvs(callpoint!.getColumnData("ARE_CCPMT.ZIP_CODE"),3))
		customer!.setPhoneNumber(cvs(callpoint!.getColumnData("ARE_CCPMT.PHONE_NO"),3))
		customer!.setEmail(cvs(callpoint!.getColumnData("ARE_CCPMT.EMAIL_ADDR"),3))
		customer!.setIp(ip$);rem --- only required by BillPro

		customerCard! = new CustomerCard()
		customerCard!.setName(cvs(callpoint!.getColumnData("ARE_CCPMT.NAME_FIRST"),3)+" "+cvs(callpoint!.getColumnData("ARE_CCPMT.NAME_LAST"),3))
		customerCard!.setNumber(cvs(callpoint!.getColumnData("ARE_CCPMT.CARD_NO"),3))
		customerCard!.setCvv(cvs(callpoint!.getColumnData("ARE_CCPMT.SECURITY_CD"),3))
		customerCard!.setExpiryMonth(cvs(callpoint!.getColumnData("ARE_CCPMT.MONTH"),3))
		customerCard!.setExpiryYear(cvs(callpoint!.getColumnData("ARE_CCPMT.YEAR"),3))

		callpoint!.setColumnData("ARE_CCPMT.NAME_FIRST","",1)
		callpoint!.setColumnData("ARE_CCPMT.NAME_LAST","",1)
		callpoint!.setColumnData("ARE_CCPMT.CARD_NO","",1)
		callpoint!.setColumnData("ARE_CCPMT.SECURITY_CD","",1)
		callpoint!.setColumnData("ARE_CCPMT.MONTH","",1)
		callpoint!.setColumnData("ARE_CCPMT.YEAR","",1)

		response! = new HTTPResponse()
		response! = gateway!.purchase(apiSampleParameters!, customer!, customerCard!, Currency.USD, apply_amt!.floatValue())
 
		rem --- process returned response
		trans_id$=""
		trans_msg$=Translate!.getTranslation("AON_NO_RESPONSE","No response received. Transaction not processed.",1)
		cash_msg$=""

		full_response!=response!.getJSONResponse()
		if full_response!<>null()
			trans_id$=full_response!.get("lr").get("transactionId",err=*next)
			trans_msg$=full_response!.get("lr").get("message")

			rem --- if transaction was approved, create cash receipt
			if response!.isSuccessful()
				gosub create_cash_receipt
			endif

			rem --- write response text to art_response
			if trans_id$<>""
				response_text$=full_response!.toString()
				trans_amount$=str(full_response!.get("lr").get("amount",err=*next))
				trans_approved$=iff(response!.isSuccessful(),"A","D");rem A=approved, D=declined
				if trans_approved$="D" and trans_amount$="" then trans_amount$=str(apply_amt!);rem use amount we submitted if it isn't in the return response
				gosub write_to_response_log
			endif
		endif

		dim msg_tokens$[1]
		msg_tokens$[0]=trans_msg$+$0A$+cash_msg$
		msg_id$="GENERIC_OK"
		gosub disp_message
		callpoint!.setStatus("EXIT")
else
	escape; rem hosted goes here
endif


		
[[ARE_CCPMT.ACUS]]
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
			curr_row = dec(notice.row$)
			curr_col = dec(notice.col$)
		endif
		switch notice.code
			case 12;rem grid_key_press
				if notice.wparam=32 gosub switch_value
			break
			case 14;rem grid_mouse_up
				if notice.col=0 gosub switch_value
			break
			case 7;rem edit stop
				if curr_col = num(callpoint!.getDevObject("pay_col")) then
					vectInvoices!=callpoint!.getDevObject("vectInvoices")
					openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
					grid_cols = num(callpoint!.getDevObject("grid_cols"))
					inv_bal_col=num(callpoint!.getDevObject("inv_bal_col"))
					disc_col=num(callpoint!.getDevObject("disc_col"))
					pay_col=num(callpoint!.getDevObject("pay_col"))
					oa_inv$=callpoint!.getDevObject("oa_inv")
					tot_pay=num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT"))
					vect_pay_amt=num(vectInvoices!.get(curr_row*grid_cols+pay_col))
					grid_pay_amt = num(openInvoicesGrid!.getCellText(curr_row,pay_col))
					if grid_pay_amt<0 then grid_pay_amt=0
					if grid_pay_amt>num(vectInvoices!.get(curr_row*grid_cols+inv_bal_col))-num(vectInvoices!.get(curr_row*grid_cols+disc_col)) and vectInvoices!.get(curr_row*grid_cols+1)<>oa_inv$
						grid_pay_amt=num(vectInvoices!.get(curr_row*grid_cols+inv_bal_col))-num(vectInvoices!.get(curr_row*grid_cols+disc_col)) 
					endif
					tot_pay=tot_pay-vect_pay_amt+grid_pay_amt
					vectInvoices!.set(curr_row*grid_cols+pay_col,str(grid_pay_amt))
					openInvoicesGrid!.setCellText(curr_row,pay_col,str(grid_pay_amt))
					callpoint!.setColumnData("<<DISPLAY>>.APPLY_AMT",str(tot_pay),1)
					if grid_pay_amt>0
						vectInvoices!.set(curr_row*grid_cols,"Y")
						openInvoicesGrid!.setCellState(curr_row,0,1)
					else
						vectInvoices!.set(curr_row*grid_cols,"")
						openInvoicesGrid!.setCellState(curr_row,0,0)
					endif
					gosub reset_timer
				endif
			break
			case 8;rem edit start
				grid_cols = num(callpoint!.getDevObject("grid_cols"))
				comment_col=grid_cols-1
 				if curr_col=comment_col
					vectInvoices!=callpoint!.getDevObject("vectInvoices")
					openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
					disp_text$=openInvoicesGrid!.getCellText(clicked_row,comment_col)
					sv_disp_text$=disp_text$

					editable$="YES"
					force_loc$="NO"
					baseWin!=null()
					startx=0
					starty=0
					shrinkwrap$="NO"
					html$="NO"
					dialog_result$=""
					spellcheck=1

					call stbl("+DIR_SYP")+ "bax_display_text.bbj",
:						"Cash Receipts Detail Comments",
:						disp_text$, 
:						table_chans$[all], 
:						editable$, 
:						force_loc$, 
:						baseWin!, 
:						startx, 
:						starty, 
:						shrinkwrap$, 
:						html$, 
:						dialog_result$,
:						spellcheck

					if disp_text$<>sv_disp_text$
						openInvoicesGrid!.setCellText(curr_row,comment_col,disp_text$)
						vectInvoices!.setItem(curr_row*grid_cols+comment_col,disp_text$)
					endif

					callpoint!.setStatus("ACTIVATE")
				endif
			break
			case default
			break
		swend
	endif
	if gui_event.code$="T" and gui_event.y=10000
		BBjAPI().removeTimer(10000)
		callpoint!.setStatus("EXIT")
	endif
[[ARE_CCPMT.ASIZ]]
rem --- Resize grids
	formHeight=Form!.getHeight()
	formWidth=Form!.getWidth()
	openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
	gridYpos=openInvoicesGrid!.getY()
	gridXpos=openInvoicesGrid!.getX()
	availableHeight=formHeight-gridYpos

	openInvoicesGrid!.setSize(formWidth-2*gridXpos,availableHeight-8)
	openInvoicesGrid!.setFitToGrid(1)
[[ARE_CCPMT.AWIN]]
rem --- Declare classes used

	use java.util.Iterator
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

	use ::ado_util.src::util	
	use ::sys/prog/bao_encryptor.bbj::Encryptor

rem --- Set timer for form - closes after 2 minutes *regardless* of active/inactive
	timer_key!=10000
	BBjAPI().createTimer(timer_key!,120,"custom_event")

rem --- get/store mask
	call stbl("+DIR_PGM")+"adc_getmask.aon","","AR","A","",ar_a_mask$,0,0
	callpoint!.setDevObject("ar_a_mask",ar_a_mask$)

rem --- Open files

num_files=8
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ART_INVHDR",open_opts$[1]="OTA"
open_tables$[2]="ART_RESPHDR",open_opts$[2]="OTA"
open_tables$[3]="ART_RESPDET",open_opts$[3]="OTA"	
open_tables$[4]="ARE_CASHHDR",open_opts$[4]="OTA"
open_tables$[5]="ARE_CASHDET",open_opts$[5]="OTA"
open_tables$[6]="ARE_CASHBAL",open_opts$[6]="OTA"
open_tables$[7]="ARS_CC_CUSTSVC",open_opts$[7]="OTA"
open_tables$[8]="ARC_GATEWAYDET",open_opts$[8]="OTA"

gosub open_tables


rem --- Add open invoice grid to form
	nxt_ctlID = util.getNextControlID()
	tmpCtl!=callpoint!.getControl("ARE_CCPMT.EMAIL_ADDR")
	grid_y=tmpCtl!.getY()+tmpCtl!.getHeight()+5
	openInvoicesGrid! = Form!.addGrid(nxt_ctlID,5,grid_y,895,125); rem --- ID, x, y, width, height
	callpoint!.setDevObject("openInvoicesGrid",openInvoicesGrid!)
	callpoint!.setDevObject("openInvoicesGridId",str(nxt_ctlID))
	callpoint!.setDevObject("grid_cols","10")
	callpoint!.setDevObject("grid_rows","10")
	callpoint!.setDevObject("inv_bal_col","5")
	callpoint!.setDevObject("disc_col","6")
	callpoint!.setDevObject("pay_col","8")
	callpoint!.setDevObject("interface_tp","")

	gosub format_grid

	openInvoicesGrid!.setTabAction(SysGUI!.GRID_NAVIGATE_GRID)
	openInvoicesGrid!.setTabActionSkipsNonEditableCells(1)
	openInvoicesGrid!.setColumnEditable(8,1)
	openInvoicesGrid!.setColumnEditable(9,1)

rem --- Reset window size
	util.resizeWindow(Form!, SysGui!)

rem --- set callbacks - processed in ACUS callpoint
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_KEY_PRESS,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_MOUSE_UP,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_EDIT_STOP,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_EDIT_START,"custom_event")
[[ARE_CCPMT.<CUSTOM>]]
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
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="INVOICE_DATE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_INVOICE_DATE")
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="5"
	attr_grid_col$[column_no,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="DUE_DATE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_DUE_DATE")
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="5"
	attr_grid_col$[column_no,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

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

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="AVAIL_DISC"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_AVAIL_DISC")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="DISC_DATE"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_DISC_DATE")
	attr_grid_col$[column_no,fnstr_pos("CTYP",attr_def_col_str$[0,0],5)]="5"
	attr_grid_col$[column_no,fnstr_pos("STYP",attr_def_col_str$[0,0],5)]="1"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="10"

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="PAY_AMOUNT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_PAYMENT_AMT")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="COMMENT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_COMMENTS")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="C"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="100"

	for curr_attr=1 to grid_cols
		attr_grid_col$[0,1] = attr_grid_col$[0,1] + 
:			pad("ARE_CCPMT." + attr_grid_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
	next curr_attr

	attr_disp_col$=attr_grid_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,openInvoicesGrid!,"COLH-LINES-LIGHT-AUTO-SIZEC-MULTI-DATES-CHECKS",grid_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_grid_col$[all]

	return

rem ==========================================================================
get_open_invoices: rem --- create vector of unpaid invoices this customer, taking into account anything entered but not yet posted
rem ==========================================================================

	art_invhdr=fnget_dev("ART_INVHDR")
	dim art_invhdr$:fnget_tpl$("ART_INVHDR")
	are_cashbal=fnget_dev("ARE_CASHBAL")
	dim are_cashbal$:fnget_tpl$("ARE_CASHBAL")

	cust_id$=callpoint!.getColumnData("ARE_CCPMT.CUSTOMER_ID")
	ar_type$=art_invhdr.ar_type$;rem --- ar_type always '  '

	vectInvoices!=BBjAPI().makeVector()
	oa_inv$="OA"+stbl("+SYSTEM_DATE")(4)
	callpoint!.setDevObject("oa_inv",oa_inv$)
	oa_flag=0

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
		read record(are_cashbal,key=firm_id$+ar_type$+are_cashbal.reserved_str$+cust_id$+art_invhdr.ar_inv_no$,dom=*next)are_cashbal$
		if arc_cashcode.disc_flag$="Y" then disc_amt=disc_amt-num(are_cashbal.discount_amt$)
		inv_bal=inv_bal-num(are_cashbal.apply_amt$)-num(are_cashbal.discount_amt$)

		if art_invhdr.invoice_bal=0 then continue
		vectInvoices!.add("")
		vectInvoices!.add(art_invhdr.ar_inv_no$)
		vectInvoices!.add(date(jul(art_invhdr.invoice_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(date(jul(art_invhdr.inv_due_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(art_invhdr.invoice_amt$)
		vectInvoices!.add(str(inv_bal))
		vectInvoices!.add(str(disc_amt))
		vectInvoices!.add(date(jul(art_invhdr.disc_date$,"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(".00")
		vectInvoices!.add(art_invhdr.memo_1024$)
		if art_invhdr.ar_inv_no$=oa_inv$ then oa_flag=1
	wend
	rem --- add final row (if need-be) to accommodate on-account payment (e.g., taking a deposit or pre-payment)
	if !oa_flag
		vectInvoices!.add("")
		vectInvoices!.add(oa_inv$)
		vectInvoices!.add(date(jul(stbl("+SYSTEM_DATE"),"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(date(jul(stbl("+SYSTEM_DATE"),"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(".00")
		vectInvoices!.add(".00")
		vectInvoices!.add(".00")
		vectInvoices!.add(date(jul(stbl("+SYSTEM_DATE"),"%Yd%Mz%Dz"):stbl("+DATE_GRID")))
		vectInvoices!.add(".00")
		vectInvoices!.add("")
	endif

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
	TempRows!=openInvoicesGrid!.getSelectedRows()
	tot_pay=num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT"))

	if TempRows!.size()>0
		for curr_row=1 to TempRows!.size()
			if openInvoicesGrid!.getCellState(TempRows!.getItem(curr_row-1),0)=0
				openInvoicesGrid!.setCellState(TempRows!.getItem(curr_row-1),0,1)
				inv_bal=num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+inv_bal_col))-num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+disc_col))
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"Y")
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+pay_col,str(inv_bal))
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),pay_col,str(inv_bal))
				tot_pay=tot_pay+inv_bal
			else
				openInvoicesGrid!.setCellState(num(TempRows!.getItem(curr_row-1)),0,0)
				grid_pay_amt=num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+pay_col))
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"")
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+pay_col,"0")
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),pay_col,"0")
				tot_pay=tot_pay-grid_pay_amt
			endif
		next curr_row
	endif

	callpoint!.setColumnData("<<DISPLAY>>.APPLY_AMT",str(tot_pay),1)

	if info(3,6)<>"5" then SysGUI!.setRepaintEnabled(1)

	gosub reset_timer

	return

rem ==========================================================================
create_cash_receipt:
rem --- in: firm_id$, cust_id$, apply_amt!, trans_id$, vectInvoices!
rem ==========================================================================

    rem --- write are_cashhdr
    rem --- TODO CAH need to read/update, not just create, as >1 payment could have been made so header already exists
    rem --- TODO CAH same for are_cashbal/are_cashdet, don't just create them
    rem --- TODO CAH also need to add logic to use deposit_ID and batch_no, and update ars_cc_custsvc with same
    rem --- TODO CAH if there is already an are_cashdet for this invoice with balance < pay amount, apply on account
	
	deposit_id$=""
	batch_no$="0000000"

	are_cashhdr$.firm_id$=firm_id$
	are_cashhdr.receipt_date$=stbl("+SYSTEM_DATE")
	are_cashhdr.customer_id$=cust_id$
	are_cashhdr.cash_rec_cd$="C"
	are_cashhdr.payment_amt=apply_amt!
	are_cashhdr.batch_no$=batch_no$
	are_cashhdr.deposit_id$=deposit_id$
	are_cashhdr.memo_1024$=$01$
	are_cashhdr$=field(are_cashhdr$)
	writerecord(are_cashhdr)are_cashhdr$

	rem --- now write are_cashdet and are_cashbal recs for each invoice in vectInvoices!
	for inv_row=0 to vectInvoices!.size()-1 step num(callpoint!.getDevObject("grid_cols"))
		pay_flag$=vectInvoices!.get(inv_row)
		if pay_flag$="Y"
			ar_inv_no$=vectInvoices!.get(inv_row+1)
			invoice_bal$=vectInvoices!.get(inv_row+num(callpoint!.getDevObject("inv_bal_col")))
			invoice_pay$=vectInvoices!.get(inv_row+num(callpoint!.getDevObject("pay_col")))
            
			redim are_cashdet$
			redim are_cashbal$

			are_cashdet.firm_id$=firm_id$
			are_cashdet.receipt_date$=are_cashhdr.receipt_date$
			are_cashdet.customer_id$=are_cashhdr.customer_id$
			are_cashdet.cash_rec_cd$=are_cashhdr.cash_rec_cd$
			are_cashdet.ar_inv_no$=ar_inv_no$
			are_cashdet.apply_amt$=invoice_pay$
			are_cashdet.batch_no$=are_cashhdr.batch_no$
			are_cashdet.memo_1024$=$01$
			are_cashdet.firm_id$=field(are_cashdet$)
			writerecord(are_cashdet)are_cashdet$

			are_cashbal.firm_id$=firm_id$
			are_cashbal.customer_id$=are_cashhdr.customer_id$
			are_cashbal.ar_inv_no$=ar_inv_no$
			are_cashbal.apply_amt$=invoice_pay$
			are_cashbal$=field(are_cashbal$)
			writerecord(are_cashbal)are_cashbal$

		endif
	next inv_row
	cash_msg$=Translate!.getTranslation("AON_CASH_RECEIPT_HAS_BEEN_ENTERED","Cash Receipt has been entered.")
    
	return

rem ==========================================================================
write_to_response_log:rem --- write to art_resphdr/det
rem --- in: firm_id$, cust_id$, trans_id$, response_text$, vectInvoices!
rem ==========================================================================

	art_resphdr.firm_id$=firm_id$
	art_resphdr.customer_id$=cust_id$
	art_resphdr.transaction_id$=trans_id$
	art_resphdr.gateway_id$=gateway$
	art_resphdr.amount$=trans_amount$
	art_resphdr.approve_decline$=trans_approved$
	art_resphdr.response_text$=response_text$
	art_resphdr.created_user$=sysinfo.user_id$
	art_resphdr.created_date$=date(0:"%Yd%Mz%Dz")
	art_resphdr.created_time$=date(0:"%Hz%mz")
	art_resphdr.deposit_id$=deposit_id$
	art_resphdr.batch_no$=batch_no$
	art_resphdr$=field(art_resphdr$)
	writerecord(art_resphdr)art_resphdr$

	next_seq=1
	seq_mask$=fill(len(art_respdet.sequence_no$),"0")
	
	for inv_row=0 to vectInvoices!.size()-1 step num(callpoint!.getDevObject("grid_cols"))
		pay_flag$=vectInvoices!.get(inv_row)
		invoice_pay$=vectInvoices!.get(inv_row+num(callpoint!.getDevObject("pay_col")))
		if pay_flag$="Y"
			ar_inv_no$=vectInvoices!.get(inv_row+1)
			redim art_respdet$
			art_respdet.firm_id$=firm_id$
			art_respdet.customer_id$=cust_id$
			art_respdet.transaction_id$=trans_id$
			art_respdet.sequence_no$=str(next_seq:seq_mask$)
			art_respdet.ar_inv_no$=ar_inv_no$;rem actual invoice selected or OAymmdd
			art_respdet.order_no$="";rem for future use by OP
			art_respdet.apply_amt$=invoice_pay$
			art_respdet$=field(art_respdet$)
			writerecord(art_respdet)art_respdet$
			next_seq=next_seq+1
		endif
	next inv_row

	return

rem ==========================================================================
reset_timer: rem --- reset timer for another 10 seconds from each AVAL, or from grid switch_value
rem ==========================================================================

rem --- Set timer for form - closes after 2 minutes *regardless* of active/inactive
	timer_key!=10000
	BBjAPI().removeTimer(10000)
	BBjAPI().createTimer(timer_key!,60,"custom_event")

	return

#include std_missing_params.src
