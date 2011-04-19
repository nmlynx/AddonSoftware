[[BMM_BILLOPER.<CUSTOM>]]
rem ===================================================================
calc_hours:
rem --- hrs_pc:			input
rem --- pc_hr:			input
rem --- setup:			input
rem --- lot_size:			input
rem --- op_code:		input
rem ===================================================================

	bmm08=fnget_dev("BMC_OPCODES")
	dim bmm08$:fnget_tpl$("BMC_OPCODES")
	read record (bmm08,key=firm_id$+op_code$,dom=*next)bmm08$

	yield_pct=callpoint!.getDevObject("yield")
	net_hrs=BmUtils.netQuantityHoursRequired(hrs_pc,bmm08_direct_rate,pc_hr,yield_pct,setup,lot_size)
rem	callpoint!.setColumnData("BMM_BILLMAT.NET_REQUIRED",str(net_qty:mask$))
	callpoint!.setStatus("REFRESH")

	return
[[BMM_BILLOPER.BSHO]]
rem --- Setup java class for Derived Data Element

	use ::bmo_BmUtils.aon::BmUtils
	declare BmUtils bmUtils!

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="BMC_OPCODES",open_opts$[1]="OTA"
	gosub open_tables
