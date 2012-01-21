[[SFE_WOCOPY.BSHO]]
rem --- jpb - set devobject for testing - remove all when implementing

	callpoint!.setDevObject("wo_loc","  ")

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFE_WOMASTR",open_opts$[1]="OTA"
	gosub open_tables
[[SFE_WOCOPY.WO_NO.AVAL]]
rem --- Populate display fields

	wo_dev=fnget_dev("SFE_WOMASTR")
	dim wo_mastr$:fnget_tpl$("SFE_WOMASTR")
	wo_loc$=callpoint!.getDevObject("wo_loc")

	read record (wo_dev,key=firm_id$+wo_loc$+callpoint!.getUserInput()) wo_mastr$
	callpoint!.setColumnData("<<DISPLAY>>.CLOSED_DATE",wo_mastr.closed_date$,1)
	callpoint!.setColumnData("<<DISPLAY>>.OPENED_DATE",wo_mastr.opened_date$,1)
	callpoint!.setColumnData("<<DISPLAY>>.SCH_PROD_QTY",str(wo_mastr.sch_prod_qty),1)
