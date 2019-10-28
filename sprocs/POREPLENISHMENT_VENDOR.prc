rem ----------------------------------------------------------------------------
rem --- PO Replenishment Register - Vendor
rem --- Program: POREPLENISHMENT_VENDOR.prc 

rem --- Copyright BASIS International Ltd.  All Rights Reserved.

rem --- 10/2019 ------------------------
rem --- Replaced single-column DocOut report with Jasper report

rem --- There are five sprocs/.jaspers for this document:
rem ---    - POREPLENISHMENT.prc / POReplenishment.jasper
rem ---    - POREPLENISHMENT_ITEM.prc / POReplenishment_item.jasper
rem ---    - POREPLENISHMENT_PRODUCT.prc / POReplenishment_product.jasper
rem ---    - POREPLENISHMENT_SELECTION.prc / POReplenishment_selection.jasper
rem ---    - POREPLENISHMENT_VENDOR.prc / POReplenishment_vendor.jasper

rem ----------------------------------------------------------------------------

    seterr sproc_error

    declare BBjStoredProcedureData sp!
    declare BBjRecordSet rs!
    declare BBjRecordData data!

rem --- Get the infomation object for the Stored Procedure
    sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem --- get SPROC parameters

    firm_id$=sp!.getParameter("FIRM_ID")
    buyer_code$=sp!.getParameter("BUYER_CODE")
    vendor_id$=sp!.getParameter("VENDOR_ID")
    vendorLen=num(sp!.getParameter("VENDOR_LEN"))
    barista_wd$=sp!.getParameter("BARISTA_WD")
    amountMask$=sp!.getParameter("AMOUNT_MASK")
    unitsMask$=sp!.getParameter("UNITS_MASK")
    vendorMask$=sp!.getParameter("VEND_MASK")
    weightMask$=sp!.getParameter("WEIGHT_MASK")
    aon_none$=sp!.getParameter("AON_NONE")
    aon_n_none$=sp!.getParameter("AON_N_NONE")
    aon_d_dollars$=sp!.getParameter("AON_D_DOLLARS")
    aon_through_last_date$=sp!.getParameter("AON_THROUGH_LAST_DATE")
    aon_through_review_date$=sp!.getParameter("AON_THROUGH_REVIEW_DATE")
    aon_u_units$=sp!.getParameter("AON_U_UNITS")
    aon_w_weight$=sp!.getParameter("AON_W_WEIGHT")

    chdir barista_wd$

rem --- create the in memory recordset for return

    dataTemplate$ = ""
    dataTemplate$ = dataTemplate$ + "vendor:C(1*),vendor_name:C(1*),"
    dataTemplate$ = dataTemplate$ + "vendor_addr_line1:C(1*),vendor_addr_line2:C(1*),vendor_addr_line3:C(1*),"
    dataTemplate$ = dataTemplate$ + "vendor_contact:C(1*),vendor_phone:C(1*),vendor_fax:C(1*),"
    dataTemplate$ = dataTemplate$ + "next_review:C(1*),prior_review:C(1*),last_receipt:C(1*),"
    dataTemplate$ = dataTemplate$ + "target_type:C(1*),cycle_days:C(1*),"
    dataTemplate$ = dataTemplate$ + "target_units:C(1*),target_weight:C(1*),target_dollars:C(1*),review_date:C(1*),"
    dataTemplate$ = dataTemplate$ + "vend_tot_sugg_order_qty:C(1*),vend_tot_total_weight:C(1*),vend_tot_extended_amt:C(1*)"

    rs! = BBJAPI().createMemoryRecordSet(dataTemplate$)
   
rem --- Use statements and Declares
	
    use ::ado_func.src::func

rem --- Retrieve the program path

    pgmdir$=""
    pgmdir$=stbl("+DIR_PGM",err=*next)
    sypdir$=""
    sypdir$=stbl("+DIR_SYP",err=*next)

rem --- Open Files    
rem --- Note 'files' and 'channels[]' are used in close loop, so don't re-use

    files=4,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]    

    files$[1]="poe-06",ids$[1]="POE_ORDHDR"
    files$[2]="poe-26",ids$[2]="POE_ORDTOT"
    files$[3]="apm-01",ids$[3]="APM_VENDMAST"
    files$[4]="apm-06",ids$[4]="APM_VENDREPL"

	call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],ids$[all],templates$[all],channels[all],batch,status

    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
    
	files_opened = files; rem used in loop to close files
	
    poeOrdHdr_dev=channels[1]; dim poeOrdHdr$:templates$[1]
    poeOrdTot_dev=channels[2]; dim poeOrdTot$:templates$[2]
    apmVendMast_dev=channels[3]; dim apmVendMast$:templates$[3]
    apmVendRepl_dev=channels[4]; dim apmVendRepl$:templates$[4]
    
rem --- Init Read

    read(poeOrdHdr_dev,key=firm_id$+buyer_code$+vendor_id$,dir=0,dom=*next)
    while 1
        readrecord(poeOrdHdr_dev,end=*break)poeOrdHdr$
        if poeOrdHdr.firm_id$+poeOrdHdr.buyer_code$+poeOrdHdr.vendor_id$<>firm_id$+buyer_code$+vendor_id$ then break
        if cvs(poeOrdHdr.cycle_date$,2)<>""
            review_date$=aon_through_review_date$+fndate$(poeOrdHdr.cycle_date$)
        else
            review_date$=aon_through_last_date$
        endif

        gosub vendor_break        

        rem --- Get totals for this vendor?
        total_sugg_order_qty=0
        total_total_weight_num=0
        total_extended_amt=0
        read(poeOrdTot_dev,key=firm_id$+buyer_code$+vendor_id$,dom=*next)
        while 1
            readrecord(poeOrdTot_dev,end=*break)poeOrdTot$
            if poeOrdTot.firm_id$+poeOrdTot.buyer_code$+poeOrdTot.vendor_id$<>firm_id$+buyer_code$+vendor_id$ then break
            total_sugg_order_qty=total_sugg_order_qty+poeOrdTot.sugg_ord_qty
            total_total_weight_num=total_total_weight_num+poeOrdTot.weight
            total_extended_amt=total_extended_amt+poeOrdTot.extended_amt
        wend

        data! = rs!.getEmptyRecordData()
        data!.setFieldValue("vendor",fnmask$(vendor_id$(1,vendorLen),vendorMask$))
        data!.setFieldValue("vendor_name",fnmask$(vendor_id$(1,vendorLen),vendorMask$)+"   "+apmVendMast.vendor_name$)
        data!.setFieldValue("vendor_addr_line1",addr_line1$)
        data!.setFieldValue("vendor_addr_line2",addr_line2$)
        data!.setFieldValue("vendor_addr_line3",addr_line3$)
        data!.setFieldValue("vendor_contact",contact$)
        data!.setFieldValue("vendor_phone",phone$)
        data!.setFieldValue("vendor_fax",fax$)
        data!.setFieldValue("next_review",nxtrev$)
        data!.setFieldValue("prior_review",prirev$)
        data!.setFieldValue("last_receipt",lastrcpt$)
        data!.setFieldValue("target_type",targetType$)
        data!.setFieldValue("cycle_days",cycleDays$)
        data!.setFieldValue("target_units",targetUnits$)
        data!.setFieldValue("target_weight",targetWeight$)
        data!.setFieldValue("target_dollars",targetDollars$)
        data!.setFieldValue("review_date",review_date$)
        data!.setFieldValue("vend_tot_sugg_order_qty",str(total_sugg_order_qty))
        data!.setFieldValue("vend_tot_total_weight",str(total_total_weight_num))
        data!.setFieldValue("vend_tot_extended_amt",str(total_extended_amt))

        rs!.insert(data!)
    wend

rem Tell the stored procedure to return the result set.
	sp!.setRecordSet(rs!)
    
	goto std_exit

vendor_break: rem --- Vendor break

    vendor_id$=poeOrdHdr.vendor_id$
    redim apmVendMast$
    findrecord(apmVendMast_dev,key=firm_id$+vendor_id$,dom=*next)apmVendMast$

    addr_line1$=apmVendMast.addr_line_1$
    addr_line2$=apmVendMast.addr_line_2$
    addr_line3$=cvs(apmVendMast.city$,51)+", "+apmVendMast.state_code$
    call stbl("+DIR_SYP")+"bac_getmask.bbj","P",cvs(apmVendMast.zip_code$,2),"",postal_mask$
    zip$=cvs(apmVendMast.zip_code$,2)
    if zip$<>"" then zip$=str(zip$:postal_mask$,err=*next)
    if cvs(apmVendMast.city$,2)+cvs(apmVendMast.state_code$,2)<>"" then
        addr_line3$=cvs(addr_line3$,2)+"  "+zip$
    else
        addr_line3$=""
        if cvs(addr_line2$,2)<>"" then
            addr_line2$=cvs(addr_line2$,2)+"  "+zip$
        else
            addr_line2$=zip$
        endif
    endif
    if cvs(addr_line2$,2)="" then
        addr_line2$=addr_line3$
        addr_line3$=""
    endif

    contact$=apmVendMast.contact_name$
    call stbl("+DIR_SYP")+"bac_getmask.bbj","T",cvs(apmVendMast.phone_no$,2),"",phone_mask$
    phone$=cvs(apmVendMast.phone_no$,2)
    if phone$<>"" then phone$=str(phone$:phone_mask$,err=*next)
    call stbl("+DIR_SYP")+"bac_getmask.bbj","T",cvs(apmVendMast.fax_no$,2),"",fax_mask$
    fax$=cvs(apmVendMast.fax_no$,2)
    if fax$<>"" then fax$=str(fax$:fax_mask$,err=*next)

    redim apmVendRepl$
    findrecord(apmVendRepl_dev,key=firm_id$+vendor_id$+buyer_code$,dom=*next)apmVendRepl$

    nxtrev$=iff(cvs(apmVendRepl.nxt_rev_date$,2)="", aon_none$, fndate$(apmVendRepl.nxt_rev_date$))
    prirev$=iff(cvs(apmVendRepl.pri_rev_date$,2)="", aon_none$, fndate$(apmVendRepl.pri_rev_date$))
    lastrcpt$=iff(cvs(apmVendRepl.lstrec_date$,2)="", aon_none$, fndate$(apmVendRepl.lstrec_date$))

    switch pos(apmVendRepl.pur_tgt_type$="NDWU")
        case 1
            targetType$=aon_n_none$
            break
        case 2
            targetType$=aon_n_dollars$
            break
        case 3
            targetType$=aon_w_weight$
            break
        case 4
            targetType$=aon_u_units$
            break
        case default
            targetType$=""
            break
    swend

    cycleDays$=str(apmVendRepl.rev_days:"##0")
    targetUnits$=str(apmVendRepl.pur_tgt_unit:unitsMask$)
    targetWeight$=str(apmVendRepl.pur_targ_lbs:weightMask$)
    targetDollars$=str(apmVendRepl.pur_targ_amt:amountMask$)
    
    return

rem --- Standard AddonSoftware functions (01Mar2006)

rem --- Date/time handling functions

    def fndate$(q$)
        q1$=""
        q1$=date(jul(num(q$(1,4)),num(q$(5,2)),num(q$(7,2)),err=*next),err=*next)
        if q1$="" q1$=q$
        return q1$
    fnend

rem --- fnmask$: Alphanumeric Masking Function (formerly fnf$)

    def fnmask$(q1$,q2$)
        if cvs(q1$,2)="" return ""
        if q2$="" q2$=fill(len(q1$),"0")
        if pos("E"=cvs(q1$,4)) goto alpha_mask
:      else return str(-num(q1$,err=alpha_mask):q2$,err=alpha_mask)
alpha_mask:
        q=1
        q0=0
        while len(q2$(q))
            if pos(q2$(q,1)="-()") q0=q0+1 else q2$(q,1)="X"
            q=q+1
        wend
        if len(q1$)>len(q2$)-q0 q1$=q1$(1,len(q2$)-q0)
        return str(q1$:q2$)
    fnend
    
rem #include std_end.src

sproc_error:rem --- SPROC error trap/handler
    rd_err_text$="", err_num=err
    if tcb(2)=0 and tcb(5) then rd_err_text$=pgm(tcb(5),tcb(13),err=*next)
    x$=stbl("+THROWN_ERR","TRUE")   
    throw "["+pgm(-2)+"] "+str(tcb(5))+": "+rd_err_text$,err_num
	
std_exit:

	rem --- Close files
		x = files_opened
		while x>=1
			close (channels[x],err=*next)
			x=x-1
		wend

    end
