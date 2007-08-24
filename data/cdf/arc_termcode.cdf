[[ARC_TERMCODE.BSHO]]
rem pgm_dir$=stbl("+DIR_PGM")

rem --- Disable Credit Hold flag if Credit Management not installed
rem --- Until Order Processing is built, this code won't be used
rem --- the Credit Hold field will have to be redisplayed using Optional Defs on the field
rem get template and read OPS_CREDIT to find correct field name
rem if OPS_CREDIT <> "Y"
rem 	ctl_name$="OPS_CREDIT.INSTALLED_FLAG"
rem 	ctl_stat$="I"
rem 	gosub disable_fields
rem endif
[[ARC_TERMCODE.<CUSTOM>]]
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
