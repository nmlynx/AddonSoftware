[[OPE_INVCASH.ARAR]]
print "OPE_INVCASH:ARAR"; rem debug

rem --- Set table_chans$[all] into util object for getDev() and getTmpl()

	declare ArrayObject tableChans!

	call stbl("+DIR_PGM")+"adc_array.aon::str_array2object", table_chans$[all], tableChans!, status
	if status = 999 then goto std_exit
	util.setTableChans(tableChans!)

rem --- Order Helper object

	declare OrderHelper ordHelp!
	ordHelp! = new OrderHelper(firm_id$, callpoint!)

rem --- Total detail lines

	cust_id$  = callpoint!.getColumnData("OPE_INVCASH.CUSTOMER_ID")
	order_no$ = callpoint!.getColumnData("OPE_INVCASH.ORDER_NO")
	print "---customer: ", cust_id$; rem debug
	print "---order_no: ", order_no$; rem debug

	ordHelp!.totalSalesDisk(cust_id$, order_no$)
	
	user_tpl.ext_price = ordHelp!.getExtPrice()
	user_tpl.taxable   = ordHelp!.getTaxable()
	user_tpl.ext_cost  = ordHelp!.getExtCost()
[[OPE_INVCASH.TENDERED_AMT.AVAL]]
rem --- Tendered enough?

	if num(callpoint!.getUserInput()) < num(callpoint!.getColumnData("OPE_INVCASH.INVOICE_AMT")) then
		msg_id$ = "OP_TENDER_MORE"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[OPE_INVCASH.EXPIRE_DATE.AVAL]]
rem --- Expiration date can't by more than today

	if callpoint!.getUserInput() > sysinfo.system_date$ then
		msg_id$="OP_CC_EXPIRED"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[OPE_INVCASH.CASH_REC_CD.AVAL]]
rem --- Validate cash receipt code

	code$ = callpoint!.getUserInput()
	file_name$ = "ARC_CASHCODE"
	dim cashcode_rec$:fnget_tpl$(file_name$)
	find record (fnget_dev(file_name$), key=firm_id$+"C"+code$) cashcode_rec$

	if pos(cashcode_rec.trans_type$="$CP")=0 then
		callpoint!.setStatus("ABORT")
		break; rem --- exit callpoint
	endif

rem --- Set customer name default

	if cvs(callpoint!.getColumnData("OPE_INVCASH.CUSTOMER_NAME"), 2) = "" then
		file_name$ = "ARM_CUSTMAST"
		dim custmast_rec$:fnget_tpl$(file_name$)
		find record (fnget_dev(file_name$), key=firm_id$+callpoint!.getColumnData("OPE_INVCASH.CUSTOMER_ID")) custmast_rec$
		callpoint!.setTableColumnAttribute("OPE_INVCASH.CUSTOMER_NAME","DFLT", custmast_rec.customer_name$)
	endif

rem --- Disable fields by trans type

	if cashcode_rec.trans_type$ <> "C" then 		
		callpoint!.setColumnEnabled("OPE_INVCASH.AR_CHECK_NO", 0)
	endif

	if cashcode_rec.trans_type$ <> "P" then 		
		callpoint!.setColumnEnabled("OPE_INVCASH.EXPIRE_DATE", 0)
	endif

	if cashcode_rec.trans_type$ = "$" then
		callpoint!.setColumnEnabled("OPE_INVCASH.PAYMENT_ID", 0)
	endif

rem --- Memo or Credit Card#?

	if cashcode_rec.trans_type$ = "C" then 
		util.changeText(Form!, "Credit Card or ABA No", "ABA No")
	else
		if cashcode_rec.trans_type$ = "P" then
			util.changeText(Form!, "Credit Card or ABA No", "Credit Card No")
		endif
	endif

rem --- Set Invoice Amount

	tax_amount   = num(callpoint!.getDevObject("tax_amount"))
	freight_amt  = num(callpoint!.getDevObject("freight_amt"))
	discount_amt = num(callpoint!.getDevObject("discount_amt"))
	invoice_amt  = user_tpl.ext_price + tax_amount - discount_amt + freight_amt

	callpoint!.setColumnData("OPE_INVCASH.INVOICE_AMT", str(invoice_amt))

rem --- Check for discount

	if discount_amt<>0 and cashcode_rec.disc_flag$<>"Y" then
		msg_id$="OP_NO_DISCOUNT"
		gosub disp_message
		callpoint!.setStauts("ABORT")
		break; rem --- exit callpoint
	endif

rem --- Set default Tendered Amount

	rem IF Y9$(21,1)="P" THEN LET Z[1]=Z[0]; GOTO 6390
	rem IF Y9$(21,1)="C" THEN IF Z[1]=0 THEN LET Z[1]=U[0]+A[0]-A[2]+A[1]

	terndered_amt = num(callpoint!.getColumnData("OPE_INVCASH.TENDERED_AMT"))

	if cashcode_rec.trans_type$ = "P" or (cashcode_rec.trans_type$ = "C" and terndered_amt = 0) then
		callpoint!.setTableColumnAttribute("OPE_INVCASH.TENDERED_AMT","DFLT", str(invoice_amt))
	endif

[[OPE_INVCASH.BSHO]]
print "OPE_INVCASH:BSHO"; rem debug

rem --- Inits

	use ::ado_util.src::util
	use ::ado_order.src::OrderHelper
	use ::adc_array.aon::ArrayObject

rem --- Open files

	num_files = 4
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	open_tables$[1]="ARM_CUSTMAST", open_opts$[1]="OTA"
	open_tables$[2]="ARC_CASHCODE", open_opts$[2]="OTA"
	open_tables$[3]="OPE_ORDHDR",   open_opts$[3]="OTA"
	open_tables$[4]="OPE_ORDDET",   open_opts$[4]="OTA"

	gosub open_tables

rem --- Global string templates

	dim user_tpl$:"ext_price:n(15), taxable:n(15), ext_cost:n(15)"

