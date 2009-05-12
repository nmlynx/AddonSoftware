[[OPE_INVHDR.BOVE]]
rem --- Restrict lookup to orders

	alias_id$ = "OPE_INVHDR"
	inq_mode$ = "EXM_ITEM"
	key_pfx$  = firm_id$
	key_id$   = "PRIMARY"

	dim filter_defs$[1,1]
	filter_defs$[1,0] = "OPE_INVHDR.ORDINV_FLAG"
	filter_defs$[1,1] = "='I'"

	call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:		gui_dev,
:		Form!,
:		alias_id$,
:		inq_mode$,
:		table_chans$[all],
:		key_pfx$,
:		key_id$,
:		selected_key$,
:		filter_defs$[all],
:		search_defs$[all]

	if selected_key$<>"" then callpoint!.setStatus("RECORD:[" + selected_key$ +"]")
[[OPE_INVHDR.AWRI]]
rem --- Write/Remove manual ship to file

	cust_id$ = callpoint!.getColumnData("OPE_INVHDR.CUSTOMER_ID")
	ord_no$  = callpoint!.getColumnData("OPE_INVHDR.ORDER_NO")
	ordship_dev = fnget_dev("OPE_ORDSHIP")
	
	if callpoint!.getColumnData("OPE_INVHDR.SHIPTO_TYPE") <> "M" then 
		remove (ordship_dev,key=firm_id$+cust_id$+ord_no$,dom=*next)
	else
		dim ordship_tpl$:fnget_tpl$("OPE_ORDSHIP")
		read record (ordship_dev, key=firm_id$+cust_id$+ord_no$ ,dom=*next) ordship_tpl$

		ordship_tpl.firm_id$     = firm_id$
		ordship_tpl.customer_id$ = cust_id$
		ordship_tpl.order_no$    = ord_no$
		ordship_tpl.name$        = callpoint!.getColumnData("<<DISPLAY>>.SNAME")
		ordship_tpl.addr_line_1$ = callpoint!.getColumnData("<<DISPLAY>>.SADD1")
		ordship_tpl.addr_line_2$ = callpoint!.getColumnData("<<DISPLAY>>.SADD2")
		ordship_tpl.addr_line_3$ = callpoint!.getColumnData("<<DISPLAY>>.SADD3")
		ordship_tpl.addr_line_4$ = callpoint!.getColumnData("<<DISPLAY>>.SADD4")
		ordship_tpl.city$        = callpoint!.getColumnData("<<DISPLAY>>.SCITY")
		ordship_tpl.state_code$  = callpoint!.getColumnData("<<DISPLAY>>.SSTATE")
		ordship_tpl.zip_code$    = callpoint!.getColumnData("<<DISPLAY>>.SZIP")

		write record (ordship_dev) ordship_tpl$
	endif

	if user_tpl.new_rec$ = "Y" then 
		gosub add_to_batch_print
	endif
[[OPE_INVHDR.ADIS]]
rem --- Display customer comments

	cust_id$ = callpoint!.getColumnData("OPE_INVHDR.CUSTOMER_ID")
	gosub disp_cust_comments

rem --- Disable Cost field if there is a value in it

	grid! = util.getGrid(Form!)
	recVect! = GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs = recVect!.size()

	if numrecs>0 then
		for reccnt=0 to numrecs-1
			gridrec$ = recVect!.getItem(reccnt)

			if gridrec.unit_cost = 0
				util.enableGridCell(grid!, 5, reccnt)
			else
				util.disableGridCell(grid!, 5, reccnt)
			endif
		next reccnt
	endif
[[OPE_INVHDR.ORDER_NO.AVAL]]
rem --- Set default values

	ope01_dev = fnget_dev("OPE_ORDHDR")
	dim ope01a$:fnget_tpl$("OPE_ORDHDR")

	ar_type$ = callpoint!.getColumnData("OPE_INVHDR.AR_TYPE")
	cust_id$ = callpoint!.getColumnData("OPE_INVHDR.CUSTOMER_ID")
	ord_no$  = callpoint!.getUserInput()

	user_tpl.new_rec$ = "Y"
	start_block = 1

	if start_block then
		find record (ope01_dev, key=firm_id$+ar_type$+cust_id$+ord_no$, dom=*endif) ope01a$
		user_tpl.new_rec$ = "N"
	endif

	callpoint!.setDevObject("order", ord_no$); rem --- why?

	if user_tpl.new_rec$ = "N" then 
		gosub check_lock_flag

		if locked=1 then 
			callpoint!.setStatus("ABORT")
			break; rem --- exit callpoint
		endif

		user_tpl.price_code$   = ope01a.price_code$
		user_tpl.pricing_code$ = ope01a.pricing_code$
		user_tpl.order_date$   = ope01a.order_date$

	else

rem --- New record, set default

		callpoint!.setColumnData("OPE_INVHDR.INVOICE_TYPE", "S")

		arm02_dev = fnget_dev("ARM_CUSTDET")
		dim arm02a$:fnget_tpl$("ARM_CUSTDET")
		read record (arm02_dev, key=firm_id$+cust_id$+"  ", dom=*next) arm02a$

		arm01_dev = fnget_dev("ARM_CUSTMAST")
		dim arm01a$:fnget_tpl$("ARM_CUSTMAST")
		read record (arm01_dev, key=firm_id$+cust_id$, dom=*next) arm01a$

		callpoint!.setColumnData("OPE_INVHDR.SHIPMNT_DATE",user_tpl.def_ship$)
		callpoint!.setColumnData("OPE_INVHDR.INVOICE_TYPE","S")
		callpoint!.setColumnData("OPE_INVHDR.ORDINV_FLAG","O")
		callpoint!.setColumnData("OPE_INVHDR.INVOICE_DATE",sysinfo.system_date$)
		callpoint!.setColumnData("OPE_INVHDR.AR_SHIP_VIA",arm01a.ar_ship_via$)
		callpoint!.setColumnData("OPE_INVHDR.SLSPSN_CODE",arm02a.slspsn_code$)
		callpoint!.setColumnData("OPE_INVHDR.TERMS_CODE",arm02a.ar_terms_code$)
		callpoint!.setColumnData("OPE_INVHDR.DISC_CODE",arm02a.disc_code$)
		callpoint!.setColumnData("OPE_INVHDR.AR_DIST_CODE",arm02a.ar_dist_code$)
		callpoint!.setColumnData("OPE_INVHDR.PRINT_STATUS","N")
		callpoint!.setColumnData("OPE_INVHDR.MESSAGE_CODE",arm02a.message_code$)
		callpoint!.setColumnData("OPE_INVHDR.TERRITORY",arm02a.territory$)
		callpoint!.setColumnData("OPE_INVHDR.ORDER_DATE",sysinfo.system_date$)
		callpoint!.setColumnData("OPE_INVHDR.TAX_CODE",arm02a.tax_code$)
		callpoint!.setColumnData("OPE_INVHDR.PRICING_CODE",arm02a.pricing_code$)
		callpoint!.setColumnData("OPE_INVHDR.CASH_SALE","N")

		gosub get_op_params

		if cust_id$ = ars01a.customer_id$
			callpoint!.setColumnData("OPE_INVHDR.CASH_SALE", "Y")
		endif

		callpoint!.setColumnData("OPE_INVHDR.LOCK_STATUS", "Y")
		user_tpl.price_code$   = ""
		user_tpl.pricing_code$ = arm02a.pricing_code$
		user_tpl.order_date$   = sysinfo.system_date$
	endif

rem --- Enable/Disable buttons

	callpoint!.setOptionEnabled("DINV",0)
	callpoint!.setOptionEnabled("CINV",0)

	if user_tpl.new_rec$="N" then 
		if user_tpl.credit_installed$="Y" and user_tpl.pick_hold$<>"Y" and
:			callpoint!.getColumnData("OPE_INVHDR.CREDIT_FLAG")="C"
:		then
			callpoint!.setOptionEnabled("RPRT",0)
		else
			callpoint!.setOptionEnabled("RPRT",1)
		endif
	endif

	callpoint!.setStatus("REFRESH")

rem --- Has this order been printed?

	gosub check_print_flag
	if locked then
		callpoint!.setStatus("ABORT")
	endif
[[OPE_INVHDR.CUSTOMER_ID.AVAL]]
rem --- Show customer data

	cust_id$ = callpoint!.getUserInput()
	gosub bill_to_info
	gosub disp_cust_comments

	rem --- why?
	callpoint!.setDevObject("cust", cust_id$)

rem --- Credit check?

	if user_tpl.credit_installed$ = "Y" and user_tpl.display_bal$ = "A" then
		call user_tpl.pgmdir$+"opc_creditmgmnt.aon", cust_id$, table_chans$[all], callpoint!
	endif

rem --- Enable Duplicate buttons

	if cvs(callpoint!.getColumnData("OPE_INVHDR.ORDER_NO"),2) = "" then
		callpoint!.setOptionEnabled("DINV", 1)
		callpoint!.setOptionEnabled("CINV", 1)
	endif
[[OPE_INVHDR.CUSTOMER_ID.AINP]]
rem --- If cash customer, get correct customer number

	gosub get_op_params

	if ars01a.cash_sale$="Y" and cvs(callpoint!.getUserInput(),1+2+4)="C" 
		callpoint!.setColumnData("OPE_INVHDR.CUSTOMER_ID",ars01a.customer_id$)
		callpoint!.setColumnData("OPE_INVHDR.CASH_SALE","Y")
		callpoint!.setStatus("REFRESH")
	endif
[[OPE_INVHDR.<CUSTOM>]]
rem ==========================================================================
bill_to_info: rem --- Get and display Bill To Information
              rem      IN: cust_id$
rem ==========================================================================

	custmast_dev = fnget_dev("ARM_CUSTMAST")
	dim custmast_tpl$:fnget_tpl$("ARM_CUSTMAST")

	read record (custmast_dev, key=firm_id$+cust_id$, dom=*next) custmast_tpl$

	callpoint!.setColumnData("<<DISPLAY>>.BADD1",custmast_tpl.addr_line_1$)
	callpoint!.setColumnData("<<DISPLAY>>.BADD2",custmast_tpl.addr_line_2$)
	callpoint!.setColumnData("<<DISPLAY>>.BADD3",custmast_tpl.addr_line_3$)
	callpoint!.setColumnData("<<DISPLAY>>.BADD4",custmast_tpl.addr_line_4$)
	callpoint!.setColumnData("<<DISPLAY>>.BCITY",custmast_tpl.city$)
	callpoint!.setColumnData("<<DISPLAY>>.BSTATE",custmast_tpl.state_code$)
	callpoint!.setColumnData("<<DISPLAY>>.BZIP",custmast_tpl.zip_code$)

	custdet_dev = fnget_dev("ARM_CUSTDET")
	dim custdet_tpl$:fnget_tpl$("ARM_CUSTDET")

	read record (custdet_dev, key=firm_id$+cust_id$+"  ", dom=*next) custdet_tpl$

	ar_balance = custdet_tpl.aging_future +
:		custdet_tpl.aging_cur +
:		custdet_tpl.aging_30 +
:		custdet_tpl.aging_60 +
:		custdet_tpl.aging_90 +
:		custdet_tpl.aging_120

	if user_tpl.credit_installed$="Y" and user_tpl.display_bal$="A" then 
		callpoint!.setColumnData("<<DISPLAY>>.AGING_120",custdet_tpl.aging_120$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_30",custdet_tpl.aging_30$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_60",custdet_tpl.aging_60$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_90",custdet_tpl.aging_90$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_CUR",custdet_tpl.aging_cur$)
		callpoint!.setColumnData("<<DISPLAY>>.AGING_FUTURE",custdet_tpl.aging_future$)
		callpoint!.setColumnData("<<DISPLAY>>.TOT_AGING",str(ar_balance))
	else
		callpoint!.setColumnData("<<DISPLAY>>.AGING_120","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_30","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_60","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_90","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_CUR","")
		callpoint!.setColumnData("<<DISPLAY>>.AGING_FUTURE","")
		callpoint!.setColumnData("<<DISPLAY>>.TOT_AGING","")
	endif

	callpoint!.setStatus("REFRESH")

return

rem ==========================================================================
ship_to_info: rem --- Get and display Bill To Information
              rem      IN: cust_id$
              rem          ship_to_type$
              rem          ship_to_no$
              rem          ord_no$
rem ==========================================================================

	if ship_to_type$<>"M" then

		if ship_to_type$="S" then
			custship_dev = fnget_dev("ARM_CUSTSHIP")
			dim custship_tpl$:fnget_tpl$("ARM_CUSTSHIP")

			read record (custship_dev, key=firm_id$+cust_id$+ship_to_no$, dom=*next) custship_tpl$

			callpoint!.setColumnData("<<DISPLAY>>.SNAME",custship_tpl.name$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD1",custship_tpl.addr_line_1$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD2",custship_tpl.addr_line_2$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD3",custship_tpl.addr_line_3$)
			callpoint!.setColumnData("<<DISPLAY>>.SADD4",custship_tpl.addr_line_4$)
			callpoint!.setColumnData("<<DISPLAY>>.SCITY",custship_tpl.city$)
			callpoint!.setColumnData("<<DISPLAY>>.SSTATE",custship_tpl.state_code$)
			callpoint!.setColumnData("<<DISPLAY>>.SZIP",custship_tpl.zip_code$)
		else
			callpoint!.setColumnData("<<DISPLAY>>.SNAME","Same")
			callpoint!.setColumnData("<<DISPLAY>>.SADD1","")
			callpoint!.setColumnData("<<DISPLAY>>.SADD2","")
			callpoint!.setColumnData("<<DISPLAY>>.SADD3","")
			callpoint!.setColumnData("<<DISPLAY>>.SADD4","")
			callpoint!.setColumnData("<<DISPLAY>>.SCITY","")
			callpoint!.setColumnData("<<DISPLAY>>.SSTATE","")
			callpoint!.setColumnData("<<DISPLAY>>.SZIP","")
		endif

	else

		ordship_dev = fnget_dev("OPE_ORDSHIP")
		dim ordship_tpl$:fnget_tpl$("OPE_ORDSHIP")

		read record (ordship_dev, key=firm_id$+cust_id$+ord_no$, dom=*next) ordship_tpl$

		callpoint!.setColumnData("<<DISPLAY>>.SNAME",ordship_tpl.name$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD1",ordship_tpl.addr_line_1$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD2",ordship_tpl.addr_line_2$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD3",ordship_tpl.addr_line_3$)
		callpoint!.setColumnData("<<DISPLAY>>.SADD4",ordship_tpl.addr_line_4$)
		callpoint!.setColumnData("<<DISPLAY>>.SCITY",ordship_tpl.city$)
		callpoint!.setColumnData("<<DISPLAY>>.SSTATE",ordship_tpl.state_code$)
		callpoint!.setColumnData("<<DISPLAY>>.SZIP",ordship_tpl.zip_code$)

	endif

	callpoint!.setStatus("REFRESH")

return

rem ==========================================================================
get_op_params:
rem ==========================================================================

	ars01_dev = fnget_dev("ARS_PARAMS")
	dim ars01a$:fnget_tpl$("ARS_PARAMS")

	read record (ars01_dev, key=firm_id$+"AR00") ars01a$

return

rem ==========================================================================
disp_ord_tot: rem --- Display order total
rem ==========================================================================

	user_tpl.ord_tot=0

	ope11_dev=fnget_dev("OPE_ORDDET")
	dim ope11a$:fnget_tpl$("OPE_ORDDET")

	opc_linecode_dev=fnget_dev("OPC_LINECODE")
	dim opc_linecode$:fnget_tpl$("OPC_LINECODE")

	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm01a$:fnget_tpl$("IVM_ITEMMAST")

	ar_type$ = callpoint!.getColumnData("OPE_INVHDR.AR_TYPE")
	cust_id$ = callpoint!.getColumnData("OPE_INVHDR.CUSTOMER_ID")
	ord_no$  = callpoint!.getColumnData("OPE_INVHDR.ORDER_NO")

	read (ope11_dev, key=firm_id$+ar_type$+cust_id$+ord_no$, dom=*next)

	while 1
		read record (ope11_dev, end=*break) ope11a$

		if ope11a.firm_id$+ope11a.ar_type$+ope11a.customer_id$+ope11a.order_no$ <> 
:			firm_id$+ar_type$+cust_id$+ord_no$ 
:		then
			break
		endif

		dim opc_linecode$:fattr(opc_linecode$)
		read record (opc_linecode_dev, key=firm_id$+ope11a.line_code$, dom=*next) opc_linecode$

		if pos(opc_linecode.line_type$="SNP") then 
			user_tpl.ord_tot = user_tpl.ord_tot + (ope11a.unit_price * ope11a.qty_ordered)
		else
			if opc_linecode.line_type$ = "O" then 
				user_tpl.ord_tot = user_tpl.ord_tot + ope11a.ext_price
			endif
		endif

		rem --- this does nothing...
		dim ivm01a$:fattr(ivm01a$)
		read record (ivm01_dev, key=firm_id$+ope11a.item_id$, dom=*next) ivm01a$

		if ivm01a.taxable_flag$="Y" and opc_linecode.taxable_flag$="Y" then 
			ope11a.taxable_amt = ope11a.ext_price
		endif
		rem ---

	wend

	callpoint!.setColumnData("<<DISPLAY>>.ORDER_TOT", str(user_tpl.ord_tot))
	callpoint!.setStatus("REFRESH")

return

rem ==========================================================================
disp_cust_comments: rem --- Display customer comments
                    rem      IN: cust_id$
rem ==========================================================================

	cmt_text$ = ""
	arm05_dev = fnget_dev("ARM_CUSTCMTS")
	dim arm05a$:fnget_tpl$("ARM_CUSTCMTS")
	more = 1

	read (arm05_dev, key=firm_id$+cust_id$, dom=*next)

	while more
		read record (arm05_dev, end=*break) arm05a$
		if arm05a.firm_id$+arm05a.customer_id$ <> firm_id$+cust$ then break
		cmt_text$ = cmt_text$ + cvs(arm05a.std_comments$,3) + $0A$
	wend

	callpoint!.setColumnData("<<DISPLAY>>.comments", cmt_text$)
	callpoint!.setStatus("REFRESH")

return

rem ==========================================================================
check_lock_flag: rem --- Check manual record lock
                 rem     OUT: locked = 1 or 0
rem ==========================================================================

	locked=0
	on pos( callpoint!.getColumnData("OPE_INVHDR.LOCK_STATUS") = "NYS12" ) goto 
:		end_lock,end_lock,locked,on_invoice,update_stat,update_stat,end_lock

locked:

	msg_id$="ORD_LOCKED"
	dim msg_tokens$[1]

	if callpoint!.getColumnData("OPE_INVHDR.PRINT_STATUS")="B" then 
		msg_tokens$[1]=" by Batch Print"
		gosub disp_message

		if msg_opt$="Y"
			callpoint!.setColumnData("OPE_INVHDR.LOCK_STATUS", "N")
		else
			locked=1
		endif

	endif

	goto end_lock

on_invoice:

	msg_id$="ORD_ON_REG"
	gosub disp_message
	locked=1
	goto end_lock

update_stat:

	msg_id$="INVOICE_IN_UPDATE"
	gosub disp_message
	locked=1

end_lock:

return

rem ==========================================================================
add_to_batch_print: rem --- Add to batch print file
rem ==========================================================================

	ope_prntlist_dev = fnget_dev("OPE_PRNTLIST")
	dim ope_prntlist$:fnget_tpl$("OPE_PRNTLIST")

	ope_prntlist.firm_id$     = firm_id$
	ope_prntlist.ordinv_flag$ = "O"
	ope_prntlist.ar_type$     = "  "
	ope_prntlist.customer_id$ = callpoint!.getColumnData("OPE_INVHDR.CUSTOMER_ID")
	ope_prntlist.order_no$    = callpoint!.getColumnData("OPE_INVHDR.ORDER_NO")

	write record (ope_prntlist_dev) ope_prntlist$

return

rem ==========================================================================
check_print_flag: rem --- Check print flag
                  rem     OUT: locked = 1/0
                  rem          printed$ = Y/N
rem ==========================================================================

	printed$ = "N"
	locked = 0
	ar_type$      = callpoint!.getColumnData("OPE_INVHDR.AR_TYPE")
	cust_id$      = callpoint!.getColumnData("OPE_INVHDR.CUSTOMER_ID")
	order_no$     = callpoint!.getColumnData("OPE_INVHDR.ORDER_NO")
	print_status$ = callpoint!.getColumnData("OPE_INVHDR.PRINT_STATUS")
	ordinv_flag$  = callpoint!.getColumnData("OPE_INVHDR.ORDINV_FLAG")
		 
	if ordinv_flag$ = "O" then 
		if print_status$ <> "Y" then 
			msg_id$ = "OP_PICKLIST_NOT_DONE"
			gosub disp_message
			if msg_opt$ = "N" then
				gosub unlock_order
				locked=1
			endif
		endif
	else
		if ordinv_flag$ = "I" then 
			if print_status$ <> "N" then 
				msg_id$ = "OP_REPRINT_INVOICE"
				gosub disp_message
				if msg_opt$ = "N" then 
					gosub unlock_order
					locked=1
				else
					callpoint!.setColumnData("OPE_INVHDR.PRINT_STATUS", "N")
					printed$ = "Y"
					gosub set_print_flag
				endif
			else
				gosub set_print_flag
			endif
		endif
	endif

return 

rem ==========================================================================
unlock_order: rem --- Unlock order
              rem      IN: ar_type$
			     rem          cust_id$
			     rem          order_no$
			  
			     rem --- What does writing the record do to Barista?
rem ==========================================================================
			  
	ope01_dev = fnget_dev("OPE_INVHDR")
	dim ope01a$:fnget_tpl$("OPE_INVHDR")
	start_block = 1
	
	if start_block then
		read record (ope01_dev, key=firm_no$+ar_type$+cust_id$+order_no$, dom=*endif) ope01a$
		callpoint!.setColumnData("OPE_INVHDR.LOCK_STATUS", "N")
		ope01a.lock_status$ = "N"
		ope01a$ = field(ope01a$)
		write record (ope01_dev) ope01a$
	endif
	
return 

rem ==========================================================================
set_print_flag: rem --- Set print flag
                rem      IN: ar_type$
				    rem          cust_id$
				    rem          order_no$
rem ==========================================================================

	ope04_dev = fnget_dev("OPE_PRNTLIST")
	dim ope04a$:fnget_tpl$("OPE_PRNTLIST")
	
	remove (ope04_dev, key=firm_id$+"O"+ar_type$+cust_id$+order_no$, dom=*next) 
	ope04a.firm_id$     = firm_id$
	ope04a.ordinv_flag$ = "I"
	ope04a.ar_type$     = ar_type$
	ope04a.customer_id$ = cust_id$
	ope04a.order_no$    = order_no$
	write record (ope04_dev) ope04a$

return
[[OPE_INVHDR.ARAR]]
print "Hdr:ARAR"; rem debug

rem --- Display order total (why here?)

	gosub disp_ord_tot

rem --- Populate address fields

	cust_id$ = callpoint!.getColumnData("OPE_INVHDR.CUSTOMER_ID")

	gosub bill_to_info

	ship_to_type$ = callpoint!.getColumnData("OPE_INVHDR.SHIPTO_TYPE")
	ship_to_no$   = callpoint!.getColumnData("OPE_INVHDR.SHIPTO_NO")
	ord_no$       = callpoint!.getColumnData("OPE_INVHDR.ORDER_NO")

	gosub ship_to_info

	rem --- why?
	user_tpl.price_code$   = callpoint!.getColumnData("OPE_INVHDR.PRICE_CODE")
	user_tpl.pricing_code$ = callpoint!.getColumnData("OPE_INVHDR.PRICING_CODE")
	user_tpl.order_date$   = callpoint!.getColumnData("OPE_INVHDR.ORDER_DATE")
	rem ---

	declare BBjVector column!
	column! = BBjAPI().makeVector()

	column!.addItem("<<DISPLAY>>.SNAME")
	column!.addItem("<<DISPLAY>>.SADD1")
	column!.addItem("<<DISPLAY>>.SADD2")
	column!.addItem("<<DISPLAY>>.SADD3")
	column!.addItem("<<DISPLAY>>.SADD4")
	column!.addItem("<<DISPLAY>>.SCITY")
	column!.addItem("<<DISPLAY>>.SSTATE")
	column!.addItem("<<DISPLAY>>.SZIP")

	if ship_to_type$ = "M" then 
		status = 1
	else
		status = -1
	endif

	callpoint!.setColumnEnabled(column!, status)

	if callpoint!.getColumnData("OPE_INVHDR.INVOICE_TYPE") <> "P" then
		status = -1
	else
		status = 1
	endif

	callpoint!.setColumnEnabled("OPE_ORDHDR.EXPIRE_DATE", status)

rem --- Clear Availability Window

	userObj!.getItem(num(user_tpl.avail_oh$)).setText("")
	userObj!.getItem(num(user_tpl.avail_comm$)).setText("")
	userObj!.getItem(num(user_tpl.avail_avail$)).setText("")
	userObj!.getItem(num(user_tpl.avail_oo$)).setText("")
	userObj!.getItem(num(user_tpl.avail_wh$)).setText("")
	userObj!.getItem(num(user_tpl.avail_type$)).setText("")
	userObj!.getItem(num(user_tpl.dropship_flag$)).setText("")

rem --- Set variables

	callpoint!.setDevObject("cust",cust_id$)
	callpoint!.setDevObject("ar_type","")
	callpoint!.setDevObject("order",ord_no$)

rem --- Enable/Disable buttons

	callpoint!.setOptionEnabled("DINV",0)
	callpoint!.setOptionEnabled("CINV",0)

	if user_tpl.credit_installed$="Y" and user_tpl.pick_hold$<>"Y" and
:		callpoint!.getColumnData("OPE_INVHDR.CREDIT_FLAG")="C"
:	then
		callpoint!.setOptionEnabled("RPRT",0)
	else
		callpoint!.setOptionEnabled("RPRT",1)
	endif
[[OPE_INVHDR.ASHO]]
print "Hdr:ASHO"; rem debug

rem --- Get default POS station

	call stbl("+DIR_SYP")+"bam_run_prog.bbj", "OPE_INVSTATION", stbl("+USER_ID"), "MNT", "", table_chans$[all]

rem --- Check for a POS record by station

	station$ = "DEFAULT"
	station$ = stbl("OPE_DEF_STATION", err=*next)

	file$ = "OPM_POINTOFSALE"
	dim pointofsale_rec$:fnget_tpl$(file$)

	find record (fnget_dev(file$), key=firm_id$+pad(station$, 16), dom=no_pointofsale) pointofsale_rec$
	goto end_pointofsale

no_pointofsale: rem --- Should we create a default record?

	msg_id$ = "POS_REC_NOT_FOUND"
	dim msg_tokens$[1]
	msg_tokens$[1] = cvs(station$, 2)

	gosub disp_message

	if msg_opt$ = "N" then
		callpoint!.setStatus("EXIT")
		break; rem --- Exit callpoint
	endif

rem --- Create a default POS record

	dim sysinfo$:stbl("+SYSINFO_TPL")
	sysinfo$=stbl("+SYSINFO")

	pointofsale_rec.firm_id$         = firm_id$
	pointofsale_rec.default_station$ = pad(station$, 16)
	pointofsale_rec.skip_whse$       = "N"
	pointofsale_rec.val_ctr_prt$     = sysinfo.printer_id$
	pointofsale_rec.val_rec_prt$     = sysinfo.printer_id$
	pointofsale_rec.cntr_printer$    = sysinfo.printer_id$
	pointofsale_rec.rec_printer$     = sysinfo.printer_id$

	write record (pointofsale_dev) pointofsale_rec$
		
end_pointofsale:

	user_tpl.skip_whse$    = pointofsale_rec.skip_whse$
	user_tpl.warehouse_id$ = pointofsale_rec.warehouse_id$	
[[OPE_INVHDR.ASIZ]]
print "Hdr:ASIZ"; rem debug

rem --- Create Empty Availability window

	grid! = util.getGrid(Form!)
	grid!.setSize(grid!.getWidth(), grid!.getHeight() - 75)

	cwin! = util.getChild(Form!).getControl(15000)
	cwin!.setLocation(cwin!.getX(), grid!.getY() + grid!.getHeight())
	cwin!.setSize(grid!.getWidth(), cwin!.getHeight())

	mwin! = cwin!.getControl(15999)
	mwin!.setSize(grid!.getWidth(), mwin!.getHeight())
[[OPE_INVHDR.BSHO]]
print "Hdr:BSHO"; rem debug

rem --- Open needed files

	num_files=35
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]

	open_tables$[1]="ARM_CUSTMAST",  open_opts$[1]="OTA"
	open_tables$[2]="ARM_CUSTSHIP",  open_opts$[2]="OTA"
	open_tables$[3]="OPE_ORDSHIP",   open_opts$[3]="OTA"
	open_tables$[4]="ARS_PARAMS",    open_opts$[4]="OTA"
	open_tables$[5]="ARM_CUSTDET",   open_opts$[5]="OTA"
	open_tables$[6]="OPE_INVCASH",   open_opts$[6]="OTA"
	open_tables$[7]="ARS_CREDIT",    open_opts$[7]="OTA"
	open_tables$[8]="OPC_LINECODE",  open_opts$[8]="OTA"
	open_tables$[9]="GLS_PARAMS",    open_opts$[9]="OTA"
	open_tables$[10]="GLS_PARAMS",   open_opts$[10]="OTA"
	open_tables$[11]="IVM_LSMASTER", open_opts$[11]="OTA"
	open_tables$[12]="IVX_LSCUST",   open_opts$[12]="OTA"
	open_tables$[13]="IVM_ITEMMAST", open_opts$[13]="OTA"
	open_tables$[15]="IVX_LSVEND",   open_opts$[15]="OTA"
	open_tables$[16]="IVM_ITEMWHSE", open_opts$[16]="OTA"
	open_tables$[17]="IVM_ITEMACT",  open_opts$[17]="OTA"
	open_tables$[18]="IVT_ITEMTRAN", open_opts$[18]="OTA"
	open_tables$[19]="IVM_ITEMTIER", open_opts$[19]="OTA"
	open_tables$[20]="IVM_ITEMACT",  open_opts$[20]="OTA"
	open_tables$[21]="IVM_ITEMVEND", open_opts$[21]="OTA"
	open_tables$[22]="IVT_LSTRANS",  open_opts$[22]="OTA"
	open_tables$[23]="OPT_ORDHDR",   open_opts$[23]="OTA"
	open_tables$[24]="OPT_ORDDET",   open_opts$[24]="OTA"
	open_tables$[25]="OPE_ORDDET",   open_opts$[25]="OTA"
	open_tables$[26]="OPT_INVSHIP",  open_opts$[26]="OTA"
	open_tables$[27]="OPE_CREDCUST", open_opts$[27]="OTA"
	open_tables$[28]="IVC_WHSECODE", open_opts$[28]="OTA"
	open_tables$[29]="IVS_PARAMS",   open_opts$[29]="OTA"
	open_tables$[30]="OPE_ORDLSDET", open_opts$[30]="OTA"
	open_tables$[31]="IVM_ITEMPRIC", open_opts$[31]="OTA"
	open_tables$[32]="IVC_PRICCODE", open_opts$[32]="OTA"
	open_tables$[33]="ARM_CUSTCMTS", open_opts$[33]="OTA"
	open_tables$[34]="OPE_PRNTLIST", open_opts$[34]="OTA"
	open_tables$[35]="OPM_POINTOFSALE", open_opts$[35]="OTA"

	gosub open_tables

rem --- get AR Params

	dim ars01a$:open_tpls$[4]
	read record(num(open_chans$[4]),key=firm_id$+"AR00")ars01a$

rem --- get IV Params

	dim ivs01a$:open_tpls$[29]
	read record(num(open_chans$[29]),key=firm_id$+"IV00")ivs01a$

rem --- See if blank warehouse exists

	blank_whse$ = "N"
	dim ivm10c$:open_tpls$[28]
	start_block = 1
	
	if start_block then
		read record (num(open_chans$[28]), key=firm_id$+"C"+ivm10c.warehouse_id$, dom=*endif) ivm10c$
		blank_whse$ = "Y"
	endif

rem --- Disable display fields

	declare BBjVector column!
	column! = BBjAPI().makeVector()

	column!.addItem("<<DISPLAY>>.BADD1")
	column!.addItem("<<DISPLAY>>.BADD2")
	column!.addItem("<<DISPLAY>>.BADD3")
	column!.addItem("<<DISPLAY>>.BADD4")
	column!.addItem("<<DISPLAY>>.BCITY")
	column!.addItem("<<DISPLAY>>.BSTATE")
	column!.addItem("<<DISPLAY>>.BZIP")
	column!.addItem("<<DISPLAY>>.ORDER_TOT")

	if ars01a.job_nos$<>"Y" then 
		column!.addItem("OPE_ORDHDR.JOB_NO")
	endif

	callpoint!.setColumnEnabled(column!, -1)

	column!.clear()
	column!.addItem("<<DISPLAY>>.SNAME")
	column!.addItem("<<DISPLAY>>.SADD1")
	column!.addItem("<<DISPLAY>>.SADD2")
	column!.addItem("<<DISPLAY>>.SADD3")
	column!.addItem("<<DISPLAY>>.SADD4")
	column!.addItem("<<DISPLAY>>.SCITY")
	column!.addItem("<<DISPLAY>>.SSTATE")
	column!.addItem("<<DISPLAY>>.SZIP")
	callpoint!.setColumnEnabled(column!, -1)

	column!.addItem("<<DISPLAY>>.AGING_FUTURE")
	column!.addItem("<<DISPLAY>>.AGING_CUR")
	column!.addItem("<<DISPLAY>>.AGING_30")
	column!.addItem("<<DISPLAY>>.AGING_60")
	column!.addItem("<<DISPLAY>>.AGING_90")
	column!.addItem("<<DISPLAY>>.AGING_120")
	column!.addItem("<<DISPLAY>>.TOT_AGING")
	callpoint!.setColumnEnabled(column!, -1)

rem --- Save totals object

	UserObj!.addItem( util.getControl(callpoint!, "<<DISPLAY>>.ORDER_TOT") )

rem --- Setup user_tpl$

	ars_credit_dev=num(open_chans$[7])
	dim ars_credit$:open_tpls$[7]
	read record (ars_credit_dev, key=firm_id$+"AR01") ars_credit$

	tpl$ = ""
	tpl$ = tpl$ + "new_rec:c(1), credit_installed:c(1), display_bal:c(1), ord_tot:n(15), amount_mask:c(1*),"
	tpl$ = tpl$ + "line_boqty:n(15), line_shipqty:n(15), blank_whse:c(1), def_ship:c(8), def_commit:c(8),"
	tpl$ = tpl$ + "dropship_whse:c(1), def_whse:c(10), avail_oh:c(5), avail_comm:c(5), avail_avail:c(5),"
	tpl$ = tpl$ + "avail_oo:c(5), avail_wh:c(5), avail_type:c(5*), dropship_flag:c(5*), ord_tot_1:c(5*),"
	tpl$ = tpl$ + "price_code:c(2), pricing_code:c(4), order_date:c(8), cur_row:n(5), pick_hold:c(1),"
	tpl$ = tpl$ + "pgmdir:c(1*), prev_line_code:c(1), skip_whse:c(1), warehouse_id:c(2),"
	tpl$ = tpl$ + "line_code:c(1), skip_ln_code:c(1)"
	dim user_tpl$:tpl$

	user_tpl.credit_installed$ = ars_credit.sys_install$
	user_tpl.pick_hold$        = ars_credit.pick_hold$
	user_tpl.display_bal$      = ars_credit.display_bal$
	user_tpl.blank_whse$       = blank_whse$
	user_tpl.dropship_whse$    = ars01a.dropshp_whse$
	user_tpl.amount_mask$      = ars01a.amount_mask$
	user_tpl.line_code$        = ars01a.line_code$
	user_tpl.skip_ln_code$     = ars01a.skip_ln_code$
	user_tpl.def_whse$         = ivs01a.warehouse_id$
	user_tpl.pgmdir$           = stbl("+DIR_PGM",err=*next)
	user_tpl.cur_row           = -1

rem --- Ship and Commit dates

	dim sysinfo$:stbl("+SYSINFO_TPL")
	sysinfo$=stbl("+SYSINFO")

	pgmdir$ = ""
	pgmdir$ = stbl("+DIR_PGM")

	orddate$ = sysinfo.system_date$
	comdate$ = orddate$
	shpdate$ = orddate$

	comdays = num(ars01a.commit_days$)
	shpdays = num(ars01a.def_shp_days$)

	if comdays then call pgmdir$+"adc_daydates.aon", orddate$, comdate$, comdays
	if shpdays then call pgmdir$+"adc_daydates.aon", orddate$, shpdate$, shpdays

	user_tpl.def_ship$   = shpdate$
	user_tpl.def_commit$ = comdate$

rem --- Save the indices of the controls for the Avail Window, setup in AFMC

	user_tpl.avail_oh$      ="2"
	user_tpl.avail_comm$    ="3"
	user_tpl.avail_avail$   ="4"
	user_tpl.avail_oo$      ="5"
	user_tpl.avail_wh$      ="6"
	user_tpl.avail_type$    ="7"
	user_tpl.dropship_flag$ ="8"
	user_tpl.ord_tot_1$     ="9"

rem --- Clear variables

	callpoint!.setDevObject("cust","")
	callpoint!.setDevObject("ar_type","")
	callpoint!.setDevObject("order","")
	callpoint!.setDevObject("int_seq","")
	callpoint!.setDevObject("wh","")
	callpoint!.setDevObject("item","")
	callpoint!.setDevObject("lsmast_dev",open_chans$[11])
	callpoint!.setDevObject("lsmast_tpl",open_tpls$[11])
	callpoint!.setDevObject("lotser_flag",ivs01a.lotser_flag$)
	callpoint!.setDevObject("default_linecode",ars01a.line_code$)

rem --- Set Lot/Serial button up properly

	switch pos(ivs01a.lotser_flag$="LS")
		case 1; callpoint!.setOptionText("LENT","Lot Entry"); break
		case 2; callpoint!.setOptionText("LENT","Serial Entry"); break
		case default; break
	swend

	callpoint!.setOptionEnabled("LENT",0)
	callpoint!.setOptionEnabled("DINV",0)
	callpoint!.setOptionEnabled("CINV",0)
	callpoint!.setOptionEnabled("RPRT",0)
[[OPE_INVHDR.AFMC]]
print 'show', "Hdr:AFMC"; rem debug

rem --- Inits

	use ::ado_util.src::util

rem --- Create Inventory Availability window

	grid!  = util.getGrid(Form!)
	child! = util.getChild(Form!)
	cxt    = SysGUI!.getAvailableContext()

	mwin! = child!.addChildWindow(15000, 0, 10, child!.getWidth(), 75, "", $00000800$, cxt)
	mwin!.addGroupBox(15999, 0, 5, grid!.getWidth(), 65, "Inventory Availability", $$)

	mwin!.addStaticText(15001,15,25,75,15,"On Hand:",$$)
	mwin!.addStaticText(15002,15,40,75,15,"Committed:",$$)
	mwin!.addStaticText(15003,215,25,75,15,"Available:",$$)
	mwin!.addStaticText(15004,215,40,75,15,"On Order:",$$)
	mwin!.addStaticText(15005,415,25,75,15,"Warehouse:",$$)
	mwin!.addStaticText(15006,415,40,75,15,"Type:",$$)

rem --- Save controls in the global userObj! (vector)

	userObj! = SysGUI!.makeVector()
	userObj!.addItem(grid!) 
	userObj!.addItem(mwin!)

	userObj!.addItem(mwin!.addStaticText(15101,90,25,75,15,"",$8000$))
	userObj!.addItem(mwin!.addStaticText(15102,90,40,75,15,"",$8000$))
	userObj!.addItem(mwin!.addStaticText(15103,295,25,75,15,"",$8000$))
	userObj!.addItem(mwin!.addStaticText(15104,295,40,75,15,"",$8000$))
	userObj!.addItem(mwin!.addStaticText(15105,490,25,75,15,"",$0000$))
	userObj!.addItem(mwin!.addStaticText(15106,490,40,75,15,"",$0000$))
	userObj!.addItem(mwin!.addStaticText(15107,695,25,75,15,"",$0000$)); rem Drop Ship text
