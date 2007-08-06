[[SAM_CUSTOMER.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records
key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_CUSTOMER.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTOMER.YEAR")
	if cvs(callpoint!.getColumnData("SAM_CUSTOMER.CUSTOMER_ID"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTOMER.CUSTOMER_ID")
		if cvs(callpoint!.getColumnData("SAM_CUSTOMER.PRODUCT_TYPE"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTOMER.PRODUCT_TYPE")
			if cvs(callpoint!.getColumnData("SAM_CUSTOMER.ITEM_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTOMER.ITEM_ID")
			endif
		endif
	endif
endif

call stbl("+DIR_PGM")+"adc_key_template.aon","SAM_CUSTOMER","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call stbl("+DIR_PGM")+"rdm_inquiry.aon",
:	gui_dev,
:	Form!,
:	"SAM_CUSTOMER",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_CUSTOMER.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_CUSTOMER.CUSTOMER_ID",rd_key.customer_id$)
callpoint!.setColumnData("SAM_CUSTOMER.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_CUSTOMER.ITEM_ID",rd_key.item_id$)
callpoint!.setStatus("REFRESH")
