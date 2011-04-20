[[BMM_BILLMAST.STD_LOT_SIZE.AVAL]]
rem --- Set devobject

	callpoint!.setDevObject("lotsize",num(callpoint!.getUserInput()))
[[BMM_BILLMAST.BILL_NO.AVAL]]
rem --- Set DevObject

	callpoint!.setDevObject("master_bill",callpoint!.getUserInput())
[[BMM_BILLMAST.AOPT-COPY]]
rem --- Go run the Copy form

	callpoint!.setDevObject("master_bill",callpoint!.getColumnData("BMM_BILLMAST.BILL_NO"))

	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:		"BMC_COPYBILL",
:		stbl("+USER_ID"),
:		"MNT",
:		"",
:		table_chans$[all]
[[BMM_BILLMAST.AREC]]
rem --- set devobject

	callpoint!.setDevObject("yield",0)
	callpoint!.setDevObject("master_bill","")
	callpoint!.setDevObject("lotsize",0)
[[BMM_BILLMAST.EST_YIELD.AVAL]]
rem --- Set devobject

	callpoint!.setDevObject("yield",num(callpoint!.getUserInput()))
[[BMM_BILLMAST.ARAR]]
rem --- Set DevObjects

	callpoint!.setDevObject("yield",num(callpoint!.getColumnData("BMM_BILLMAST.EST_YIELD")))
	callpoint!.setDevObject("master_bill",callpoint!.getColumnData("BMM_BILLMAST.BILL_NO"))
	callpoint!.setDevObject("lotsize",num(callpoint!.getColumnData("BMM_BILLMAST.STD_LOT_SIZE")))
[[BMM_BILLMAST.BSHO]]
rem --- Set DevObjects required

	callpoint!.setDevObject("yield",0)
	callpoint!.setDevObject("master_bill","")
	callpoint!.setDevObject("lotsize",0)

	num_files=4
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="BMM_BILLMAT",open_opts$[1]="OTA"
	open_tables$[2]="BMM_BILLOPER",open_opts$[2]="OTA"
	open_tables$[3]="BMM_BILLCMTS",open_opts$[3]="OTA"
	open_tables$[4]="BMM_BILLSUB",open_opts$[4]="OTA"
	gosub open_tables
