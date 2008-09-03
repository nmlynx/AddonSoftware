[[IVC_PRODCODE.BDEL]]
rem --- make sure prod type being deleted isn't used in ivm-01

ivm01_dev=fnget_dev("IVM_ITEMMAST")
k$=""

read (ivm01_dev,key=firm_id$+callpoint!.getColumnData("IVC_PRODCODE.PRODUCT_TYPE"),knum=2,dom=*next)
k$=key(ivm01_dev,err=*next)
if pos(firm_id$+callpoint!.getColumnData("IVC_PRODCODE.PRODUCT_TYPE")=k$)=1
	dim msg_tokens$[1]
	msg_tokens$[1]="This Product Type is assigned to one or more Inventory items."
	msg_id$="IV_NO_DELETE"
	gosub disp_message
	callpoint!.setStatus("ABORT")
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

#include std_missing_params.src
[[IVC_PRODCODE.BSHO]]
rem --- Open/Lock files

files=2,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="IVS_PARAMS",options$[1]="OTA"
files$[2]="IVM_ITEMMAST",options$[2]="OTA"
call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$
if status$<>""  goto std_exit
ivs01_dev=num(chans$[1])
ivm01_dev=num(chans$[2])
rem --- Dimension miscellaneous string templates

dim ivs01a$:templates$[1]

rem --- init/parameters

ivs01a_key$=firm_id$+"IV00"
find record (ivs01_dev,key=ivs01a_key$,err=std_missing_params) ivs01a$

call stbl("+DIR_PGM")+"adc_application.aon","SA",info$[all]
sa$=info$[20]
if sa$<>"Y"
	ctl_name$="IVC_PRODCODE.SA_LEVEL"
	ctl_stat$="I"
	gosub disable_fields
	callpoint!.setTableColumnAttribute("IVC_PRODCODE.SA_LEVEL","DFLT","N")
endif
