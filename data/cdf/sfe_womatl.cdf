[[SFE_WOMATL.SCRAP_FACTOR.AVAL]]
rem --- Calc Totals

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getUserInput())
	gosub calculate_totals
[[SFE_WOMATL.ALT_FACTOR.AVAL]]
rem --- Calc Totals

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getUserInput())
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.QTY_REQUIRED.AVAL]]
rem --- Verify minimum quantity > 0

	if num(callpoint!.getUserInput())<=0
		msg_id$="IV_QTY_GT_ZERO"
		gosub disp_message
		callpoint!.setColumnData("SFE_WOMATL.QTY_REQUIRED",callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"),1)
		callpoint!.setStatus("ABORT")
	endif

rem --- Calc Totals

	qty_required=num(callpoint!.getUserInput())
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.DIVISOR.AVAL]]
rem --- Calc Totals

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getUserInput())
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.<CUSTOM>]]
rem ========================================================
calculate_totals:
rem ========================================================

	wo_est_yield=num(callpoint!.getDevObject("wo_est_yield"))	
	prod_qty=num(callpoint!.getDevObject("prod_qty"))

	units=SfUtils.matQtyWorkOrd(qty_required,alt_factor,divisor,scrap_factor,wo_est_yield)

	callpoint!.setColumnData("SFE_WOMATL.UNITS",str(units),1)
	callpoint!.setColumnData("SFE_WOMATL.UNIT_COST",str(units*scrap_factor),1)
	callpoint!.setColumnData("SFE_WOMATL.TOTAL_UNITS",str(prod_qty*units),1)
	callpoint!.setColumnData("SFE_WOMATL.TOTAL_COST",str(prod_qty*units*scrap_factor),1)
	precision 2
	callpoint!.setColumnData("SFE_WOMATL.TOTAL_COST",str(num(callpoint!.getColumnData("SFE_WOMATL.TOTAL_COST"))*1)); rem jpb callpoint!.setColumnData("SFE_WOMATL.TOTAL_COST" is w(3)
	precision num(callpoint!.getDevObject("iv_precision"))

	return

rem =========================================================
explode_bills:

rem --- incoming data:
rem --- wo_no$
rem --- wo_loc$
rem --- new_bill$
rem --- sfe_womastr$

rem =========================================================

	bmm01_dev=fnget_dev("BMM_BILLMAST")
	bmm02_dev=fnget_dev("BMM_BILLMAT")
	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	ivm02_dev=fnget_dev("IVM_ITEMWHSE")
	sfe02_dev=fnget_dev("SFE_WOOPRTN")
	sfe22_dev=fnget_dev("SFE_WOMATL")
	sfe32_dev=fnget_dev("SFE_WOSUBCNT")

	dim bmm_billmast$:fnget_tpl$("BMM_BILLMAST")
	dim bmm_billmat$:fnget_tpl$("BMM_BILLMAT")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
	dim ivm_itemwhse$:fnget_tpl$("IVM_ITEMWHSE")
	dim sfe_wooprtn$:fnget_tpl$("SFE_WOOPRTN")
	dim sfe_womatl$:fnget_tpl$("SFE_WOMATL")
	dim sfe_wosubcnt$:fnget_tpl$("SFE_WOSUBCNT")

	all_bills$=new_bill$
	curr_bill$=new_bill$
	subs$=""
	mats$=""
	dim yld[99]
	yld[0]=num(sfe_womastr.est_yield$)
	yld=yld[0]

mats_next_bill:
	read (bmm02_dev,key=firm_id$+curr_bill$,dom=*next)

	while 1
mats_loop:
		dim sfe_womatl$:fattr(sfe_womatl$)
		sfe_womatl.firm_id$=firm_id$
		sfe_womatl.wo_location$=wo_loc$
		sfe_womatl.wo_no$=wo_no$

		bmm02_key$=key(bmm02_dev,end=*break)
		read record (bmm02_dev)bmm_billmat$
		if pos(firm_id$+curr_bill$=bmm02_key$)<>1 then break

		wh_unit_cost=0
		dim ivm_itemmast$:fattr(ivm_itemmast$)
		dim ivm_itemwhse$:fattr(ivm_itemwhse$)
		read record (ivm01_dev,key=firm_id$+bmm_billmat.item_id$,dom=*next)ivm_itemmast$
		w_cost=num(ivm_itemmast.maximum_qty$)
		read record(ivm02_dev,key=firm_id$+sfe_womastr.warehouse_id$+bmm_billmat.item_id$,dom=*next)ivm_itemwhse$
		w_cost=num(ivm_itemwhse.unit_cost$)		
		read record (bmm01_dev,key=firm_id$+new_bill$,dom=*next)bmm_billmast$
		eff_date$=bmm_billmat.effect_date$
		obs_date$=bmm_billmat.obsolt_date$
		gosub verify_dates
		if ok$="N" then continue

		sfe_womatl.unit_measure$=ivm_itemmast.unit_of_sale$
		sfe_womatl.require_date$=sfe_womastr.eststt_date$
		sfe_womatl.warehouse_id$=sfe_womastr.warehouse_id$
		sfe_womatl.item_id$=bmm_billmat.item_id$
		sfe_womatl.line_type$="S"

		all_bills[x,1]=num(bmm_billmat.material_seq$)
		bmm_billmat.qty_required=iff(bmm_billmat.qty_required=0,1,bmm_billmat.qty_required)
		bmm_billmat.alt_factor=iff(bmm_billmat.alt_factor=0,1,bmm_billmat.alt_factor)
		bmm_billmat.divisor=iff(bmm_billmat.divisor=0,1,bmm_billmat.divisor)
		
		sfe_womatl.divisor=bmm_billmat.divisor
		sfe_womatl.qty_required=bmm_billmat.qty_required*t
		sfe_womatl.alt_factor=bmm_billmat.alt_factor
		rem --- old record had 2 unit cost fields, I think the one below should be 2nd one... need investigation/fix
		sfe_womatl.unit_cost=w_cost
		sfe_womatl.scrap_factor=bmm_billmat.scrap_factor

		yld=iff(yld[x]=0,100,yld[x])
		material_units=SfUtils.matQty(bmm_billmat.qty_required,bmm_billmat.alt_factor,bmm_billmat.divisor,yld,bmm_billmat.scrap_factor)
		sfe_womatl.units=material_units*t
		sfe_womatl.unit_cost=material_units*w_cost*t
		sfe_womatl.total_units=	material_units*t*sfe_womastr.sch_prod_qty
		sfe_womatl.total_cost=material_units*w_cost*t*sfe_womastr.sch_prod_qty
	
		precision 2
		sfe_womatl.total_cost=sfe_womatl.total_cost*1
		precision num(callpoint!.getDevObject("iv_precision"))

		rem --- is this material line a phantom bill? (6200)
		dim bmm_billmast$:fattr(bmm_billmast$)
		dim sfe22_prev_key$:sfe22_key_tpl$
		wfattr$=fattr(sfe22_prev_key$,"MATERIAL_SEQ")
		material_seq_len=dec(wfattr$(10,2))
		seq_msk$=fill(material_seq_len,"0")
		bmm_billmast.phantom_bill$="N"
		read record(bmm01_dev,key=firm_id$+bmm_billmat.item_id$,dom=*next)bmm_billmast$

		if bmm_billmast.phantom_bill$="N"
			rem -- not phantom, or not a bill (6400)
			read (sfe22_dev,key=firm_id$+wo_loc$+wo_no$+$FF$,dom=*next)
			sfe_womatl.material_seq$=fill(material_seq_len,"0")
			sfe22_prev_key$=keyp(sfe22_dev,end=no_prev_key)
			if pos(firm_id$+wo_loc$+wo_no$=prev_sfe22key$)=1 then sfe_womatl.material_seq$=sfe22_prev_key.material_seq$
			if pos("9"<>sfe22_prev_key.material_seq$)=0 
				rem display "no more sequence numbers" message
				rem goto back_up_levels
			endif
no_prev_key:
			sfe_womatl.material_seq$=str(num(sfe22_prev_key.material_seq$)+1:seq_msk$)
			call stbl("+DIR_SYP")+"bas_sequences.bbj","INTERNAL_SEQ_NO",sfe_womatl.internal_seq_no$,rd_table_chans$[all],"QUIET"
			if ivm_itemwhse.special_ord$="Y" then sfe_womatl.po_status$="S"
			sfe_womatl$=field(sfe_womatl$)
			writerecord (sfe22_dev)sfe_womatl$
			if cvs(bmm_billmat.op_int_seq_ref$,3)<>""
				mats$=mats$+bmm_billmat.bill_no$+bmm_billmat.op_int_seq_ref$+sfe_womatl.internal_seq_no$
			endif
		else
			rem down one level; exitto mats_next_bill
			rem LEFT OFF HERE 
		endif

	wend
back_up_levels: rem --- this should be the 6900 part - move on to labor and subcontracts for phantom/subassemblies, or final

	return

rem =========================================================
verify_dates:

rem --- verify date on WO is within effective and obsolete dates
rem --- incoming data:
rem --- eff_date$ from bmm_billmat rec
rem --- obs_date$ from bmm_billmat rec
rem --- sfe_womastr$ rec

rem --- returned:  ok$ (Y/N)
rem =========================================================

	ok$="Y"
	if cvs(eff_date$,3)<>"" 
		if sfe_womastr.opened_date$<eff_date$
			ok$="N"
		endif
	endif
	if cvs(obs_date$,3)<>""
		if sfe_womastr.opened_date$>=obs_date$
			ok$="N"
		endif
	endif
	return
[[SFE_WOMATL.ITEM_ID.AVAL]]
rem --- Set default Unit Cost

	ivm02_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm02a$:fnget_tpl$("IVM_ITEMWHSE")
	whse_id$=callpoint!.getDevObject("default_wh")

	read record (ivm02_dev,key=firm_id$+whse_id$+callpoint!.getUserInput()) ivm02a$

	callpoint!.setColumnData("SFE_WOMATL.UNIT_COST",str(ivm02a.unit_cost))

	qty_required=num(callpoint!.getColumnData("SFE_WOMATL.QTY_REQUIRED"))
	alt_factor=num(callpoint!.getColumnData("SFE_WOMATL.ALT_FACTOR"))
	divisor=num(callpoint!.getColumnData("SFE_WOMATL.DIVISOR"))
	scrap_factor=num(callpoint!.getColumnData("SFE_WOMATL.SCRAP_FACTOR"))
	gosub calculate_totals
[[SFE_WOMATL.BSHO]]
use ::sfo_SfUtils.aon::SfUtils
declare SfUtils sfUtils!

rem --- init data

rem 0590 DIM T0$(0),T[10,1]
rem 0600 LET X=0,T[X,0]=1,T[X,1]=1,T=1

	all_bills$=""
	x=0
	t=1
	dim all_bills[10,1]
	all_bills[x,0]=1
	all_bills[x,1]=1

	call stbl("+DIR_SYP")+"bac_key_template.bbj","SFE_WOMATL","PRIMARY",sfe22_key_tpl$,rd_table_chans$[all],status$

rem --- if coming in from the AWRI of the header form (vs. launching manually from the Addt'l Opts)
rem --- see if we're on a new WO that's for an I-category bill, and if so explode mats/ops/subs before displaying mats

	if callpoint!.getDevObject("new_rec")="Y" and callpoint!.getDevObject("wo_category")="I" and callpoint!.getDevObject("bm")="Y"

		bmm02_dev=fnget_dev("BMM_BILLMAT")
		sfe01_dev=fnget_dev("SFE_WOMASTR")

		dim bmm_billmat$:fnget_tpl$("BMM_BILLMAT")
		dim sfe_womastr$:fnget_tpl$("SFE_WOMASTR")

		wo_no$=callpoint!.getDevObject("wo_no")
		wo_loc$=callpoint!.getDevObject("wo_loc")
		read record (sfe01_dev,key=firm_id$+wo_loc$+wo_no$,dom=*next)sfe_womastr$
		new_bill$=sfe_womastr.item_id$

		if cvs(new_bill$,3)<>""
			read(bmm02_dev,key=firm_id$+wo_no$,dom=*next)
			bmm02_key$=key(bmm02_dev,end=*endif)
rem --- rem'd for checkin until tested; temp CAH	if pos(firm_id$+wo_no$=bmm02_key$)=1 then gosub explode_bills
		endif
	endif

rem --- Disable grid if Closed Work Order or Recurring
	
	if callpoint!.getDevObject("wo_status")="C" or 
:		callpoint!.getDevObject("wo_category")="R" or
:		(callpoint!.getDevObject("wo_category")="I" and callpoint!.getDevObject("bm")="Y")
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

	callpoint!.setTableColumnAttribute("SFE_WOMATL.OPER_SEQ_REF","LDAT",ldat$)
	col_hdr$=callpoint!.getTableColumnAttribute("SFE_WOMATL.OPER_SEQ_REF","LABS")
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
[[SFE_WOMATL.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::grid_entry"
