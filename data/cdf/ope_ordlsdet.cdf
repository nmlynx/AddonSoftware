[[OPE_ORDLSDET.LOTSER_NO.AVAL]]
rem --- validate open lot number
escape
	wh$=callpoint!.getDevObject("wh")
	item$=callpoint!.getDevObject("item")
	lsdet_dev=num(callpoint!.getDevObject("lsdet_dev"))
	dim lsdet_tpl$:callpoint!.getDevObject("lsdet_tpl")
escape;rem aval
	readrecord(lsdet_dev,key=firm_id$+wh$+item$+callpoint!.getUserInput(),knum=3)lsdet_tpl$
	if lsdet_tpl.closed_flag$<>"Y"
		escape
	endif
[[OPE_ORDLSDET.LOTSER_NO.AINQ]]
escape; rem ainq
