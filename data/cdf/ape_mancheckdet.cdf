[[APE_MANCHECKDET.DISCOUNT_AMT.AVEC]]
gosub calc_tots
gosub disp_tots

[[APE_MANCHECKDET.DISCOUNT_AMT.AVAL]]
net_paid=num(callpoint!.getColumnData("APE_MANCHECKDET.INVOICE_AMT"))-num(callpoint!.getColumnData("APE_MANCHECKDET.DISCOUNT_AMT"))
callpoint!.setColumnData("APE_MANCHECKDET.NET_PAID_AMT",str(net_paid))
callpoint!.setStatus("MODIFIED-REFRESH")
[[APE_MANCHECKDET.INVOICE_AMT.AVEC]]
gosub calc_tots
gosub disp_tots

apt_invoicehdr_dev=fnget_dev("APT_INVOICEHDR")			
dim apt01a$:fnget_tpl$("APT_INVOICEHDR")

ap_type$=field(apt01a$,"AP_TYPE")
vendor_id$=field(apt01a$,"VENDOR_ID")
ap_type$(1)=UserObj!.getItem(num(user_tpl.ap_type_vpos$)).getText()
vendor_id$(1)=UserObj!.getItem(num(user_tpl.vendor_id_vpos$)).getText()

apt01ak1$=firm_id$+ap_type$+vendor_id$+callpoint!.getColumnData("APE_MANCHECKDET.AP_INV_NO")
readrecord(apt_invoicehdr_dev,key=apt01ak1$,dom=*next)apt01a$
if apt01a$(1,len(apt01ak1$))<>apt01ak1$ 

	gosub get_gl_tots
	user_id$=stbl("+USER_ID")
	dim dflt_data$[1,1]
	key_pfx$=callpoint!.getColumnData("APE_MANCHECKDET.FIRM_ID")+callpoint!.getColumnData("APE_MANCHECKDET.AP_TYPE")+
:		callpoint!.getColumnData("APE_MANCHECKDET.CHECK_NO")+callpoint!.getColumnData("APE_MANCHECKDET.VENDOR_ID")+
:		callpoint!.getColumnData("APE_MANCHECKDET.AP_INV_NO")
	call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:	"APE_MANCHECKDIST",
:	user_id$,
:	"MNT",
:	key_pfx$,
:	table_chans$[all],
:	"",
:	dflt_data$[all]

	glns!=bbjapi().getNamespace("GLNS","GL Dist",1)
	amt_dist=num(glns!.getValue("dist_amt"))
	if amt_dist<>num(callpoint!.getColumnData("APE_MANCHECKDET.INVOICE_AMT"))
		msg_id$="AP_NOBAL"
		gosub disp_message
	endif


wk =Form!.getChildWindow(1109).getControl(5900).getSelectedRow()
Form!.getChildWindow(1109).getControl(5900).focus()
rem --- Form!.getChildWindow(1109).getControl(5900).startEdit(wk,5)
rem --- Form!.focus()
	
endif
[[APE_MANCHECKDET.INVOICE_AMT.AVAL]]
net_paid=num(callpoint!.getColumnData("APE_MANCHECKDET.INVOICE_AMT"))-num(callpoint!.getColumnData("APE_MANCHECKDET.DISCOUNT_AMT"))
callpoint!.setColumnData("APE_MANCHECKDET.NET_PAID_AMT",str(net_paid))

glns!=bbjapi().getNamespace("GLNS","GL Dist",1)
glns!.setValue("dist_amt",callpoint!.getColumnData("APE_MANCHECKDET.INVOICE_AMT"))
glns!.setValue("dflt_dist",user_tpl.dflt_dist_cd$)
glns!.setValue("dflt_gl",user_tpl.dflt_gl_account$)

callpoint!.setStatus("MODIFIED-REFRESH")
[[APE_MANCHECKDET.AP_INV_NO.AVAL]]
dtlGrid!=Form!.getChildWindow(1109).getControl(5900)

old_inv_no$=dtlGrid!.getCellText(dtlGrid!.getSelectedRow(),0)
new_inv_no$=dtlGrid!.getValidationText()

apt_invoicehdr_dev=fnget_dev("APT_INVOICEHDR")
apt_invoicedet_dev=fnget_dev("APT_INVOICEDET")

dim apt01a$:fnget_tpl$("APT_INVOICEHDR")
dim apt11a$:fnget_tpl$("APT_INVOICEDET")

inv_amt=0,disc_amt=0,ret_amt=0

ap_type$=field(apt01a$,"AP_TYPE")
vendor_id$=field(apt01a$,"VENDOR_ID")
ap_type$(1)=UserObj!.getItem(num(user_tpl.ap_type_vpos$)).getText()
vendor_id$(1)=UserObj!.getItem(num(user_tpl.vendor_id_vpos$)).getText()

apt01ak1$=firm_id$+ap_type$+vendor_id$+callpoint!.getColumnData("APE_MANCHECKDET.AP_INV_NO")+"00"
apt11ak1$=apt01ak1$(1,len(apt01ak1$)-2)
readrecord(apt_invoicehdr_dev,key=apt01ak1$,dom=*next)apt01a$
if apt01a$(1,len(apt01ak1$))=apt01ak1$
	inv_amt=num(apt01a.invoice_amt$)
	disc_amt=num(apt01a.discount_amt$)
	ret_amt=num(apt01a.retention$)
	more_dtl=1
	read(apt_invoicedet_dev,key=apt11ak1$,dom=*next)							
	while more_dtl
		readrecord(apt_invoicedet_dev,end=*next)apt11a$
		if apt11a$(1,len(apt11ak1$))=apt11ak1$
			inv_amt=inv_amt+num(apt11a.trans_amt$)
			disc_amt=disc_amt+num(apt11a.trans_disc$)
			ret_amt=ret_amt+num(apt11a.trans_ret$)			
		else
			more_dtl=0
		endif
	wend
	callpoint!.setColumnData("APE_MANCHECKDET.INVOICE_DATE",apt01a.invoice_date$)
	callpoint!.setColumnData("APE_MANCHECKDET.AP_DIST_CODE",apt01a.ap_dist_code$)

	rem --- disable inv date/dist code, leaving only inv amt/disc amt enabled for open invoice
	w!=Form!.getChildWindow(1109)
	c!=w!.getControl(5900)
	c!.setColumnEditable(1,0)
	c!.setColumnEditable(2,0)
	c!.startEdit(c!.getSelectedRow(),4)
else
	rem --- enable inv date/dist code if on invoice not in open invoice file
	rem --- also have user confirm that the invoice wasn't found in Open Invoice file
	msg_id$="AP_EXT_INV"
	gosub disp_message
	w!=Form!.getChildWindow(1109)
	c!=w!.getControl(5900)
	c!.setColumnEditable(1,1)
	c!.setColumnEditable(2,1)
	callpoint!.setColumnData("APE_MANCHECKDET.AP_DIST_CODE",user_tpl.dflt_dist_cd$)
endif

	callpoint!.setColumnData("APE_MANCHECKDET.INVOICE_AMT",str(inv_amt))
	callpoint!.setColumnData("APE_MANCHECKDET.DISCOUNT_AMT",str(disc_amt))
	callpoint!.setColumnData("APE_MANCHECKDET.RETENTION",str(ret_amt))
	callpoint!.setColumnData("APE_MANCHECKDET.NET_PAID_AMT",str(inv_amt-disc_amt-ret_amt))

callpoint!.setStatus("MODIFIED-REFRESH")
endif
[[APE_MANCHECKDET.<CUSTOM>]]
calc_tots:

	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	tinv=0,tdisc=0,tret=0
	if numrecs>0
		for reccnt=0 to numrecs-1
			if gridrec$<>""
				gridrec$=recVect!.getItem(reccnt)
				tinv=tinv+num(gridrec.invoice_amt$)
				tdisc=tdisc+num(gridrec.discount_amt$)
				tret=tret+num(gridrec.retention$)
			endif
		next reccnt
	endif

return

disp_tots:

    rem --- get context and ID of display controls for totals, and redisplay w/ amts from calc_tots
    
    tinv!=UserObj!.getItem(num(user_tpl.tinv_vpos$))
    tinv!.setValue(tinv)

    tdisc!=UserObj!.getItem(num(user_tpl.tdisc_vpos$))
    tdisc!.setValue(tdisc)

    tret!=UserObj!.getItem(num(user_tpl.tret_vpos$))
    tret!.setValue(tret)

    tchk!=UserObj!.getItem(num(user_tpl.tchk_vpos$))
    tchk!.setValue(tinv-tdisc-tret)

return

get_gl_tots:

	ape12_dev=fnget_dev("APE_MANCHECKDIST")				
	dim ape12a$:fnget_tpl$("APE_MANCHECKDIST")
	amt_dist=0
	ape12ak1$=firm_id$+callpoint!.getColumnData("APE_MANCHECKDET.AP_TYPE")+
:	callpoint!.getColumnData("APE_MANCHECKDET.CHECK_NO")+callpoint!.getColumnData("APE_MANCHECKDET.VENDOR_ID")+
:	callpoint!.getColumnData("APE_MANCHECKDET.AP_INV_NO")

	read(ape12_dev,key=ape12ak1$,dom=*next)
	more_dtl=1
	while more_dtl
		read record(ape12_dev,end=*break)ape12a$
		if ape12a$(1,len(ape12ak1$))=ape12ak1$
			amt_dist=amt_dist+num(ape12a.gl_post_amt$)
		else
			more_dtl=0
		endif
	wend
		pfx$="GLNS",nm$="GL Dist"
		GLNS!=BBjAPI().getNamespace(pfx$,nm$,1)
		GLNS!.setValue("dist_amt",str(amt_dist))

return
