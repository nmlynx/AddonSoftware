[[POR_POPRINT.BSHO]]
rem --- set defaults

callpoint!.setColumnData("POR_POPRINT.REPORT_TYPE","N")
callpoint!.setColumnData("POR_POPRINT.RESTART","N")
callpoint!.setColumnData("POR_POPRINT.MESSAGE_TEXT","")
callpoint!.setColumnData("POR_POPRINT.VENDOR_ID","")

vendor_id$="with $"

ctl_name$=VENDOR_ID$
escape;rem need ""?  which worked?
clt_stat$="D"
gosub disable_fields

callpoint!.setStatus("REFRESH")
[[POR_POPRINT.RESTART.AVAL]]
if callpoint!.getColumnData("POR_POPRINT.RESTART")="Y"
	ctl_name$=POR_POPRINT.VENDOR_ID
	ctl_stat$="D"
	gosub disable_fields
else
	ctl_name$=POR_POPRINT.VENDOR_ID
	ctl_stat$=" "
	gosub disable_fields
endif
[[POR_POPRINT.<CUSTOM>]]
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
