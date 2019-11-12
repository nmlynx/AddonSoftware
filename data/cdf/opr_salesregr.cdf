[[OPR_SALESREGR.SUMM_DTL.AMOD]]
rem --- Export format only available for detail report
	if callpoint!.getUserInput()="S" then
		callpoint!.setColumnData("OPR_SALESREGR.EXPORT_FORMAT","N",1)
		callpoint!.setColumnEnabled("OPR_SALESREGR.EXPORT_FORMAT",0)
	else
		callpoint!.setColumnEnabled("OPR_SALESREGR.EXPORT_FORMAT",1)
	endif
[[OPR_SALESREGR.ARAR]]
rem --- Export format only available for detail report
	callpoint!.setColumnData("OPR_SALESREGR.SUMM_DTL","S")
	callpoint!.setColumnEnabled("OPR_SALESREGR.EXPORT_FORMAT",0)
