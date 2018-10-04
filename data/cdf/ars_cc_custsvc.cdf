[[ARS_CC_CUSTSVC.ADIS]]
rem --- populate list of supported gateways based on the interface type

	interface_tp$=callpoint!.getColumnData("ARS_CC_CUSTSVC.INTERFACE_TP")
	column$="ARS_CC_CUSTSVC.GATEWAY_ID"
	gosub get_gateways
	callpoint!.setStatus("REFRESH")
[[ARS_CC_CUSTSVC.<CUSTOM>]]
rem ============================================================
get_gateways:rem --- load up listbutton with supported gateways for given or selected interface type
rem --- in: interface_tp$, column$ (ars_cc_custsvc.gateway_id or ars_cc_customer.gateway_id) to set list for
rem ============================================================

	arc_gatewayhdr=fnget_dev("ARC_GATEWAYHDR")
	dim arc_gatewayhdr$:fnget_tpl$("ARC_GATEWAYHDR")

	ldat$=""

	codeVect!=BBjAPI().makeVector()
	descVect!=BBjAPI().makeVector()

	read(arc_gatewayhdr,key=firm_id$,dom=*next)
	while 1
		readrecord(arc_gatewayhdr,end=*break)arc_gatewayhdr$
		if pos(firm_id$=arc_gatewayhdr$)<>1 then break
		if pos(arc_gatewayhdr.interface_tp$=interface_tp$+"B")
			codeVect!.add(arc_gatewayhdr.gateway_id$)
			descVect!.add(arc_gatewayhdr.description$)
		endif
	wend

	ldat$=func.buildListButtonList(descVect!,codeVect!)
	callpoint!.setTableColumnAttribute(column$,"LDAT",ldat$)
	c!=callpoint!.getControl(column$)
	c!.removeAllItems()
	c!.insertItems(0,descVect!)

	return

#include std_missing_params.src
[[ARS_CC_CUSTSVC.BSHO]]
rem --- use

	use ::ado_func.src::func

rem --- open tables

	num_files=4
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARC_GATEWAYHDR",open_opts$[1]="OTA"
	open_tables$[2]="ARS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="ADM_PROCMASTER",open_opts$[3]="OTA"
	open_tables$[4]="ADM_PROCDETAIL",open_opts$[4]="OTA"
	gosub open_tables

	ars_params=num(open_chans$[2])
	adm_procmaster=num(open_chans$[3])
	adm_procdetail=num(open_chans$[4])

	dim ars_params$:open_tpls$[2]
	dim adm_procmaster$:open_tpls$[3]
	dim adm_procdetail$:open_tpls$[4]

	rem --- enable/disable deposit description based on whether using bank rec or not
	read record(ars_params,key=firm_id$+"AR00",err=std_missing_params)ars_params$
	callpoint!.setColumnEnabled("ARS_CC_CUSTSVC.DEPOSIT_DESC",iff(ars_params.br_interface$="Y",1,-1))

	rem --- get process_id for Cash Receipts to see if batching is turned on
	rem --- if not, disable batch description
	proc_key_val$=firm_id$+pad("ARE_CASHHDR",len(adm_procdetail.dd_table_alias$))
	read record (adm_procdetail,key=proc_key_val$,knum="AO_TABLE_PROCESS",dom=*next)
	while 1
		k$=key(adm_procdetail,end=*break)
		if pos(proc_key_val$=k$)<>1 break
		readrecord(adm_procdetail,end=*break)adm_procdetail$
		proc_id$=adm_procdetail.process_id$
		break
	wend
	read record (adm_procmaster,key=firm_id$+proc_id$,dom=*next)adm_procmaster$
	callpoint!.setColumnEnabled("ARS_CC_CUSTSVC.BATCH_DESC",iff(adm_procmaster.batch_entry$="Y",1,-1))
[[ARS_CC_CUSTSVC.INTERFACE_TP.AVAL]]
rem --- populate list of supported gateways based on the interface type

	interface_tp$=callpoint!.getUserInput()
	column$="ARS_CC_CUSTSVC.GATEWAY_ID"
	gosub get_gateways
[[ARS_CC_CUSTSVC.AOPT-GTWY]]
rem --- launch config form for selected gateway

	gateway$=callpoint!.getColumnData("ARS_CC_CUSTSVC.GATEWAY_ID")

	dim dflt_data$[1,1]
	dflt_data$[0,0]="FIRM_ID"
	dflt_data$[0,1]=firm_id$
	dflt_data$[1,0]="GATEWAY_ID"
	dflt_data$[1,1]=gateway$

	key_pfx$=firm_id$+gateway$

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"ARC_GATEWAYHDR",
:		stbl("+USER_ID"),
:		"",
:		key_pfx$,
:		table_chans$[all],
:		"",
:		dflt_data$[all]

	
