[[GLC_CYCLECODE.AFMC]]
rem --- Disable fields that are display only

rem	ctl_name$="GLC_CYCLECODE.LSTUSE_DATE"
	rem ctl_stat$="D"
	rem gosub disable_fields
	rem ctl_name$="GLC_CYCLECODE.LSTUSE_TIME"
	rem gosub disable_fields
	rem ctl_name$="GLC_CYCLECODE.PROCESS_DATE"
rem --- End of disables
[[GLC_CYCLECODE.<CUSTOM>]]
#include std_missing_params.src

disable_fields:
 rem --- used to disable/enable controls depending on parameter settings
 rem --- send in control to toggle (format "ALIAS.CONTROL_NAME"), and D or space to disable/enable
 
 wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
 wmap$=callpoint!.getAbleMap()
 wpos=pos(wctl$=wmap$,8)
 wmap$(wpos+6,1)=ctl_stat$
 callpoint!.setAbleMap(wmap$)
 callpoint!.setStatus("ABLEMAP-REFRESH")
 
return
[[GLC_CYCLECODE.BSHO]]
rem --- Open/Lock files

files=1,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="GLS_PARAMS";rem --- ads-01

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call dir_pgm$+"adc_open_tables.aon",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$

if status$<>""  goto std_exit

ads01_dev=num(chans$[1])

rem --- Retrieve miscellaneous templates

files=1,begfile=1,endfile=files
dim ids$[files],templates$[files]
ids$[1]="gls-01A"

call dir_pgm$+"adc_template.aon",begfile,endfile,ids$[all],templates$[all],status
if status goto std_exit

rem --- Dimension miscellaneous string templates

dim gls01a$:templates$[1]

rem --- init/parameters

gls01a_key$=firm_id$+"GL00"
find record (ads01_dev,key=gls01a_key$,err=std_missing_params) gls01a$
