[[IVR_ITEMDETAIL.ASVA]]
rem --- Get descriptions for Tax Service Codes (TAX_SVC_CD) that might get reported

	rem --- Inits
	use ::opo_AvaTaxInterface.aon::AvaTaxInterface
	use java.util.ArrayList

	taxSvcCdMap!=new ArrayList()
	callpoint!.setDevObject("taxSvcCdMap",taxSvcCdMap!)

	rem --- Skip if Sales Order Processing not installed
	call dir_pgm1$+"adc_application.aon","OP",info$[all]
	op$=info$[20]
	callpoint!.setDevObject("op",op$)
	if op$="Y" then
		rem --- Open/Lock files
		files=1,begfile=1,endfile=files
		dim files$[files],options$[files],chans$[files],templates$[files]
		files$[1]="OPS_PARAMS",options$[1]="OTA"
		call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],chans$[all],templates$[all],table_chans$[all],batch,status$
		if status$<>"" then break
		ops_params_dev=num(chans$[1])
		dim ops_params$:templates$[1]

		rem --- Skip if OP is not using a Sales Tax Service
		find record (ops_params_dev,key=firm_id$+"AR00",err=*endif)ops_params$
		if cvs(ops_params.sls_tax_intrface$,2)<>"" then
			rem --- Get connection to Sales Tax Service
			salesTax!=new AvaTaxInterface(firm_id$)
			salesTax!.connectClient(Form!,err=*endif)

			rem --- Get list of all Tax Service Codes
			taxSvcCdMap!=salesTax!.getTaxSvcCds(err=*endif)
			callpoint!.setDevObject("taxSvcCdMap",taxSvcCdMap!)
			endif
		endif
	endif

[[IVR_ITEMDETAIL.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::option_entry"



