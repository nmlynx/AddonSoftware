[[IVC_PRODCODE.BDEL]]
rem --- Make sure prod type being deleted isn't used in ivm-01

ivm01_dev=fnget_dev("IVM_ITEMMAST")
ivs_defaults=fnget_dev("IVS_DEFAULTS")
dim ivs_defaults$:fnget_tpl$("IVS_DEFAULTS")
prod_type$ = callpoint!.getColumnData("IVC_PRODCODE.PRODUCT_TYPE")

read (ivm01_dev,key=firm_id$+prod_type$,knum="AO_PROD_ITEM",dom=*next)
k$="", k$=key(ivm01_dev,err=*next)
if pos(firm_id$+prod_type$=k$)=1
	dim msg_tokens$[1]
	msg_tokens$[1]=Translate!.getTranslation("AON_THIS_PRODUCT_TYPE_IS_ASSIGNED_TO_ONE_OR_MORE_INVENTORY_ITEMS.")
	msg_id$="IV_NO_DELETE"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif

rem --- Make sure this prod type isn't a default

readrecord (ivs_defaults,key=firm_id$+"D",dom=*next)ivs_defaults$

if ivs_defaults.product_type$=prod_type$ then
	msg_id$="IV_PROD_DEFAULT"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif

[[IVC_PRODCODE.BSHO]]
rem --- Inits

use ::opo_AvaTaxInterface.aon::AvaTaxInterface

rem --- Is Sales Order Processing installed?

call dir_pgm1$+"adc_application.aon","OP",info$[all]
op$=info$[20]

rem --- Open/Lock files

files=3,begfile=1,endfile=files
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

rem --- init/parameters

ivs01a_key$=firm_id$+"IV00"
find record (ivs01_dev,key=ivs01a_key$,err=std_missing_params) ivs01a$

rem --- Disable SA_LEVEL when SA is not installed

call stbl("+DIR_PGM")+"adc_application.aon","SA",info$[all]
sa$=info$[20]
if sa$<>"Y"
	ctl_name$="IVC_PRODCODE.SA_LEVEL"
	ctl_stat$="I"
	gosub disable_fields
	callpoint!.setTableColumnAttribute("IVC_PRODCODE.SA_LEVEL","DFLT","N")
endif

rem --- Disable TAX_SVC_CD when OP is not installed

if op$<>"Y" then
	callpoint!.setColumnEnabled("IVC_PRODCODE.TAX_SVC_CD",-1)
else
	rem --- Disable TAX_SVC_CD when OP is not using a Sales Tax Service
	ops_params_dev=num(chans$[4])
	dim ops_params$:templates$[4]
	find record (ops_params_dev,key=firm_id$+"AR00",err=std_missing_params)ops_params$
	if cvs(ops_params.sls_tax_intrface$,2)="" then
		callpoint!.setColumnEnabled("IVC_PRODCODE.TAX_SVC_CD",-1)
	else
		rem --- Disable TAX_SVC_CD when not using Product Type for the Tax Service Code Source
		if ops_params.tax_svc_cd_src$<>"P" then
			callpoint!.setColumnEnabled("IVC_PRODCODE.TAX_SVC_CD",-1)
		else
			rem --- Get connection to Sales Tax Service
rem wgh ... 9806 ... stopped here
		endif
	endif
endif

[[IVC_PRODCODE.<CUSTOM>]]
rem #include disable_fields.src

disable_fields:
	rem --- used to disable/enable controls
	rem --- ctl_name$ sent in with name of control to enable/disable (format "ALIAS.CONTROL_NAME")
	rem --- ctl_stat$ sent in as D or space, meaning disable/enable, respectively

	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP-REFRESH-ACTIVATE")

return

rem #endinclude disable_fields.src

#include [+ADDON_LIB]std_missing_params.aon



