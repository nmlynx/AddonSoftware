[[GLS_PARAMS.ASVA]]
rem --- Check For Required Fiscal Calendars
	theFirm$=firm_id$
	call stbl("+DIR_PGM")+"glc_checkfiscalcalendars.aon",theFirm$,Translate!,status
[[GLS_PARAMS.AREC]]
rem --- Init new record

	callpoint!.setColumnData("GLS_PARAMS.POST_TO_GL","Y")
