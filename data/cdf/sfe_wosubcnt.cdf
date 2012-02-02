[[SFE_WOSUBCNT.BSHO]]
rem --- Disable grid if Closed Work Order or Recurring

	if callpoint!.getDevObject("wo_status")="C" or callpoint!.getDevObject("wo_category")="R"
		opts$=callpoint!.getTableAttribute("OPTS")
		callpoint!.setTableAttribute("OPTS",opts$+"BID")

		x$=callpoint!.getTableColumns()
		for x=1 to len(x$) step 40
			opts$=callpoint!.getTableColumnAttribute(cvs(x$(x,40),2),"OPTS")
			callpoint!.setTableColumnAttribute(cvs(x$(x,40),2),"OPTS",o$+"C"); rem - makes cells read only
		next x
	endif
