[[SAM_CUSTTERR.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records
key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_CUSTTERR.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTERR.YEAR")
	if cvs(callpoint!.getColumnData("SAM_CUSTTERR.TERRITORY"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTERR.TERRITORY")
		if cvs(callpoint!.getColumnData("SAM_CUSTTERR.CUSTOMER_ID"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTERR.CUSTOMER_ID")
			if cvs(callpoint!.getColumnData("SAM_CUSTTERR.PRODUCT_TYPE"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTERR.PRODUCT_TYPE")
				if cvs(callpoint!.getColumnData("SAM_CUSTTERR.ITEM_ID"),2) <>"" then
					key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTERR.ITEM_ID")
				endif
			endif
		endif
	endif
endif

call stbl("+DIR_SYP")+"bac_key_template.bbj","SAM_CUSTTERR","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_CUSTTERR",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_CUSTTERR.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_CUSTTERR.TERRITORY",rd_key.territory$)
callpoint!.setColumnData("SAM_CUSTTERR.CUSTOMER_ID",rd_key.customer_id$)
callpoint!.setColumnData("SAM_CUSTTERR.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_CUSTTERR.ITEM_ID",rd_key.item_id$)
callpoint!.setStatus("REFRESH")
