[[OPE_ORDDET.QTY_SHIPPED.AVAL]]
rem ---recalc quantities and extended price
	shipqty=num(callpoint!.getUserInput())
	ordqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))
	if shipqty>ordqty
		callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",callpoint!.getColumnUndoData("OPE_ORDDET.QTY_SHIPPED"))
		msg_id$="SHIP_EXCEEDS_ORD"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	else
		callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD",str(shipqty-ordqty))

		unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
		new_ext_price=newqty*unit_price

		callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
		callpoint!.setStatus("MODIFIED-REFRESH")
	endif
[[OPE_ORDDET.QTY_ORDERED.AVAL]]
rem ---recalc quantities and extended price
	newqty=num(callpoint!.getUserInput())
	callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD","0")
	callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",str(newqty))

	unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
	new_ext_price=newqty*unit_price

	callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
	callpoint!.setStatus("MODIFIED-REFRESH")
[[OPE_ORDDET.QTY_BACKORD.AVAL]]
rem ---recalc quantities and extended price
	boqty=num(callpoint!.getUserInput())
	ordqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))
	if boqty>ordqty
		callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD",callpoint!.getColumnUndoData("OPE_ORDDET.QTY_BACKORD"))
		msg_id$="BO_EXCEEDS_ORD"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	else
		shipqty=ordqty-boqty
		callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",str(shipqty))

		unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
		new_ext_price=ordqty*unit_price

		callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
		callpoint!.setStatus("MODIFIED-REFRESH")
	endif
[[OPE_ORDDET.<CUSTOM>]]
calc_grid_tots:
escape;rem somewhere over the rainbow!
	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	if numrecs>0
		for reccnt=0 to numrecs-1
			gridrec$=recVect!.getItem(reccnt)
			tamt=tamt+num(gridrec.ext_price$)
		next reccnt
		user_tpl.ord_tot=tamt
	endif
return

disp_totals: rem --- get context and ID of total amount display control, and redisplay w/ amts from calc_tots
    
	tqty!=UserObj!.getItem(0)
	tqty!.setValue(num(user_tpl.totqty$))

	tamt!=UserObj!.getItem(1)
	tamt!.setValue(num(user_tpl.totamt$))
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
