[[ARM_ENTITYUSE.ASHO]]
rem --- OP is required
	if callpoint!.getDevObject("op")<>"Y" then
		msg_id$="AD_MODULE_NOT_INSTAL"
		dim msg_tokens$[1]
		msg_tokens$[1]="OP"
		gosub disp_message

		callpoint!.setStatus("EXIT")
		break
	endif

rem --- EXIT if OP is not using a Sales Tax Service
	ops_params_dev=fnget_dev("OPS_PARAMS")
	dim ops_params$:fnget_tpl$("OPS_PARAMS")
	find record (ops_params_dev,key=firm_id$+"AR00",err=std_missing_params)ops_params$
	if cvs(ops_params.sls_tax_intrface$,2)="" then
		callpoint!.setStatus("EXIT")
		break
	else
		rem --- Get connection to Sales Tax Service
		salesTax!=new AvaTaxInterface(firm_id$)
		if salesTax!.connectClient(Form!,err=connectErr) then
			callpoint!.setDevObject("salesTax",salesTax!)
			callpoint!.setColumnEnabled("ARM_ENTITYUSE.ENTITY_USE_CD",1)
		else
			callpoint!.setStatus("EXIT")
			break
		endif
	endif

	break

connectErr:
	callpoint!.setStatus("EXIT")

	break

[[ARM_ENTITYUSE.BEND]]
rem --- Close connection to Sales Tax Service
	salesTax!=callpoint!.getDevObject("salesTax")
	if salesTax!<>null() then
		salesTax!.close()
	endif

[[ARM_ENTITYUSE.BSHO]]
rem --- Inits
	use ::ado_util.src::util
	use ::opo_AvaTaxInterface.aon::AvaTaxInterface

rem --- Is Sales Order Processing installed?
	call dir_pgm1$+"adc_application.aon","OP",info$[all]
	op$=info$[20]
	callpoint!.setDevObject("op",op$)

rem --- Open/Lock files

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

[[ARM_ENTITYUSE.ENTITY_USE_CD.AVAL]]
rem --- Do NOT allow using sales tax service standard Entity Use Code
	entityUseCd$=cvs(callpoint!.getUserInput(),2)
	priorEntityUseCd$=cvs(callpoint!.getColumnData("ARM_ENTITYUSE.ENTITY_USE_CD"),2)
	if entityUseCd$<>priorEntityUseCd$ then
		salesTax!=callpoint!.getDevObject("salesTax")
		success=0
		name$=salesTax!.getEntityUseCdName(entityUseCd$,err=*next); success=1
		if success then
			if name$<>"" then
				rem --- Sales tax service standard Entity Use Code
				msg_id$="AR_ENTITY_CD_EXISTS"
				dim msg_tokens$[1]
				msg_tokens$[1]=entityUseCd$
				gosub disp_message

				callpoint!.setStatus("ABORT")
				break
			endif
		else
			rem --- AvaTax call error
			callpoint!.setStatus("EXIT")
			break
		endif
	endif

[[ARM_ENTITYUSE.<CUSTOM>]]
#include [+ADDON_LIB]std_missing_params.aon



