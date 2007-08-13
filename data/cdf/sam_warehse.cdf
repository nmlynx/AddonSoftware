[[SAM_WAREHSE.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records
key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_WAREHSE.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_WAREHSE.YEAR")
	if cvs(callpoint!.getColumnData("SAM_WAREHSE.WAREHOUSE_ID"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_WAREHSE.WAREHOUSE_ID")
		if cvs(callpoint!.getColumnData("SAM_WAREHSE.PRODUCT_TYPE"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_WAREHSE.PRODUCT_TYPE")
			if cvs(callpoint!.getColumnData("SAM_WAREHSE.ITEM_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_WAREHSE.ITEM_ID")
			endif
		endif
	endif
endif

call stbl("+DIR_SYP")+"bac_key_template.bbj","SAM_WAREHSE","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_WAREHSE",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_WAREHSE.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_WAREHSE.WAREHOUSE_ID",rd_key.warehouse_id$)
callpoint!.setColumnData("SAM_WAREHSE.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_WAREHSE.ITEM_ID",rd_key.item_id$)
callpoint!.setStatus("REFRESH")
