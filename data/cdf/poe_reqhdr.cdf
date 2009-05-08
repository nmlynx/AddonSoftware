[[POE_REQHDR.BWRI]]
rem --- check for mandatory data

ok_to_write$="Y"
missing_so_ref$=""

if callpoint!.getColumnData("POE_REQHDR.DROPSHIP")="Y"
	if cvs(callpoint!.getColumnData("POE_REQHDR.CUSTOMER_ID"),3)="" then ok_to_write$="N"
	if callpoint!.getDevObject("OP_installed")="Y"
		if cvs(callpoint!.getColumnData("POE_REQHDR.ORDER_NO"),3)="" then ok_to_write$="N"
		if callpoint!.getColumnData("POE_REQHDR.DROPSHIP")="Y"
			rem --- loop thru detail grid and see if all lines contain reference to corres. sales order line
			dtl!=gridVect!.getItem(0)
			numrecs=dtl!.size()
			dim dtl_rec$:dtlg_param$[1,3]
			if numrecs
				for x=0 to numrecs-1
					dtl_rec$=dtl!.getItem(x)
					if cvs(dtl_rec$,3)<> "" and callpoint!.getGridRowDeleteStatus(reccnt)<>"Y" 
						if pos(cvs(dtl_rec.po_line_code$,3)="DSNO")
							if cvs(dtl_rec.so_int_seq_ref$,3)="" then missing_so_ref$="Y"
						endif
					endif
				next x
			endif
		endif
	endif
endif

if ok_to_write$<>"Y"
	msg_id$="PO_REQD_DATA"
	gosub disp_message
	callpoint!.setStatus("ABORT")
else
	if missing_so_ref$="Y"
		msg_id$="PO_MISSING_SO"
		gosub disp_message
		if msg_opt$="N"
			callpoint!.setStatus("ABORT")
		endif		
	endif	
endif
[[POE_REQHDR.AREC]]
rem --- setting up for new rec

util.ableGridColumn(Form!,num(callpoint!.getDevObject("dtl_grid_so_ref_col")),0)
callpoint!.setDevObject("ds_orders","")
callpoint!.setDevObject("so_ldat","")
callpoint!.setDevObject("so_lines_list","")
[[POE_REQHDR.ADIS]]
rem --- enable/disable SO_INT_SEQ_REF column in grid, and load possible orde line#'s into list, 
rem ---	depending on whether or not drop-ship flag is selected and OE is installed
rem ---	if drop-ship is selected, disable drop-ship checkbox, customer, order until/unless no detail exists

callpoint!.setColumnEnabled("POE_REQHDR.DROPSHIP",1)

if callpoint!.getColumnData("POE_REQHDR.DROPSHIP")<>"Y"
	util.ableGridColumn(Form!,num(callpoint!.getDevObject("dtl_grid_so_ref_col")),0)
else
	if callpoint!.getDevObject("OP_installed")="Y"
		util.ableGridColumn(Form!,num(callpoint!.getDevObject("dtl_grid_so_ref_col")),1)
		tmp_customer_id$=callpoint!.getColumnData("POE_REQHDR.CUSTOMER_ID")
		tmp_order_no$=callpoint!.getColumnData("POE_REQHDR.ORDER_NO")
		gosub get_dropship_order_lines
		dtl!=gridvect!.getItem(0)		
		if dtl!.size() 
			callpoint!.setColumnEnabled("POE_REQHDR.DROPSHIP",0)
			callpoint!.setColumnEnabled("POE_REQHDR.CUSTOMER_ID",0)
			callpoint!.setColumnEnabled("POE_REQHDR.ORDER_NO",0)			
		endif
	else
		util.ableGridColumn(Form!,num(callpoint!.getDevObject("dtl_grid_so_ref_col")),0)
		callpoint!.setColumnEnabled("POE_REQHDR.ORDER_NO",0)		
	endif
endif
callpoint!.setStatus("REFRESH")
[[POE_REQHDR.ORDER_NO.AVAL]]
rem --- if dropshipping, retrieve specified sales order and display shipto address

if cvs(callpoint!.getColumnData("POE_REQHDR.CUSTOMER_ID"),3)<>""

	tmp_customer_id$=callpoint!.getColumnData("POE_REQHDR.CUSTOMER_ID")
	tmp_order_no$=callpoint!.getUserInput()

	gosub dropship_shipto
	gosub get_dropship_order_lines

	if callpoint!.getDevObject("ds_orders")<>"Y" and cvs(callpoint!.getUserInput(),3)<>""
		msg_id$="PO_NO_SO_LINES"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif			
endif
[[POE_REQHDR.CUSTOMER_ID.AVAL]]
rem --- if dropshipping, retrieve specified sales order and display shipto address

	callpoint!.setColumnData("POE_REQHDR.ORDER_NO","")
	callpoint!.setColumnData("POE_REQHDR.SHIPTO_NO","")
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_1","")
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_2","")
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_3","")
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_4","")
	callpoint!.setColumnData("POE_REQHDR.DS_CITY","")
	callpoint!.setColumnData("POE_REQHDR.DS_NAME","")
	callpoint!.setColumnData("POE_REQHDR.DS_STATE_CD","")
	callpoint!.setColumnData("POE_REQHDR.DS_ZIP_CODE","")

	tmp_customer_id$=callpoint!.getUserInput()
	gosub shipto_cust;rem will refresh address w/ that from order once order# is entered
	
	callpoint!.setStatus("REFRESH")
	
[[POE_REQHDR.DROPSHIP.AVAL]]
rem --- can't toggle dropship (at least for this release) if any detail lines exist when OP is installed


if callpoint!.getDevObject("OP_installed")="Y"
	if gridVect!.size()
		recs!=gridVect!.getItem(0)
		if recs!.size()
			msg_id$="PO_DTL_EXISTS"
			gosub disp_message
			callpoint!.setUserInput(callpoint!.getColumnData("POE_REQHDR.DROPSHIP"))
			callpoint!.setStatus("REFRESH")
		else
			if callpoint!.getUserInput()="N"
				callpoint!.setDevObject("ds_orders","N")
				callpoint!.setDevObject("so_ldat","")
				callpoint!.setDevObject("so_lines_list","")
				util.ableGridColumn(Form!,num(callpoint!.getDevObject("dtl_grid_so_ref_col")),0)
				callpoint!.setStatus("REFRESH")
			endif
		endif
	endif
endif			

			
[[POE_REQHDR.ARNF]]
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
	callpoint!.setColumnData("POE_REQHDR.WAREHOUSE_ID",ivs_params.warehouse_id$)
	gosub whse_addr_info
	callpoint!.setColumnData("POE_REQHDR.ORD_DATE",sysinfo.system_date$)
	callpoint!.setColumnData("POE_REQHDR.AP_TERMS_CODE",apm02a.ap_terms_code$)
	callpoint!.setColumnData("POE_REQHDR.REQD_DATE",sysinfo.system_date$)
	callpoint!.setColumnData("POE_REQHDR.PO_FRT_TERMS",pos_params.po_frt_terms$)
	callpoint!.setColumnData("POE_REQHDR.AP_SHIP_VIA",pos_params.ap_ship_via$)
	callpoint!.setColumnData("POE_REQHDR.FOB",pos_params.fob$)
	callpoint!.setColumnData("POE_REQHDR.HOLD_FLAG",pos_params.hold_flag$)
	callpoint!.setColumnData("POE_REQHDR.PO_MSG_CODE",pos_params.po_req_msg_code$)
[[POE_REQHDR.PROMISE_DATE.AVAL]]
tmp$=cvs(callpoint!.getUserInput(),2)
if tmp$<>"" and tmp$<callpoint!.getColumnData("POE_REQHDR.ORD_DATE") then callpoint!.setStatus("ABORT")
[[POE_REQHDR.NOT_B4_DATE.AVAL]]
not_b4_date$=cvs(callpoint!.getUserInput(),2)
if not_b4_date$<>"" then
	if not_b4_date$<callpoint!.getColumnData("POE_REQHDR.ORD_DATE") then callpoint!.setStatus("ABORT")
	if not_b4_date$>callpoint!.getColumnData("POE_REQHDR.REQD_DATE") then callpoint!.setStatus("ABORT")
	promise_date$=cvs(callpoint!.getColumnData("POE_REQHDR.PROMISE_DATE"),2)
	if promise_date$<>"" and not_b4_date$>promise_date$ then callpoint!.setStatus("ABORT")
endif
[[POE_REQHDR.REQD_DATE.AVAL]]
tmp$=callpoint!.getUserInput()
if tmp$<callpoint!.getColumnData("POE_REQHDR.ORD_DATE") then callpoint!.setStatus("ABORT")
[[POE_REQHDR.WAREHOUSE_ID.AVAL]]
gosub whse_addr_info
[[POE_REQHDR.ARAR]]
vendor_id$=callpoint!.getColumnData("POE_REQHDR.VENDOR_ID")
purch_addr$=callpoint!.getColumnData("POE_REQHDR.PURCH_ADDR")
gosub vendor_info
gosub purch_addr_info
gosub whse_addr_info
[[POE_REQHDR.PURCH_ADDR.AVAL]]
vendor_id$=callpoint!.getColumnData("POE_REQHDR.VENDOR_ID")
purch_addr$=callpoint!.getUserInput()
gosub purch_addr_info
[[POE_REQHDR.VENDOR_ID.AVAL]]
vendor_id$=callpoint!.getUserInput()
gosub vendor_info
[[POE_REQHDR.<CUSTOM>]]
vendor_info: rem --- get and display Vendor Information
	apm01_dev=fnget_dev("APM_VENDMAST")
	dim apm01a$:fnget_tpl$("APM_VENDMAST")
	read record(apm01_dev,key=firm_id$+vendor_id$,dom=*next)apm01a$
	callpoint!.setColumnData("<<DISPLAY>>.V_ADDR1",apm01a.addr_line_1$)
	callpoint!.setColumnData("<<DISPLAY>>.V_ADDR2",apm01a.addr_line_2$)
	callpoint!.setColumnData("<<DISPLAY>>.V_CITY",apm01a.city$)
	callpoint!.setColumnData("<<DISPLAY>>.V_STATE",apm01a.state_code$)
	callpoint!.setColumnData("<<DISPLAY>>.V_ZIP_CODE",apm01a.zip_code$)
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
	callpoint!.setColumnData("<<DISPLAY>>.PA_ZIP_CODE",apm05a.zip_code$)
	callpoint!.setStatus("REFRESH")
return

whse_addr_info: rem --- get and display Warehouse Address Info
	ivc_whsecode_dev=fnget_dev("IVC_WHSECODE")
	dim ivc_whsecode$:fnget_tpl$("IVC_WHSECODE")
	warehouse_id$=callpoint!.getColumnData("POE_REQHDR.WAREHOUSE_ID")
	read record(ivc_whsecode_dev,key=firm_id$+"C"+warehouse_id$,dom=*next)ivc_whsecode$
	callpoint!.setColumnData("<<DISPLAY>>.W_ADDR1",ivc_whsecode$.addr_line_1$)
	callpoint!.setColumnData("<<DISPLAY>>.W_ADDR2",ivc_whsecode$.addr_line_2$)
	callpoint!.setColumnData("<<DISPLAY>>.W_CITY",ivc_whsecode$.city$)
	callpoint!.setColumnData("<<DISPLAY>>.W_STATE",ivc_whsecode$.state_code$)
	callpoint!.setColumnData("<<DISPLAY>>.W_ZIP_CODE",ivc_whsecode$.zip_code$)
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
	callpoint!.setColumnData("POE_REQHDR.SHIPTO_NO",shipto_no$)
	if cvs(shipto_no$,3)=""
		gosub shipto_cust
	endif
	if num(shipto_no$,err=*endif)=99
		read record (ope_ordship_dev,key=firm_id$+tmp_customer_id$+tmp_order_no$,dom=*next)ope_ordship$
		dim rec$:fattr(ope_ordship$)
		rec$=ope_ordship$
		gosub fill_dropship_address
		callpoint!.setColumnData("POE_REQHDR.DS_NAME",rec.name$)
	endif
	if num(shipto_no$,err=*endif)>0 and num(shipto_no$,err=*endif)<99
		read record (arm_custship_dev,key=firm_id$+tmp_customer_id$+shipto_no$,dom=*next)arm_custship$
		dim rec$:fattr(arm_custship$)
		rec$=arm_custship$
		gosub fill_dropship_address
		callpoint!.setColumnData("POE_REQHDR.DS_NAME",rec.name$)
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
	callpoint!.setColumnData("POE_REQHDR.DS_NAME",rec.customer_name$)

return

fill_dropship_address:
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_1",rec.addr_line_1$)
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_2",rec.addr_line_2$)
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_3",rec.addr_line_3$)
	callpoint!.setColumnData("POE_REQHDR.DS_ADDR_LINE_4",rec.addr_line_4$)
	callpoint!.setColumnData("POE_REQHDR.DS_CITY",rec.city$)
	callpoint!.setColumnData("POE_REQHDR.DS_STATE_CD",rec.state_code$)
	callpoint!.setColumnData("POE_REQHDR.DS_ZIP_CODE",rec.zip_code$)
return

get_dropship_order_lines:
rem --- read thru selected sales order and build list of lines for which line code is marked as drop-ship
	ope_ordhdr_dev=fnget_dev("OPE_ORDHDR")
	ope_orddet_dev=fnget_dev("OPE_ORDDET")

	dim ope_ordhdr$:fnget_tpl$("OPE_ORDHDR")
	dim ope_orddet$:fnget_tpl$("OPE_ORDDET")

	order_lines!=SysGUI!.makeVector()
	tmpListCtl!=callpoint!.getDevObject("dtl_grid_so_ref_ctl")
	tmpListCtl!.removeAllItems()
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
		util.ableGridColumn(Form!,num(callpoint!.getDevObject("dtl_grid_so_ref_col")),0)
	else 
		callpoint!.setDevObject("ds_orders","Y")
		ldat$=""
		if order_lines!.size()
			for x=0 to order_lines!.size()-1
				ldat$=order_lines!.getItem(x)+"~"+order_lines!.getItem(x)+";"
			next x
		endif

		callpoint!.setDevObject("so_ldat",ldat$)

		callpoint!.setDevObject("so_lines_list",order_lines!)
		tmpListCtl!.insertItems(0,order_lines!)
		dtlGrid!=callpoint!.getDevObject("dtl_grid")
	 	dtlGrid!.setColumnListControl(num(callpoint!.getDevObject("dtl_grid_so_ref_col")),tmpListCtl!) 
		util.ableGridColumn(Form!,num(callpoint!.getDevObject("dtl_grid_so_ref_col")),1)
	endif	
return
[[POE_REQHDR.BSHO]]
rem print 'show';rem debug
rem --- inits

	use ::ado_util.src::util

rem --- Open Files
	num_files=8
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="APS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="IVS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="POS_PARAMS",open_opts$[3]="OTA"
	open_tables$[4]="APM_VENDHIST",open_opts$[4]="OTA"
	open_tables$[5]="IVM_ITEMWHSE",open_opts$[5]="OTA"
	open_tables$[6]="IVM_ITEMVEND",open_opts$[6]="OTA"
	open_tables$[7]="IVM_ITEMMAST",open_opts$[7]="OTA"
	open_tables$[8]="IVM_ITEMSYN",open_opts$[8]="OTA"

	gosub open_tables
	aps_params_dev=num(open_chans$[1]),aps_params_tpl$=open_tpls$[1]
	ivs_params_dev=num(open_chans$[2]),ivs_params_tpl$=open_tpls$[2]
	pos_params_dev=num(open_chans$[3]),pos_params_tpl$=open_tpls$[3]
	apm_vendhist_dev=num(open_chans$[4]),apm_vendhist_tpl$=open_tpls$[4]
	ivm_itemwhse_dev=num(open_chans$[5]),ivm_itemwhse_tpl$=open_tpls$[5]
	ivm_itemvend_dev=num(open_chans$[6]),ivm_itemvend_tpl$=open_tpls$[6]

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

rem --- AP Params
	dim aps_params$:aps_params_tpl$
	read record(aps_params_dev,key=firm_id$+"AP00")aps_params$

rem --- set up UserObj! as vector
	UserObj!=SysGUI!.makeVector()
	ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.ORDER_TOTAL","CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.ORDER_TOTAL","CTLI"))
	tamt!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
	UserObj!.addItem(tamt!)

rem --- store default PO Line Code from POS_PARAMS
	
	dim pos_params$:fnget_tpl$("POS_PARAMS")
	read record (pos_params_dev,key=firm_id$+"PO00")pos_params$
	callpoint!.setDevObject("dflt_po_line_code",pos_params.po_line_code$)
	
rem --- get IV precision

	dim ivs_params$:fnget_tpl$("IVS_PARAMS")
	read record (ivs_params_dev,key=firm_id$+"IV00")ivs_params$
	callpoint!.setDevObject("iv_prec",ivs_params.precision$)	

rem --- store col# of SO line# reference in devObject (not bulletproof, but this way if column moves, only need to change it here)
rem --- then set up a temp listbutton control that will be used in detail grid to hold sales order line#'s if PO req. is marked for drop-ship
rem --- store detail grid and temp listbutton objects in devObject as well (see how used in get_dropship_order_lines routine of 'custom' callpoint)

	callpoint!.setDevObject("dtl_grid_so_ref_col",13)
	nxt_ctlID=num(stbl("+CUSTOM_CTL"))
	xwk$=stbl("+CUSTOM_CTL",str(nxt_ctlID+1))
	dtlWin!=Form!.getChildWindow(1109)
	dtlGrid!=dtlWin!.getControl(5900)
	tmpListCtl!=dtlWin!.addListButton(nxt_ctlID,10,10,100,100,"",$0810$)
	callpoint!.setDevObject("dtl_grid",dtlGrid!)
	callpoint!.setDevObject("dtl_grid_so_ref_ctl",tmpListCtl!)

rem --- store dropship control so it can be retrieved and enabled/disabled from detail grid

	c!=util.getControl(callpoint!,"POE_REQHDR.DROPSHIP")
	callpoint!.setDevObject("dropship_ctl",c!)
