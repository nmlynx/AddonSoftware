[[ARU_AGINGUPDATE.ARER]]
rem --- default age_by (report_type) based on AR params

num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ars_params=num(open_chans$[1])
dim ars_params$:open_tpls$[1]

readrecord(ars_params,key=firm_id$+"AR00",dom=std_missing_params)ars_params$
callpoint!.setColumnData("ARU_AGINGUPDATE.PICK_LISTBUTTON",iff(cvs(ars_params.dflt_age_by$,2)="","I",ars_params.dflt_age_by$),1)

rem --- Disable customer_id fields when requested
if callpoint!.getDevObject("disable_customers")="Y" then
	callpoint!.setColumnEnabled("ARU_AGINGUPDATE.CUSTOMER_ID_1",0)
	callpoint!.setColumnEnabled("ARU_AGINGUPDATE.CUSTOMER_ID_2",0)
endif

[[ARU_AGINGUPDATE.BSHO]]
print"disable_customers=",callpoint!.getDevObject("disable_customers")
escape; rem wgh ... 9919 ...
if callpoint!.getDevObject("disable_customers")="Y" then
	callpoint!.setColumnEnabled("ARU_AGINGUPDATE.CUSTOMER_ID_1",0)
	callpoint!.setColumnEnabled("ARU_AGINGUPDATE.CUSTOMER_ID_2",0)
endif

[[ARU_AGINGUPDATE.<CUSTOM>]]
#include [+ADDON_LIB]std_missing_params.aon



