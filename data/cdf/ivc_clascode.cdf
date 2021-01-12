[[IVC_CLASCODE.ASHO]]
rem --- Disable TAX_SVC_CD when OP is not installed
	callpoint!.setDevObject("salesTax",null())
	if callpoint!.getDevObject("op")<>"Y" then
		callpoint!.setColumnEnabled("IVC_CLASCODE.TAX_SVC_CD",-1)
	else
		rem --- Disable TAX_SVC_CD when OP is not using a Sales Tax Service
		ops_params_dev=fnget_dev("OPS_PARAMS")
		dim ops_params$:fnget_tpl$("OPS_PARAMS")
		find record (ops_params_dev,key=firm_id$+"AR00",err=std_missing_params)ops_params$
		if cvs(ops_params.sls_tax_intrface$,2)="" then
			callpoint!.setColumnEnabled("IVC_CLASCODE.TAX_SVC_CD",-1)
		else
			rem --- Disable TAX_SVC_CD when not using Product Type for the Tax Service Code Source
			if ops_params.tax_svc_cd_src$<>"C" then
				callpoint!.setColumnEnabled("IVC_CLASCODE.TAX_SVC_CD",-1)
			else
				rem --- Get connection to Sales Tax Service
				salesTax!=new AvaTaxInterface(firm_id$)
				if salesTax!.connectClient(Form!,err=connectErr) then
					callpoint!.setDevObject("salesTax",salesTax!)
					callpoint!.setColumnEnabled("IVC_CLASCODE.TAX_SVC_CD",1)
				else
					callpoint!.setColumnEnabled("IVC_CLASCODE.TAX_SVC_CD",0)
					salesTax!.close()
				endif
			endif
		endif
	endif

	break

connectErr:
	callpoint!.setColumnEnabled("IVC_CLASCODE.TAX_SVC_CD",0)
	if salesTax!<>null() then salesTax!.close()

	break

[[IVC_CLASCODE.BDEL]]
rem --- Make sure item class being deleted isn't used in ivm-01

ivm01_dev=fnget_dev("IVM_ITEMMAST")
ivs_defaults=fnget_dev("IVS_DEFAULTS")
dim ivs_defaults$:fnget_tpl$("IVS_DEFAULTS")
item_class$ = callpoint!.getColumnData("IVC_CLASCODE.ITEM_CLASS")

read (ivm01_dev,key=firm_id$+item_class$,knum="AO_ITMCLS_ITEM",dom=*next)
k$="", k$=key(ivm01_dev,err=*next)
if pos(firm_id$+item_class$=k$)=1
	msg_id$="IV_CLASS_IN_USE"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif

rem --- Make sure this item class isn't a default

readrecord (ivs_defaults,key=firm_id$+"D",dom=*next)ivs_defaults$

if ivs_defaults.item_class$=item_class$ then
	msg_id$="IV_CLASS_DEFAULT"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif

[[IVC_CLASCODE.BEND]]
rem --- Close connection to Sales Tax Service
	salesTax!=callpoint!.getDevObject("salesTax")
	if salesTax!<>null() then
		salesTax!.close()
	endif

[[IVC_CLASCODE.BSHO]]
rem --- Inits

use ::ado_util.src::util
use ::opo_AvaTaxInterface.aon::AvaTaxInterface

rem --- Is Sales Order Processing installed?

call dir_pgm1$+"adc_application.aon","OP",info$[all]
op$=info$[20]
callpoint!.setDevObject("op",op$)

rem --- Open/Lock files

files=3
if op$="Y" then files=4
begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="IVS_PARAMS",options$[1]="OTA"
files$[2]="IVM_ITEMMAST",options$[2]="OTA"
files$[3]="IVS_DEFAULTS",options$[3]="OTA"
if op$="Y" then files$[4]="OPS_PARAMS",options$[4]="OTA"
call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$
if status$<>"" then
	remove_process_bar:
	bbjAPI!=bbjAPI()
	rdFuncSpace!=bbjAPI!.getGroupNamespace()
	rdFuncSpace!.setValue("+build_task","OFF")
	release
endif
ivs01_dev=num(chans$[1])

rem --- Dimension miscellaneous string templates

	dim ivs01a$:templates$[1]

	ivs01a_key$=firm_id$+"IV00"
	find record (ivs01_dev,key=ivs01a_key$,err=std_missing_params) ivs01a$

rem --- Add static label for displaying TAX_SVC_CD description
tax_svc_cd!=fnget_control!("IVC_CLASCODE.TAX_SVC_CD")
tax_svc_cd_x=tax_svc_cd!.getX()
tax_svc_cd_y=tax_svc_cd!.getY()
tax_svc_cd_height=tax_svc_cd!.getHeight()
tax_svc_cd_width=tax_svc_cd!.getWidth()
code_desc!=fnget_control!("IVC_CLASCODE.CODE_DESC")
code_desc_width=code_desc!.getWidth()
nxt_ctlID=util.getNextControlID()
tax_svc_cd_desc!=Form!.addStaticText(nxt_ctlID,tax_svc_cd_x+tax_svc_cd_width+5,tax_svc_cd_y+3,code_desc_width,tax_svc_cd_height,"")
callpoint!.setDevObject("tax_svc_cd_desc",tax_svc_cd_desc!)

[[IVC_CLASCODE.TAX_SVC_CD.AVAL]]
rem --- Validate TAX_SVC_CD
	taxSvcCd$=cvs(callpoint!.getUserInput(),2)
	priorTaxSvcCd$=cvs(callpoint!.getColumnData("IVC_CLASCODE.TAX_SVC_CD"),2)
	if taxSvcCd$<>priorTaxSvcCd$ then
		tax_svc_cd_desc!=callpoint!.getDevObject("tax_svc_cd_desc")
		if taxSvcCd$<>"" then
			salesTax!=callpoint!.getDevObject("salesTax")
			success=0
			desc$=salesTax!.getTaxSvcCdDesc(taxSvcCd$,err=*next); success=1
			if success then
				if desc$<>"" then
					rem --- Good code entered
					tax_svc_cd_desc!.setText(desc$)
				else
					rem --- Bad code entered
					msg_id$="OP_BAD_TAXSVC_CD"
					dim msg_tokens$[1]
					msg_tokens$[1]=taxSvcCd$
					gosub disp_message

					callpoint!.setColumnData("IVC_CLASCODE.TAX_SVC_CD",priorTaxSvcCd$,1)
					callpoint!.setStatus("ABORT")
					break
				endif
			else
				rem --- AvaTax call error
				callpoint!.setUserInput(priorTaxSvcCd$)
				break
			endif
		else
			rem --- No code entered, so clear description.
			tax_svc_cd_desc!.setText("")
		endif
	endif

[[IVC_CLASCODE.<CUSTOM>]]
rem #include fnget_control.src
	def fnget_control!(ctl_name$)
	ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
	get_control!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
	return get_control!
	fnend
rem #endinclude fnget_control.src

#include [+ADDON_LIB]std_missing_params.aon



