[[SFE_RELEASEWO.ARAR]]
rem --- Set defaults

	if callpoint!.getDevObject("wo_status")="O"
		callpoint!.setColumnData("SFE_RELEASEWO.RELEASE","Y",1)
	endif
[[SFE_RELEASEWO.ASVA]]
rem --- Process information

	wo_no$=callpoint!.getDevObject("wo_no")

	if callpoint!.getColumnData("SFE_RELEASEWO.PRINT_TRAVEL")
		opened_wo=fnget_dev("SFE_OPENEDWO")
		dim opened_wo$:fnget_tpl$("SFE_OPENEDWO")
		opened_wo.firm_id$=firm_id$
		opened_wo.wo_no$=wo_no$
		opened_wo$=field(opened_wo$)
		write record (opened_wo) opened_wo$
	endif
[[SFE_RELEASEWO.BSHO]]
rem --- Open needed tables

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFE_OPENEDWO",open_opts$[1]="OTA"
	gosub open_tables
