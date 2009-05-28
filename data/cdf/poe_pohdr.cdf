[[POE_POHDR.BDEL]]
rem --- ask if user wants to retain the requisition (if this PO came from one); if so, re-create it
rem --- also loop thru gridVect! and call atamo to reverse OO qty for each dtl row that isn't already marked deleted

rem --- 		status = 999
rem --- 		call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs_params$,items$[all],refs$[all],refs[all],table_chans$[all],status
rem --- 		if status then goto std_exit
rem --- 
rem --- 			find record (poc_linecode_dev,key=firm_id$+poe_podet.po_line_code$,dom=*next)poc_linecode$
rem --- 			if poc_linecode.line_type$="S"
rem --- 				items$[0]=firm_id$
rem ---  				items$[1]=poe_podet.warehouse_id$
rem --- 				items$[2]=poe_podet.item_id$
rem --- 				refs[0]=-(poe_podet.qty_ordered - poe_podet.qty_received)*poe_podet.conv_factor
rem --- 				action$="OO"
rem --- 		                call stbl("+DIR_PGM")+"ivc_itemupdt.aon",action$,chan[all],ivs_params$,items$[all],refs$[all],refs[all],table_chans$[all],status
rem --- 			endif
[[POE_POHDR.VENDOR_ID.AVAL]]
vendor_id$=callpoint!.getUserInput()
gosub vendor_info
[[POE_POHDR.DROPSHIP.AVAL]]
rem --- if turning off dropship flag, clear devObject items

if callpoint!.getUserInput()="N"
	callpoint!.setDevObject("ds_orders","N")
	callpoint!.setDevObject("so_ldat","")
	callpoint!.setDevObject("so_lines_list","")
	callpoint!.setTableColumnAttribute("POE_POHDR.CUSTOMER_ID","MINL","0")	
	callpoint!.setTableColumnAttribute("POE_POHDR.ORDER_NO","MINL","0")
else
	callpoint!.setTableColumnAttribute("POE_POHDR.CUSTOMER_ID","MINL","1")
	if callpoint!.getDevObject("OP_installed")="Y"
		callpoint!.setTableColumnAttribute("POE_POHDR.ORDER_NO","MINL","1")
	endif
endif
[[POE_POHDR.CUSTOMER_ID.AVAL]]
rem --- if dropshipping, retrieve/display specified shipto address

	callpoint!.setColumnData("POE_POHDR.ORDER_NO","")
	callpoint!.setColumnData("POE_POHDR.SHIPTO_NO","")
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_1","")
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_2","")
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_3","")
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_4","")
	callpoint!.setColumnData("POE_POHDR.DS_CITY","")
	callpoint!.setColumnData("POE_POHDR.DS_NAME","")
	callpoint!.setColumnData("POE_POHDR.DS_STATE_CD","")
	callpoint!.setColumnData("POE_POHDR.DS_ZIP_CODE","")

	tmp_customer_id$=callpoint!.getUserInput()
	gosub shipto_cust;rem will refresh address w/ that from order once order# is entered
	
	callpoint!.setStatus("REFRESH")
[[POE_POHDR.ORDER_NO.AVAL]]
rem --- if dropshipping, retrieve specified sales order and display shipto address

if cvs(callpoint!.getColumnData("POE_POHDR.CUSTOMER_ID"),3)<>""

	tmp_customer_id$=callpoint!.getColumnData("POE_POHDR.CUSTOMER_ID")
	tmp_order_no$=callpoint!.getUserInput()

	gosub dropship_shipto
	gosub get_dropship_order_lines

	if callpoint!.getDevObject("ds_orders")<>"Y" and cvs(callpoint!.getUserInput(),3)<>""
		msg_id$="PO_NO_SO_LINES"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif			
endif
[[POE_POHDR.ADIS]]
vendor_id$=callpoint!.getColumnData("POE_POHDR.VENDOR_ID")
purch_addr$=callpoint!.getColumnData("POE_POHDR.PURCH_ADDR")
gosub vendor_info
gosub purch_addr_info
gosub whse_addr_info

rem --- depending on whether or not drop-ship flag is selected and OE is installed, set min lengths for cust# and order#

callpoint!.setTableColumnAttribute("POE_POHDR.CUSTOMER_ID","MINL","1")
if callpoint!.getDevObject("OP_installed")="Y"
	callpoint!.setTableColumnAttribute("POE_POHDR.ORDER_NO","MINL","1")
endif

rem --- disable drop-ship checkbox, customer, order until/unless no detail exists

dtl!=gridvect!.getItem(0)		
if dtl!.size()
	callpoint!.setDevObject("dtl_posted","Y")
else
	callpoint!.setDevObject("dtl_posted","")
endif
gosub enable_dropship_fields 

rem --- check if receiver, QA receiver, or invoice exists for this PO.  If so, give warning and don't allow edits
rem --- old code checked poe-33 (QA), 34(receiver) and 35 (invoice GL dist); we'll use alt_key_01 on the 33 and 34 files, and we still have 35.
rem --- v6 code that accessed poe-35 looks like it could never have worked?

poe_qahdr_dev=fnget_dev("POE_QAHDR")
dim poe_qahdr$:fnget_tpl$("POE_QAHDR")

poe_rechdr_dev=fnget_dev("POE_RECHDR")
dim poe_rechdr$:fnget_tpl$("POE_RECHDR")

vendor_id$=callpoint!.getColumnData("POE_POHDR.VENDOR_ID")
po_no$=callpoint!.getColumnData("POE_POHDR.PO_NO")

read (poe_rechdr_dev,key=firm_id$+po_no$+vendor_id$,knum=1,dom=*next)
read record (poe_rechdr_dev,err=*next)poe_rechdr$
if poe_rechdr.firm_id$=firm_id$ and poe_rechdr.vendor_id$=vendor_id$ and poe_rechdr.po_no$=po_no$
	msg_id$="PO_REC_EXISTS"
	gosub disp_message
	callpoint!.setStatus("NEWREC")
endif

read (poe_qahdr_dev,key=firm_id$+po_no$+vendor_id$,knum=1,dom=*next)
read record (poe_qahdr_dev,err=*next)poe_qahdr$
if poe_qahdr.firm_id$=firm_id$ and poe_qahdr.vendor_id$=vendor_id$ and poe_qahdr.po_no$=po_no$
	msg_id$="PO_QA_EXISTS"
	gosub disp_message
	callpoint!.setStatus("NEWREC")
endif
[[POE_POHDR.AREC]]
gosub  form_inits
[[POE_POHDR.APFE]]
rem --- set total order amt

total_amt=num(callpoint!.getDevObject("total_amt"))
callpoint!.setColumnData("<<DISPLAY>>.ORDER_TOTAL",str(total_amt))
tamt!=callpoint!.getDevObject("tamt")
tamt!.setValue(total_amt)

rem --- check dtl_posted flag to see if dropship fields should be disabled

gosub enable_dropship_fields 
[[POE_POHDR.AWRI]]
rem --- need to put out poe_poprint record

poe_poprint_dev=fnget_dev("POE_POPRINT")
dim poe_poprint$:fnget_tpl$("POE_POPRINT")

poe_poprint.firm_id$=firm_id$
poe_poprint.vendor_id$=callpoint!.getColumnData("POE_POHDR.VENDOR_ID")
poe_poprint.po_no$=callpoint!.getColumnData("POE_POHDR.PO_NO")

writerecord (poe_poprint_dev)poe_poprint$
[[POE_POHDR.ADEL]]
rem --- also delete PO print record

poe_poprint_dev=fnget_dev("POE_POPRINT")
remove (poe_poprint_dev,key=firm_id$+callpoint!.getColumnData("POE_POHDR.VENDOR_ID")+callpoint!.getColumnData("POE_POHDR.REQ_NO"),dom=*next)
[[POE_POHDR.REQ_NO.AVAL]]
rem --- Load PO from requisition

if cvs(callpoint!.getUserInput(),3)<>""

	msg_id$="PO_CREATE_REQ"
	gosub disp_message

	if msg_opt$="Y"

		rem --- write the po and podet recs, plus the print rec and poe_linked rec (if dropship)
		rem --- also call atamo to adjust on order qty for S line types
		rem --- also calls poc_wa (not yet implemented).

		status = 999
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs_params$,items$[all],refs$[all],refs[all],table_chans$[all],status
		if status then goto std_exit

		poe_reqhdr_dev=fnget_dev("POE_REQHDR")
		dim poe_reqhdr$:fnget_tpl$("POE_REQHDR")
		poe_pohdr_dev=fnget_dev("POE_POHDR")
		dim poe_pohdr$:fnget_tpl$("POE_POHDR")
		poe_reqdet_dev=fnget_dev("POE_REQDET")
		dim poe_reqdet$:fnget_tpl$("POE_REQDET")
		poe_podet_dev=fnget_dev("POE_PODET")
		poe_reqprint_dev=fnget_dev("POE_REQPRINT")

		poe_linked_dev=fnget_dev("POE_LINKED")
		dim poe_linked$:fnget_tpl$("POE_LINKED")
		poe_poprint_dev=fnget_dev("POE_POPRINT")
		dim poe_poprint$:fnget_tpl$("POE_POPRINT")
		poc_linecode_dev=fnget_dev("POC_LINECODE")
		dim poc_linecode$:fnget_tpl$("POC_LINECODE")

		po_no$=callpoint!.getColumnData("POE_POHDR.PO_NO")
		req_no$=callpoint!.getUserInput()
		
		read record (poe_reqhdr_dev,key=firm_id$+req_no$,dom=*break) poe_reqhdr$
		call stbl("+DIR_PGM")+"adc_copyfile.aon",poe_reqhdr$,poe_pohdr$,status	
		poe_pohdr.po_no$=po_no$
		write record (poe_pohdr_dev) poe_pohdr$

		poe_poprint.firm_id$=firm_id$
		poe_poprint.vendor_id$=poe_pohdr.vendor_id$
		poe_poprint.po_no$=poe_pohdr.po_no$
		write record (poe_poprint_dev)poe_poprint$

		read record(poe_reqdet_dev,key=firm_id$+req_no$,dom=*next)
		while 1
			read record(poe_reqdet_dev) poe_reqdet$
			if poe_reqdet.req_no$<>req_no$ or poe_reqdet.firm_id$<>firm_id$ then break
			dim poe_podet$:fnget_tpl$("POE_PODET")
			call stbl("+DIR_PGM")+"adc_copyfile.aon",poe_reqdet$,poe_podet$,status
			poe_podet.po_no$=po_no$
			poe_podet.qty_ordered=poe_reqdet.req_qty
			write record (poe_podet_dev) poe_podet$

			find record (poc_linecode_dev,key=firm_id$+poe_podet.po_line_code$,dom=*next)poc_linecode$
			if poc_linecode.line_type$="S"
				items$[0]=firm_id$
				items$[1]=poe_podet.warehouse_id$
				items$[2]=poe_podet.item_id$
				refs[0]=poe_podet.qty_ordered*poe_podet.conv_factor
				action$="OO"
		                call stbl("+DIR_PGM")+"ivc_itemupdt.aon",action$,chan[all],ivs_params$,items$[all],refs$[all],refs[all],table_chans$[all],status
			endif

			rem --- Update work order?

			if callpoint!.getDevObject("SF_installed")<>"N" and pos(poc_linecode.line_type$="NS")<>0 and cvs(poe_podet.wo_no$,2)<>""
	escape;rem logic not yet exercised - poc_wa not yet debugged
				sfe_womatl_dev=fnget_dev("SFE_WOMATL")
				sfe_wosubcnt_dev=fnget_dev("SFE_WOSUBCNT")
				oldwo$=poe_podet.wo_no$+poe_podet.wo_seq_ref$
				newwo$=oldwo$,po$=poe_podet.po_no$+poe_podet.internal_seq_no$
				call stbl("+DIR_PGM")+"poc_wa.bbx",sfe_womatl_dev,sfe_wosubcnt_dev,firm_id$,po$,"P",poc_linecode.code_desc$,oldwo$,newwo$,i[1],status
			endif

			rem --- Update PO to OP link

			if cvs(poe_pohdr.customer_id$+poe_pohdr.order_no$,2)<>""
				dim poe_linked$:fattr(poe_linked$)
				poe_linked.firm_id$=firm_id$
				poe_linked.po_no$=poe_pohdr.po_no$
				poe_linked.poedet_seq_ref$=poe_podet.internal_seq_no$
				poe_linked.customer_id$=poe_pohdr.customer_id$
				poe_linked.order_no$=poe_pohdr.order_no$
				poe_linked.opedet_seq_ref$=poe_podet.so_int_seq_ref$
				poe_linked$=field(poe_linked$)
				write record (poe_linked_dev) poe_linked$
			endif

		wend

		rem --- delete the requisition

		status=0
		dim files[20]
    		files[2]=poc_linecode_dev
		files[3]=poe_reqhdr_dev
    		files[4]=poe_reqdet_dev
    		files[5]=poe_reqprint_dev
		files[13]=poe_linked_dev
	
		sf_installed$=str(callpoint!.getDevObject("SF_installed"))
        		dtl_tpl$=fattr(poe_reqdet$)
        		hdr_pri_key$=poe_reqhdr.firm_id$+poe_reqhdr.req_no$
       		hdr_alt_key1$=poe_reqhdr.firm_id$+poe_reqhdr.vendor_id$+poe_reqhdr.req_no$
		dim ivs_params$:fnget_tpl$("IVS_PARAMS")
		ivs_params$=str(callpoint!.getDevObject("ivs_params_rec"))
        		call stbl("+DIR_PGM")+"poc_deletepo.aon","R",files[all],sf_installed$,ivs_params$,hdr_pri_key$,hdr_alt_key1$,dtl_tpl$,status

		callpoint!.setStatus("RECORD:["+firm_id$+po_no$+"]")

	else

		callpoint!.setStatus("ABORT")

	endif
endif
	
[[POE_POHDR.ARNF]]
rem -- set default values
rem --- IV Params
	ivs_params_chn=fnget_dev("IVS_PARAMS")
	dim ivs_params$:fnget_tpl$("IVS_PARAMS")
	read record(ivs_params_chn,key=firm_id$+"IV00")ivs_params$
rem --- PO Params
	pos_params_chn=fnget_dev("POS_PARAMS")
	dim pos_params$:fnget_tpl$("POS_PARAMS")
	read record(pos_params_chn,key=firm_id$+"PO00")pos_params$
rem --- Set Defaults
	apm02_dev=fnget_dev("APM_VENDHIST")
	dim apm02a$:fnget_tpl$("APM_VENDHIST")
	read record(apm02_dev,key=firm_id$+vendor_id$,dom=*next)
	tmp$=key(apm02_dev,end=done_apm_vendhist)
		if pos(firm_id$+vendir_id$=tmp$)<>1 then goto done_apm_vendhist
		read record(apm02_dev,key=tmp$)apm02a$
	done_apm_vendhist:
	callpoint!.setColumnData("<<DISPLAY>>.ORDER_TOTAL","")
	callpoint!.setColumnData("POE_POHDR.WAREHOUSE_ID",ivs_params.warehouse_id$)
	gosub whse_addr_info
	callpoint!.setColumnData("POE_POHDR.ORD_DATE",sysinfo.system_date$)
	callpoint!.setColumnData("POE_POHDR.AP_TERMS_CODE",apm02a.ap_terms_code$)
	callpoint!.setColumnData("POE_POHDR.REQD_DATE",sysinfo.system_date$)
	callpoint!.setColumnData("POE_POHDR.PO_FRT_TERMS",pos_params.po_frt_terms$)
	callpoint!.setColumnData("POE_POHDR.AP_SHIP_VIA",pos_params.ap_ship_via$)
	callpoint!.setColumnData("POE_POHDR.FOB",pos_params.fob$)
	callpoint!.setColumnData("POE_POHDR.HOLD_FLAG",pos_params.hold_flag$)
	callpoint!.setColumnData("POE_POHDR.PO_MSG_CODE",pos_params.po_msg_code$)
[[POE_POHDR.WAREHOUSE_ID.AVAL]]
gosub whse_addr_info
[[POE_POHDR.REQD_DATE.AVAL]]
tmp$=callpoint!.getUserInput()
if tmp$<callpoint!.getColumnData("POE_POHDR.ORD_DATE") then callpoint!.setStatus("ABORT")
[[POE_POHDR.NOT_B4_DATE.AVAL]]
not_b4_date$=cvs(callpoint!.getUserInput(),2)
if not_b4_date$<>"" then
	if not_b4_date$<callpoint!.getColumnData("POE_POHDR.ORD_DATE") then callpoint!.setStatus("ABORT")
	if not_b4_date$>callpoint!.getColumnData("POE_POHDR.REQD_DATE") then callpoint!.setStatus("ABORT")
	promise_date$=cvs(callpoint!.getColumnData("POE_POHDR.PROMISE_DATE"),2)
	if promise_date$<>"" and not_b4_date$>promise_date$ then callpoint!.setStatus("ABORT")
endif
[[POE_POHDR.PROMISE_DATE.AVAL]]
tmp$=cvs(callpoint!.getUserInput(),2)
if tmp$<>"" and tmp$<callpoint!.getColumnData("POE_POHDR.ORD_DATE") then callpoint!.setStatus("ABORT")
[[POE_POHDR.BSHO]]
rem print 'show';rem debug
rem --- inits

	use ::ado_util.src::util

rem --- Open Files
	num_files=15
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="APS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="IVS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="POS_PARAMS",open_opts$[3]="OTA"
	open_tables$[4]="APM_VENDHIST",open_opts$[4]="OTA"
	open_tables$[5]="IVM_ITEMWHSE",open_opts$[5]="OTA"
	open_tables$[6]="IVM_ITEMVEND",open_opts$[6]="OTA"
	open_tables$[7]="POE_REQHDR",open_opts$[7]="OTA"
	open_tables$[8]="POE_REQDET",open_opts$[8]="OTA"
	open_tables$[9]="POE_POPRINT",open_opts$[9]="OTA"
	open_tables$[10]="IVM_ITEMMAST",open_opts$[10]="OTA"
	open_tables$[11]="POE_LINKED",open_opts$[11]="OTA"
	open_tables$[12]="IVM_ITEMSYN",open_opts$[12]="OTA"
	open_tables$[13]="POE_REQPRINT",open_opts$[13]="OTA"
	open_tables$[14]="POE_QAHDR",open_opts$[14]="OTA"
	open_tables$[15]="POE_RECHDR",open_opts$[15]="OTA"

	gosub open_tables

	aps_params_dev=num(open_chans$[1]),aps_params_tpl$=open_tpls$[1]
	ivs_params_dev=num(open_chans$[2]),ivs_params_tpl$=open_tpls$[2]
	pos_params_dev=num(open_chans$[3]),pos_params_tpl$=open_tpls$[3]
	apm_vendhist_dev=num(open_chans$[4]),apm_vendhist_tpl$=open_tpls$[4]
	ivm_itemwhse_dev=num(open_chans$[5]),ivm_itemwhse_tpl$=open_tpls$[5]
	ivm_itemvend_dev=num(open_chans$[6]),ivm_itemvend_tpl$=open_tpls$[6]
	poe_reqhdr_dev=num(open_chans$[7]),poe_reqhdr_tpl$=open_tpls$[7]
	poe_reqdet_dev=num(open_chans$[8]),poe_reqdet_tpl$=open_tpls$[8]
	poe_poprint_dev=num(open_chans$[9]),poe_poprint_tpl$=open_tpls$[9]

rem --- call adc_application to see if OE is installed; if so, open a couple tables for potential use if linking PO to SO for dropship

	dim info$[20]
	call stbl("+DIR_PGM")+"adc_application.aon","OP",info$[all]
	callpoint!.setDevObject("OP_installed",info$[20])
	if info$[20]="Y"
		num_files=6
		dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
		open_tables$[1]="ARM_CUSTMAST",open_opts$[1]="OTA"
		open_tables$[2]="ARM_CUSTSHIP",open_opts$[2]="OTA"
		open_tables$[3]="OPE_ORDSHIP",open_opts$[3]="OTA"
		open_tables$[4]="OPE_ORDHDR",open_opts$[4]="OTA"
		open_tables$[5]="OPE_ORDDET",open_opts$[5]="OTA"
		open_tables$[6]="OPC_LINECODE",open_opts$[6]="OTA"

		gosub open_tables
	
		opc_linecode_dev=num(open_chans$[6])
		dim opc_linecode$:open_tpls$[6]
		
		let oe_dropship$=""
		read record (opc_linecode_dev,key=firm_id$,dom=*next)
		
		while 1
			read record (opc_linecode_dev,end=*break)opc_linecode$
			if opc_linecode.firm_id$<>firm_id$ then break
			if opc_linecode.dropship$="Y" then oe_dropship$=oe_dropship$+opc_linecode.line_code$
		wend
		
		callpoint!.setDevObject("oe_ds_line_codes",oe_dropship$)
	endif

rem --- call adc_application to see if SF is installed

	dim info$[20]
	call stbl("+DIR_PGM")+"adc_application.aon","SF",info$[all]
	callpoint!.setDevObject("SF_installed",info$[20])
	if info$[20]="Y"
		num_files=2
		dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
		open_tables$[1]="SFE_WOMATL",open_opts$[1]="OTA"
		open_tables$[2]="SFE_WOSUBCNT",open_opts$[2]="OTA"

		gosub open_tables
	endif

rem --- AP Params
	dim aps_params$:aps_params_tpl$
	read record(aps_params_dev,key=firm_id$+"AP00")aps_params$

rem --- store total amount control in devObject

	tamt!=util.getControl(callpoint!,"<<DISPLAY>>.ORDER_TOTAL")
	callpoint!.setDevObject("tamt",tamt!)

rem --- store default PO Line Code from POS_PARAMS
	
	dim pos_params$:fnget_tpl$("POS_PARAMS")
	read record (pos_params_dev,key=firm_id$+"PO00")pos_params$
	callpoint!.setDevObject("dflt_po_line_code",pos_params.po_line_code$)
	
rem --- get IV precision

	dim ivs_params$:fnget_tpl$("IVS_PARAMS")
	read record (ivs_params_dev,key=firm_id$+"IV00")ivs_params$
	callpoint!.setDevObject("iv_prec",ivs_params.precision$)
	callpoint!.setDevObject("ivs_params_rec",ivs_params$)	

rem --- store dtlGrid! and column for sales order line# reference listbutton (within grid) in devObject

	dtlWin!=Form!.getChildWindow(1109)
	dtlGrid!=dtlWin!.getControl(5900)
	callpoint!.setDevObject("dtl_grid",dtlGrid!)
	callpoint!.setDevObject("so_seq_ref_col",14)
[[POE_POHDR.PURCH_ADDR.AVAL]]
vendor_id$=callpoint!.getColumnData("POE_POHDR.VENDOR_ID")
purch_addr$=callpoint!.getUserInput()
gosub purch_addr_info
[[POE_POHDR.ARAR]]
vendor_id$=callpoint!.getColumnData("POE_POHDR.VENDOR_ID")
purch_addr$=callpoint!.getColumnData("POE_POHDR.PURCH_ADDR")
gosub vendor_info
gosub purch_addr_info
gosub whse_addr_info
gosub form_inits

rem ---	depending on whether or not drop-ship flag is selected and OE is installed...
rem ---	if drop-ship is selected, load up sales order line#'s for the detail grid's so reference listbutton

if callpoint!.getColumnData("POE_POHDR.DROPSHIP")="Y"

	if callpoint!.getDevObject("OP_installed")="Y"
		tmp_customer_id$=callpoint!.getColumnData("POE_POHDR.CUSTOMER_ID")
		tmp_order_no$=callpoint!.getColumnData("POE_POHDR.ORDER_NO")
		gosub get_dropship_order_lines

	endif
endif
[[POE_POHDR.<CUSTOM>]]
vendor_info: rem --- get and siplay Vendor Information
	apm01_dev=fnget_dev("APM_VENDMAST")
	dim apm01a$:fnget_tpl$("APM_VENDMAST")
	read record(apm01_dev,key=firm_id$+vendor_id$,dom=*next)apm01a$
	callpoint!.setColumnData("<<DISPLAY>>.V_ADDR1",apm01a.addr_line_1$)
	callpoint!.setColumnData("<<DISPLAY>>.V_ADDR2",apm01a.addr_line_2$)
	callpoint!.setColumnData("<<DISPLAY>>.V_CITY",apm01a.city$)
	callpoint!.setColumnData("<<DISPLAY>>.V_STATE",apm01a.state_code$)
	callpoint!.setColumnData("<<DISPLAY>>.V_ZIP",apm01a.zip_code$)
	callpoint!.setColumnData("<<DISPLAY>>.V_CONTACT",apm01a.contact_name$)
	callpoint!.setColumnData("<<DISPLAY>>.V_PHONE",apm01a.phone_no$)
	callpoint!.setColumnData("<<DISPLAY>>.V_FAX",apm01a.fax_no$)
	callpoint!.setStatus("REFRESH")
return

purch_addr_info: rem --- get and display Purchase Address Info
	apm05_dev=fnget_dev("APM_VENDADDR")
	dim apm05a$:fnget_tpl$("APM_VENDADDR")
	read record(apm05_dev,key=firm_id$+vendor_id$+purch_addr$,dom=*next)apm05a$
	callpoint!.setColumnData("<<DISPLAY>>.PA_ADDR1",apm05a.addr_line_1$)
	callpoint!.setColumnData("<<DISPLAY>>.PA_ADDR2",apm05a.addr_line_2$)
	callpoint!.setColumnData("<<DISPLAY>>.PA_CITY",apm05a.city$)
	callpoint!.setColumnData("<<DISPLAY>>.PA_STATE",apm05a.state_code$)
	callpoint!.setColumnData("<<DISPLAY>>.PA_ZIP",apm05a.zip_code$)
	callpoint!.setStatus("REFRESH")
return

whse_addr_info: rem --- get and display Warehouse Address Info
	ivc_whsecode_dev=fnget_dev("IVC_WHSECODE")
	dim ivc_whsecode$:fnget_tpl$("IVC_WHSECODE")
	warehouse_id$=callpoint!.getColumnData("POE_POHDR.WAREHOUSE_ID")
	read record(ivc_whsecode_dev,key=firm_id$+"C"+warehouse_id$,dom=*next)ivc_whsecode$
	callpoint!.setColumnData("<<DISPLAY>>.W_ADDR1",ivc_whsecode$.addr_line_1$)
	callpoint!.setColumnData("<<DISPLAY>>.W_ADDR2",ivc_whsecode$.addr_line_2$)
	callpoint!.setColumnData("<<DISPLAY>>.W_CITY",ivc_whsecode$.city$)
	callpoint!.setColumnData("<<DISPLAY>>.W_STATE",ivc_whsecode$.state_code$)
	callpoint!.setColumnData("<<DISPLAY>>.W_ZIP",ivc_whsecode$.zip_code$)
	callpoint!.setStatus("REFRESH")
return

dropship_shipto: rem --- get and display shipto from Sales Order if drop ship indicated, and OE installed

	ope_ordhdr_dev=fnget_dev("OPE_ORDHDR")
	arm_custship_dev=fnget_dev("ARM_CUSTSHIP")
	ope_ordship_dev=fnget_dev("OPE_ORDSHIP")

	dim ope_ordhdr$:fnget_tpl$("OPE_ORDHDR")
	dim arm_custship$:fnget_tpl$("ARM_CUSTSHIP")
	dim ope_ordship$:fnget_tpl$("OPE_ORDSHIP")

	read record (ope_ordhdr_dev,key=firm_id$+ope_ordhdr.ar_type$+tmp_customer_id$+tmp_order_no$,dom=*next)ope_ordhdr$
	shipto_no$=ope_ordhdr.shipto_no$
	callpoint!.setColumnData("POE_POHDR.SHIPTO_NO",shipto_no$)
	if cvs(shipto_no$,3)=""
		gosub shipto_cust
	endif
	if num(shipto_no$,err=*endif)=99
		read record (ope_ordship_dev,key=firm_id$+tmp_customer_id$+tmp_order_no$,dom=*next)ope_ordship$
		dim rec$:fattr(ope_ordship$)
		rec$=ope_ordship$
		gosub fill_dropship_address
		callpoint!.setColumnData("POE_POHDR.DS_NAME",rec.name$)
	endif
	if num(shipto_no$,err=*endif)>0 and num(shipto_no$,err=*endif)<99
		read record (arm_custship_dev,key=firm_id$+tmp_customer_id$+shipto_no$,dom=*next)arm_custship$
		dim rec$:fattr(arm_custship$)
		rec$=arm_custship$
		gosub fill_dropship_address
		callpoint!.setColumnData("POE_POHDR.DS_NAME",rec.name$)
	endif

	callpoint!.setStatus("REFRESH")
return

shipto_cust:

	arm_custmast_dev=fnget_dev("ARM_CUSTMAST")
	dim arm_custmast$:fnget_tpl$("ARM_CUSTMAST")

	read record (arm_custmast_dev,key=firm_id$+tmp_customer_id$,dom=*next)arm_custmast$
	dim rec$:fattr(arm_custmast$)
	rec$=arm_custmast$
	gosub fill_dropship_address
	callpoint!.setColumnData("POE_POHDR.DS_NAME",rec.customer_name$)

return

fill_dropship_address:
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_1",rec.addr_line_1$)
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_2",rec.addr_line_2$)
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_3",rec.addr_line_3$)
	callpoint!.setColumnData("POE_POHDR.DS_ADDR_LINE_4",rec.addr_line_4$)
	callpoint!.setColumnData("POE_POHDR.DS_CITY",rec.city$)
	callpoint!.setColumnData("POE_POHDR.DS_STATE_CD",rec.state_code$)
	callpoint!.setColumnData("POE_POHDR.DS_ZIP_CODE",rec.zip_code$)
return

get_dropship_order_lines:
rem --- read thru selected sales order and build list of lines for which line code is marked as drop-ship
	ope_ordhdr_dev=fnget_dev("OPE_ORDHDR")
	ope_orddet_dev=fnget_dev("OPE_ORDDET")

	dim ope_ordhdr$:fnget_tpl$("OPE_ORDHDR")
	dim ope_orddet$:fnget_tpl$("OPE_ORDDET")

	order_lines!=SysGUI!.makeVector()
	callpoint!.setDevObject("ds_orders","N")

	read record (ope_ordhdr_dev,key=firm_id$+ope_ordhdr.ar_type$+tmp_customer_id$+tmp_order_no$,dom=*return)ope_ordhdr$

	read (ope_orddet_dev,key=firm_id$+ope_ordhdr.ar_type$+ope_ordhdr.customer_id$+ope_ordhdr.order_no$,dom=*next)

	while 1
		read record (ope_orddet_dev,end=*break)ope_orddet$
		if ope_orddet.firm_id$+ope_orddet.ar_type$+ope_orddet.customer_id$+ope_orddet.order_no$<>
:			ope_ordhdr.firm_id$+ope_ordhdr.ar_type$+ope_ordhdr.customer_id$+ope_ordhdr.order_no$ then break
		if pos(ope_orddet.line_code$=callpoint!.getDevObject("oe_ds_line_codes"))<>0
			order_lines!.addItem(ope_orddet.internal_seq_no$)
		endif
	wend

	if order_lines!.size()=0 
		callpoint!.setDevObject("ds_orders","N")
		callpoint!.setDevObject("so_ldat","")
		callpoint!.setDevObject("so_lines_list","")
	else 
		ldat$=""
		for x=0 to order_lines!.size()-1
			ldat$=ldat$+order_lines!.getItem(x)+"~"+order_lines!.getItem(x)+";"
		next x

		callpoint!.setDevObject("ds_orders","Y")		
		callpoint!.setDevObject("so_ldat",ldat$)
		callpoint!.setDevObject("so_lines_list",order_lines!)
	endif	
return

form_inits:

rem --- setting up for new rec or nav to diff rec

callpoint!.setDevObject("ds_orders","")
callpoint!.setDevObject("so_ldat","")
callpoint!.setDevObject("so_lines_list","")

callpoint!.setDevObject("total_amt","0")
callpoint!.setDevObject("dtl_posted","")

callpoint!.setTableColumnAttribute("POE_POHDR.CUSTOMER_ID","MINL","0")	
callpoint!.setTableColumnAttribute("POE_POHDR.ORDER_NO","MINL","0")

return

enable_dropship_fields:
rem disables/enables dropship fields if detail has (or hasn't) been created for this requisition
rem since warehouse in hdr can't be changed once detail is posted, handling that control here, too.

if callpoint!.getDevObject("dtl_posted")="Y"
	callpoint!.setColumnEnabled("POE_POHDR.WAREHOUSE_ID",0)
	if callpoint!.getDevObject("OP_installed")="Y"
		callpoint!.setColumnEnabled("POE_POHDR.DROPSHIP",0)
		callpoint!.setColumnEnabled("POE_POHDR.CUSTOMER_ID",0)
		callpoint!.setColumnEnabled("POE_POHDR.ORDER_NO",0)			
	else
		callpoint!.setColumnEnabled("POE_POHDR.DROPSHIP",1)
		callpoint!.setColumnEnabled("POE_POHDR.CUSTOMER_ID",1)
		callpoint!.setColumnEnabled("POE_POHDR.ORDER_NO",0)		
	endif
else
	callpoint!.setColumnEnabled("POE_POHDR.WAREHOUSE_ID",1)
	if callpoint!.getColumnData("POE_POHDR.DROPSHIP")="Y"
		callpoint!.setColumnEnabled("POE_POHDR.DROPSHIP",1)
		callpoint!.setColumnEnabled("POE_POHDR.CUSTOMER_ID",1)
		callpoint!.setColumnEnabled("POE_POHDR.ORDER_NO",1)
	else
		callpoint!.setColumnEnabled("POE_POHDR.DROPSHIP",1)
		callpoint!.setColumnEnabled("POE_POHDR.CUSTOMER_ID",0)
		callpoint!.setColumnEnabled("POE_POHDR.ORDER_NO",0)
	endif
endif


callpoint!.setStatus("REFRESH")

return
