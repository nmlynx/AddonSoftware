[[SAM_PRODITMCST.AOPT-SALU]]
rem -- call inquiry program to view Sales Analysis Records

syspgmdir$=stbl("+DIR_SYP",err=*next)

key_pfx$=firm_id$
if cvs(callpoint!.getColumnData("SAM_PRODITMCST.YEAR"),2) <>"" then
	key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.YEAR")
	if cvs(callpoint!.getColumnData("SAM_PRODITMCST.PRODUCT_TYPE"),2) <>"" then
		key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.PRODUCT_TYPE")
		if cvs(callpoint!.getColumnData("SAM_PRODITMCST.ITEM_ID"),2) <>"" then
			key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.ITEM_ID")
			if cvs(callpoint!.getColumnData("SAM_PRODITMCST.CUSTOMER_ID"),2) <>"" then
				key_pfx$=key_pfx$+callpoint!.getColumnData("SAM_PRODITMCST.CUSTOMER_ID")
			endif
		endif
	endif
endif

call syspgmdir$+"bac_key_template.bbj","SAM_CUSTOMER","ALT_KEY_01",key_temp$,table_chans$[all],rd_stat$
dim rd_key$:key_temp$
call syspgmdir$+"bam_inquiry.bbj",
:	gui_dev,
:	Form!,
:	"SAM_CUSTOMER",
:	"LOOKUP",
:	table_chans$[all],
:	key_pfx$,
:	"ALT_KEY_01",
:	rd_key$

rem --- get record and redisplay

sam_tpl$=fnget_tpl$("SAM_CUSTOMER")
dim sam_tpl$:sam_tpl$
while 1
	readrecord(fnget_dev("SAM_CUSTOMER"),key=rd_key$,knum=1,dom=*break)sam_tpl$
	callpoint!.setColumnData("SAM_PRODITMCST.YEAR",rd_key.year$)
	callpoint!.setColumnData("SAM_PRODITMCST.PRODUCT_TYPE",rd_key.product_type$)
	callpoint!.setColumnData("SAM_PRODITMCST.ITEM_ID",rd_key.item_id$)
	callpoint!.setColumnData("SAM_PRODITMCST.CUSTOMER_ID",rd_key.customer_id$)
	For x=1 to 13
		callpoint!.setColumnData("SAM_PRODITMCST.QTY_SHIPPED_"+str(x:"00"),FIELD(sam_tpl$,"qty_shipped_"+str(x:"00")))
		callpoint!.setColumnData("SAM_PRODITMCST.TOTAL_COST_"+str(x:"00"),FIELD(sam_tpl$,"total_cost_"+str(x:"00")))
		callpoint!.setColumnData("SAM_PRODITMCST.TOTAL_SALES_"+str(x:"00"),FIELD(sam_tpl$,"total_sales_"+str(x:"00")))
	next x
	callpoint!.setStatus("REFRESH")
	break
wend
