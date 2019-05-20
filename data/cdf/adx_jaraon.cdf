[[ADX_JARAON.JAR_FILE.AVAL]]
rem --- Warn before overwriting an existing file
	jar_file$=callpoint!.getUserInput()
	base_dir$=callpoint!.getColumnData("ADX_JARAON.BASE_DIR")
	path$=base_dir$+File.separator+jar_file$
	base!=new File(path$)
	if base!.exists() then
		if base!.isFile() then
			msg_id$="AD_OVERWRITE_FILE"
			dim msg_tokens$[1]
			msg_tokens$[1]=path$
			gosub disp_message
			if msg_opt$<>"Y"then
				callpoint!.setStatus("ABORT")
				break
			endif
		else
			msg_id$="AD_EXISTING_DIR"
			dim msg_tokens$[1]
			msg_tokens$[1]=path$
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
	endif
[[ADX_JARAON.BAR_DIR.AVAL]]
rem --- Validate Barista installation directory
	bar_dir$=callpoint!.getUserInput()
	bar!=new File(bar_dir$)

	rem --- Directory must exist
	if ! bar!.exists()
		msg_id$="AD_DIR_MISSING"
		dim msg_tokens$[1]
		msg_tokens$[1]=bar_dir$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif
	
	rem --- Directory must be a directory
	if ! bar!.isDirectory()
		msg_id$="AD_BAD_DIR"
		dim msg_tokens$[1]
		msg_tokens$[1]=bar_dir$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

	rem --- Directory must be readable
	if ! bar!.canRead()
		msg_id$="AD_NOT_READABLE"
		dim msg_tokens$[1]
		msg_tokens$[1]=bar_dir$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

	rem --- Barista installation directory must be under installation base directory
	base!=new File(callpoint!.getColumnData("ADX_JARAON.BASE_DIR"))
	base_dir$=base!.getCanonicalPath()
	bar_dir$=bar!.getCanonicalPath()
	if len(bar_dir$)=len(base_dir$) or pos(base_dir$=bar_dir$)<>1 then
		msg_id$="AD_BAD_BAR_INST_DIR"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

	rem --- Use canonical path
	callpoint!.setUserInput(bar_dir$)
[[ADX_JARAON.<CUSTOM>]]
rem =========================================================
fix_path: rem --- Flip directory path separators
	rem --- input: filePath$
rem =========================================================

	pos=pos("\"=filePath$)
	while pos
		filePath$=filePath$(1, pos-1)+"/"+filePath$(pos+1)
		pos=pos("\"=filePath$)
	wend
	return
[[ADX_JARAON.BASE_DIR.AVAL]]
rem --- Validate installation base directory
	base_dir$=callpoint!.getUserInput()
	base!=new File(base_dir$)

	rem --- Directory must exist
	if ! base!.exists()
		msg_id$="AD_DIR_MISSING"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif
	
	rem --- Directory must be a directory
	if ! base!.isDirectory()
		msg_id$="AD_BAD_DIR"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

	rem --- Directory must be readable
	if ! base!.canRead()
		msg_id$="AD_NOT_READABLE"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

	rem --- Use canonical path
	callpoint!.setUserInput(base!.getCanonicalPath())
[[ADX_JARAON.BSHO]]
rem --- Inits
	use java.io.File
