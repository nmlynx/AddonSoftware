[[SAM_CUSTSIC.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records

syspgmdir$=stbl("+DIR_SYP",err=*next)

key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_CUSTSIC.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSIC.YEAR")
	if cvs(callpoint!.getColumnData("SAM_CUSTSIC.SIC_CODE"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSIC.SIC_CODE")
		if cvs(callpoint!.getColumnData("SAM_CUSTSIC.PRODUCT_TYPE"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSIC.PRODUCT_TYPE")
			if cvs(callpoint!.getColumnData("SAM_CUSTSIC.ITEM_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_CUSTSIC.ITEM_ID")
			endif
		endif
	endif
endif

call syspgmdir$+"bac_key_template.bbj","SAM_CUSTSIC","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call syspgmdir$+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_CUSTSIC",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

callpoint!.setColumnData("SAM_CUSTSIC.YEAR",rd_key.year$)
callpoint!.setColumnData("SAM_CUSTSIC.SIC_CODE",rd_key.sic_code$)
callpoint!.setColumnData("SAM_CUSTSIC.PRODUCT_TYPE",rd_key.product_type$)
callpoint!.setColumnData("SAM_CUSTSIC.ITEM_ID",rd_key.item_id$)
callpoint!.setStatus("REFRESH")
