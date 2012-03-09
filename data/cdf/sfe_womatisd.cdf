[[SFE_WOMATISD.AGRE]]
rem --- Do not commit if row has been deleted
	if callpoint!.getGridRowDeleteStatus(callpoint!.getValidationRow())="Y" then
		rem --- row has been deleted, so do not commit inventory
		break
	endif

rem --- Do not commit unless quantity issued has changed!
	sfe_womatisd_dev=fnget_dev("SFE_WOMATISD")
	dim sfe_womatisd$:fnget_tpl$("SFE_WOMATISD")
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	sfe_womatisd_key$=sfe_womatish_key$+callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO")
	readrecord(sfe_womatisd_dev,key=sfe_womatisd_key$,dom=*next)sfe_womatisd$
	start_qty_issued=sfe_womatisd.qty_issued
	qty_issued=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ISSUED"))
	if qty_issued=start_qty_issued then
		rem --- qty_issued has not changed, so do not commit inventory
		break
	endif

rem --- Init things for later
	warehouse_id$=callpoint!.getColumnData("SFE_WOMATISD.WAREHOUSE_ID")
	item_id$=callpoint!.getColumnData("SFE_WOMATISD.ITEM_ID")
	qty_ordered=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))
	tot_qty_iss=num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS"))

rem --- Inform user when item quantity is recommitted
rem --- Actually, nothing is recommitted. In the update less will be uncommitted since qty_issued has decreased.
rem --- It's this reduction in uncommitted that is being described as recommitted.
	if qty_issued<start_qty_issued then
		msg_id$="SF_ITEM_RECOMMIT"
		dim msg_tokens$[2]
		msg_tokens$[1] = str(abs(start_qty_issued-qty_issued))
		msg_tokens$[2] = cvs(item_id$, 2)
		gosub disp_message
	endif
    
rem --- Initialize inventory item update
	call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

rem --- Do initial commit if nothing previously ordered or issued
	if qty_ordered=0 and tot_qty_iss=0 then
		qty_ordered=qty_issued
		callpoint!.setColumnData("SFE_WOMATISD.QTY_ORDERED",str(qty_ordered),1)

		items$[1]=warehouse_id$
		items$[2]=item_id$
		refs[0]=qty_ordered-tot_qty_iss
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	endif

rem --- Adjust committed if issue qty exceeds ordered qty 
rem --- (For new records qty_ordered=qty_issued and tot_qty_iss=0)
	if qty_issued+tot_qty_iss>qty_ordered then
		comit_qty=qty_issued+tot_qty_iss-qty_ordered
		items$[1]=warehouse_id$
		items$[2]=item_id$
		refs[0]=qty_issued+tot_qty_iss-qty_ordered
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

		rem --- Update order quantity with adjusted committed quantity
		qty_ordered=qty_issued+tot_qty_iss
		callpoint!.setColumnData("SFE_WOMATISD.QTY_ORDERED",str(qty_ordered),1)
	endif

rem wgh ... stopped
rem wgh ... may need to update qty_issued
rem wgh ... what if more entered than qty_ordered?
rem wgh ... maybe do lot/serial before commits? ... depends on how committments are handled in sfe_wolsissu
	rem --- Lot/serial entry needed?
	if pos(callpoint!.getDevObject("lotser")="LS") then

		rem --- Item lotted/serialized and inventoried?
		ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
		dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
		warehouse_id$=callpoint!.getDevObject("warehouse_id")
		item_id$=callpoint!.getColumnData("SFE_WOMATISD.ITEM_ID")
		findrecord(ivm_itemmast_dev,key=firm_id$+item_id$,dom=*next)ivm_itemmast$
		if ivm_itemmast.lotser_item$="Y" and ivm_itemmast.inventoried$="Y" then

			rem --- All lot/serial items issued already?
			sfe_wolsissu_dev=fnget_dev("SFE_WOLSISSU")
			dim sfe_wolsissu$:fnget_tpl$("SFE_WOLSISSU")
			tot_ls_qty_issued=0
			sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
			sfe_womatisd_key$=sfe_womatish_key$+callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO")
			read(sfe_wolsissu_dev,key=sfe_womatisd_key$,dom=*next)
			while 1
				sfe_wolsissu_key$=key(sfe_wolsissu_dev,end=*break)
				if pos(sfe_womatisd_key$=sfe_wolsissu_key$)<>1 then break
				readrecord(sfe_wolsissu_dev)sfe_wolsissu$
				tot_ls_qty_issued=tot_ls_qty_issued+sfe_wolsissu.qty_issued
			wend

rem wgh ... stopped
rem wgh ... rethink this for AGRE needs ... don't commit unless qty_issued has changed!!!!
rem wgh ... make sure this plays well with lookup via AOPT-LENT
			if tot_ls_qty_issued<>qty_issued+num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS")) then
				sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
				sfe_womatisd_key$=sfe_womatish_key$+callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO")
				callpoint!.setDevObject("sfe_womatisd_key",sfe_womatisd_key$)
				callpoint!.setDevObject("womatisd_seq_ref",callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO"))
				callpoint!.setDevObject("item_id",callpoint!.getColumnData("SFE_WOMATISD.ITEM_ID"))
				callpoint!.setDevObject("womatisd_qty_issued",qty_issued)
				call stbl("+DIR_SYP")+"bam_run_prog.bbj","SFE_WOLSISSU",stbl("+USER_ID"),"","",table_chans$[all],"",dflt_data$[all]
rem wgh ... stopped here
rem wgh ... may need to update qty_issued
rem wgh ... what if more entered than qty_ordered?
rem wgh ... maybe do lot/serial before commits? ... depends on how committments are handled in sfe_wolsissu
qty_issued=num(callpoint!.setDevObject("tot_ls_qty_issued"))
callpoint!.setColumnData("SFE_WOMATISD.QTY_ISSUED",str(qty_issued),1)
if qty_issued<>0 then
	issue_cost=num(callpoint!.setDevObject("tot_ls_issue_cost"))/qty_issued
	unit_cost=issue_cost
	callpoint!.setColumnData("SFE_WOMATISD.UNIT_COST",str(unit_cost),0)
	callpoint!.setColumnData("SFE_WOMATISD.ISSUE_COST",str(issue_cost),1)
endif
rem wgh ... 4185 IF T0<>W[3] THEN LET W[3]=T0,O0=2,I0=5
rem wgh ... 4187 IF T0<>0 THEN IF W[4]<>T1/T0 THEN LET W[4]=T1/T0,O0=2,I0=5
rem wgh ... 4188 IF T0<>0 THEN LET W[2]=T1/T0,C[11]=W[2]

rem wgh ... 2570 IF W[2]=0 THEN LET W[2]=C[11]
rem wgh ... 2580 LET W[4]=C[11]
			endif
		endif
	endif
rem wgh ... stopped
rem wgh ... test with item 300 - inventoried and serialized

rem --- Init DISPLAY columns
	gosub init_display_cols
[[SFE_WOMATISD.AOPT-LENT]]
rem wgh ... stopped
rem wgh ... need to enable/disable LENT option
rem wgh ... disable unless ... ivm_itemmast.lotser_item$="Y" and ivm_itemmast.inventoried$="Y"


rem --- Lot/serial entry
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	sfe_womatisd_key$=sfe_womatish_key$+callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO")
	callpoint!.setDevObject("sfe_womatisd_key",sfe_womatisd_key$)
	callpoint!.setDevObject("womatisd_seq_ref",callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO"))
	callpoint!.setDevObject("item_id",callpoint!.getColumnData("SFE_WOMATISD.ITEM_ID"))
	callpoint!.setDevObject("womatisd_qty_issued",callpoint!.getColumnData("SFE_WOMATISD.QTY_ISSUED"))
	call stbl("+DIR_SYP")+"bam_run_prog.bbj","SFE_WOLSISSU",stbl("+USER_ID"),"","",table_chans$[all],"",dflt_data$[all]
rem wgh ... stopped
rem wgh ... may need to update qty_issued
rem wgh ... what if more entered than qty_ordered?
rem wgh ... maybe do lot/serial before commits
rem wgh ... callpoint!.setDevObject("tot_ls_qty_issued",tot_ls_qty_issued)
rem wgh ... callpoint!.setDevObject("tot_ls_issue_cost",tot_ls_issue_cost)
rem wgh ... 4185 IF T0<>W[3] THEN LET W[3]=T0,O0=2,I0=5
rem wgh ... 4187 IF T0<>0 THEN IF W[4]<>T1/T0 THEN LET W[4]=T1/T0,O0=2,I0=5
rem wgh ... 4188 IF T0<>0 THEN LET W[2]=T1/T0,C[11]=W[2]
rem wgh ... 2570 IF W[2]=0 THEN LET W[2]=C[11]
rem wgh ... 2580 LET W[4]=C[11]
[[SFE_WOMATISD.BGDS]]
rem --- Init Java classes
	use ::sfo_SfUtils.aon::SfUtils

rem --- Init lot/serial additional option
	switch pos(callpoint!.getDevObject("lotser")="LS")
		case 1
			callpoint!.setOptionText("LENT",Translate!.getTranslation("AON_LOT_ENTRY"))
			break
		case 2
			callpoint!.setOptionText("LENT",Translate!.getTranslation("AON_SERIAL_ENTRY"))
			break
		case default
			callpoint!.setOptionEnabled("LENT",0)
			break
	swend
[[SFE_WOMATISD.BDEL]]
rem --- Has record been written yet?
	sfe_womatisd_dev=fnget_dev("SFE_WOMATISD")
	dim sfe_womatisd$:fnget_tpl$("SFE_WOMATISD")
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	sfe_womatisd_key$=sfe_womatish_key$+callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO")
	found=0
	readrecord(sfe_womatisd_dev,key=sfe_womatisd_key$,dom=*next)sfe_womatisd$; found=1
	if !found then
		rem --- Record not written yet, so don't uncommit inventory
		break
	endif

rem --- Retain commitment on delete?
	msg_id$="SF_DELETE_ISSUE"
	gosub disp_message
	if msg_opt$="C" then
		callpoint!.setStatus("ABORT")
		break
	endif
	del_issue_only$=msg_opt$
	callpoint!.setDevObject("del_issue_only",msg_opt$)

rem --- Initialize inventory item update
	call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

rem --- Delete lot/serial and inventory commitments. Must do this before sfe_womatisd records are removed.
	sfe_womatdtl_dev=fnget_dev("SFE_WOMATDTL")
	dim sfe_womatdtl$:fnget_tpl$("SFE_WOMATDTL")
	sfe_wolsissu_dev=fnget_dev("SFE_WOLSISSU")
	dim sfe_wolsissu$:fnget_tpl$("SFE_WOLSISSU")

	rem --- Delete lot/serial commitments, but keep inventory commitments (for now)
	if pos(callpoint!.getDevObject("lotser")="LS") then
		read(sfe_wolsissu_dev,key=sfe_womatish_key$+sfe_womatisd.womatisd_seq_no$,dom=*next)
		while 1
			sfe_wolsissu_key$=key(sfe_wolsissu_dev,end=*break)
			if pos(sfe_womatish_key$+sfe_womatisd.womatisd_seq_no$=sfe_wolsissu_key$)<>1 then break
			readrecord(sfe_wolsissu_dev)sfe_wolsissu$

			rem --- Delete lot/serial commitments
			items$[1]=sfe_womatisd.warehouse_id$
			items$[2]=sfe_womatisd.item_id$
			items$[3]=sfe_wolsissu.lotser_no$
			refs[0]=sfe_wolsissu.qty_issued
			call stbl("+DIR_PGM")+"ivc_itemupdt.aon","UC",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

			rem --- Keep inventory commitments (for now)
			items$[3]=" "
			call stbl("+DIR_PGM")+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
rem wgh ... stopped
rem wgh ... test if remove is needed with cascaded deletes
			remove(sfe_wolsissu_dev,key=sfe_wolsissu_key$)
		wend
	endif

	rem --- Delete inventory commitments if not being retained
	if del_issue_only$="N" then
		items$[1]=sfe_womatisd.warehouse_id$
		items$[2]=sfe_womatisd.item_id$
		refs[0]=sfe_womatisd.qty_ordered-sfe_womatisd.tot_qty_iss
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon","UC",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

		found=0
		sfe_womatdtl_key$=sfe_womatish_key$+sfe_womatisd.womatdtl_seq_ref$
		readrecord(sfe_womatdtl_dev,key=sfe_womatdtl_key$,dom=*next)sfe_womatdtl$; found=1
		if found then
			sfe_womatdtl.qty_ordered=0
			writerecord(sfe_womatdtl_dev,key=sfe_womatdtl_key$)sfe_womatdtl$
		endif
	endif

rem wgh ... stopped
rem wgh ... test with item 300 - inventoried and serialized
[[SFE_WOMATISD.AUDE]]
rem --- It is "safer" to use qty_issued from what was restored to disk rather than the grid row
rem --- even though they "should" be the same. 
rem --- Was record written?
	sfe_womatisd_dev=fnget_dev("SFE_WOMATISD")
	dim sfe_womatisd$:fnget_tpl$("SFE_WOMATISD")
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	sfe_womatisd_key$=sfe_womatish_key$+callpoint!.getColumnData("SFE_WOMATISD.WOMATISD_SEQ_NO")
	found=0
	readrecord(sfe_womatisd_dev,key=sfe_womatisd_key$,dom=*next)sfe_womatisd$; found=1
	if !found then
		rem --- Record written , so do not undelete (recommit)
		break
	endif

rem --- Do not undelete (recommit) if order quantity is zero
	qty_ordered=sfe_womatisd.qty_ordered
	if qty_ordered=0 then
		rem --- qty_ordered is zero, so there is nothing to undelete (recommit)
		break
	endif

rem --- Initialize inventory item update
	call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status

rem --- Can't undelete lot/serial commitments (recommit) because that info has been lost for good. They'll have to re-enter it.

rem --- Were commitments retained during delete? No if sfe_womatdtl.qty_ordered=0
	sfe_womatdtl_dev=fnget_dev("SFE_WOMATDTL")
	dim sfe_womatdtl$:fnget_tpl$("SFE_WOMATDTL")
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	sfe_womatdtl_key$=sfe_womatish_key$+sfe_womatisd.womatdtl_seq_ref$
	readrecord(sfe_womatdtl_dev,key=sfe_womatdtl_key$,dom=*next)sfe_womatdtl$
	if sfe_womatdtl.qty_ordered=0 then
		rem --- Undelete inventory commitments (recommit)
		sfe_womatdtl.qty_ordered=qty_ordered
		writerecord(sfe_womatdtl_dev,key=sfe_womatdtl_key$)sfe_womatdtl$

		items$[1]=sfe_womatisd.warehouse_id$
		items$[2]=sfe_womatisd.item_id$
		refs[0]=sfe_womatisd.qty_ordered-sfe_womatisd.tot_qty_iss
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	endif

rem --- Init DISPLAY columns
	gosub init_display_cols

rem wgh ... stopped
rem wgh ... test with item 300 - inventoried and serialized
[[SFE_WOMATISD.ITEM_ID.AVAL]]
rem --- Item ID is disabled except for a new row, so can init entire new row here.
	item_id$=callpoint!.getUserInput()
	if item_id$=callpoint!.getColumnData("SFE_WOMATISD.ITEM_ID") then
		rem --- Do not re-init if user returns to item_id field on a new row
		break
	endif

	rem --- Get Warehouse ID and Issued Date from header
	warehouse_id$=callpoint!.getDevObject("warehouse_id")
	required_date$=callpoint!.getDevObject("issued_date")

	rem -- Get Unit of Measure and Unit Cost for this item
	ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
	ivm_itemwhse_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm_itemwhse$:fnget_tpl$("IVM_ITEMWHSE")
	findrecord(ivm_itemmast_dev,key=firm_id$+item_id$,dom=*next)ivm_itemmast$
	unit_measure$=ivm_itemmast.unit_of_sale$
	findrecord(ivm_itemwhse_dev,key=firm_id$+warehouse_id$+item_id$,dom=*next)ivm_itemwhse$
	unit_cost=ivm_itemwhse.unit_cost
	issue_cost=ivm_itemwhse.unit_cost

	rem --- Check item for commitments
	sfe_womatdtl_dev=fnget_dev("SFE_WOMATDTL")
	dim sfe_womatdtl$:fnget_tpl$("SFE_WOMATDTL")
	sfe_womatish_key$=callpoint!.getDevObject("sfe_womatish_key")
	read(sfe_womatdtl_dev,key=sfe_womatish_key$,dom=*next)
	while 1
		sfe_womatdtl_key$=key(sfe_womatdtl_dev,end=*break)
		if pos(sfe_womatish_key$=sfe_womatdtl_key$)<>1 then break
		readrecord(sfe_womatdtl_dev)sfe_womatdtl$
		rem --- Looking for matching warehouse and item
		if sfe_womatdtl.warehouse_id$+sfe_womatdtl.item_id$=warehouse_id$+item_id$ then
			unit_measure$=sfe_womatdtl.unit_measure$
			womatdtl_seq_ref$=sfe_womatdtl.womatdtl_seq_no$
			warehouse_id$=sfe_womatdtl.warehouse_id$
			item_id$=sfe_womatdtl.item_id$
			require_date$=sfe_womatdtl.require_date$
			qty_ordered=sfe_womatdtl.qty_ordered
			tot_qty_iss=sfe_womatdtl.tot_qty_iss
			unit_cost=iff(sfe_womatdtl.unit_cost=0,ivm_itemwhse.unit_cost,sfe_womatdtl.unit_cost)
			qty_issued=sfe_womatdtl.qty_issued
			issue_cost=sfe_womatdtl.issue_cost
			break; rem --- found the one we were looking for
		endif
	wend

	rem --- Set and display data for new row
	callpoint!.setColumnData("SFE_WOMATISD.UNIT_MEASURE",unit_measure$,1)
	callpoint!.setColumnData("SFE_WOMATISD.WOMATDTL_SEQ_REF",womatdtl_seq_ref$,0)
	callpoint!.setColumnData("SFE_WOMATISD.WAREHOUSE_ID",warehouse_id$,0)
	callpoint!.setColumnData("SFE_WOMATISD.ITEM_ID",item_id$,1)
	callpoint!.setColumnData("SFE_WOMATISD.REQUIRE_DATE",required_date$,1)
	callpoint!.setColumnData("SFE_WOMATISD.QTY_ORDERED",str(qty_ordered),1)
	callpoint!.setColumnData("SFE_WOMATISD.TOT_QTY_ISS",str(tot_qty_iss),0)
	callpoint!.setColumnData("SFE_WOMATISD.UNIT_COST",str(unit_cost),0)
	callpoint!.setColumnData("SFE_WOMATISD.QTY_ISSUED",str(qty_issued),1)
	callpoint!.setColumnData("SFE_WOMATISD.ISSUE_COST",str(issue_cost),1)
	gosub init_display_cols; rem --- Init DISPLAY columns
	gosub disable_by_item; rem --- Enable/disable unit of measure
[[SFE_WOMATISD.QTY_ISSUED.AVAL]]
rem --- Can't un-issue (negative issue) more than have already been issued.
	qty_issued=num(callpoint!.getUserInput())
	if qty_issued<0 and abs(qty_issued)>num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS")) and
:	num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))<>0 then
		msg_id$="SF_MAX_NEG_ISSU"
		dim msg_tokens$[1]
		msg_tokens$[1] = callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS")
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Init DISPLAY columns
	callpoint!.setColumnData("SFE_WOMATISD.QTY_ISSUED",callpoint!.getUserInput())
	gosub init_display_cols
[[SFE_WOMATISD.<CUSTOM>]]
init_display_cols: rem --- Init DISPLAY columns
	qty_ordered=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))
	tot_qty_iss=num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS"))
	callpoint!.setColumnData("<<DISPLAY>>.QTY_REMAIN",str(qty_ordered-tot_qty_iss),1)

	qty_issued=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ISSUED"))
	issue_cost=num(callpoint!.getColumnData("SFE_WOMATISD.ISSUE_COST"))
	callpoint!.setColumnData("<<DISPLAY>>.VALUE",str(qty_issued*issue_cost),1)
	return

disable_by_item: rem --- Set enable/disable based on item ID
	ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
	findrecord(ivm_itemmast_dev,key=firm_id$+item_id$,dom=*next)ivm_itemmast$
	if ivm_itemmast.inventoried$="Y" then
		callpoint!.setColumnEnabled(num(callpoint!.getValidationRow()),"SFE_WOMATISD.UNIT_MEASURE",0)

	else
		callpoint!.setColumnEnabled(num(callpoint!.getValidationRow()),"SFE_WOMATISD.UNIT_MEASURE",1)
	endif
	return
[[SFE_WOMATISD.AGDR]]
rem --- Init DISPLAY columns
	gosub init_display_cols

rem --- Enable/disable unit of measure
	item_id$=callpoint!.getColumnData("SFE_WOMATISD.ITEM_ID")
	gosub disable_by_item
[[SFE_WOMATISD.BGDR]]
rem --- Init DISPLAY columns

	qty_ordered=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ORDERED"))
	tot_qty_iss=num(callpoint!.getColumnData("SFE_WOMATISD.TOT_QTY_ISS"))
	callpoint!.setColumnData("<<DISPLAY>>.QTY_REMAIN",str(qty_ordered-tot_qty_iss),1)

	qty_issued=num(callpoint!.getColumnData("SFE_WOMATISD.QTY_ISSUED"))
	issue_cost=num(callpoint!.getColumnData("SFE_WOMATISD.ISSUE_COST"))
	callpoint!.setColumnData("<<DISPLAY>>.VALUE",str(qty_issued*issue_cost),1)
[[SFE_WOMATISD.AGRN]]
rem --- Init DISPLAY columns
	gosub init_display_cols
[[SFE_WOMATISD.ADGE]]
rem --- Set precision
	precision num(callpoint!.getDevObject("precision"))
[[SFE_WOMATISD.ITEM_ID.AINV]]
rem --- Item synonym processing
	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::grid_entry"
