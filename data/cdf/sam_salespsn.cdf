[[SAM_SALESPSN.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records
key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_SALESPSN.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_SALESPSN.YEAR")
	if cvs(callpoint!.getColumnData("SAM_SALESPSN.SLSPSN_CODE"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_SALESPSN.SLSPSN_CODE")
		if cvs(callpoint!.getColumnData("SAM_SALESPSN.PRODUCT_TYPE"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_SALESPSN.PRODUCT_TYPE")
			if cvs(callpoint!.getColumnData("SAM_SALESPSN.ITEM_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_SALESPSN.ITEM_ID")
			endif
		endif
	endif
endif

call stbl("+DIR_SYP")+"bac_key_template.bbj","SAM_SALESPSN","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_SALESPSN",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_SALESPSN.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_SALESPSN.SLSPSN_CODE",rd_key.slspsn_code$)
callpoint!.setColumnData("SAM_SALESPSN.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_SALESPSN.ITEM_ID",rd_key.item_id$)
callpoint!.setStatus("REFRESH")
