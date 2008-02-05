[[OPE_ORDDET.ADIS]]
rem --- set enable/disable based on line type
	opc_linecode_dev=fnget_dev("OPC_LINECODE")
	dim opc_linecode$:fnget_tpl$("OPC_LINECODE")
	read record (opc_linecode_dev,key=firm_id$+recdata.line_code$)opc_linecode$
	callpoint!.setStatus("ENABLE:"+"opc_linecode.line_type$")
[[OPE_ORDDET.LINE_CODE.AVAL]]
rem --- set enable/disable based on line type
	opc_linecode_dev=fnget_dev("OPC_LINECODE")
	dim opc_linecode$:fnget_tpl$("OPC_LINECODE")
	read record (opc_linecode_dev,key=firm_id$+callpoint!.getColumnData("OPE_ORDDET.LINE_CODE"))opc_linecode$
	callpoint!.setStatus("ENABLE:"+"opc_linecode.line_type$")
