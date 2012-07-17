[[SFE_WO_COST_ADJ.ASVA]]
rem --- Call Correct Form
goto jim1;rem jpb!
if callpoint!.getColumnData("SFE_WO_COST_ADJ.LEVEL_SELECTION")="O"
	if cvs(callpoint!.getColumnData("SFE_WO_COST_ADJ.WO_NO"),2)<>""

		callpoint!.setDevObject("wo_no",callpoint!.getColumnData("SFE_WO_COST_ADJ.WO_NO"))
		call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:			"SFE_WO_OPSADJ",
:			stbl("+USER_ID"),
:			"MNT",
:			"",
:			table_chans$[all],
:			"",
:			dflt_data$[all]
	endif
endif
jim1:
if callpoint!.getColumnData("SFE_WO_COST_ADJ.LEVEL_SELECTION")="S"
	if cvs(callpoint!.getColumnData("SFE_WO_COST_ADJ.WO_NO"),2)<>""

		callpoint!.setDevObject("wo_no",callpoint!.getColumnData("SFE_WO_COST_ADJ.WO_NO"))
		call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:			"SFE_WO_SUBADJ",
:			stbl("+USER_ID"),
:			"MNT",
:			"",
:			table_chans$[all],
:			"",
:			dflt_data$[all]
	endif
endif

callpoint!.setStatus("ABORT")
[[SFE_WO_COST_ADJ.WO_NO.AVAL]]
rem --- Fill form

	sfe_womast=fnget_dev("SFE_WOMASTR")
	dim sfe_womast$:fnget_tpl$("SFE_WOMASTR")
	wo_no$=callpoint!.getUserInput()

	if cvs(wo_no$,2)<>""
		callpoint!.setDevObject("wo_loc",sfe_womast.wo_location$)
		read record (sfe_womast,key=firm_id$+sfe_womast.wo_location$+wo_no$) sfe_womast$

		if sfe_womast.wo_status$="C"
			msg_id$="WO_CLOSED"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif

		callpoint!.setColumnData("<<DISPLAY>>.WO_CATEGORY",sfe_womast.wo_category$,1)
		callpoint!.setColumnData("<<DISPLAY>>.WO_STATUS",sfe_womast.wo_status$,1)
		callpoint!.setColumnData("<<DISPLAY>>.WO_TYPE",sfe_womast.wo_type$,1)
		callpoint!.setColumnData("<<DISPLAY>>.BILL_NO",sfe_womast.item_id$,1)
		if sfe_womast.wo_category$<>"I"
			callpoint!.setColumnData("<<DISPLAY>>.DESCRIPTION",sfe_womast.description_01$,1)
		endif
		callpoint!.setColumnData("<<DISPLAY>>.UNIT_MEASURE",sfe_womast.unit_measure$,1)
		callpoint!.setColumnData("<<DISPLAY>>.WAREHOUSE_ID",sfe_womast.warehouse_id$,1)
	endif
[[SFE_WO_COST_ADJ.BSHO]]
rem --- Set Custom Query for BOM Item Number

	callpoint!.setTableColumnAttribute("<<DISPLAY>>.BILL_NO", "IDEF", "BOM_LOOKUP")

rem --- Open tables

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFE_WOMASTR",open_opts$[1]="OTA"
	gosub open_tables
