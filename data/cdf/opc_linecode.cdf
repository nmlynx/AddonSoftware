[[OPC_LINECODE.BSHO]]
rem --- setup for G/L Parameter
	call stbl("+DIR_PGM")+"adc_application.aon","OP",info$[all]
	dim user_tpl$:"gl:c(1)"
	user_tpl.gl$=info$[9]
[[OPC_LINECODE.ARAR]]
rem --- re-enable all fields
	dim dctl$[7],dmap$[7]
	dctl$[1]="GL_REV_ACCT"
	dctl$[2]="TAXABLE_FLAG"
	dctl$[3]="DROPSHIP"
	dctl$[4]="PRODUCT_TYPE"
	dctl$[5]="DIST_CODE"
	dctl$[6]="PROD_TYPE_PR"
	dctl$[7]="MESSAGE_TYPE"
	line_type$=callpoint!.getColumnData("OPC_LINECODE.LINE_TYPE")
	if user_tpl.gl$<>"Y" or line_type$ = "O"
		dmap$[1]="I"
		dmap$[3]="I"
		dmap$[7]="I"
	endif
	if line_type$="M"
		dmap$[2]="I"
		dmap$[3]="I"
		dmap$[4]="I"
		dmap$[6]="I"
	endif
	if line_type$="N"
		dmap$[7]="I"
	endif
	if line_type$="S"
		dmap$[4]="I"
		dmap$[6]="I"
		dmap$[7]="I"
	endif
	if line_type$="P"
		dmap$[7]="I"
	endif
	gosub disable_ctls
[[OPC_LINECODE.BREA]]
rem --- re-enable all fields
	dim dctl$[7],dmap$[7]
	dctl$[1]="GL_REV_ACCT"
	dctl$[2]="TAXABLE_FLAG"
	dctl$[3]="DROPSHIP"
	dctl$[4]="PRODUCT_TYPE"
	dctl$[5]="DIST_CODE"
	dctl$[6]="PROD_TYPE_PR"
	dctl$[7]="MESSAGE_TYPE"
	gosub disable_ctls
[[OPC_LINECODE.<CUSTOM>]]
disable_ctls:rem --- disable selected control

for dctl=1 to 7
	dctl$=dctl$[dctl]
	wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=dmap$[dctl]
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP")
next dctl
return
