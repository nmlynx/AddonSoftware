[[GLM_ACCTBREAKS.<CUSTOM>]]
#include std_missing_params.src
[[GLM_ACCTBREAKS.BSHO]]
rem --- Open/Lock files

files=1,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="GLS_PARAMS";rem --- ads-01

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call dir_pgm$+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
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
