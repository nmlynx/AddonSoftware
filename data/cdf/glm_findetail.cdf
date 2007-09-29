[[GLM_FINDETAIL.EDITING_CODE.AVAL]]
if len(callpoint!.getColumnData("GLM_FINDETAIL.EDITING_CODE"))>5 
	MSG_ID$="GL_FIN_EDIT"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
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
