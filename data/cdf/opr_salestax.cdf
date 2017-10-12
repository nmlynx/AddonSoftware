[[OPR_SALESTAX.AREC]]
rem --- Initialize Beginnin and Ending Dates
	callpoint!.setColumnData("OPR_SALESTAX.PICK_DATE_YYYYMM_1",stbl("+SYSTEM_DATE")(1,6),1)
	callpoint!.setColumnData("OPR_SALESTAX.PICK_DATE_YYYYMM_2",stbl("+SYSTEM_DATE")(1,6),1)
