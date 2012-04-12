[[SFE_WOSUBCNT.PO_NO.AVAL]]





[[SFE_WOSUBCNT.BGDR]]
rem --- get PO#/req# and ISN, load up corresponding item info

	switch pos(callpoint!.getColumnData("SFE_WOSUBCNT.PO_STATUS")="RP")
		case 1;rem requisition
			call stbl("+DIR_SYP")+"bac_key_template.bbj","POE_REQDET","PRIMARY",key_tpl$,rd_table_chans$[all],status$
			dim po_req_key$:key_tpl$
		break
		case 2; rem po
			call stbl("+DIR_SYP")+"bac_key_template.bbj","POE_PODET","PRIMARY",key_tpl$,rd_table_chans$[all],status$
			dim po_req_key$:key_tpl$
		break
	swend
	po_req_key$=firm_id$+callpoint!.getColumnData("SFE_WOSUBCNT.PO_NO")+callpoint!.getColumnData("SFE_WOSUBCNT.PUR_ORD_SEQ_REF")

	gosub get_po_info

	callpoint!.setColumnData("<<DISPLAY>>.DISP_ITEM",line_desc$,1)
[[SFE_WOSUBCNT.PO_NO.BINQ]]
rem --- call custom inquiry depending on whether we're looking for PO or Req.

	switch pos(callpoint!.getColumnData("SFE_WOSUBCNT.PO_STATUS")="RP")
		case 1;rem requisition

			call stbl("+DIR_SYP")+"bac_key_template.bbj","POE_REQDET","PRIMARY",key_tpl$,rd_table_chans$[all],status$
			dim po_req_key$:key_tpl$
			dim search_defs$[2]
			dim filter_defs$[3,2]
			filter_defs$[0,0]="POE_REQHDR.FIRM_ID"
			filter_defs$[0,1]="='"+firm_id$ +"'"
			filter_defs$[0,2]="LOCK"
			filter_defs$[1,0]="POE_REQHDR.VENDOR_ID"
			filter_defs$[1,1]="='"+callpoint!.getColumnData("SFE_WOSUBCNT.VENDOR_ID")+"'"
			filter_defs$[1,2]="LOCK"
			filter_defs$[3,0]="POE_REQDET.WO_NO"
			filter_defs$[3,1]="='' "
			filter_defs$[3,2]="LOCK"
 
                		call stbl("+DIR_SYP")+"bax_query.bbj",gui_dev,form!,"REQDETAIL","",table_chans$[all],po_req_key$,filter_defs$[all]
		break
		case 2;rem PO

			call stbl("+DIR_SYP")+"bac_key_template.bbj","POE_PODET","PRIMARY",key_tpl$,rd_table_chans$[all],status$
			dim po_req_key$:key_tpl$
			dim search_defs$[2]
			dim filter_defs$[3,2]
			filter_defs$[1,0]="POE_POHDR.FIRM_ID"
			filter_defs$[1,1]="='"+firm_id$ +"'"
			filter_defs$[1,2]="LOCK"
			filter_defs$[2,0]="POE_POHDR.VENDOR_ID"
			filter_defs$[2,1]="='"+callpoint!.getColumnData("SFE_WOSUBCNT.VENDOR_ID")+"'"
			filter_defs$[2,2]="LOCK"
			filter_defs$[3,0]="POE_PODET.WO_NO"
			filter_defs$[3,1]="='' "
			filter_defs$[3,2]="LOCK"
	
                		call stbl("+DIR_SYP")+"bax_query.bbj",gui_dev,form!,"PODETAIL","",table_chans$[all],po_req_key$,filter_defs$[all]

		break
		case default
		break
	swend

	gosub get_po_info
	
	rem --- this isn't code complete, yet.  Before moving into callpoint! object, need to gosub routine to update corresponding PO
	rem --- if our PO# was empty, now isn't, update PO w/ WO#
	rem --- if our PO# wasn't empty, now is, remove WO# from that PO
	rem --- if our PO# has been changed (i.e., wasn't empty, still isn't, and <>), then remove WO# from old PO and update WO# in new PO
	
	if cvs(po_req_key$,3)<>""
		callpoint!.setColumnData("SFE_WOSUBCNT.PO_NO",po_req_no$,1)
		callpoint!.setColumnData("SFE_WOSUBCNT.PUR_ORD_SEQ_REF",po_req_line$,1)
		callpoint!.setColumnData("<<DISPLAY>>.DISP_ITEM",line_desc$,1)
		callpoint!.setStatus("MODIFIED")
	endif

	callpoint!.setStatus("ACTIVATE-ABORT")
	
[[SFE_WOSUBCNT.LINE_TYPE.AVAL]]
rem --- enable/disable PO-related fields based on PO Status (enabled if P or R)
	
	line_type$=callpoint!.getUserInput()
	gosub enable_po_fields
[[SFE_WOSUBCNT.AGRN]]
rem --- enable/disable PO-related fields based on PO Status (enabled if P or R)
	
	line_type$=callpoint!.getColumnData("SFE_WOSUBCNT.LINE_TYPE")
	gosub enable_po_fields
[[SFE_WOSUBCNT.PO_STATUS.AVAL]]
rem --- Disable PO Number and Sequence?

	if cvs(callpoint!.getUserInput(),2)="" or callpoint!.getUserInput()="C"
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PUR_ORD_SEQ_REF",0)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_NO",0)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.LEAD_TIME",0)
	else
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PUR_ORD_SEQ_REF",1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_NO",1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.LEAD_TIME",1)
	endif
 
	if callpoint!.getUserInput()<>callpoint!.getColumnData("SFE_WOSUBCNT.PO_STATUS") and cvs(callpoint!.getColumnData("SFE_WOSUBCNT.PO_STATUS"),3)<>""
		callpoint!.setColumnData("<<DISPLAY>>.DISP_ITEM","",1)
		callpoint!.setColumnData("SFE_WOSUBCNT.PO_NO","",1)
		callpoint!.setColumnData("SFE_WOSUBCNT.PUR_ORD_SEQ_REF","",1)
	endif
[[SFE_WOSUBCNT.UNITS.AVAL]]
rem --- Verify minimum quantity > 0

	if num(callpoint!.getUserInput())<=0
		msg_id$="IV_QTY_GT_ZERO"
		gosub disp_message
		callpoint!.setColumnData("SFE_WOSUBCNT.UNITS",callpoint!.getColumnData("SFE_WOSUBCNT.UNITS"),1)
		callpoint!.setStatus("ABORT")
	endif

rem --- Calc numbers

	units=num(callpoint!.getUserInput())
	rate=num(callpoint!.getColumnData("SFE_WOSUBCNT.RATE"))
	gosub calc_totals
[[SFE_WOSUBCNT.RATE.AVAL]]
rem --- Calc numbers

	units=num(callpoint!.getColumnData("SFE_WOSUBCNT.UNITS"))
	rate=num(callpoint!.getUserInput())
	gosub calc_totals
[[SFE_WOSUBCNT.<CUSTOM>]]
rem ========================================================
calc_totals:
rem rate:		input
rem units:	input
rem ========================================================

	prod_qty=num(callpoint!.getDevObject("prod_qty"))
	
	callpoint!.setColumnData("SFE_WOSUBCNT.UNIT_COST",str(units*rate),1)
	callpoint!.setColumnData("SFE_WOSUBCNT.TOTAL_UNITS",str(units*prod_qty),1)
	callpoint!.setColumnData("SFE_WOSUBCNT.TOTAL_COST",str(units*rate*prod_qty),1)

	return

rem ========================================================
enable_po_fields:
rem line_type:	input
rem ========================================================

	if line_type$="S"
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_STATUS",1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PUR_ORD_SEQ_REF",1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_NO",1)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.LEAD_TIME",1)
	else
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_STATUS",0)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PUR_ORD_SEQ_REF",0)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.PO_NO",0)
		callpoint!.setColumnEnabled(callpoint!.getValidationRow(),"SFE_WOSUBCNT.LEAD_TIME",0)
	endif

	return

rem ========================================================
get_po_info:
rem po_req_key$:	input
rem po_req_no$:	output
rem po_req_line$:	output
rem line_desc$:	output
rem ========================================================

	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")

	poe11_dev=fnget_dev("POE_PODET")
	poe_podet_tpl$=fnget_tpl$("POE_PODET")

	poe12_dev=fnget_dev("POE_REQDET")
	poe_reqdet_tpl$=fnget_tpl$("POE_REQDET")

	line_desc$=""

	rem --- po_req_key$ will be firm/po or req#/ISN; need to read that PO line to get item/description for display in grid, and store ISN in subcontract rec.
	if po_req_key$<>""
		if po_req_key$(len(po_req_key$),1)="^" then po_req_key$=po_req_key$(1,len(po_req_key$)-1)
		switch pos(callpoint!.getColumnData("SFE_WOSUBCNT.PO_STATUS")="RP")
			case 1;rem requisition
				po_req_dev=poe12_dev	
				po_req_no$=po_req_key.req_no$
				po_req_line$=po_req_key.internal_seq_no$
				dim po_req_det$:poe_reqdet_tpl$
			break
			case 2; rem po
				po_req_dev=poe11_dev
				po_req_no$=po_req_key.po_no$
				po_req_line$=po_req_key.internal_seq_no$
				dim po_req_det$:poe_podet_tpl$
			break
			case default
			break	
		swend
			
		read record(po_req_dev,key=firm_id$+po_req_no$+po_req_line$,dom=*next)po_req_det$
		if cvs(po_req_det.item_id$,3)<>""
			read record (ivm01_dev,key=firm_id$+po_req_det.item_id$,dom=*next)ivm_itemmast$
			line_desc$=cvs(ivm_itemmast.item_id$,3)+" - "+cvs(ivm_itemmast.item_desc$,3)
		else
			line_desc$=cvs(po_req_det.order_memo$,3)
		endif		

	endif

	return
[[SFE_WOSUBCNT.BSHO]]
rem --- Disable grid if Closed Work Order or Recurring or PO not installed

	if callpoint!.getDevObject("wo_status")="C" or callpoint!.getDevObject("wo_category")="R" or callpoint!.getDevObject("po")<>"Y"
		opts$=callpoint!.getTableAttribute("OPTS")
		callpoint!.setTableAttribute("OPTS",opts$+"BID")

		x$=callpoint!.getTableColumns()
		for x=1 to len(x$) step 40
			opts$=callpoint!.getTableColumnAttribute(cvs(x$(x,40),2),"OPTS")
			callpoint!.setTableColumnAttribute(cvs(x$(x,40),2),"OPTS",o$+"C"); rem - makes cells read only
		next x
	endif

rem --- fill listbox for use with Op Sequence

	sfe02_dev=fnget_dev("SFE_WOOPRTN")
	dim sfe02a$:fnget_tpl$("SFE_WOOPRTN")
	op_code=callpoint!.getDevObject("opcode_chan")
	dim op_code$:callpoint!.getDevObject("opcode_tpl")
	wo_no$=callpoint!.getDevObject("wo_no")
	wo_loc$=callpoint!.getDevObject("wo_loc")

	ops_lines!=SysGUI!.makeVector()
	ops_items!=SysGUI!.makeVector()
	ops_list!=SysGUI!.makeVector()
	ops_lines!.addItem("000000000000")
	ops_items!.addItem("")
	ops_list!.addItem("")

	read(sfe02_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)
	while 1
		read record (sfe02_dev,end=*break) sfe02a$
		if pos(firm_id$+wo_loc$+wo_no$=sfe02a$)<>1 break
		if sfe02a.line_type$<>"S" continue
		dim op_code$:fattr(op_code$)
		read record (op_code,key=firm_id$+sfe02a.op_code$,dom=*next)op_code$
		ops_lines!.addItem(sfe02a.internal_seq_no$)
		ops_items!.addItem(sfe02a.op_code$)
		ops_list!.addItem(sfe02a.op_code$+" - "+op_code.code_desc$)
	wend

	if ops_lines!.size()>0
		ldat$=""
		for x=0 to ops_lines!.size()-1
			ldat$=ldat$+ops_items!.getItem(x)+"~"+ops_lines!.getItem(x)+";"
		next x
	endif

	callpoint!.setTableColumnAttribute("SFE_WOSUBCNT.OPER_SEQ_REF","LDAT",ldat$)
	col_hdr$=callpoint!.getTableColumnAttribute("SFE_WOSUBCNT.OPER_SEQ_REF","LABS")
	my_grid!=Form!.getControl(5000)
	num_grid_cols=my_grid!.getNumColumns()
	ListColumn=-1
	for xwk=0 to num_grid_cols-1
		if my_grid!.getColumnHeaderCellText(xwk)=col_hdr$ then ListColumn=xwk
	next xwk
	if ListColumn>=0
		my_control!=my_grid!.getColumnListControl(ListColumn)
		my_control!.removeAllItems()
		my_control!.insertItems(0,ops_list!)
		my_grid!.setColumnListControl(ListColumn,my_control!)
	endif

rem --- Check for PO Installed
rem --- confusion in old code - seems subs grid isn't accessible if PO not installed, but other tests in the code look at the PO flag
rem --- so even tho' code above says to disable the entire grid if PO not installed, leaving this if/else as is for now.

	if callpoint!.getDevObject("po")<>"Y"
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.PO_STATUS",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.PUR_ORD_SEQ_REF",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.PO_NO",-1)
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.LEAD_TIME",-1)
	else
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.PO_STATUS",1)
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.PUR_ORD_SEQ_REF",1)
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.PO_NO",1)
		callpoint!.setColumnEnabled(-1,"SFE_WOSUBCNT.LEAD_TIME",1)
	endif
