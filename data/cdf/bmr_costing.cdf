[[BMR_COSTING.BFMC]]
rem --- Set Custom Query for BOM Item Number

	callpoint!.setTableColumnAttribute("BMR_COSTING.BILL_NO_1", "IDEF", "BOM_LOOKUP")
	callpoint!.setTableColumnAttribute("BMR_COSTING.BILL_NO_2", "IDEF", "BOM_LOOKUP")
[[BMR_COSTING.AREC]]
rem --- Set default Warehouse

	whse$=callpoint!.getDevObject("dflt_whse")
	callpoint!.setColumnData("BMR_COSTING.WAREHOUSE_ID",whse$,1)
[[BMR_COSTING.BSHO]]
rem --- Open needed tables
	num_files=2
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="IVM_ITEMMAST",open_opts$[2]="OTA"
	gosub open_tables

	ivs01_dev=num(open_chans$[1])
	dim ivs01a$:open_tpls$[1]

	read record (ivs01_dev,key=firm_id$+"IV00")ivs01a$
	callpoint!.setDevObject("dflt_whse",ivs01a.warehouse_id$)
