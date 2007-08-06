[[IVR_VENDLIST.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="IVS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
ads01_dev=num(open_chans$[1]),ivs_params_tpl$=open_tpls$[1]
dim ivs01a$:ivs_params_tpl$

rem --- Retrieve miscellaneous templates

    files=2,begfile=1,endfile=files
    dim ids$[files],templates$[files]
    ids$[1]="aps-01A"
    ids$[2]="gls-01A"
    call dir_pgm$+"adc_template.aon",begfile,endfile,ids$[all],templates$[all],status
    if status goto std_exit

rem --- Dimension miscellaneous string templates

    dim aps01a$:templates$[1],gls01a$:templates$[2]

    aps01a_key$=firm_id$+"AP00"
    find record (ads01_dev,key=aps01a_key$,err=std_missing_params) aps01a$
    gls01a_key$=firm_id$+"GL00"
    find record (ads01_dev,key=gls01a_key$,err=std_missing_params) gls01a$
    ivs01a_key$=firm_id$+"IV00"
    find record (ads01_dev,key=ivs01a_key$,err=std_missing_params) ivs01a$
[[IVR_VENDLIST.<CUSTOM>]]
#include std_missing_params.src
