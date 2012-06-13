[[SFE_WOLOTSER.ADIS]]
rem --- disable inputs if on a closed WO

	if callpoint!.getDevObject("wo_status")="C" 
		callpoint!.setColumnEnabled("SFE_WOLOTSER.LOTSER_NO",0)
		callpoint!.setColumnEnabled("SFE_WOLOTSER.WO_LS_CMT",0)
		callpoint!.setColumnEnabled("SFE_WOLOTSER.SCH_PROD_QTY",0)
	endif
[[SFE_WOLOTSER.BSHO]]
rem --- set qty to 1 if serialized
	

	if callpoint!.getDevObject("lotser")="S" and callpoint!.getDevObject("wo_status")<>"C"
		callpoint!.setTableColumnAttribute("SFE_WOLOTSER.SCH_PROD_QTY","DFLT","1")
	endif

