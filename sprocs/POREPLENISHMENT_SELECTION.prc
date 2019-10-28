rem ----------------------------------------------------------------------------
rem --- PO Replenishment Register - Selection
rem --- Program: POREPLENISHMENT_SELECTION.prc 

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
    barista_wd$=sp!.getParameter("BARISTA_WD")
    vendorLen=num(sp!.getParameter("VENDOR_LEN"))
    vendorMask$=sp!.getParameter("VEND_MASK")
    aonFirst$=sp!.getParameter("AON_FIRST")
    aonLast$=sp!.getParameter("AON_LAST")

    chdir barista_wd$

rem --- create the in memory recordset for return

    dataTemplate$ = ""
    dataTemplate$ = dataTemplate$ + "seq_num:C(2),begin_buyer:C(1*),end_buyer:C(1*),begin_vendor:C(1*),end_vendor:C(1*),"
    dataTemplate$ = dataTemplate$ + "begin_date:C(1*),end_date:C(1*),begin_whse:C(1*),end_whse:C(1*),comment:C(1*)"

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

    files$[1]="poe-07",ids$[1]="POE_REPSEL"
    files$[2]="poe-17",ids$[2]="POE_REPXREF"

	call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],ids$[all],templates$[all],channels[all],batch,status

    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
    
	files_opened = files; rem used in loop to close files
	
    poeRepSel_dev=channels[1]; dim poeRepSel$:templates$[1]
    poeRepXref_dev=channels[2]; dim poeRepXref$:templates$[2]
    
rem --- Init Read

    read(poeRepXref_dev,key=firm_id$+buyer_code$,dom=*next)
    while 1
        readrecord(poeRepXref_dev,end=*break)poeRepXref$
        if poeRepXref.firm_id$+poeRepXref.buyer_code$<>firm_id$+buyer_code$ then break
        
        readrecord(poeRepSel_dev,key=firm_id$+poeRepXref.sequence_num$,dom=*next)poeRepSel$

        data! = rs!.getEmptyRecordData()
        data!.setFieldValue("seq_num",str(poeRepSel.sequence_num$:"00"))
        data!.setFieldValue("begin_buyer",iff(cvs(poeRepSel.beg_buyer$,2)="",aonFirst$,poeRepSel.beg_buyer$))
        data!.setFieldValue("end_buyer",iff(cvs(poeRepSel.end_buyer$,2)="",aonLast$,poeRepSel.end_buyer$))
        data!.setFieldValue("begin_vendor",iff(cvs(poeRepSel.begin_vend$,2)="",aonFirst$,fnmask$(poeRepSel.begin_vend$(1,vendorLen),vendorMask$)))
        data!.setFieldValue("end_vendor",iff(cvs(poeRepSel.ending_vend$,2)="",aonLast$,fnmask$(poeRepSel.ending_vend$(1,vendorLen),vendorMask$)))
        data!.setFieldValue("begin_date",iff(cvs(poeRepSel.begrev_date$,2)="",aonFirst$,fndate$(poeRepSel.begrev_date$)))
        data!.setFieldValue("end_date",iff(cvs(poeRepSel.endrev_date$,2)="",aonLast$,fndate$(poeRepSel.endrev_date$)))
        data!.setFieldValue("begin_whse",iff(cvs(poeRepSel.from_whse$,2)="",aonFirst$,poeRepSel.from_whse$))
        data!.setFieldValue("end_whse",iff(cvs(poeRepSel.thru_whse$,2)="",aonLast$,poeRepSel.thru_whse$))
        data!.setFieldValue("comment",poeRepSel.rep_comments$)

        rs!.insert(data!)
    wend

rem Tell the stored procedure to return the result set.
	sp!.setRecordSet(rs!)
    
	goto std_exit

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
