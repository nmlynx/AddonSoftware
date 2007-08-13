[[IVC_BUYCODE.<CUSTOM>]]
#include std_missing_params.src
[[IVC_BUYCODE.BSHO]]
rem --- Open/Lock files

files=1,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="IVS_PARAMS";rem --- ads-01

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$

if status$<>""  goto std_exit

ads01_dev=num(chans$[1])

rem --- Retrieve miscellaneous templates

files=2,begfile=1,endfile=files
dim ids$[files],templates$[files]
ids$[1]="ivs-01A"
ids$[2]="pos-01A"

call dir_pgm$+"bac_template.bbj",begfile,endfile,ids$[all],templates$[all],status
if status goto std_exit

rem --- Dimension miscellaneous string templates

dim ivs01a$:templates$[1],pos01a$:templates$[2]

rem --- init/parameters

disable_str$=""
enable_str$=""
dim info$[20]

ivs01a_key$=firm_id$+"IV00"
find record (ads01_dev,key=ivs01a_key$,err=std_missing_params) ivs01a$

call dir_pgm$+"adc_application.aon","PO",info$[all]
po$=info$[20]

if po$<>"Y"
	MSG_ID$="PO_NOT_INST"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
