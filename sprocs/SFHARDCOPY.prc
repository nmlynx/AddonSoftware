rem ----------------------------------------------------------------------------
rem Program: SFHARDCOPY.prc
rem Description: Stored Procedure to get the Shop Floor Hard Copy info into iReports
rem Used for Hard Copy, Traveler, Work Order Closed Detail and Work Order Detail
rem
rem Author(s): J. Brewer
rem Revised: 04.05.2012
rem
rem AddonSoftware
rem Copyright BASIS International Ltd.
rem ----------------------------------------------------------------------------

rem --- Set of utility methods

	use ::ado_func.src::func

rem --- Declare some variables ahead of time

	declare BBjStoredProcedureData sp!
	declare BBjRecordSet rs!
	declare BBjRecordData data!

rem --- Get the infomation object for the Stored Procedure

	sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem --- Get the IN parameters used by the procedure

	firm_id$ = sp!.getParameter("FIRM_ID")
	wo_loc$  = sp!.getParameter("WO_LOCATION")
	from_wo$ = sp!.getParameter("WO_NO_1")
	thru_wo$ = sp!.getParameter("WO_NO_2")
	barista_wd$ = sp!.getParameter("BARISTA_WD")

	sv_wd$=dir("")
	chdir barista_wd$

rem --- Create a memory record set to hold results.
rem --- Columns for the record set are defined using a string template
	temp$="FIRM_ID:C(2), WO_NO:C(7*), WO_TYPE:C(1*), WO_CATEGORY:C(1*), WO_STATUS:C(1*), CUSTOMER_ID:C(1*), "
	temp$=temp$+"SLS_ORDER_NO:C(1*), WAREHOUSE_ID:C(1*), ITEM_ID:C(1*), OPENED_DATE:C(1*), LAST_CLOSE:C(1*), "
	temp$=temp$+"TYPE_DESC:C(1*), PRIORITY:C(1*), UOM:C(1*), YIELD:C(1*), PROD_QTY:C(1*), COMPLETED:C(1*), "
	temp$=temp$+"LAST_ACT_DATE:C(1*), ITEM_DESC:C(1*), DRAWING_NO:C(1*), REV:C(1*)"
	rs! = BBJAPI().createMemoryRecordSet(temp$)

rem --- Get Barista System Program directory
	sypdir$=""
	sypdir$=stbl("+DIR_SYP",err=*next)

rem --- Open files with adc

    files=2,begfile=1,endfile=files
    dim files$[files],options$[files],ids$[files],templates$[files],channels[files]
    files$[1]="sfe-01",ids$[1]="SFE_WOMASTR"
    files$[2]="ivm-01",ids$[2]="IVM_ITEMMAST"

    call pgmdir$+"adc_fileopen.aon",action,begfile,endfile,files$[all],options$[all],
:                                   ids$[all],templates$[all],channels[all],batch,status
    if status goto std_exit
    sfe_womast_dev = channels[1]
    ivm_itemmast_dev = channels[2]

rem --- Dimension string templates

    dim sfe_womast$:templates$[1]
	dim ivm_itemmast$:templates$[2]

goto no_bac_open
rem --- Open Files    
    num_files = 4
    dim open_tables$[1:num_files], open_opts$[1:num_files], open_chans$[1:num_files], open_tpls$[1:num_files]

	open_tables$[1]="SFE_WOMASTR",  open_opts$[1] = "OTA"
	open_tables$[2]="IVM_ITEMMAST",   open_opts$[2] = "OTA"

call sypdir$+"bac_open_tables.bbj",
:       open_beg,
:		open_end,
:		open_tables$[all],
:		open_opts$[all],
:		open_chans$[all],
:		open_tpls$[all],
:		table_chans$[all],
:		open_batch,
:		open_status$

	sfe_womast_dev  = num(open_chans$[1])
	ivm_itemmast_dev  = num(open_chans$[2])

	dim sfe_womast$:open_tpls$[1]
	dim ivm_itemmast$:open_tpls$[2]
no_bac_open:
rem --- Trip Read

	extract record (sfe_womast_dev, key=firm_id$+wo_loc$+from_wo$, dom=*next)
	while 1
		sfe01_key$=key(sfe_womast_dev,end=*break)
		if pos(firm_id$=sfe01_key$)<>1 break
		readrecord (sfe_womast_dev,key=sfe01_key$) sfe_womast$
		if cvs(thru_wo$,2)<>""
			if cvs(sfe_womast.wo_no$,2)>cvs(thru_wo$,2) break
		endif

		data! = rs!.getEmptyRecordData()
		
		dim ivm_itemmast$:fattr(ivm_itemmast$)
		find record (ivm_itemmast_dev,key=firm_id$+sfe_womast.item_id$,dom=*next)ivm_itemmast$
		data!.setFieldValue("FIRM_ID",firm_id$)
		data!.setFieldValue("WO_NO",sfe_womast.wo_no$)
		data!.setFieldValue("WO_TYPE",sfe_womast.wo_type$)
		data!.setFieldValue("WO_CATEGORY",sfe_womast.wo_category$)
		data!.setFieldValue("WO_STATUS",sfe_womast.wo_status$)
		data!.setFieldValue("CUSTOMER_ID",sfe_womast.customer_id$)
		data!.setFieldValue("SLS_ORDER_NO",sfe_womast.order_no$)
		data!.setFieldValue("WAREHOUSE_ID",sfe_womast.warehouse_id$)
		data!.setFieldValue("ITEM_ID",sfe_womast.item_id$)
		data!.setFieldValue("OPENED_DATE",fndate$(sfe_womast.opened_date$))
		data!.setFieldValue("LAST_CLOSE",fndate$(sfe_womast.closed_date$))
rem		data!.setFieldValue("TYPE_DESC",sfe_womast.std_lot_size$)
		data!.setFieldValue("PRIORITY",sfe_womast.priority$)
		data!.setFieldValue("UOM",unit_measure$)
		data!.setFieldValue("YIELD",sfe_womast.est_yield$)
		data!.setFieldValue("PROD_QTY",sfe_womast.sch_prod_qty$)
		data!.setFieldValue("COMPLETED",sfe_womast.qty_cls_todt$)
		data!.setFieldValue("LAST_ACT_DATE",fndate$(sfe_womast.lstact_date$))
		data!.setFieldValue("ITEM_DESC",sfe_womast.description_01$)
		data!.setFieldValue("DRAWING_NO",sfe_womast.drawing_no$)
		data!.setFieldValue("REV",sfe_womast.drawing_rev$)
		rs!.insert(data!)
	wend
	
rem --- Tell the stored procedure to return the result set.

	sp!.setRecordSet(rs!)
	goto std_exit

rem --- Functions

    def fndate$(q$)
        q1$=""
        q1$=date(jul(num(q$(1,4)),num(q$(5,2)),num(q$(7,2)),err=*next),err=*next)
        if q1$="" q1$=q$
        return q1$
    fnend

	std_exit:
	
	end
