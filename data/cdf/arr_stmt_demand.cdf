[[ARR_STMT_DEMAND.AREC]]
rem --- use ReportControl object to see if this customer is set up for email/fax statement

	use ::ado_rptControl.src::ReportControl

	rpt_id$=pad("ARR_STATEMENTS",16);rem use ARR_STATEMENTS for regular (batch) and on-demand, so customers don't have to be set up multiple times

rem --- See if this document/recipient is set up in Addon Report Control

	reportControl!=new ReportControl()
	found=reportControl!.getRecipientInfo(rpt_id$,callpoint!.getColumnData("ARR_STMT_DEMAND.CUSTOMER_ID"),"")

	if found and (reportControl!.getEmailYN()="Y" or reportControl!.getFaxYN()="Y")
		callpoint!.setColumnEnabled("ARR_STMT_DEMAND.PICK_CHECK",1)
	else
		callpoint!.setColumnEnabled("ARR_STMT_DEMAND.PICK_CHECK",0)
	endif

	rem --- destroy to close files so they don't get opened repeatedly with each iteration
	reportControl!.destroy()
	reportControl! = null()

[[ARR_STMT_DEMAND.ARER]]
rem --- default age_by (report_type) based on AR params

num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params=num(open_chans$[1])
dim ars_params$:open_tpls$[1]


readrecord(ars_params,key=firm_id$+"AR00",dom=std_missing_params)ars_params$
callpoint!.setColumnData("ARR_STMT_DEMAND.REPORT_TYPE",iff(cvs(ars_params.dflt_age_by$,2)="","I",ars_params.dflt_age_by$),1)

[[ARR_STMT_DEMAND.<CUSTOM>]]
#include [+ADDON_LIB]std_missing_params.aon



