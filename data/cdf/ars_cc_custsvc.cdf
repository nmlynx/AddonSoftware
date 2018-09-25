[[ARS_CC_CUSTSVC.AOPT-GTWY]]
rem --- launch config form for selected gateway

	gateway$=cvs(callpoint!.getColumnData("ARS_CC_CUSTSVC.GATEWAY"),11)

	dim dflt_data$[1,1]
	dflt_data$[0,0]="FIRM_ID"
	dflt_data$[0,1]=firm_id$
	dflt_data$[1,0]="GATEWAY"
	dflt_data$[1,1]=gateway$

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"ARS_"+gateway$,
:		user_id$,
:		"",
:		key_pfx$,
:		table_chans$[all],
:		"",
:		dflt_data$[all]

	
