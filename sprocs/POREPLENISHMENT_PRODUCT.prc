rem ----------------------------------------------------------------------------
rem --- PO Replenishment Register - Product
rem --- Program: POREPLENISHMENT_PRODUCT.prc 

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
    barista_wd$=sp!.getParameter("BARISTA_WD")
    sugg_itemsonly$=sp!.getParameter("SUGG_ITEMSONLY")

    chdir barista_wd$

rem --- create the in memory recordset for return

    dataTemplate$ = ""
    dataTemplate$ = dataTemplate$ + "product_type:C(3),product:C(1*),have_items:C(1),"
    dataTemplate$ = dataTemplate$ + "prod_tot_sugg_order_qty:C(1*),prod_tot_total_weight:C(1*),prod_tot_extended_amt:C(1*)"

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

    files=3,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]    

    files$[1]="poe-16",ids$[1]="POE_ORDDET"
    files$[2]="poe-26",ids$[2]="POE_ORDTOT"
    files$[3]="ivc_prodcode",ids$[3]="IVC_PRODCODE"

	call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],ids$[all],templates$[all],channels[all],batch,status

    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
    
    files_opened = files; rem used in loop to close files
	
    poeOrdDet_dev=channels[1]; dim poeOrdDet$:templates$[1]
    poeOrdTot_dev=channels[2]; dim poeOrdTot$:templates$[2]
    ivcProdCode_dev=channels[3]; dim ivcProdCode$:templates$[3]
    
rem --- Init Read

    product_type$=""

    read(poeOrdDet_dev,key=firm_id$+buyer_code$+vendor_id$,dom=*next)
    while 1
        readrecord(poeOrdDet_dev,end=*break)poeOrdDet$
        if poeOrdDet.firm_id$+poeOrdDet.buyer_code$+poeOrdDet.vendor_id$<>firm_id$+buyer_code$+vendor_id$ then break
        if poeOrdDet.firm_id$+poeOrdDet.buyer_code$+poeOrdDet.vendor_id$+poeOrdDet.product_type$=firm_id$+buyer_code$+vendor_id$+product_type$ then continue
        if poeOrdDet.product_type$<>product_type$ then gosub product_break        

        rem --- Get totals for this product?
        total_sugg_order_qty=0
        total_total_weight_num=0
        total_extended_amt=0
        read(poeOrdTot_dev,key=firm_id$+buyer_code$+vendor_id$+product_type$,dom=*next)
        while 1
            readrecord(poeOrdTot_dev,end=*break)poeOrdTot$
            if poeOrdTot.firm_id$+poeOrdTot.buyer_code$+poeOrdTot.vendor_id$+poeOrdTot.product_type$<>firm_id$+buyer_code$+vendor_id$+product_type$ then break
            total_sugg_order_qty=total_sugg_order_qty+poeOrdTot.sugg_ord_qty
            total_total_weight_num=total_total_weight_num+poeOrdTot.weight
            total_extended_amt=total_extended_amt+poeOrdTot.extended_amt
        wend
        if sugg_itemsonly$="Y" then
            haveItems$=iff(total_sugg_order_qty=0, "N", "Y")
        else
            haveItems$="Y"
        endif

        data! = rs!.getEmptyRecordData()
        data!.setFieldValue("product_type",poeOrdDet.product_type$)
        data!.setFieldValue("product",cvs(poeOrdDet.product_type$,2)+"   "+ivcProdCode.code_desc$)
        data!.setFieldValue("have_items",haveItems$)
        data!.setFieldValue("prod_tot_sugg_order_qty",str(total_sugg_order_qty))
        data!.setFieldValue("prod_tot_total_weight",str(total_total_weight_num))
        data!.setFieldValue("prod_tot_extended_amt",str(total_extended_amt))

        rs!.insert(data!)
    wend

rem Tell the stored procedure to return the result set.
	sp!.setRecordSet(rs!)
    
	goto std_exit

product_break: rem --- Product break

    product_type$=poeOrdDet.product_type$
    redim ivcProdCode$
    findrecord(ivcProdCode_dev,key=firm_id$+"A"+product_type$,dom=*next)ivcProdCode$

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
