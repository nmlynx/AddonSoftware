[[SAM_CUSTOMER.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis records

syspgmdir$=stbl("+DIR_SYP",err=*next)

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

call syspgmdir$+"bac_key_template.bbj","SAM_CUSTOMER","PRIMARY",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call syspgmdir$+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_CUSTOMER",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"PRIMARY",
:	rd_key$

rem --- get record and redisplay

sam_tpl$=fnget_tpl$("SAM_CUSTOMER")
dim sam_tpl$:sam_tpl$
escape
while 1
	readrecord(fnget_dev("SAM_CUSTOMER"),key=rd_key$,dom=*break)sam_tpl$
	callpoint!.setColumnData("SAM_CUSTOMER.YEAR",rd_key.year$)
	callpoint!.setColumnData("SAM_CUSTOMER.CUSTOMER_ID",rd_key.customer_id$)
	callpoint!.setColumnData("SAM_CUSTOMER.PRODUCT_TYPE",rd_key.product_type$)
	callpoint!.setColumnData("SAM_CUSTOMER.ITEM_ID",rd_key.item_id$)
For x=1 to 13
callpoint!.setColumnData("SAM_CUSTOMER.QTY_SHIPPED_"+str(x:”00”),"FIELD(sam_tpl$,”qty_shipped_”+str(x:”00”))")
next x

	callpoint!.setStatus("REFRESH")
	break
wend
