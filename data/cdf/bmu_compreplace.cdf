[[BMU_COMPREPLACE.OLD_ITEM.AVAL]]
rem --- Ensure Old and New items are not the same

	if callpoint!.getUserInput()=callpoint!.getColumnData("new_item")
		msg_id$="BM_OLD_NEW_ITEM"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[BMU_COMPREPLACE.NEW_ITEM.AVAL]]
rem --- Ensure Old and New items are not the same

	if callpoint!.getUserInput()=callpoint!.getColumnData("old_item")
		msg_id$="BM_OLD_NEW_ITEM"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[BMU_COMPREPLACE.BILL_CONV_FACT.AVAL]]
rem --- Ensure Conversion Factor is greater than zero

	if num(callpoint!.getUserInput())<=0
		msg_id$="BM_VAL_GRTR_ZERO"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
[[BMU_COMPREPLACE.AREC]]
rem -- Default Rounding precision from BOM params	
	
	prec$=callpoint!.getDevObject("bm_param_prec")
	callpoint!.setColumnData("BMU_COMPREPLACE.BM_ROUND_PREC",prec$,1)
[[BMU_COMPREPLACE.BSHO]]
rem --- Open needed tables

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="BMS_PARAMS",open_opts$[1]="OTA"
	gosub open_tables
	
	bms01_dev=num(open_chans$[1])
	dim bms01a$:open_tpls$[1]

rem -- Get precision from BOM params for default Rounding Precision

	read record (bms01_dev,key=firm_id$+"BM00")bms01a$
	callpoint!.setDevObject("bm_param_prec",bms01a.bm_precision$)
