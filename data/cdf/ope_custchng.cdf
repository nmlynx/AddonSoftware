[[OPE_CUSTCHNG.AREC]]
rem --- Initialize "current" fields
	curr_customer_id$=callpoint!.getColumnData("OPE_CUSTCHNG.CURR_CUSTOMER_ID")
	armCustMast=fnget_dev("ARM_CUSTMAST")
	dim armCustMast$:fnget_tpl$("ARM_CUSTMAST")
	findrecord(armCustMast,key=firm_id$+curr_customer_id$,err=*next)armCustMast$

	callpoint!.setColumnData("OPE_CUSTCHNG.CURR_ADDR_LINE_1",armCustMast.addr_line_1$)
	callpoint!.setColumnData("OPE_CUSTCHNG.CURR_ADDR_LINE_2",armCustMast.addr_line_2$)
	callpoint!.setColumnData("OPE_CUSTCHNG.CURR_ADDR_LINE_3",armCustMast.addr_line_3$)
	callpoint!.setColumnData("OPE_CUSTCHNG.CURR_ADDR_LINE_4",armCustMast.addr_line_4$)
	callpoint!.setColumnData("OPE_CUSTCHNG.CURR_CITY",armCustMast.city$)
	callpoint!.setColumnData("OPE_CUSTCHNG.CURR_STATE_CODE",armCustMast.state_code$)

[[OPE_CUSTCHNG.ARER]]
rem --- Do NOT allow changing the customer if an invoice exists for the order
	abort=0
	curr_customer_id$=callpoint!.getColumnData("OPE_CUSTCHNG.CURR_CUSTOMER_ID")
	order_no$=callpoint!.getColumnData("OPE_CUSTCHNG.ORDER_NO")
	opeOrdHdr=fnget_dev("@OPE_ORDHDR")
	dim opeOrdHdr$:fnget_tpl$("@OPE_ORDHDR")
	trip_key$=firm_id$+opeOrdHdr.ar_type$+curr_customer_id$+order_no$
	read(opeOrdHdr,key=trip_key$,knum="PRIMARY",dom=*next)
	while 1
		this_key$=key(opeOrdHdr,end=*break)
		if pos(trip_key$=this_key$)<>1 then break
		readrecord(opeOrdHdr)opeOrdHdr$
		if cvs(opeOrdHdr.ar_inv_no$,2)<>"" then
			msg_id$="OP_INV_EXISTS"
			gosub disp_message
			callpoint!.setDevObject("customerChange_status","Cancel")
			callpoint!.setStatus("EXIT")
			abort=1
			break
		endif
	wend
	if abort then break

rem --- Warn if Order Acknowledgement has already been sent
	opeOrdHdr_key$=firm_id$+"E"+opeOrdHdr.ar_type$+curr_customer_id$+order_no$+opeOrdHdr.ar_inv_no$
	findrecord(opeOrdHdr,key=opeOrdHdr_key$,knum="AO_STATUS",dom=*next)opeOrdHdr$
	if opeOrdHdr.ord_conf_printed$="Y" then
		msg_id$="OP_ACK_SENT"
		gosub disp_message
		if msg_opt$<>"Y" then
			callpoint!.setDevObject("customerChange_status","Cancel")
			callpoint!.setStatus("EXIT")
			break
		endif
	endif

rem --- Warn if Picking List has already been printed
	if opeOrdHdr.print_status$="Y" then
		msg_id$="OP_PICKLIST_PRNTD"
		gosub disp_message
		if msg_opt$<>"Y" then
			callpoint!.setDevObject("customerChange_status","Cancel")
			callpoint!.setStatus("EXIT")
			break
		endif
	endif

[[OPE_CUSTCHNG.ASVA]]
rem --- Capture if item prices and order Discount Amount are to be recalculated
	callpoint!.setDevObject("recalcPriceDiscAmt",callpoint!.getColumnData("OPE_CUSTCHNG.RECALCULATE"))

rem --- Capture the new customer_id to use
	callpoint!.setDevObject("newCustomerId",callpoint!.getColumnData("OPE_CUSTCHNG.NEW_CUSTOMER_ID"))

[[OPE_CUSTCHNG.BEND]]
rem --- Set form exit status for Cancel
	callpoint!.setDevObject("customerChange_status","Cancel")

[[OPE_CUSTCHNG.BSHO]]
rem --- Set form's default exit status for OK
	callpoint!.setDevObject("customerChange_status","OK")

rem --- Open needed files
	num_files=3
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARM_CUSTMAST",  open_opts$[1]="OTA"
	open_tables$[2]="OPS_PARAMS",  open_opts$[2]="OTA"
	open_tables$[3]="OPE_ORDHDR",  open_opts$[3]="@OTA"

	gosub open_tables

        
	opsParams=num(open_chans$[2]); dim opsParams$:open_tpls$[2]

 rem --- Get needed OP params
	readrecord(opsParams,key=firm_id$+"AR00")opsParams$
	callpoint!.setDevObject("allow_cash_sale",opsParams.cash_sale$)
	callpoint!.setDevObject("cash_customer",opsParams.customer_id$)

[[OPE_CUSTCHNG.NEW_CUSTOMER_ID.AVAL]]
rem --- Don't allow using inactive customer
	new_customer_id$=callpoint!.getUserInput()
	armCustMast=fnget_dev("ARM_CUSTMAST")
	dim armCustMast$:fnget_tpl$("ARM_CUSTMAST")
	findrecord(armCustMast,key=firm_id$+new_customer_id$,err=*next)armCustMast$
	if armCustMast.cust_inactive$="Y" then
		call stbl("+DIR_PGM")+"adc_getmask.aon","CUSTOMER_ID","","","",m0$,0,customer_size
		msg_id$="AR_CUST_INACTIVE"
		dim msg_tokens$[2]
	   	msg_tokens$[1]=fnmask$(armCustMast.customer_id$(1,customer_size),m0$)
		msg_tokens$[2]=cvs(armCustMast.customer_name$,2)
		gosub disp_message
		callpoint!.setStatus("ACTIVATE-ABORT")
		break
	endif

rem --- Don't allow new customer to be the same as current customer
	if new_customer_id$=callpoint!.getColumnData("OPE_CUSTCHNG.CURR_CUSTOMER_ID") then
		msg_id$="OP_SAME_CUST"
		gosub disp_message
		callpoint!.setStatus("ACTIVATE-ABORT")
		break
	endif

rem --- Do NOT allow new customer to be the "cash customer"
	if callpoint!.getDevObject("allow_cash_sale")="Y" and cvs(new_customer_id$,2)=cvs(callpoint!.getDevObject("cash_customer"),2) then
		msg_id$="OP_NOT_CSH_CUST"
		gosub disp_message
		callpoint!.setStatus("ACTIVATE-ABORT")
		break
	endif

rem --- Initialize "new" fields
	callpoint!.setColumnData("OPE_CUSTCHNG.NEW_ADDR_LINE_1",armCustMast.addr_line_1$,1)
	callpoint!.setColumnData("OPE_CUSTCHNG.NEW_ADDR_LINE_2",armCustMast.addr_line_2$,1)
	callpoint!.setColumnData("OPE_CUSTCHNG.NEW_ADDR_LINE_3",armCustMast.addr_line_3$,1)
	callpoint!.setColumnData("OPE_CUSTCHNG.NEW_ADDR_LINE_4",armCustMast.addr_line_4$,1)
	callpoint!.setColumnData("OPE_CUSTCHNG.NEW_CITY",armCustMast.city$,1)
	callpoint!.setColumnData("OPE_CUSTCHNG.NEW_STATE_CODE",armCustMast.state_code$,1)

[[OPE_CUSTCHNG.<CUSTOM>]]
#include [+ADDON_LIB]std_functions.aon



