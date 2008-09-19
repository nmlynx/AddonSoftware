[[POE_POHDR.PURCH_ADDR.AVAL]]
vendor_id$=callpoint!.getColumnData("POE_POHDR.VENDOR_ID")
purch_addr$=callpoint!.getColumnData("POE_POHDR.PURCH_ADDR")
gosub purch_addr_info
[[POE_POHDR.ARAR]]
vendor_id$=callpoint!.getColumnData("POE_POHDR.VENDOR_ID")
purch_addr$=callpoint!.getColumnData("POE_POHDR.PURCH_ADDR")

gosub vendor_info
gosub purch_addr_info
gosub whse_addr_info
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

disable_ctls:
for dctl=1 to 9
	dctl$=dctl$[dctl]
	if cvs(dctl$,2)<>""
		wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
		wmap$=callpoint!.getAbleMap()
		wpos=pos(wctl$=wmap$,8)
		wmap$(wpos+6,1)=dmap$
		callpoint!.setAbleMap(wmap$)
		callpoint!.setStatus("ABLEMAP-REFRESH")
	endif
next dctl
[[POE_POHDR.PO_NO.AVAL]]
rem -- set default values

	if callpoint!.getRecordMode()="A" then 
	
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
		callpoint!.setColumnData("POE_POHDR.TERMS_CODE",apm02a.ap_terms_code$)
		callpoint!.setColumnData("POE_POHDR.REQD_DATE",sysinfo.system_date$)
		callpoint!.setColumnData("POE_POHDR.PO_FRT_TERMS",pos_params.po_frt_terms$)
		callpoint!.setColumnData("POE_POHDR.AP_SHIP_VIA",pos_params.ap_ship_via$)
		callpoint!.setColumnData("POE_POHDR.FOB",pos_params.fob$)
		callpoint!.setColumnData("POE_POHDR.HOLD_FLAG",pos_params.hold_flag$)
		callpoint!.setColumnData("POE_POHDR.PO_MSG_CODE",pos_params.po_req_msg_code$)

	endif
