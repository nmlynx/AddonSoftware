[[ARE_CCPMT_HOST.<CUSTOM>]]
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


	column_no = column_no +1
	attr_grid_col$[column_no,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="PAY_AMOUNT"
	attr_grid_col$[column_no,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_PAYMENT_AMT")
	attr_grid_col$[column_no,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[column_no,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="20"
	attr_grid_col$[column_no,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=ar_a_mask$

	for curr_attr=1 to grid_cols
		attr_grid_col$[0,1] = attr_grid_col$[0,1] + 
:			pad("are_ccpmt_host." + attr_grid_col$[curr_attr, fnstr_pos("DVAR", attr_def_col_str$[0,0], 5)], 40)
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

	cust_id$=callpoint!.getColumnData("are_ccpmt_host.CUSTOMER_ID")
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
		vectInvoices!.add(".00")
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
				inv_bal=num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+5))
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"Y")
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+grid_cols-1,str(inv_bal))
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),grid_cols-1,str(inv_bal))
				tot_pay=tot_pay+inv_bal
			else
				openInvoicesGrid!.setCellState(num(TempRows!.getItem(curr_row-1)),0,0)
				grid_pay_amt=num(vectInvoices!.get(TempRows!.getItem(curr_row-1)*grid_cols+6))
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols,"")
				vectInvoices!.set(TempRows!.getItem(curr_row-1)*grid_cols+grid_cols-1,"0")
				openInvoicesGrid!.setCellText(TempRows!.getItem(curr_row-1),grid_cols-1,"0")
				tot_pay=tot_pay-grid_pay_amt
			endif
		next curr_row
	endif

	callpoint!.setColumnData("<<DISPLAY>>.APPLY_AMT",str(tot_pay),1)

	if info(3,6)<>"5" then SysGUI!.setRepaintEnabled(1)

	gosub reset_timer

	return

rem ==========================================================================
write_to_response_log:rem --- write to art_response
rem --- in: trans_id$, response_text$
rem ==========================================================================

	art_response=fnget_dev("ART_RESPONSE")
	dim art_response$:fnget_tpl$("ART_RESPONSE")

	cust_id$=callpoint!.getColumnData("ARE_CCPMT_HOST.CUSTOMER_ID")
	vectInvoices!=callpoint!.getDevObject("vectInvoices")
	grid_cols=num(callpoint!.getDevObject("grid_cols"))

	for inv_row=0 to vectInvoices!.size()-1 step grid_cols
		pay_flag$=vectInvoices!.get(inv_row)
		if pay_flag$="Y"
			ar_inv_no$=vectInvoices!.get(inv_row+1)
			art_response.firm_id$=firm_id$
			art_response.customer_id$=cust_id$
			art_response.ar_inv_no$=ar_inv_no$
			art_response.transaction_id$=trans_id$
			art_response.response_text$=response_text$
			art_response.created_user$=sysinfo.user_id$
			art_response.created_date$=date(0:"%Yd%Mz%Dz")
			art_response.created_time$=date(0:"%Hz%mz")
			art_response$=field(art_response$)
			writerecord(art_response)art_response$
		endif
	next inv_row

	return

rem ==========================================================================
create_cash_receipt:
rem --- in: payment_amt$, trans_id$
rem ==========================================================================

	rem --- write are_cashhdr
	rem --- TODO CAH need to read/update, not just create, as >1 payment could have been made so header already exists
	rem --- TODO CAH same for are_cashbal/are_cashdet, don't just create them
	rem --- TODO CAH also need to add logic to use deposit_ID and batch_no, and update ars_cc_custsvc with same
	rem --- TODO CAH if there is already an are_cashdet for this invoice with balance < pay amount, apply on account
	rem --- TODO CAH need to handle situation where transaction is approved, but incoming payment_amt$ <> what was accumulated in <<DISPLAY>>.APPLY_AMT 

	are_cashhdr=fnget_dev("ARE_CASHHDR")
	dim are_cashhdr$:fnget_tpl$("ARE_CASHHDR")
	are_cashdet=fnget_dev("ARE_CASHDET")
	dim are_cashdet$:fnget_tpl$("ARE_CASHDET")
	are_cashbal=fnget_dev("ARE_CASHBAL")
	dim are_cashbal$:fnget_tpl$("ARE_CASHBAL")

	are_cashhdr$.firm_id$=firm_id$
	are_cashhdr.receipt_date$=stbl("+SYSTEM_DATE")
	are_cashhdr.customer_id$=callpoint!.getColumnData("ARE_CCPMT_HOST.CUSTOMER_ID")
	are_cashhdr.cash_rec_cd$="C"
	are_cashhdr.payment_amt=num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT"))
	are_cashhdr.batch_no$="0000000"
	are_cashhdr.memo_1024$=$01$
	are_cashhdr$=field(are_cashhdr$)
	writerecord(are_cashhdr)are_cashhdr$

	rem --- now write are_cashdet and are_cashbal recs for each invoice in vectInvoices!

	vectInvoices!=callpoint!.getDevObject("vectInvoices")
	grid_cols=num(callpoint!.getDevObject("grid_cols"))

	for inv_row=0 to vectInvoices!.size()-1 step grid_cols
		pay_flag$=vectInvoices!.get(inv_row)
		if pay_flag$="Y"
			ar_inv_no$=vectInvoices!.get(inv_row+1)
			invoice_bal$=vectInvoices!.get(inv_row+5)
			invoice_pay$=vectInvoices!.get(inv_row+6)
			            
			redim are_cashdet$
			redim are_cashbal$

			are_cashdet.firm_id$=firm_id$
			are_cashdet.receipt_date$=are_cashhdr.receipt_date$
			are_cashdet.customer_id$=are_cashhdr.customer_id$
			are_cashdet.cash_rec_cd$=are_cashhdr.cash_rec_cd$
			are_cashdet.ar_inv_no$=ar_inv_no$
			are_cashdet.apply_amt$=invoice_pay$
			are_cashdet.batch_no$=are_cashhdr.batch_no$
			are_cashdet.transaction_id$=trans_id$
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
	cash_msg$="Cash Receipt has been entered.";rem --- TODO CAH needs localization

	return

rem ==========================================================================
reset_timer: rem --- reset timer for another 10 seconds from each AVAL, or from grid switch_value
rem ==========================================================================

rem --- Set timer for form - closes after 2 minutes *regardless* of active/inactive
	timer_key!=10000
	BBjAPI().removeTimer(10000)
	BBjAPI().createTimer(timer_key!,60,"custom_event")

	return

rem =====================================================================
rem --- parse PayPal response text
rem --- wkx0$=response, wkx1$=key to look for, wkx2$=delim used to separate key/value pairs

def fnparse$(wkx0$,wkx1$,wkx2$)

	wkx3$=""
	wk1=pos(wkx1$=wkx0$)
	if wk1
		wkx3$=wkx0$(wk1+len(wkx1$))
		wk2=pos(wkx2$=wkx3$)
		if wk2
			wkx3$=wkx3$(1,wk2-1)
		endif
	endif
	return wkx3$
	fnend
[[ARE_CCPMT_HOST.AWIN]]
rem --- Declare classes used

	use ::ado_util.src::util

	use ::REST/BBWebClient.bbj::BBWebClient
	use ::REST/BBWebClient.bbj::BBWebRequest
	use ::REST/BBWebClient.bbj::BBWebResponse

	use java.math.BigDecimal
	use java.math.RoundingMode
	use java.util.UUID
	use java.util.Iterator

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

	use org.json.JSONObject

rem --- Set timer for form - closes after 2 minutes *regardless* of active/inactive
	timer_key!=10000
	BBjAPI().createTimer(timer_key!,600,"custom_event")

rem --- get/store mask
	call stbl("+DIR_PGM")+"adc_getmask.aon","","AR","A","",ar_a_mask$,0,0
	callpoint!.setDevObject("ar_a_mask",ar_a_mask$)

rem --- Open files

	num_files=6
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ART_INVHDR",open_opts$[1]="OTA"
	open_tables$[2]="ART_RESPONSE",open_opts$[2]="OTA"
	open_tables$[3]="ARE_CASHHDR",open_opts$[3]="OTA"
	open_tables$[4]="ARE_CASHDET",open_opts$[4]="OTA"
	open_tables$[5]="ARE_CASHBAL",open_opts$[5]="OTA"
	open_tables$[6]="ARS_CC_CUSTSVC",open_opts$[6]="OTA"
	gosub open_tables

rem --- Add open invoice grid to form
	nxt_ctlID = util.getNextControlID()
	tmpCtl!=callpoint!.getControl("<<DISPLAY>>.APPLY_AMT")
	grid_y=tmpCtl!.getY()+tmpCtl!.getHeight()+5
	openInvoicesGrid! = Form!.addGrid(nxt_ctlID,5,grid_y,895,125); rem --- ID, x, y, width, height
	callpoint!.setDevObject("openInvoicesGrid",openInvoicesGrid!)
	callpoint!.setDevObject("openInvoicesGridId",str(nxt_ctlID))
	callpoint!.setDevObject("grid_cols","7")
	callpoint!.setDevObject("grid_rows","10")

	gosub format_grid

	openInvoicesGrid!.setTabAction(SysGUI!.GRID_NAVIGATE_GRID)
	openInvoicesGrid!.setTabActionSkipsNonEditableCells(1)
	openInvoicesGrid!.setColumnEditable(6,1)

rem --- set callbacks - processed in ACUS callpoint
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_KEY_PRESS,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_MOUSE_UP,"custom_event")
	openInvoicesGrid!.setCallback(openInvoicesGrid!.ON_GRID_EDIT_STOP,"custom_event")
[[ARE_CCPMT_HOST.ASIZ]]
rem --- Resize grids
	formHeight=Form!.getHeight()
	formWidth=Form!.getWidth()
	openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
	gridYpos=openInvoicesGrid!.getY()
	gridXpos=openInvoicesGrid!.getX()
	availableHeight=formHeight-gridYpos

	openInvoicesGrid!.setSize(formWidth-2*gridXpos,availableHeight-8)
	openInvoicesGrid!.setFitToGrid(1)
[[ARE_CCPMT_HOST.ASVA]]
rem --- check for mandatory data, confirm, then process

	apply_amt!=cast(BBjNumber, num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT")))
	masked_amt$=cvs(str(num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT")):callpoint!.getDevObject("ar_a_mask")),3)

	if apply_amt!=0
		dim msg_tokens$[1]
		msg_tokens$[0]="Please select invoices for payment."
		msg_id$="GENERIC_WARN"
		gosub disp_message
		callpoint!.setStatus("ABORT-ACTIVATE")
		break
	endif

	msg_id$="CONF_CC_PAYMENT"
	msg_opt$=""
	dim msg_tokens$[1]
	msg_tokens$[0]=masked_amt$
	gosub disp_message
	if msg_opt$<>"Y"
		callpoint!.setStatus("EXIT")
	else
		ars_cc_custsvc=fnget_dev("ARS_CC_CUSTSVC")
		dim ars_cc_custsvc$:fnget_tpl$("ARS_CC_CUSTSVC")
		readrecord(ars_cc_custsvc,key=firm_id$+"AR00",dom=*next)ars_cc_custsvc$
		gateway$=cvs(ars_cc_custsvc.gateway$,7)

		vectInvoices!=callpoint!.getDevObject("vectInvoices")
		cust_id$=callpoint!.getColumnData("ARE_CCPMT_HOST.CUSTOMER_ID")

	        rem --- using Authorize.net or PayPal hosted page (interface_tp$="H")
	        switch gateway$
			case "PAYFLOWPRO"
				rem --- get random number to send when requesting secure token
				rem --- set namespace variable using that number
				rem --- PayPal returns that number in the response, so can match number in response to number we're sending to be sure we're processing our payment and not someone else's (multi-user)
				sid!=UUID.randomUUID()
				sid$=sid!.toString()
				callpoint!.setDevObject("sid",sid$)
				ns!=BBjAPI().getNamespace("aon","credit_receipt_paypal",1)
				ns!.setValue(sid$,"init")
				ns!.setCallbackForVariableChange(sid$,"custom_event")
	           
				rem --- use BBj's REST API to send sid$ and receive back secure token
				rem --- TODO CAH the setURI(), setContent(), and browse() methods need to get info from ars_payflowpro
				client!=new BBWebClient()
				request!=new BBWebRequest()
				request!.setURI("https://pilot-payflowpro.paypal.com")
				request!.setMethod("POST") 
				request!.setContent("PARTNER=PayPal&VENDOR=AONtesting&USER=CHawkins&PWD=Titp4CH&TRXTYPE=S&AMT="+str(apply_amt!:"###,###.00")+"&CREATESECURETOKEN=Y&SECURETOKENID="+sid!.toString())
				response! = client!.sendRequest(request!) 
				content!=response!.getBody()
				response!.close()

				tokenID!=content!.substring(content!.indexOf("SECURETOKEN=")+11)
				tokenID$=tokenID!.substring(1,tokenID!.indexOf("&"))

				rem --- if successful in getting secure token, launch hosted page
				rem --- PayPal Silent Post configuration will contain return URL that runs a BBJSP servlet once payment is completed (or declined)
				rem --- servlet updates namespace variable sid$ with response text
				rem --- registered callback for variable change will cause paypal_response routine to get executed
				rem --- paypal_response will record response in art_response and post cash receipt, if applicable

				if content!.contains("RESULT=0")
					returnCode=scall("bbj "+$22$+"are_hosted.aon"+$22$+" - -gpayflowpro -t"+tokenID$+" -s"+sid$)
rem					BBjAPI().getThinClient().browse("https://pilot-payflowlink.paypal.com?SECURETOKENID="+sid!.toString()+"&SECURETOKEN="+tokenID!)
				else
					trans_msg$="Unable to acquire secure token from PayPal."
				endif
			break
			case "AUTHORIZE"
				ns!=BBjAPI().getNamespace("aon","credit_receipt_authorize",1)
				ns!.setCallbackForNamespace("custom_event")

				rem --- Create the order object to add to transaction request
				rem --- Currently filling with unique ID so we can link this auth-capture to returned response
				rem --- Authorize.net next API version should allow refID to be passed that will be returned in Webhook, obviating need for unique ID in order
				rem --- TODO CAH will need to change Environment.SANDBOX to LIVE --- when? After VAR tests? 
				rem --- TODO CAH get Name and TransactionKey from ars_authorize, along with URLs for our 'starter' payment page and confirmation pages

				sid!=UUID.randomUUID()
				sid$=sid!.toString()
				callpoint!.setDevObject("sid",sid$)
				order! = new OrderType()
				order!.setInvoiceNumber(cust_id$)
				order!.setDescription(sid$)

				ApiOperationBase.setEnvironment(Environment.SANDBOX)

				merchantAuthenticationType!  = new MerchantAuthenticationType() 
				merchantAuthenticationType!.setName("58rvyVe2Ns")
				merchantAuthenticationType!.setTransactionKey("23bm952fK8UR74FM")
				ApiOperationBase.setMerchantAuthentication(merchantAuthenticationType!)

				rem Create the payment transaction request
				txnRequest! = new TransactionRequestType()
				txnRequest!.setTransactionType(TransactionTypeEnum.AUTH_CAPTURE_TRANSACTION.value())
				txnRequest!.setAmount(new BigDecimal(apply_amt!).setScale(2, RoundingMode.CEILING))
				txnRequest!.setOrder(order!)

				setting1! = new SettingType()
				setting1!.setSettingName("hostedPaymentButtonOptions")
				setting1!.setSettingValue("{"+$22$+"text"+$22$+": "+$22$+"Pay"+$22$+"}")
                        
				setting2! = new SettingType()
				setting2!.setSettingName("hostedPaymentOrderOptions")
				setting2!.setSettingValue("{"+$22$+"show"+$22$+": false}")

				setting3! = new SettingType()
				setting3!.setSettingName("hostedPaymentReturnOptions")
				setting3!.setSettingValue("{"+$22$+"showReceipt"+$22$+": true, "+$22$+"url"+$22$+": "+$22$+"https://test.basis.com:443/dev_aon_er9410/AuthorizeConfirmation.htm"+$22$+", "+$22$+"urlText"+$22$+": "+$22$+"Continue"+$22$+"}")

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
					returnCode=scall("bbj "+$22$+"are_hosted.aon"+$22$+" - -gauthorize -t"+authResponse!.getToken()+" -a"+masked_amt$)
rem					BBjAPI().getThinClient().browse("https://test.basis.com:443/AuthorizeHostedPayment.htm?authtoken="+authResponse!.getToken())
				else
					trans_msg$="Unable to acquire secure token. Response: "+$0a$+authResponse!.getMessages().getMessage().get(0).getCode()+$0a$+authResponse!.getMessages().getMessage().get(0).getText();rem --- TODO CAH needs localization
				endif
			break
			case default
				escape;rem shouldn't get here CAH
			break
		swend
	endif
[[ARE_CCPMT_HOST.AREC]]
rem --- load up open invoices

	gosub get_open_invoices
	gosub fill_grid
[[ARE_CCPMT_HOST.BEND]]
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
[[ARE_CCPMT_HOST.ACUS]]
rem --- Process custom event -- used in this pgm to select/de-select checkboxes in grid
rem --- See basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info
rem --- This routine is executed when callbacks have been set to run a 'custom event'
rem --- Analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind
rem --- of event it is... in this case, we're toggling checkboxes on/off in form grid control

	dim gui_event$:tmpl(gui_dev)
	dim notify_base$:noticetpl(0,0)
	gui_event$=SysGUI!.getLastEventString()
	ev!=BBjAPI().getLastEvent()

	if ev!.getEventName()="BBjNamespaceEvent"
		ns_name$=ev!.getNamespaceName()
		if pos("authorize"=ns_name$)
			rem --- response (webhook) from Authorize.net
			newValue! = new JSONObject(ev!.getNewValue())
			trans_id$=newValue!.get("payload").get("id")

			ApiOperationBase.setEnvironment(Environment.SANDBOX)

			merchantAuthenticationType!  = new MerchantAuthenticationType() 
			merchantAuthenticationType!.setName("58rvyVe2Ns");rem TODO CAH get from ars_authorize
			merchantAuthenticationType!.setTransactionKey("23bm952fK8UR74FM")
			ApiOperationBase.setMerchantAuthentication(merchantAuthenticationType!)

			getRequest! = new GetTransactionDetailsRequest()
			getRequest!.setMerchantAuthentication(merchantAuthenticationType!)
			getRequest!.setTransId(trans_id$)

			controller! = new GetTransactionDetailsController(getRequest!)
			controller!.execute()
			authResponse! = controller!.getApiResponse()
			if authResponse!.getMessages().getResultCode()=MessageTypeEnum.OK
				resp_cust$=authResponse!.getTransaction().getOrder().getInvoiceNumber()
				resp_sid$=authResponse!.getTransaction().getOrder().getDescription()
				resp_code=authResponse!.getTransaction().getResponseCode()
				payment_amt$=str(authResponse!.getTransaction().getAuthAmount())
				trans_msg$=authResponse!.getMessages().getMessage().get(0).getCode()+$0a$+authResponse!.getMessages().getMessage().get(0).getText()

				rem if resp_sid$ matches callpoint!.getDevObject("sid") then this is a response to OUR payment
				rem this is a workaround until Authorize.net returns our assigned refID in the webhook response
				rem until then, don't know if this event got triggered by us, or someone else processing a credit card payment
				rem so we have to put the sid$ in something that gets returned in the full response, and get that full response
				rem instead of just using the returned webhook
				rem may want to always get full response to record in art_response, since webhook payload is abridged   
   
				if resp_sid$=callpoint!.getDevObject("sid")
					response_text$=newValue!.toString()
					gosub write_to_response_log
					if resp_code
						gosub create_cash_receipt
					else
						cash_msg$=""
					endif
				endif
			else
				escape;rem --- TODO CAH should put something in a message here about not being successful at getting the message response
			endif

		else
			rem --- response (silent post) from PayPal
			old_value$=ev!.getOldValue()
			if old_value$="init"
				new_value$=ev!.getNewValue()
				trans_id$=fnparse$(new_value$,"PNREF=","&")
				payment_amt$=str(num(fnparse$(new_value$,"AMT=","&")))
				trans_msg$=fnparse$(new_value$,"RESPMSG=","&")
				if cvs(trans_id$,3)<>""
					response_text$=new_value$
					gosub write_to_response_log
				endif
				if fnparse$(new_value$,"RESULT=","&")="0"
					gosub create_cash_receipt
				else
					cash_msg$=""
				endif
			endif
		endif
		dim msg_tokens$[1]
		msg_tokens$[0]=trans_msg$+$0A$+cash_msg$
		msg_id$="GENERIC_OK"
		gosub disp_message
		callpoint!.setStatus("EXIT")
	else
		if ev!.getEventName()="BBjTimerEvent" and gui_event.y=10000
			BBjAPI().removeTimer(10000)
			callpoint!.setStatus("EXIT")
		else
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
						if curr_col = 6 then
							vectInvoices!=callpoint!.getDevObject("vectInvoices")
							openInvoicesGrid!=callpoint!.getDevObject("openInvoicesGrid")
							grid_cols = num(callpoint!.getDevObject("grid_cols"))
							tot_pay=num(callpoint!.getColumnData("<<DISPLAY>>.APPLY_AMT"))
							vect_pay_amt=num(vectInvoices!.get(curr_row*grid_cols+grid_cols-1))
							grid_pay_amt = num(openInvoicesGrid!.getCellText(curr_row,grid_cols-1))
							if grid_pay_amt<0 then grid_pay_amt=0
							if grid_pay_amt>num(vectInvoices!.get(curr_row*grid_cols+5)) then grid_pay_amt=num(vectInvoices!.get(curr_row*grid_cols+5)) 
							tot_pay=tot_pay-vect_pay_amt+grid_pay_amt
							vectInvoices!.set(curr_row*grid_cols+6,str(grid_pay_amt))
							openInvoicesGrid!.setCellText(curr_row,grid_cols-1,str(grid_pay_amt))
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
				swend
			else
escape;rem event?
			endif
		endif
	endif
