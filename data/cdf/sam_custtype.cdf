[[SAM_CUSTTYPE.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records

syspgmdir$=stbl("+DIR_SYP",err=*next)

key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_CUSTTYPE.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTYPE.YEAR")
	if cvs(callpoint!.getColumnData("SAM_CUSTTYPE.CUSTOMER_TYPE"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTYPE.CUSTOMER_TYPE")
		if cvs(callpoint!.getColumnData("SAM_CUSTTYPE.PRODUCT_TYPE"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTYPE.PRODUCT_TYPE")
			if cvs(callpoint!.getColumnData("SAM_CUSTTYPE.ITEM_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTTYPE.ITEM_ID")
			endif
		endif
	endif
endif

call syspgmdir$+"bac_key_template.bbj","SAM_CUSTTYPE","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call syspgmdir$+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_CUSTTYPE",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_CUSTTYPE.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_CUSTTYPE.CUSTOMER_TYPE",rd_key.customer_type$)
callpoint!.setColumnData("SAM_CUSTTYPE.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_CUSTTYPE.ITEM_ID",rd_key.item_id$)
callpoint!.setStatus("REFRESH")
