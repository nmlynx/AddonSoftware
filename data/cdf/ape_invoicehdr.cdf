[[APE_INVOICEHDR.INVOICE_AMT.AVAL]]
rem  if num("APE_INVOICEHDR.NET_INV_AMT") = 0
rem	callpoint!.setColumnData("APE_INVOICEHDR.NET_INV_AMT",
rem  :	"APE_INVOICEHDR.INVOICE_AMT")
rem  endif
[[APE_INVOICEHDR.<CUSTOM>]]
#include std_missing_params.src

[[APE_INVOICEHDR.BSHO]]
rem --- Open/Lock files

files=1,begfile=1,endfile=files
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="APS_PARAMS";rem --- ads-01

for wkx=begfile to endfile
	options$[wkx]="OTA"
next wkx

call stbl("+DIR_SYP")+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                 chans$[all],templates$[all],table_chans$[all],batch,status$

if status$<>""  goto std_exit

ads01_dev=num(chans$[1])

rem --- Retrieve miscellaneous templates

files=1,begfile=1,endfile=files
dim ids$[files],templates$[files]
ids$[1]="aps-01A:APS_PARAMS"

call stbl("+DIR_PGM")+"adc_template.aon",begfile,endfile,ids$[all],templates$[all],status
if status goto std_exit

rem --- Dimension miscellaneous string templates

dim aps01a$:templates$[1]

rem --- init/parameters

aps01a_key$=firm_id$+"AP00"
find record (ads01_dev,key=aps01a_key$,err=std_missing_params) aps01a$

dim info$[20]

