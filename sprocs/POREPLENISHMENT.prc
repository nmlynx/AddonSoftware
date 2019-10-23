rem ----------------------------------------------------------------------------
rem --- PO Replenishment Register
rem --- Program: POREPLENISHMENT.prc 

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
    barista_wd$=sp!.getParameter("BARISTA_WD")

    chdir barista_wd$

rem --- create the in memory recordset for return

    dataTemplate$ = ""
    dataTemplate$ = dataTemplate$ + "buyer_code:C(3),buyer:C(1*),"
    dataTemplate$ = dataTemplate$ + "vendor_id:C(6),"
    dataTemplate$ = dataTemplate$ + "do_total:C(1)"

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

    files=2,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]    

    files$[1]="poe-06",ids$[1]="POE_ORDHDR"
    files$[2]="ivc_buycode",ids$[2]="IVC_BUYCODE"

	call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],ids$[all],templates$[all],channels[all],batch,status

    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
    
	files_opened = files; rem used in loop to close files
	
    poeOrdHdr_dev=channels[1]; dim poeOrdHdr$:templates$[1]
    ivcBuyCode_dev=channels[2]; dim ivcBuyCode$:templates$[2]
    
rem --- Init Read

    buyer_code$=""

    read(poeOrdHdr_dev,key=firm_id$,dom=*next)
    while 1
        readrecord(poeOrdHdr_dev,end=*break)poeOrdHdr$
        if poeOrdHdr.firm_id$<>firm_id$ then break
        if poeOrdHdr.buyer_code$<>buyer_code$ then gosub buyer_break

        poeOrdHdr_key$=""
        poeOrdHdr_key$=key(poeOrdHdr_dev,end=*next)
        do_total$=iff(pos(firm_id$+buyer_code$=poeOrdHdr_key$)=1,"N","Y")

        data! = rs!.getEmptyRecordData()
        data!.setFieldValue("buyer_code",buyer_code$)
        data!.setFieldValue("buyer",cvs(buyer_code$,2)+"   "+ivcBuyCode.code_desc$)
        data!.setFieldValue("vendor_id",poeOrdHdr.vendor_id$)
        data!.setFieldValue("do_total",do_total$)

        rs!.insert(data!)
    wend

rem Tell the stored procedure to return the result set.
	sp!.setRecordSet(rs!)
    
	goto std_exit

buyer_break: rem --- Buyer break

    buyer_code$=poeOrdHdr.buyer_code$
    redim ivcBuyCode$
    findrecord(ivcBuyCode_dev,key=firm_id$+"F"+buyer_code$,dom=*next)ivcBuyCode$

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
        return str(-num(q1$,err=*next):q2$,err=*next)
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
