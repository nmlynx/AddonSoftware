[[OPR_SALESREG.AFMC]]
rem --- Inits
	use ::ado_util.src::util
	use ::opo_AvaTaxInterface.aon::AvaTaxInterface

[[OPR_SALESREG.ASHO]]
rem --- When using Sales Tax Service, get connection
	callpoint!.setDevObject("salesTaxObject",null())
	if callpoint!.getDevObject("sls_tax_intrface")<>"" then
		rem --- Get connection to Sales Tax Service
		salesTax!=new AvaTaxInterface(firm_id$)
		if salesTax!.connectClient(Form!,err=connectErr) then
			callpoint!.setDevObject("salesTaxObject",salesTax!)

			rem --- Warn if in test mode
			if salesTax!.isTestMode() then
				rem --- Skip warning if they were previously warned
				global_ns!=BBjAPI().getGlobalNamespace()
				nsValue!=global_ns!.getValue(info(3,2)+date(0)+"_SalesTaxSvcTestWarning",err=*next)
				if nsValue!=null() then
					msg_id$="OP_SLS_TAX_SVC_TEST"
					gosub disp_message

					global_ns!.setValue(info(3,2)+date(0)+"_SalesTaxSvcTestWarning","Test mode warning")
				endif
			endif
		else
			if salesTax!<>null() then salesTax!.close()
			salesTax!=null()
		endif
	endif

	break

connectErr:
	if salesTax!<>null() then salesTax!.close()
	salesTax!=null()

	break

[[OPR_SALESREG.BEND]]
rem --- Close connection to Sales Tax Service
	salesTax!=callpoint!.getDevObject("salesTaxObject")
	if salesTax!<>null() then
		salesTax!.close()
	endif

[[OPR_SALESREG.BSHO]]
rem --- Open needed files
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARS_PARAMS",    open_opts$[1]="OTA"

	gosub open_tables

rem --- get AR Params
	dim ars01a$:open_tpls$[1]
	read record (num(open_chans$[1]), key=firm_id$+"AR00") ars01a$
	callpoint!.setDevObject("sls_tax_intrface", cvs(ars01a.sls_tax_intrface$,2))



