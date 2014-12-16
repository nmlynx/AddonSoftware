rem ----------------------------------------------------------------------------
rem --- OP Invoice Printing
rem --- Program: OP_HIST_INVOICE_DET_LOTSER.prc
rem --- Description: Stored Procedure to create Lot/Serial detail for a jasper-based OP invoice 
 
rem --- Copyright BASIS International Ltd.  All Rights Reserved.
rem --- All Rights Reserved

rem --- 9/2014-----------------------
rem --- Based on OP_INVOICE_DET_LOTSER.prc, but uses historical (opt) files
rem --- used to print historical invoice from Invoice History Inquiry form
rem --- may become the 'only' print program once RTP is done

rem --- There are three sprocs and three .jaspers for this enhancement:
rem ---    - OP_HIST_INVOICE_HDR.prc / OPHistInvoiceHdr.jasper
rem ---    - OP_HIST_INVOICE_DET.prc / OPHistInvoiceDet.jasper
rem ---    - OP_HIST_INVOICE_DET_LOTSER.prc / OPHistInvoiceDet-LotSer.jasper
rem -----------------------------------

rem ----------------------------------------------------------------------------

	seterr sproc_error

rem --- Use statements and Declares

	declare BBjStoredProcedureData sp!
	declare BBjRecordSet rs!
	declare BBjRecordData data!

	use ::ado_func.src::func

rem --- Get the infomation object for the Stored Procedure

	sp! = BBjAPI().getFileSystem().getStoredProcedureData()


rem --- Get 'IN' SPROC parameters 
	firm_id$ =               sp!.getParameter("FIRM_ID")
	ar_type$ =               sp!.getParameter("AR_TYPE")
	customer_id$ =           sp!.getParameter("CUSTOMER_ID")
	ar_inv_no$ =             sp!.getParameter("AR_INV_NO")
	opt11_orddet_seq_ref$ =  sp!.getParameter("ORDDET_SEQ_REF")
	opt11_qty_shipped =  num(sp!.getParameter("OPT11_QTY_SHIPPED")); rem To conditionally print writein lines for missing Lot/Serial shipped qtys
	qty_mask$ =              sp!.getParameter("QTY_MASK")
	lotser_flag$ =           sp!.getParameter("IVS_LOTSER_FLAG")
	barista_wd$ =            sp!.getParameter("BARISTA_WD")

	chdir barista_wd$

rem --- Get Barista System Program directory

	sypdir$=""
	sypdir$=stbl("+DIR_SYP",err=*next)
	
	pgmdir$=stbl("+DIR_PGM",err=*next)

rem --- create the in memory recordset for return

	dataTemplate$ = ""
	dataTemplate$ = dataTemplate$ + "lotser_no:c(1*), qty_shipped_raw:c(1*)" 
	
	rs! = BBJAPI().createMemoryRecordSet(dataTemplate$)

	dbserver$=stbl("+DBSERVER",err=*next)
	dbsqlport$=":"+stbl("+DBSQLPORT",err=*next)
	dbssl=num(stbl("+DBSSL",err=*next))
	dbtimeout$="&socket_timeout="+stbl("+DBTIMEOUT")

	if dbssl
		dbssl$="&ssl=true"
	else
		dbssl$="&ssl=false"
	endif

	url_user$="&user=guest"
	if stbl("!DSUDDB",err=*endif)<>"" then
		url_user$=""
	endif

	dbname$ = stbl("+DBNAME",err=*next)
	dbname_api$ = stbl("+DBNAME_API",err=*next)
	if pos("jdbc:apache"=cvs(dbname$,8))=1 then
		url$ = dbname$
	else
		if pos("jdbc:"=cvs(dbname$,8))=1 then			
			url$=dbname$+url_user$
		else
			url$ = "jdbc:basis:"+dbserver$+dbsqlport$+"?database="+dbname_api$+url_user$+dbssl$+dbtimeout$
		endif
	endif
	mode$="mode=PROCEDURE"
	
rem --- Initializationas

	total_lotser_qty_shipped = 0

rem --- Open Files    
rem --- Note 'files' and 'channels[]' are used in close loop, so don't re-use

    files=1,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]    

    files$[1]="opt-21",      ids$[1]="OPT_INVLSDET"
	
	call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],ids$[all],templates$[all],channels[all],batch,status

    if status then
        seterr 0
        x$=stbl("+THROWN_ERR","TRUE")   
        throw "File open error.",1001
    endif
    
	files_opened = files; rem used in loop to close files

    opt21_dev = channels[1]
    
    dim opt21a$:templates$[1]

rem --- Get any associated Lots/SerialNumbers

	sqlprep$=""
	sqlprep$=sqlprep$+"SELECT LOTSER_NO, QTY_SHIPPED"
	sqlprep$=sqlprep$+" FROM opt_invlsdet"
	sqlprep$=sqlprep$+" WHERE firm_id="       +"'"+ firm_id$+"'"
	sqlprep$=sqlprep$+"   AND ar_type="       +"'"+ ar_type$+"'"
	sqlprep$=sqlprep$+"   AND customer_id="   +"'"+ customer_id$+"'"
	sqlprep$=sqlprep$+"   AND ar_inv_no="      +"'"+ ar_inv_no$+"'"
	sqlprep$=sqlprep$+"   AND orddet_seq_ref="+"'"+ opt11_orddet_seq_ref$+"'"

	sql_chan=sqlunt
	sqlopen(sql_chan,mode="PROCEDURE",err=*next)stbl("+DBNAME")
	sqlprep(sql_chan)sqlprep$
	dim read_tpl$:sqltmpl(sql_chan)
	sqlexec(sql_chan)

rem --- Process through SQL results 

	while 1

		read_tpl$ = sqlfetch(sql_chan,end=*break)
		
		data! = rs!.getEmptyRecordData()
		
		ls_qty_shipped = num (read_tpl.qty_shipped$)
		
		data!.setFieldValue("LOTSER_NO", read_tpl.lotser_no$)
		data!.setFieldValue("QTY_SHIPPED_RAW", str(ls_qty_shipped))

		rs!.insert(data!)
		
		total_lotser_qty_shipped = total_lotser_qty_shipped + ls_qty_shipped
	wend
	
	rem --- Compare LS shipped qty with Item's Shipped Qty
	rem --- If they do not match, send underscores to 
	rem --- prompt for L/S entry/write-in on the invoice.

	if total_lotser_qty_shipped <> opt11_qty_shipped
	
		for y=1 to max(abs(opt11_qty_shipped - total_lotser_qty_shipped),1)
			data! = rs!.getEmptyRecordData()
			
			data!.setFieldValue("LOTSER_NO", FILL(20,"_"))				
			data!.setFieldValue("QTY_SHIPPED_RAW", "0")

			rs!.insert(data!)
			
			if lotser_flag$="L" then break
		next y

	endif

rem --- Tell the stored procedure to return the result set.
	sp!.setRecordSet(rs!)

	goto std_exit

	
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
