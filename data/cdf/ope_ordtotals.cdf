[[OPE_ORDTOTALS.BSHO]]
print "OPE_ORDTOTALS:BSHO"; rem debug

rem --- Get order header record and totals

	use ::ado_order.src::OrderHelper
	declare OrderHelper ordHelp!

	ordHelp! = cast(OrderHelper, callpoint!.getDevObject("order_helper_object"))
	ordHelp!.totalSalesDisk()

	file_name$ = "OPE_ORDHDR"
	dim ordhdr_rec$:fnget_tpl$(file_name$)
	ordhdr_dev = fnget_dev(file_name$)
	find record (ordhdr_dev, key=firm_id$+"  "+ordHelp!.getCust_id()+ordHelp!.getOrder_no()) ordhdr_rec$

	user_tpl.disc_code$ = ordhdr_rec.disc_code$
	user_tpl.tax_code$  = ordhdr_rec.tax_code$
[[OPE_ORDTOTALS.BEND]]
print "BEND"; rem debug

rem (not called if the Run button pushed)

	gosub send_back_values
	
	print "OPE_ORDTOTALS:END"; rem debug
[[OPE_ORDTOTALS.ARAR]]
print "OPE_ORDTOTALS:ARAR"; rem debug

rem --- Get order helper object

	ordHelp! = cast(OrderHelper, callpoint!.getDevObject("order_helper_object"))	

rem --- Get upper level sales tax
	
	gosub get_sales_tax

rem --- Get Amount mask

	call stbl("+DIR_PGM")+"adc_getmask.aon","","IV","A","",amount_mask$,0,mask_len

rem --- Get previous and current discounts

	file_name$ = "OPC_DISCCODE"
	disccode_dev = fnget_dev(file_name$)
	dim disccode_rec$:fnget_tpl$(file_name$)

	find record (disccode_dev, key=firm_id$+user_tpl.disc_code$, dom=*next) disccode_rec$
	new_disc_per = disccode_rec.disc_percent

	find record (disccode_dev, key=firm_id$+user_tpl.prev_disc_code$, dom=*next) disccode_rec$
	old_disc_per = disccode_rec.disc_percent
	discount_amt = num(callpoint!.getColumnData("OPE_ORDTOTALS.DISCOUNT_AMT"))

	if user_tpl.prev_sales_total <> 0 then
		calc_prev_disc_per = round(100 * discount_amt / user_tpl.prev_sales_total, 2)
	else
		calc_prev_disc_per = 0
	endif

rem --- Change discount?

	msg_opt$ = ""
	disc_per_in = 0

rem --- A discount code or amount has been previously entered and the discount amt doesn't match the old discount percentage

	if (user_tpl.prev_disc_code$ <> "" or discount_amt <> 0) and 
:		(user_tpl.prev_sales_total = 0 or round(discount_amt, 2) <> round(old_disc_per * user_tpl.prev_sales_total / 100, 2))
:	then 

		saved_new_disc = new_disc_per

		if user_tpl.prev_sales_total <> 0 then 
			disc_per_in = calc_prev_disc_per
		else
			disc_per_in = old_disc_per
		endif

		if ordHelp!.getExtPrice() <> user_tpl.prev_sales_total 	or 
:			user_tpl.disc_code$    <> user_tpl.prev_disc_code$		or
:			round(disc_per_in * ordHelp!.getExtPrice() / 100, 2) <> discount_amt
:		then
			gosub tax_calc
			rem gosub display_fields

		rem --- Replace discounts?

			new_disc_amt = round(saved_new_disc * ordHelp!.getExtPrice() / 100, 2)
			
			if disc_per_in<>new_disc_per or discount_amt<>new_disc_amt then

				msg_id$ = "OP_REPLACE_DISC"
				dim msg_tokens$[4]
				msg_tokens$[1] = cvs( str(disc_per_in:"##0.00-"), 3) + "%"
				msg_tokens$[2] = cvs( str(discount_amt:amount_mask$), 3)
				msg_tokens$[3] = cvs( str(new_disc_per:"##0.00-"), 3) + "%"
				msg_tokens$[4] = cvs( str(new_disc_amt:amount_mask$), 3)
				gosub disp_message

				if msg_opt$ = "N" then new_disc_per = disc_per_in
			endif
		endif
	endif

	if msg_opt$ <> "N" then discount_amt = round(new_disc_per * ordHelp!.getExtPrice() / 100, 2)
	callpoint!.setColumnData("OPE_ORDTOTALS.DISCOUNT_AMT", str(discount_amt))
	user_tpl.prev_sales_total = ordHelp!.getExtPrice()

rem --- Calculate and display Discount, Tax & Cash Receipt

	user_tpl.prev_disc_code$ = user_tpl.disc_code$
	freight_amt = num(callpoint!.getColumnData("OPE_ORDTOTALS.FREIGHT_AMT"))

	if disp_per_in = 0 then
		gosub calc_disc_per
	endif

	gosub tax_calc
	gosub display_fields
[[OPE_ORDTOTALS.ASVA]]
print "ASVA"; rem debug

rem (Doesn't get here if you click the close button "x")

	gosub send_back_values

	print "OPE_ORDTOTALS:END"; rem debug
[[OPE_ORDTOTALS.FREIGHT_AMT.AVAL]]
print "FREIGHT_AMT.AVAL"; rem debug

rem --- Save freight and recalculate tax

	ordHelp! = cast(OrderHelper, callpoint!.getDevObject("order_helper_object"))
	freight_amt  = num(callpoint!.getUserInput())
	discount_amt = num(callpoint!.getColumnData("OPE_ORDTOTALS.DISCOUNT_AMT"))
	callpoint!.setColumnData("OPE_ORDTOTALS.FREIGHT_AMT", str(freight_amt))

	gosub calc_disc_per
	gosub get_sales_tax
	gosub tax_calc
	gosub display_fields
[[OPE_ORDTOTALS.DISCOUNT_AMT.AVAL]]
print "DISCOUNT_AMT.AVAL"; rem debug

rem --- Save discount and recalculate tax

	ordHelp! = cast(OrderHelper, callpoint!.getDevObject("order_helper_object"))
	discount_amt = num(callpoint!.getUserInput())
	freight_amt  = num(callpoint!.getColumnData("OPE_ORDTOTALS.FREIGHT_AMT"))

	gosub calc_disc_per
	gosub get_sales_tax
	gosub tax_calc
	gosub display_fields
	
[[OPE_ORDTOTALS.<CUSTOM>]]
rem ==========================================================================
tax_calc: rem --- Calculate tax amount
          rem      IN: disc_per_in
          rem          ordHelp!
          rem          taxcode dev, rec$, and rec2$
rem ==========================================================================

	if ordHelp!.getTaxable() <> 0 then 
		taxable_amt = round(ordHelp!.getTaxable() - disc_per_in * ordHelp!.getTaxable() / 100, 2)
	else
		taxable_amt = 0
	endif

	if taxcode_rec.tax_frt_flag$ = "Y" then 
		taxable_amt = taxable_amt + num(callpoint!.getColumnData("OPE_ORDTOTALS.FREIGHT_AMT"))
	endif

	tax_amount = 0
	tax_calc = round(taxcode_rec.tax_rate * taxable_amt / 100, 2)

	if taxcode_rec.op_max_limit <> 0 and abs(tax_calc) > taxcode_rec.op_max_limit then
		tax_calc = taxcode_rec.op_max_limit * sgn(tax_calc)
	endif

	tax_amount = tax_calc

	for i=1 to 10
		tax_code$ = field(taxcode_rec$, "AR_TOT_CODE_" + str(i:"00"))
		if cvs(tax_code$,2) = "" then continue
		find record (taxcode_dev, key=firm_id$+tax_code$, dom=*continue) taxcode_rec2$
		tax_calc = round(taxcode_rec2.tax_rate * taxable_amt / 100, 2)

		if taxcode_rec2.op_max_limit <> 0 and abs(tax_calc) > taxcode_rec2.op_max_limit then
			tax_calc = taxcode_rec2.op_max_limit * sgn(tax_calc)
		endif

		tax_amount = tax_amount + tax_calc
	next i

	callpoint!.setColumnData("OPE_ORDTOTALS.TAX_AMOUNT", str(tax_amount))
	callpoint!.setStatus("REFRESH")

	return

rem ==========================================================================
get_sales_tax: rem --- Get sales tax
               rem     OUT: taxcode_rec$
rem ==========================================================================

	file_name$ = "OPC_TAXCODE"
	taxcode_dev = fnget_dev(file_name$)
	dim taxcode_rec$:fnget_tpl$(file_name$)
	dim taxcode_rec2$:fnget_tpl$(file_name$)
	find record (taxcode_dev, key=firm_id$+user_tpl.tax_code$, dom=*next) taxcode_rec$

	return

rem ==========================================================================
get_ordhdr_rec: rem --- Get order header record and order helper object
                rem     OUT: ordHelp!
                rem          ordhdr_rec$
rem ==========================================================================

	escape; rem debug

rem --- Note: although the order header record is retrieved and used, it is 
rem     not written back to disk.  This is done in the callers (OPE_ORDHDR and
rem     OPE_INVHDR).  The values are passed back via the ordHelp! object.

	ordHelp! = cast(OrderHelper, callpoint!.getDevObject("order_helper_object"))	

	file_name$ = "OPE_ORDHDR"
	dim ordhdr_rec$:fnget_tpl$(file_name$)
	ordhdr_dev = fnget_dev(file_name$)
	find record (ordhdr_dev, key=firm_id$+"  "+ordHelp!.getCust_id()+ordHelp!.getOrder_no()) ordhdr_rec$

	return

rem ==========================================================================
send_back_values: rem --- Send back the entered values
rem ==========================================================================

	ordHelp! = cast(OrderHelper, callpoint!.getDevObject("order_helper_object"))

	ordHelp!.setFreight(   num(callpoint!.getColumnData("OPE_ORDTOTALS.FREIGHT_AMT")) )
	ordHelp!.setDiscount(  num(callpoint!.getColumnData("OPE_ORDTOTALS.DISCOUNT_AMT")) )
	ordHelp!.setTaxAmount( num(callpoint!.getColumnData("OPE_ORDTOTALS.TAX_AMOUNT")) )

	return

rem ==========================================================================
display_fields: rem --- Display net sales and subtotal
                rem      IN: discount_amt
                rem          ordHelp!
                rem          freight_amt
rem ==========================================================================

	tax_amt = num(callpoint!.getColumnData("OPE_ORDTOTALS.TAX_AMOUNT"))
	net_sales = ordHelp!.getExtPrice() - discount_amt + tax_amount + freight_amt
	callpoint!.setColumnData("<<DISPLAY>>.SUBTOTAL", str(ordHelp!.getExtPrice() - discount_amt))
	callpoint!.setColumnData("<<DISPLAY>>.NET_SALES", str(net_sales))
	callpoint!.setStatus("REFRESH")

	return

rem ==========================================================================
calc_disc_per: rem --- Calculate discount percent
               rem      IN: discount_amt
               rem     OUT: disc_per_in
rem ==========================================================================

	ordHelp! = cast(OrderHelper, callpoint!.getDevObject("order_helper_object"))

	if ordHelp!.getExtPrice() <> 0 then 
		disc_per_in = round(100 * discount_amt / ordHelp!.getExtPrice(), 2)
	else
		disc_per_in = 0
	endif

	return
