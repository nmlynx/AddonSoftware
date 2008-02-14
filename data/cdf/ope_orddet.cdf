[[OPE_ORDDET.QTY_SHIPPED.AVEC]]
rem --- update header
	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.QTY_ORDERED.AVEC]]
rem --- update header
escape;rem avec
	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.QTY_BACKORD.AVEC]]
rem --- update header
	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.ARAR]]
rem --- 
	g!=form!.getControl(1109).getControl(5900)
	cur_row=g!.getSelectedRow()
	cur_col=g!.getSelectedColumn()
rem 	header!=g!.getHeader()
rem escape;rem ? cur_row and cur_col
	user_tpl.line_boqty=rec_data.qty_backord
	user_tpl.line_shipqty=rec_data.qty_shipped
[[OPE_ORDDET.AREC]]
escape; rem after new rec
	user_tpl.line_boqty=0
	user_tpl.line_shipqty=0
[[OPE_ORDDET.BSHO]]
rem --- Set user template
	
[[OPE_ORDDET.QTY_SHIPPED.AVAL]]
rem ---recalc quantities and extended price
	shipqty=num(callpoint!.getUserInput())
	ordqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))
	if shipqty>ordqty
		callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",str(user_tpl.line_shipqty))
		msg_id$="SHIP_EXCEEDS_ORD"
		gosub disp_message
		callpoint!.setStatus("ABORT-REFRESH")
	else
		callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD",str(ordqty-shipqty))

		unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
		new_ext_price=ordqty*unit_price

		callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
		callpoint!.setStatus("MODIFIED-REFRESH")
	endif
	user_tpl.line_shipqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_SHIPPED"))
[[OPE_ORDDET.QTY_ORDERED.AVAL]]
rem ---recalc quantities and extended price
	newqty=num(callpoint!.getUserInput())
	callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD","0")
	callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",str(newqty))

	unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
	new_ext_price=newqty*unit_price

	callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
rem	callpoint!.setStatus("MODIFIED-REFRESH")
[[OPE_ORDDET.QTY_BACKORD.AVAL]]
rem ---recalc quantities and extended price
	boqty=num(callpoint!.getUserInput())
	ordqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))
	if boqty>ordqty
		callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD",str(user_tpl.line_boqty))
		msg_id$="BO_EXCEEDS_ORD"
		gosub disp_message
		callpoint!.setStatus("ABORT-REFRESH")
	else
		shipqty=ordqty-boqty
		callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",str(shipqty))

		unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
		new_ext_price=ordqty*unit_price

		callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
		callpoint!.setStatus("MODIFIED-REFRESH")
	endif
	user_tpl.line_boqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_BACKORD"))
[[OPE_ORDDET.<CUSTOM>]]
calc_grid_tots:
	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	tamt=0
	if numrecs>0
		for reccnt=0 to numrecs-1
			gridrec$=recVect!.getItem(reccnt)
			tamt=tamt+num(gridrec.ext_price$)
		next reccnt
		user_tpl.ord_tot=tamt
	endif
return

disp_totals: rem --- get context and ID of total amount display control, and redisplay w/ amts from calc_tots
	tamt!=UserObj!.getItem(1)
	tamt!.setValue(user_tpl.ord_tot)
return

update_totals: rem --- Update Order/Invoice Totals & Commit Inventory
	dim iv_files[44],iv_info$[3],iv_info[0],iv_params$[4],iv_refs$[11],iv_refs[5]
	iv_files[0]=fnget_dev("GLS_PARAMS")
	iv_files[1]=fnget_dev("IVM_ITEMMAST")
	iv_files[2]=fnget_dev("IVM_ITEMWHSE")
	iv_files[4]=fnget_dev("IVM_ITEMTIER")
	iv_files[5]=fnget_dev("IVM_ITEMVEND")
	iv_files[7]=fnget_dev("IVM_LSMASTER")
	iv_files[8]=fnget_dev("IVX_LSXREF")
	iv_files[12]=fnget_dev("IVM_ITEMACCT")
	iv_files[17]=fnget_dev("IVM_LSACT")
	iv_files[41]=fnget_dev("IVT_LSTRANS")
	iv_files[42]=fnget_dev("IVX_LSCUST")
	iv_files[43]=fnget_dev("IVX_LSVEND")
	iv_fles[44]=fnget_dev("IVT_ITEMTRAN")
escape; rem decisions have to be made about ivc_ua (ivc_itemupt.aon)
	U[0]=U[0]+S8*line_sign
	U[1]=U[1]+S9*line_sign
	U[2]=U[2]+S0*line_sign
	while 1
		if pos(S8$(2,1)="SP")=0 break
		if s8$(3,1)="Y" or a0$(21,1)="P" break; REM "Drop ship or quote
		iv_info$[1]=s8$(4,2),iv_info$[2]=s8$(6,20),iv_info$[3]="",iv_refs[0]=s7
		if line_sign>0 iv_action$="OE" else iv_action$="UC"
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon",iv_action$,iv_files[all],iv_info[all],iv_params$[all],
:			iv_info$[all],iv_refs$[all],iv_refs[all],iv_status
		break
	wend
return

#include std_missing_params.src
[[OPE_ORDDET.LINE_CODE.AVAL]]
rem --- set enable/disable based on line type
	line_code$=callpoint!.getColumnData("OPE_ORDDET.LINE_CODE")
	if cvs(line_code$,2)<>""
		opc_linecode_dev=fnget_dev("OPC_LINECODE")
		dim opc_linecode$:fnget_tpl$("OPC_LINECODE")
		read record (opc_linecode_dev,key=firm_id$+line_code$,dom=*next)opc_linecode$
		callpoint!.setStatus("ENABLE:"+opc_linecode.line_type$)
	endif
