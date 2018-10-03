[[ARS_CC_CUSTSVC.BSHO]]
rem --- use

	use ::ado_func.src::func

rem --- open tables

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARC_GATEWAYHDR",open_opts$[1]="OTA"
	gosub open_tables

[[ARS_CC_CUSTSVC.INTERFACE_TP.AVAL]]
rem --- populate list of gateways based on the interface type
rem - read arc_gatewayhdr, and for every gateway where interface_tp matches this type or is set to 'both'
rem - store gateway code in codeVect! and gateway description in descVect!
rem - then use func.buildListButtonList() method to build ldat$

	arc_gatewayhdr=fnget_dev("ARC_GATEWAYHDR")
	dim arc_gatewayhdr$:fnget_tpl$("ARC_GATEWAYHDR")

	interface_tp$=callpoint!.getUserInput()
	ldat$=""

	codeVect!=BBjAPI().makeVector()
	descVect!=BBjAPI().makeVector()

	read(arc_gatewayhdr,key=firm_id$,dom=*next)
	while 1
		readrecord(arc_gatewayhdr,end=*break)arc_gatewayhdr$
		if pos(firm_id$=arc_gatewayhdr$)<>1 then break
		if arc_gatewayhdr.interface_tp$=interface_tp$
			codeVect!.add(arc_gatewayhdr.gateway_id$)
			descVect!.add(arc_gatewayhdr.description$)
		endif
	wend

	ldat$=func.buildListButtonList(codeVect!,descVect!)
	callpoint!.setTableColumnAttribute("ARS_CC_CUSTSVC.GATEWAYS","LDAT",ldat$)
[[ARS_CC_CUSTOMER.INTERFACE_TP.AVAL]]



	
[[ARS_CC_CUSTSVC.AOPT-GTWY]]
rem --- launch config form for selected gateway

	gateway$=cvs(callpoint!.getColumnData("ARS_CC_CUSTSVC.GATEWAY"),11)

	dim dflt_data$[1,1]
	dflt_data$[0,0]="FIRM_ID"
	dflt_data$[0,1]=firm_id$
	dflt_data$[1,0]="GATEWAY_ID"
	dflt_data$[1,1]=gateway$

	key_pfx$=firm_id$+gateway$

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"ARC_GATEWAYHDR",
:		user_id$,
:		"",
:		key_pfx$,
:		table_chans$[all],
:		"",
:		dflt_data$[all]

	
