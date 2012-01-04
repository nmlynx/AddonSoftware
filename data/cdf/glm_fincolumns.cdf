[[GLM_FINCOLUMNS.<CUSTOM>]]
validate_chars: rem --- Verify only valid characters entered
	bad_char=0
	pos=len(chars$)
	while pos
		if pos(chars$(pos,1)=validChars$)=0 then break
		pos=pos-1
	wend
	if pos
		msg_id$="AD_INVALID_CHAR"
		dim msg_tokens$[2]
		msg_tokens$[1]=chars$(pos,1)
		msg_tokens$[2]=validChars$
		gosub disp_message
		bad_char=1
	endif
	return
[[GLM_FINCOLUMNS.HEAD_ALIGNMENT.AVAL]]
rem --- Verify only valid characters used
	chars$=callpoint!.getUserInput()
	validChars$="LRC^"
	gosub validate_chars
	if bad_char then
		callpoint!.setStatus("ABORT")
		break
	endif

rem --- Verify valid alignment entered
	bad_align=0
	while chars$<>""
		rem --- Strip leading ^
		while chars$<>"" and chars$(1,1)="^"
			if len(chars$)=1 then
				chars$=""
			else
				chars$=chars$(2)
			endif
		wend
		rem --- Get alignment for next line of heading
		pos=pos("^"=chars$)
		if pos then
			align$=chars$(1,pos-1)
			chars$=chars$(pos)
		else
			align$=chars$
			chars$=""
		endif
		Rem --- Only single character alignment codes are allowed
		if len(align$)>1 then
			bad_align=1
			break
		endif
	wend
	if bad_align then
		msg_id$="AD_INVALID_ALIGN"
		dim msg_tokens$[1]
		msg_tokens$[1]=align$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif
[[GLM_FINCOLUMNS.HEAD_SPAN_COLS.AVAL]]
rem --- Verify only valid characters used
	chars$=callpoint!.getUserInput()
	validChars$="0123456789^"
	gosub validate_chars
	if bad_char then
		callpoint!.setStatus("ABORT")
		break
	endif

rem wgh ... verify valid number of columns entered
rem wgh ... can't span more columns than there are rows in this grid
rem wgh ... GridVect! doesn't work here since it's for detail grids
rem wgh ... try the following
rem g!=form!.getControl(num(stbl("+GRID_CTL")))
rem r=g!.getNumRows()

