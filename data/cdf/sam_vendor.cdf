[[SAM_VENDOR.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records

syspgmdir$=stbl("+DIR_SYP",err=*next)

key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_VENDOR.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_VENDOR.YEAR")
	if cvs(callpoint!.getColumnData("SAM_VENDOR.VENDOR_ID"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_VENDOR.VENDOR_ID")
		if cvs(callpoint!.getColumnData("SAM_VENDOR.PRODUCT_TYPE"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_VENDOR.PRODUCT_TYPE")
			if cvs(callpoint!.getColumnData("SAM_VENDOR.ITEM_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_VENDOR.ITEM_ID")
			endif
		endif
	endif
endif

call syspgmdir$+"bac_key_template.bbj","SAM_VENDOR","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call syspgmdir$+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_VENDOR",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_VENDOR.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_VENDOR.VENDOR_ID",rd_key.vendor_id$)
callpoint!.setColumnData("SAM_VENDOR.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_VENDOR.ITEM_ID",rd_key.item_id$)
callpoint!.setStatus("REFRESH")
