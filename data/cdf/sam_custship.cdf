[[SAM_CUSTSHIP.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records
key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_CUSTSHIP.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSHIP.YEAR")
	if cvs(callpoint!.getColumnData("SAM_CUSTSHIP.CUSTOMER_ID"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSHIP.CUSTOMER_ID")
		if cvs(callpoint!.getColumnData("SAM_CUSTSHIP.SHIPTO_NO"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSHIP.SHIPTO_NO")
			if cvs(callpoint!.getColumnData("SAM_CUSTSHIP.ITEM_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSHIP.ITEM_ID")
			endif
		endif
	endif
endif

call stbl("+DIR_SYP")+"bac_key_template.bbj","SAM_CUSTSHIP","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call stbl("+DIR_SYP")+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_CUSTSHIP",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

if len(cvs(rd_key$,2))>0 then
	callpoint!.setColumnData("SAM_CUSTSHIP.YEAR",rd_key.year$)
	callpoint!.setColumnData("SAM_CUSTSHIP.CUSTOMER_ID",rd_key.customer_id$)
	callpoint!.setColumnData("SAM_CUSTSHIP.SHIPTO_NO",rd_key.shipto_no$)
	callpoint!.setColumnData("SAM_CUSTSHIP.ITEM_ID",rd_key.item_id$)
	callpoint!.setStatus("REFRESH")
endif
