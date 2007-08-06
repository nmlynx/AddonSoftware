[[SAM_NONSTOCK.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records
key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_NONSTOCK.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_NONSTOCK.YEAR")
	if cvs(callpoint!.getColumnData("SAM_NONSTOCK.PRODUCT_TYPE"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_NONSTOCK.PRODUCT_TYPE")
		if cvs(callpoint!.getColumnData("SAM_NONSTOCK.NONSTOCK_NO"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_NONSTOCK.NONSTOCK_NO")
		endif
	endif
endif

call stbl("+DIR_PGM")+"adc_key_template.aon","SAM_NONSTOCK","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call stbl("+DIR_PGM")+"rdm_inquiry.aon",
:	gui_dev,
:	Form!,
:	"SAM_NONSTOCK",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_NONSTOCK.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_NONSTOCK.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_NONSTOCK.NONSTOCK_NO",rd_key.nonstock_no$)
callpoint!.setStatus("REFRESH")
