[[IVC_TYPECODE.<CUSTOM>]]
#include std_missing_params.src
[[IVC_TYPECODE.BSHO]]
rem --- Open/Lock files

files=1,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="IVS_PARAMS";rem --- ads-01

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
ids$[1]="ivs-01A"

call dir_pgm$+"adc_template.aon",begfile,endfile,ids$[all],templates$[all],status
if status goto std_exit

rem --- Dimension miscellaneous string templates

dim ivs01a$:templates$[1],pos01a$:templates$[2]

rem --- init/parameters

ivs01a_key$=firm_id$+"IV00"
find record (ads01_dev,key=ivs01a_key$,err=std_missing_params) ivs01a$
