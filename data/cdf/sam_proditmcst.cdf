[[SAM_PRODITMCST.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis Records
key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_PRODITMCST.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.YEAR")
	if cvs(callpoint!.getColumnData("SAM_PRODITMCST.PRODUCT_TYPE"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.PRODUCT_TYPE")
		if cvs(callpoint!.getColumnData("SAM_PRODITMCST.ITEM_ID"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.ITEM_ID")
			if cvs(callpoint!.getColumnData("SAM_PRODITMCST.CUSTOMER_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.CUSTOMER_ID")
			endif
		endif
	endif
endif

call stbl("+DIR_PGM")+"adc_key_template.aon","SAM_CUSTOMER","ALT_KEY_01",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call stbl("+DIR_PGM")+"rdm_inquiry.aon",
:	gui_dev,
:	Form!,
:	"SAM_CUSTOMER",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"ALT_KEY_01",
:	rd_key$

callpoint!.setColumnData("SAM_PRODITMCST.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_PRODITMCST.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_PRODITMCST.ITEM_ID",rd_key.item_id$)
callpoint!.setColumnData("SAM_PRODITMCST.CUSTOMER_ID",rd_key.customer_id$)
callpoint!.setStatus("REFRESH")
