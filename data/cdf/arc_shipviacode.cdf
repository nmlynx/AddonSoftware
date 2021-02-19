[[ARC_SHIPVIACODE.ADIS]]
rem --- Show FREIGHT_TAXCD description
	salesTax!=callpoint!.getDevObject("salesTax")
	if salesTax!<>null() then
		freight_taxcd_desc!=callpoint!.getDevObject("freight_taxcd_desc")
		taxSvcCd$=cvs(callpoint!.getColumnData("ARC_SHIPVIACODE.FREIGHT_TAXCD"),2)
		if taxSvcCd$<>"" then
			salesTax!=callpoint!.getDevObject("salesTax")
			success=0
			desc$=salesTax!.getTaxSvcCdDesc(taxSvcCd$,err=*next); success=1
			if success then
				if desc$<>"" then
					rem --- Good code entered
					freight_taxcd_desc!.setText(desc$)
				else
					rem --- Bad code entered
					msg_id$="OP_BAD_TAXSVC_CD"
					dim msg_tokens$[1]
					msg_tokens$[1]=taxSvcCd$
					gosub disp_message

					freight_taxcd_desc!.setText("?????")
				endif
			else
				rem --- AvaTax call error
				freight_taxcd_desc!.setText("?????")
			endif
		else
			rem --- No code entered, so clear description.
			freight_taxcd_desc!.setText("")
		endif
	endif

[[ARC_SHIPVIACODE.AREC]]
rem --- Clear FREIGHT_TAXCD description
	salesTax!=callpoint!.getDevObject("salesTax")
	if salesTax!<>null() then
		freight_taxcd_desc!=callpoint!.getDevObject("freight_taxcd_desc")
		freight_taxcd_desc!.setText("")
	endif

[[ARC_SHIPVIACODE.ASHO]]
rem --- Disable FREIGHT_TAXCD when OP is not installed
	callpoint!.setDevObject("salesTax",null())
	if callpoint!.getDevObject("op")<>"Y" then
		callpoint!.setColumnEnabled("ARC_SHIPVIACODE.FREIGHT_TAXCD",-1)
	else
		rem --- Disable FREIGHT_TAXCD when OP is not using a Sales Tax Service
		ops_params_dev=fnget_dev("OPS_PARAMS")
		dim ops_params$:fnget_tpl$("OPS_PARAMS")
		find record (ops_params_dev,key=firm_id$+"AR00",err=std_missing_params)ops_params$
		if cvs(ops_params.sls_tax_intrface$,2)="" then
			callpoint!.setColumnEnabled("ARC_SHIPVIACODE.FREIGHT_TAXCD",-1)
		else
			rem --- Get connection to Sales Tax Service
			salesTax!=new AvaTaxInterface(firm_id$)
			if salesTax!.connectClient(Form!,err=connectErr) then
				callpoint!.setDevObject("salesTax",salesTax!)
				callpoint!.setColumnEnabled("ARC_SHIPVIACODE.FREIGHT_TAXCD",1)
			else
				callpoint!.setColumnEnabled("ARC_SHIPVIACODE.FREIGHT_TAXCD",0)
				salesTax!.close()
			endif
		endif
	endif

	break

connectErr:
	callpoint!.setColumnEnabled("ARC_SHIPVIACODE.FREIGHT_TAXCD",0)
	if salesTax!<>null() then salesTax!.close()

	break

[[ARC_SHIPVIACODE.BDEL]]
rem --- Check if code is used as a default code

	num_files = 1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARS_CUSTDFLT", open_opts$[1]="OTA"
	gosub open_tables
	ars_custdflt_dev = num(open_chans$[1])
	dim ars_rec$:open_tpls$[1]

	find record(ars_custdflt_dev,key=firm_id$+"D",dom=*next)ars_rec$
	if ars_rec.ar_ship_via$ = callpoint!.getColumnData("ARC_SHIPVIACODE.AR_SHIP_VIA") then
		callpoint!.setMessage("AR_SHIP_VIA_IN_DFLT")
		callpoint!.setStatus("ABORT")
	endif

[[ARC_SHIPVIACODE.BEND]]
rem --- Close connection to Sales Tax Service
	salesTax!=callpoint!.getDevObject("salesTax")
	if salesTax!<>null() then
		salesTax!.close()
	endif

[[ARC_SHIPVIACODE.BSHO]]
rem --- Inits
	use ::ado_util.src::util
	use ::opo_AvaTaxInterface.aon::AvaTaxInterface

rem --- Is Sales Order Processing installed?
call dir_pgm1$+"adc_application.aon","OP",info$[all]
op$=info$[20]
callpoint!.setDevObject("op",op$)

rem --- Open/Lock files
	files=3
	if op$="Y" then
		files=1,begfile=1,endfile=files
		dim files$[files],options$[files],chans$[files],templates$[files]
		files$[1]="OPS_PARAMS",options$[1]="OTA"
		call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$
		if status$<>"" then
			remove_process_bar:
			bbjAPI!=bbjAPI()
			rdFuncSpace!=bbjAPI!.getGroupNamespace()
			rdFuncSpace!.setValue("+build_task","OFF")
			release
		endif
	endif

rem --- Add static label for displaying FREIGHT_TAXCD description
	freight_taxcd!=fnget_control!("ARC_SHIPVIACODE.FREIGHT_TAXCD")
	freight_taxcd_x=freight_taxcd!.getX()
	freight_taxcd_y=freight_taxcd!.getY()
	freight_taxcd_height=freight_taxcd!.getHeight()
	freight_taxcd_width=freight_taxcd!.getWidth()
	desc!=fnget_control!("ARC_SHIPVIACODE.DESCRIPTION")
	desc_width=desc!.getWidth()
	nxt_ctlID=util.getNextControlID()
	freight_taxcd_desc!=Form!.addStaticText(nxt_ctlID,freight_taxcd_x+freight_taxcd_width+5,freight_taxcd_y+3,desc_width,freight_taxcd_height,"")
	callpoint!.setDevObject("freight_taxcd_desc",freight_taxcd_desc!)

[[ARC_SHIPVIACODE.FREIGHT_TAXCD.AVAL]]
rem --- Validate FREIGHT_TAXCD
	taxSvcCd$=cvs(callpoint!.getUserInput(),2)
	priorTaxSvcCd$=cvs(callpoint!.getColumnData("ARC_SHIPVIACODE.FREIGHT_TAXCD"),2)
	if taxSvcCd$<>priorTaxSvcCd$ then
		freight_taxcd_desc!=callpoint!.getDevObject("freight_taxcd_desc")
		if taxSvcCd$<>"" then
			salesTax!=callpoint!.getDevObject("salesTax")
			success=0
			desc$=salesTax!.getTaxSvcCdDesc(taxSvcCd$,err=*next); success=1
			if success then
				if desc$<>"" then
					rem --- Good code entered
					freight_taxcd_desc!.setText(desc$)
				else
					rem --- Bad code entered
					msg_id$="OP_BAD_TAXSVC_CD"
					dim msg_tokens$[1]
					msg_tokens$[1]=taxSvcCd$
					gosub disp_message

					callpoint!.setColumnData("ARC_SHIPVIACODE.FREIGHT_TAXCD",priorTaxSvcCd$,1)
					callpoint!.setStatus("ABORT")
					break
				endif
			else
				rem --- AvaTax call error
				callpoint!.setColumnData("ARC_SHIPVIACODE_SVC_CD",priorTaxSvcCd$,1)
				callpoint!.setStatus("ABORT")
				break
			endif
		else
			rem --- No code entered, so clear description.
			freight_taxcd_desc!.setText("")
		endif
	endif

[[ARC_SHIPVIACODE.<CUSTOM>]]
#include [+ADDON_LIB]std_missing_params.aon

rem #include fnget_control.src
	def fnget_control!(ctl_name$)
	ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
	get_control!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
	return get_control!
	fnend
rem #endinclude fnget_control.src



