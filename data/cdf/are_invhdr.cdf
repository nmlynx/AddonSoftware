[[ARE_INVHDR.ARNF]]
if num(stbl("+BATCH_NO"),err=*next)<>0
	rem --- Check if this record exists in a different batch
	tableAlias$=callpoint!.getAlias()
	primaryKey$=callpoint!.getColumnData("ARE_INVHDR.FIRM_ID")+
:		callpoint!.getColumnData("ARE_INVHDR.AR_INV_NO")
	call stbl("+DIR_PGM")+"adc_findbatch.aon",tableAlias$,primaryKey$,Translate!,table_chans$[all],existingBatchNo$,status
	if status or existingBatchNo$<>"" then callpoint!.setStatus("NEWREC")
endif
[[ARE_INVHDR.AR_DIST_CODE.AVAL]]
rem --- get gl sales account for this distribution code

	dist_code$ = callpoint!.getUserInput()

	gosub get_gl_sales_acct
[[ARE_INVHDR.BEND]]
rem --- remove software lock on batch, if batching

	batch$=stbl("+BATCH_NO",err=*next)
	if num(batch$)<>0
		lock_table$="ADM_PROCBATCHES"
		lock_record$=firm_id$+stbl("+PROCESS_ID")+batch$
		lock_type$="X"
		lock_status$=""
		lock_disp$=""
		call stbl("+DIR_SYP")+"bac_lock_record.bbj",lock_table$,lock_record$,lock_type$,lock_disp$,rd_table_chan,table_chans$[all],lock_status$
	endif
[[ARE_INVHDR.BTBL]]
rem --- Get Batch information

call stbl("+DIR_PGM")+"adc_getbatch.aon",callpoint!.getAlias(),"",table_chans$[all]
callpoint!.setTableColumnAttribute("ARE_INVHDR.BATCH_NO","PVAL",$22$+stbl("+BATCH_NO")+$22$)
[[ARE_INVHDR.ARAR]]
if callpoint!.getColumnData("ARE_INVHDR.PRINT_STATUS") = "Y" then
	msg_id$="OP_REPRINT_INVOICE"
	gosub disp_message
	if msg_opt$="Y"
		callpoint!.setColumnData("ARE_INVHDR.PRINT_STATUS", "N")
		callpoint!.setStatus("MODIFIED")
	endif
endif
[[ARE_INVHDR.ADEL]]
rem --- hdr/dtl have been deleted; now write back header w/ "V" flag

	are_invhdr_dev=fnget_dev("ARE_INVHDR")
	rec_data.sim_inv_type$="V"

	rec_data$=field(rec_data$)
	write record(are_invhdr_dev)rec_data$
[[ARE_INVHDR.ADIS]]
cust_key$=callpoint!.getColumnData("ARE_INVHDR.FIRM_ID")+callpoint!.getColumnData("ARE_INVHDR.CUSTOMER_ID")
gosub disp_cust_addr
gosub calc_grid_tots
callpoint!.setColumnData("<<DISPLAY>>.TOT_QTY",str(tqty))
callpoint!.setColumnData("<<DISPLAY>>.TOT_AMT",str(tamt))
callpoint!.setStatus("REFRESH")
if callpoint!.getColumnData("ARE_INVHDR.SIM_INV_TYPE")="V"
	tmp_cust_id$=callpoint!.getColumnData("ARE_INVHDR.CUSTOMER_ID")
	gosub check_outstanding_inv
	if os_inv$="N"
		msg_id$="AR_VOID_INV"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		if msg_opt$="Y"
			callpoint!.setColumnData("ARE_INVHDR.SIM_INV_TYPE","I")
			callpoint!.setColumnUndoData("ARE_INVHDR.SIM_INV_TYPE","I")
			callpoint!.setStatus("MODIFIED-REFRESH")
		else
			callpoint!.setStatus("ABORT")
		endif
	else
		msg_id$="AR_INV_ADJ"
		dim msg_tokens$[1]
		msg_opt$=""
		gosub disp_message
		if msg_opt$="Y"
			callpoint!.setColumnData("ARE_INVHDR.SIM_INV_TYPE","A")
			callpoint!.setColumnUndoData("ARE_INVHDR.SIM_INV_TYPE","A")
			callpoint!.setStatus("MODIFIED-REFRESH")
		else
			callpoint!.setStatus("ABORT")
		endif
	endif
endif

rem --- get gl sales account for this distribution code

	dist_code$ = callpoint!.getColumnData("ARE_INVHDR.AR_DIST_CODE")
	gosub get_gl_sales_acct

rem --- Display Comments
	cust_id$=callpoint!.getColumnData("ARE_INVHDR.CUSTOMER_ID")
	gosub disp_cust_comments
[[ARE_INVHDR.AGDS]]
gosub calc_grid_tots
callpoint!.setColumnData("<<DISPLAY>>.TOT_QTY",str(tqty))
callpoint!.setColumnData("<<DISPLAY>>.TOT_AMT",str(tamt))
[[ARE_INVHDR.BSHO]]
rem --- Use statements

	use ::ado_func.src::func

rem --- Open/Lock files

	dir_pgm$=stbl("+DIR_PGM",err=*next)
	sys_pgm$=stbl("+DIR_SYP",err=*next)
	files=21,begfile=1,endfile=10
	dim files$[files],options$[files],chans$[files],templates$[files]
	files$[1]="ARS_PARAMS";rem --- "ARS_PARAMS"..."ads-01"
	files$[2]="ARE_INVHDR";rem --- "are-05"
	files$[3]="ARE_INVDET";rem --- "are-15"
	files$[4]="ARM_CUSTMAST";rem --- "arm-01"
	files$[5]="ARM_CUSTDET";rem --- "arm-02"
	files$[6]="ARC_TERMCODE";rem --- "arm-10" (A)
	files$[7]="ARC_DISTCODE";rem --- "arm-10 (D)
	files$[8]="ARS_MTDCASH";rem --- "ars-10",ids$[7]="C"
	files$[9]="ART_INVHDR";rem --- "art-01"
	files$[10]="ART_INVDET";rem --- "art-11"
	rem --- are-15 used to get open on 2 channels, but looks like it won't be necessary in v8.CAH
	rem --- files$[11]="ARE_INVDET";rem --- "are-15" -- open on 2 channels
	for wkx=begfile to endfile
		options$[wkx]="OTA"
	next wkx
	rem --- options$[11]="NA";rem --- force are-15 open on 2nd device
	call sys_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                   chans$[all],templates$[all],table_chans$[all],batch,status$
	if status$<>"" then
		remove_process_bar:
		bbjAPI!=bbjAPI()
		rdFuncSpace!=bbjAPI!.getGroupNamespace()
		rdFuncSpace!.setValue("+build_task","OFF")
		release
	endif
	ads01_dev=num(chans$[1])
rem --- set up UserObj! as vector
	UserObj!=SysGUI!.makeVector()
	
	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.TOT_QTY","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.TOT_QTY","CTLI"))
	tqty!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.TOT_AMT","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.TOT_AMT","CTLI"))
	tamt!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
	UserObj!.addItem(tqty!)
	UserObj!.addItem(tamt!)
rem --- Dimension miscellaneous string templates
	dim ars01a$:templates$[1]
	dim user_tpl$:"firm_id:c(2),glint:C(1),glyr:C(4),glper:C(2),totqty:C(15),totamt:C(15)";rem --- used to pass 'stuff' to/from cpt
	user_tpl.firm_id$=firm_id$

rem --- Additional init
	gl$="N"
	status=0
	source$=pgm(-2)
	call dir_pgm$+"glc_ctlcreate.aon",err=*next,source$,"AR",glw11$,gl$,status
	if status<>0 goto std_exit
	user_tpl.glint$=gl$

rem --- Retrieve parameter data - not keeping any of it here, just make sure params exist
	ars01a_key$=firm_id$+"AR00"
	find record (ads01_dev,key=ars01a_key$,err=std_missing_params) ars01a$
rem --- Disable display only columns
	dim dctl$[8]
	dctl$[1]="<<DISPLAY>>.CUST_ADDR1"
	dctl$[2]="<<DISPLAY>>.CUST_ADDR2"
	dctl$[3]="<<DISPLAY>>.CUST_ADDR3"
	dctl$[4]="<<DISPLAY>>.CUST_ADDR4"
	dctl$[5]="<<DISPLAY>>.CUST_CTST"
	dctl$[6]="<<DISPLAY>>.CUST_ZIP"
	dctl$[7]="<<DISPLAY>>.TOT_QTY"
	dctl$[8]="<<DISPLAY>>.TOT_AMT"
	gosub disable_ctls
[[ARE_INVHDR.CUSTOMER_ID.AVAL]]
rem "Customer Inactive Feature"
customer_id$=callpoint!.getUserInput()
arm01_dev=fnget_dev("ARM_CUSTMAST")
arm01_tpl$=fnget_tpl$("ARM_CUSTMAST")
dim arm01a$:arm01_tpl$
arm01a_key$=firm_id$+customer_id$
find record (arm01_dev,key=arm01a_key$,err=*break) arm01a$
if arm01a.cust_inactive$="Y" then
   call stbl("+DIR_PGM")+"adc_getmask.aon","CUSTOMER_ID","","","",m0$,0,customer_size
   msg_id$="AR_CUST_INACTIVE"
   dim msg_tokens$[2]
   msg_tokens$[1]=fnmask$(arm01a.customer_id$(1,customer_size),m0$)
   msg_tokens$[2]=cvs(arm01a.customer_name$,2)
   gosub disp_message
   callpoint!.setStatus("ACTIVATE-ABORT")
   goto std_exit
endif

if cvs(callpoint!.getUserInput(),2)<>"" and callpoint!.getUserInput()<>
:							callpoint!.getColumnUndoData("ARE_INVHDR.CUSTOMER_ID")
		rem --- force current and original cust ID same, so we skip this routine on later validation sweep
		callpoint!.setColumnUndoData("ARE_INVHDR.CUSTOMER_ID",callpoint!.getUserInput())
		cust_key$=callpoint!.getColumnData("ARE_INVHDR.FIRM_ID")+callpoint!.getUserInput()
		gosub disp_cust_addr
		callpoint!.setStatus("REFRESH")
		tmp_cust_id$=callpoint!.getUserInput()
		gosub check_outstanding_inv
		if os_inv$="Y"
			msg_id$="AR_INV_ADJ"
			dim msg_tokens$[1]
			msg_opt$=""
			gosub disp_message
			if msg_opt$="Y"
				callpoint!.setColumnData("ARE_INVHDR.SIM_INV_TYPE","A")
				callpoint!.setColumnUndoData("ARE_INVHDR.SIM_INV_TYPE","A")
				callpoint!.setStatus("MODIFIED-REFRESH")
			else
				callpoint!.setStatus("CLEAR-NEWREC")
			endif
		endif                            
endif


rem --- Display Comments
	cust_id$=customer_id$
	gosub disp_cust_comments
[[ARE_INVHDR.INV_DATE.AVAL]]
gl$=user_tpl.glint$
invdate$=callpoint!.getUserInput()        
if gl$="Y" 
	call stbl("+DIR_PGM")+"glc_datecheck.aon",invdate$,"Y",per$,yr$,status
	if status>99
		callpoint!.setStatus("ABORT")
	else
		user_tpl.glyr$=yr$
		user_tpl.glper$=per$
	endif
endif
[[ARE_INVHDR.<CUSTOM>]]
#include [+ADDON_LIB]std_functions.aon
calc_grid_tots:
        recVect!=GridVect!.getItem(0)
        dim gridrec$:dtlg_param$[1,3]
        numrecs=recVect!.size()
        if numrecs>0
            for reccnt=0 to numrecs-1
                gridrec$=recVect!.getItem(reccnt)
                tqty=tqty+num(gridrec.units$)
                tamt=tamt+num(gridrec.ext_price$)
            next reccnt
            user_tpl.totqty$=str(tqty),user_tpl.totamt$=str(tamt)
        endif
    return

disp_cust_addr:

	declare BBjTemplatedString addr!

	arm_custmast_dev = fnget_dev("ARM_CUSTMAST")
	dim arm01a$:fnget_tpl$("ARM_CUSTMAST")
	read record (arm_custmast_dev, key=cust_key$, err=std_error) arm01a$
	addr! = BBjAPI().makeTemplatedString( fnget_tpl$("ARM_CUSTMAST") )
	addr!.setString(arm01a$)
	addr$ = func.formatAddress(table_chans$[all], addr!, 30, 7)

	callpoint!.setColumnData("<<DISPLAY>>.CUST_ADDR1",addr$(31,30))
	callpoint!.setColumnData("<<DISPLAY>>.CUST_ADDR2",addr$(61,30))
	callpoint!.setColumnData("<<DISPLAY>>.CUST_ADDR3",addr$(91,30))
	callpoint!.setColumnData("<<DISPLAY>>.CUST_ADDR4",addr$(121,30))
	callpoint!.setColumnData("<<DISPLAY>>.CUST_CTST",addr$(151,30))
	callpoint!.setColumnData("<<DISPLAY>>.CUST_ZIP",addr$(181,30))

rem --- also retrieve default dist/terms codes for customer
	if cvs(callpoint!.getColumnData("ARE_INVHDR.AR_DIST_CODE"),3)=""
		arm_custdet_dev=fnget_dev("ARM_CUSTDET")
		dim arm02a$:fnget_tpl$("ARM_CUSTDET")
		arm02a.firm_id$=arm01a.firm_id$,arm02a.customer_id$=arm01a.customer_id$,arm02a.ar_type$="  "
		readrecord(arm_custdet_dev,key=arm02a.firm_id$+arm02a.customer_id$+arm02a.ar_type$,err=*next)arm02a$
		callpoint!.setColumnData("ARE_INVHDR.AR_DIST_CODE",arm02a.ar_dist_code$)
		rem --- get gl sales account for this distribution code
		dist_code$=arm02a.ar_dist_code$
		gosub get_gl_sales_acct
	endif
	if cvs(callpoint!.getColumnData("ARE_INVHDR.AR_TERMS_CODE"),3)=""
		arm_custdet_dev=fnget_dev("ARM_CUSTDET")
		dim arm02a$:fnget_tpl$("ARM_CUSTDET")
		arm02a.firm_id$=arm01a.firm_id$,arm02a.customer_id$=arm01a.customer_id$,arm02a.ar_type$="  "
		readrecord(arm_custdet_dev,key=arm02a.firm_id$+arm02a.customer_id$+arm02a.ar_type$,err=*next)arm02a$
		callpoint!.setColumnData("ARE_INVHDR.AR_TERMS_CODE",arm02a.ar_terms_code$)
	endif
return

check_outstanding_inv:
    rem --- tmp_cust_id$ set prior to gosub
    os_inv$="N"
    art_invhdr_dev=fnget_dev("ART_INVHDR")
    dim art01a$:fnget_tpl$("ART_INVHDR")
    readrecord(art_invhdr_dev,key=firm_id$+"  "+tmp_cust_id$+
:       callpoint!.getColumnData("ARE_INVHDR.AR_INV_NO")+"00",err=*next)art01a$;os_inv$="Y"
    return

get_gl_sales_acct:
rem --- incoming dist_code$ from either ADIS (calling up existing rec) or dist code AVAL

	arc_distcode_dev=fnget_dev("ARC_DISTCODE")
	dim arc_distcode$:fnget_tpl$("ARC_DISTCODE")
	readrecord(arc_distcode_dev,key=firm_id$+"D"+dist_code$,err=*next)arc_distcode$

	callpoint!.setDevObject("dflt_gl_account", arc_distcode.gl_sls_acct$)
	return

disable_ctls:rem --- disable selected control
	for dctl=1 to 8
		dctl$=dctl$[dctl]
		if dctl$<>""
			wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
			wmap$=callpoint!.getAbleMap()
			wpos=pos(wctl$=wmap$,8)
			wmap$(wpos+6,1)="I"
			callpoint!.setAbleMap(wmap$)
			callpoint!.setStatus("ABLEMAP")
		endif
	next dctl
	return

disp_cust_comments: rem --- You must pass in cust_id$ because we don't know whether it's verified or not
	arm01_dev=fnget_dev("ARM_CUSTMAST")
	dim arm01a$:fnget_tpl$("ARM_CUSTMAST")
	readrecord(arm01_dev,key=firm_id$+cust_id$,dom=*next)arm01a$
	callpoint!.setColumnData("<<DISPLAY>>.comments",arm01a.memo_1024$,1)
	return

#include [+ADDON_LIB]std_missing_params.aon
