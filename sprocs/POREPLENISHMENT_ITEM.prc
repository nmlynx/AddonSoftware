rem ----------------------------------------------------------------------------
rem --- PO Replenishment Register - Item
rem --- Program: POREPLENISHMENT_ITEM.prc 

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
    product_type$=sp!.getParameter("PRODUCT_TYPE")
    barista_wd$=sp!.getParameter("BARISTA_WD")
    itemLen=num(sp!.getParameter("ITEM_LEN"))
    amountMask$=sp!.getParameter("AMOUNT_MASK")
    costMask$=sp!.getParameter("COST_MASK")
    itemMask$=sp!.getParameter("ITEM_MASK")
    unitsMask$=sp!.getParameter("UNITS_MASK")
    weightMask$=sp!.getParameter("WEIGHT_MASK")
    whse_detail$=sp!.getParameter("WHSE_DETAIL")
    sugg_itemsonly$=sp!.getParameter("SUGG_ITEMSONLY")

    chdir barista_wd$

rem --- create the in memory recordset for return

    dataTemplate$ = ""
    dataTemplate$ = dataTemplate$ + "estimated:C(2),item_desc:C(1*),"
    dataTemplate$ = dataTemplate$ + "whs:C(2),act_annl_usage:C(1*),period_avg_usage:C(1*),safety_stock:C(1*),lead_time:C(1*),avail:C(1*),on_order:C(1*),"
    dataTemplate$ = dataTemplate$ + "order_point:C(1*),max_qty:C(1*),eoq:C(1*),line_point:C(1*),unit_cost:C(1*),suggested_order_qty:C(1*),total_weight:C(1*),"
    dataTemplate$ = dataTemplate$ + "extension:C(1*),surplus:C(1*),"
    dataTemplate$ = dataTemplate$ + "adjustcodes:C(1*),total_act_annl_usage:C(1*),total_period_avg_usage:C(1*),total_avail:C(1*),total_on_order:C(1*),"
    dataTemplate$ = dataTemplate$ + "total_suggested_order_qty:C(1*),total_total_weight:C(1*),total_extension:C(1*),"
    dataTemplate$ = dataTemplate$ + "total_suggested_order_qty_num:C(1*),total_total_weight_num:C(1*),total_extension_num:C(1*)"

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

    files=5,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]    

    files$[1]="poe-16",ids$[1]="POE_ORDDET"
    files$[2]="poe-26",ids$[2]="POE_ORDTOT"
    files$[3]="poe-36",ids$[3]="POE_REPSURP"
    files$[4]="ivm-01",ids$[4]="IVM_ITEMMAST"
    files$[5]="ivs_params",ids$[5]="IVS_PARAMS"

	call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],ids$[all],templates$[all],channels[all],batch,status

    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
    
    files_opened = files; rem used in loop to close files
	
    poeOrdDet_dev=channels[1]; dim poeOrdDet$:templates$[1]
    poeOrdTot_dev=channels[2]; dim poeOrdTot$:templates$[2]
    poeRepSurp_dev=channels[3]; dim poeRepSurp$:templates$[3]
    ivmItemMast_dev=channels[4]; dim ivmItemMast$:templates$[4]
    ivsParams_dev=channels[5]; dim ivsParams$:templates$[5]

rem --- Retrieve parameter records

    ivsParams.desc_len_01$="30"
    ivsParams.desc_len_02$="0"
    ivsParams.desc_len_03$="0"     

    findrecord(ivsParams_dev,key=firm_id$+"IV00",dom=*next)ivsParams$
    desclen1=num(ivsParams.desc_len_01$)
    desclen2=num(ivsParams.desc_len_02$)
    desclen3=num(ivsParams.desc_len_03$)     

rem --- Init Data

    m9$="###0";rem lead time & cycle days
    
rem --- Init Read

    item_id$=""

    read(poeOrdDet_dev,key=firm_id$+buyer_code$+vendor_id$+product_type$,dom=*next)
    while 1
        readrecord(poeOrdDet_dev,end=*break)poeOrdDet$
        if poeOrdDet.firm_id$+poeOrdDet.buyer_code$+poeOrdDet.vendor_id$+poeOrdDet.product_type$<>firm_id$+buyer_code$+vendor_id$+product_type$ then break

        suggested_order_qty=poeOrdDet.sugg_ord_qty

        if poeOrdDet.usage_is_est$="Y" then estimated$="**"
        act_annl_usage$=str(poeOrdDet.annual_usage:unitsMask$)
        period_avg_usage$=str(poeOrdDet.avg_usage:unitsMask$)
        safety_stock$=str(poeOrdDet.safety_stock:unitsMask$)
        lead_time$=str(poeOrdDet.lead_time:m9$)
        avail$=str(poeOrdDet.qty_avail:unitsMask$)
        on_order$=str(poeOrdDet.qty_on_order:unitsMask$)
        order_point$=str(poeOrdDet.order_point:unitsMask$)
        max_qty$=str(poeOrdDet.maximum_qty:unitsMask$)
        eoq$=str(poeOrdDet.eoq:unitsMask$)
        line_point$=str(poeOrdDet.line_point:unitsMask$)
        unit_cost$=str(poeOrdDet.est_unit_cst:costMask$)
        suggested_order_qty$=str(suggested_order_qty:unitsMask$)
        total_weight$=str(poeOrdDet.weight:weightMask$)
        extension$=str(poeOrdDet.extended_amt:amountMask$)
 
        if poeOrdDet.item_id$<>item_id$ then
            gosub item_break
        else
            item_desc$=""
        endif        
        if poeOrdDet.warehouse_id$<>warehouse_id$ then gosub warehouse_break        

        if whse_detail$="Y" then gosub doSurplus

        gosub itemTotals
        rem --- Only show item totals after last warehouse
        poeOrdDet_key$=""
        poeOrdDet_key$=key(poeOrdDet_dev,end=*next)
        if pos(poeOrdDet.firm_id$+poeOrdDet.buyer_code$+poeOrdDet.vendor_id$+poeOrdDet.product_type$+poeOrdDet.item_id$=poeOrdDet_key$)=1 then adjustcodes$="skip"

        if sugg_itemsonly$="Y"
            if poeOrdTot.sugg_ord_qty=0 then
                rem --- Don't print item, surplus, or adjustments detail, but still report totals
                    item_desc$=""
                    surplus$=""
                    adjustcodes$="skip"
            endif
    
            if poeOrdDet.sugg_ord_qty=0 then 
                rem --- Don't print warehose detail, but still report totals
                whse$=""
                total_sugg_order_qty$="0"
                total_total_weight_num$="0"
                total_extended_amt$="0"
            endif
        endif

        data! = rs!.getEmptyRecordData()
        data!.setFieldValue("estimated",estimated$)
        data!.setFieldValue("item_desc",item_desc$)
        data!.setFieldValue("whs",whse$)
        data!.setFieldValue("act_annl_usage",act_annl_usage$)
        data!.setFieldValue("period_avg_usage",period_avg_usage$)
        data!.setFieldValue("safety_stock",safety_stock$)
        data!.setFieldValue("lead_time",lead_time$)
        data!.setFieldValue("avail",avail$)
        data!.setFieldValue("on_order",on_order$)
        data!.setFieldValue("order_point",order_point$)
        data!.setFieldValue("max_qty",max_qty$)
        data!.setFieldValue("eoq",eoq$)
        data!.setFieldValue("line_point",line_point$)
        data!.setFieldValue("unit_cost",unit_cost$)
        data!.setFieldValue("suggested_order_qty",suggested_order_qty$)
        data!.setFieldValue("total_weight",total_weight$)
        data!.setFieldValue("extension",extension$)
        data!.setFieldValue("surplus",surplus$)
        data!.setFieldValue("adjustcodes",adjustcodes$)
        data!.setFieldValue("total_act_annl_usage",total_act_annl_usage$)
        data!.setFieldValue("total_period_avg_usage",total_period_avg_usage$)
        data!.setFieldValue("total_avail",total_avail$)
        data!.setFieldValue("total_on_order",total_on_order$)
        data!.setFieldValue("total_suggested_order_qty",total_suggested_order_qty$)
        data!.setFieldValue("total_suggested_order_qty_num",total_sugg_order_qty$)
        data!.setFieldValue("total_total_weight",total_total_weight$)
        data!.setFieldValue("total_total_weight_num",total_total_weight_num$)
        data!.setFieldValue("total_extension",total_extension$)
        data!.setFieldValue("total_extension_num",total_extended_amt$)

        rs!.insert(data!)
    wend

rem Tell the stored procedure to return the result set.
	sp!.setRecordSet(rs!)

	goto std_exit

item_break: rem --- Item break
    
    item_id$=poeOrdDet.item_id$
    
    redim ivmItemMast$
    findrecord(ivmItemMast_dev,key=firm_id$+item_id$,dom=*next)ivmItemMast$
    item_desc$=cvs(fnmask$(item_id$(1,itemLen),itemMask$),2)+"  "+fnitem$(ivmItemMast.item_desc$,desclen1,desclen2,desclen3)

    minusannuse=0
    minusavguse=0
    minusavail=0
    minusonord=0

    gosub warehouse_break

    return

warehouse_break: rem --- Warehouse break

    if whse_detail$="Y" then
        whse$=poeOrdDet.warehouse_id$
    else
        whse$=""
    endif

    return

doSurplus: rem --- Get surplus form other warehouses

    surplus$="    "

    read(poeRepSurp_dev,key=firm_id$+item_id$,dom=*next)

    while 1
        readrecord (poeRepSurp_dev,end=*break)poeRepSurp$
        if pos(poeRepSurp.firm_id$+poeRepSurp.item_id$=firm_id$+item_id$)<>1 break
        if poeRepSurp.warehouse_id$<>whse$
            surplus$=surplus$+poeRepSurp.warehouse_id$+": "+cvs(str(poeRepSurp.surplus_qty:unitsMask$),3)+"      "
        endif
    wend

    return
    
itemTotals: rem --- Get totals for the item

    redim poeOrdTot$
    found=0
    findrecord(poeOrdTot_dev,key=firm_id$+buyer_code$+vendor_id$+product_type$+item_id$,dom=*next)poeOrdTot$;found=1

    if found then
        adjustcodes$=""
        for x=1 to 8
            adjustcodes$=adjustcodes$+field(poeOrdTot$,"ADJUST_CODE_"+str(x:"00"))
        next x
    else
        adjustcodes$="?????"
    endif

    total_act_annl_usage$=str(poeOrdTot.annual_usage-minusannuse:unitsMask$)
    total_period_avg_usage$=str(poeOrdTot.avg_usage-minusavguse:unitsMask$)
    total_avail$=str(poeOrdTot.qty_avail-minusavail:unitsMask$)
    total_on_order$=str(poeOrdTot.qty_on_order-minusonord:unitsMask$)
    total_suggested_order_qty$=str(poeOrdTot.sugg_ord_qty:unitsMask$)
    total_sugg_order_qty$=str(poeOrdTot.sugg_ord_qty)
    total_total_weight$=str(poeOrdTot.weight:weightMask$)
    total_total_weight_num$=str(poeOrdTot.weight)
    total_extension$=str(poeOrdTot.extended_amt:amountMask$)
    total_extended_amt$=str(poeOrdTot.extended_amt)

    return
    
rem --- Standard AddonSoftware functions (01Mar2006)

rem --- Format inventory item description

    def fnitem$(q$,q1,q2,q3)
        q$=pad(q$,q1+q2+q3)
        return cvs(q$(1,q1)+" "+q$(q1+1,q2)+" "+q$(q1+q2+1,q3),32)
    fnend

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
