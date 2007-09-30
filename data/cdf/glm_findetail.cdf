[[GLM_FINDETAIL.OUTPUT_OPER_01.AVAL]]
if pos(callpoint!.getUserInput()="+- ")=0 callpoint!.setStatus("ABORT-REFRESH")
[[GLM_FINDETAIL.INPUT_PERCNT.AVAL]]
if num(callpoint!.getUserInput())=0 
	callpoint!.setColumnData("GLM_FINDETAIL.ACCUM_PCT","N")

ctl_name$="GLM_FINDETAIL.ACCUM_PCT"
ctl_stat$="D"
	gosub disable_fields
[[GLM_FINDETAIL.<CUSTOM>]]
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
[[GLM_FINDETAIL.ACCUM_PCT.BINP]]
if num(callpoint!.getColumnData("GLM_FINDETAIL.INPUT_PERCNT"))=0 
	callpoint!.setColumnData("GLM_FINDETAIL.ACCUM_PCT","")

ctl_name$="GLM_FINDETAIL.ACCUM_PCT"
ctl_stat$="D"
	gosub disable_fields
[[GLM_FINDETAIL.LINE_TYPE_LIST.AVAL]]
if pos(callpoint!.getUserInput()="HDTNBC")=0  then callpoint!.setStatus("ABORT-REFRESH")
[[GLM_FINDETAIL.EDITING_CODE.AVAL]]
edits$=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE")
edlen=len(edits$), reject$=""
if edlen >5 
	MSG_ID$="GL_FIN_EDIT"
	gosub disp_message
	callpoint!.setStatus("ABORT")
  else
	for x = 1 to edlen
		if pos(edits$(x,1)="SUDP-CF$")=0
		reject$="Y"
	next x
endif

if reject$<>"" callpoint!.SetStatus("ABORT")

[[GLM_FINDETAIL.BWRI]]
if len(callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>5 
	MSG_ID$="GL_FIN_EDIT"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif


 
[[GLM_FINDETAIL.BWAR]]
rem callpoint!.setColumnData("GLM_FINDETAIL.EDITING_CODE","")

EDITCODE$=""

if callpoint!.getColumnData("<<DISPLAY>>.UNDERLINE")="Y"  
:	EDITCODE$=EDITCODE$+"U"

if callpoint!.getColumnData("<<DISPLAY>>.DBL_LINE")="Y"  
:	EDITCODE$=EDITCODE$+"D"

if callpoint!.getColumnData("<<DISPLAY>>.NEW_PAGE")="Y"  
:	EDITCODE$=EDITCODE$+"P"

if callpoint!.getColumnData("<<DISPLAY>>.CLEAR_TOTALS")="Y"  
:	EDITCODE$=EDITCODE$+"C"

if callpoint!.getColumnData("<<DISPLAY>>.SPACE")="Y"  
:	EDITCODE$=EDITCODE$+"S"

if callpoint!.getColumnData("<<DISPLAY>>.MASK")="Y"  
:	EDITCODE$=EDITCODE$+"$"

if callpoint!.getColumnData("<<DISPLAY>>.FAVOR_UNFAV")="Y"  
:	EDITCODE$=EDITCODE$+"F"

if callpoint!.getColumnData("<<DISPLAY>>.CHANGE_SIGN")="Y"  
:	EDITCODE$=EDITCODE$+"-"

callpoint!.setColumnData("GLM_FINDETAIL.EDITING_CODE",EDITCODE$)

 
[[GLM_FINDETAIL.ARAR]]
 

if pos("U"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.UNDERLINE","Y")
if pos("S"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.SPACE","Y")
if pos("D"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.DBL_LINE","Y")
if pos("-"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.CHANGE_SIGN","Y")

if pos("P"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.NEW_PAGE","Y")
if pos("C"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.CLEAR_TOTALS","Y")
if pos("F"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.FAVOR_UNFAV","Y")
if pos("$"=callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>0  then callpoint!.setColumnData("<<DISPLAY>>.MASK","Y")

 
callpoint!.setStatus("ABLEMAP-REFRESH")
