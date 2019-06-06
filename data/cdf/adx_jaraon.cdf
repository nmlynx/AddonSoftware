[[ADX_JARAON.<CUSTOM>]]
validate_base_dir: rem --- Validate installation base directory
	abort=0
	base!=new File(base_dir$)

	rem --- Directory must exist
	if ! base!.exists()
		msg_id$="AD_DIR_MISSING"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_JARAON.BASE_DIR",base_dir$)
		callpoint!.setFocus("ADX_JARAON.BASE_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif
	
	rem --- Directory must be a directory
	if ! base!.isDirectory()
		msg_id$="AD_BAD_DIR"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_JARAON.BASE_DIR",base_dir$)
		callpoint!.setFocus("ADX_JARAON.BASE_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif

	rem --- Directory must be readable
	if ! base!.canRead()
		msg_id$="AD_NOT_READABLE"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_JARAON.BASE_DIR",base_dir$)
		callpoint!.setFocus("ADX_JARAON.BASE_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif

	callpoint!.setColumnData("ADX_JARAON.BASE_DIR",base_dir$)

	return

validate_bar_dir: rem --- Validate Barista installation directory
	abort=0

	rem --- Make sure path ends with barista
	bar!=new File(bar_dir$)
	bar_dir$=bar!.getCanonicalPath()
	if pos("barista"=bar_dir$,-1)<>len(bar_dir$)-6 then
		bar_dir$=bar_dir$+File.separator+"barista"
		bar!=new File(bar_dir$)
	endif

	rem --- Directory must exist
	if ! bar!.exists()
		msg_id$="AD_DIR_MISSING"
		dim msg_tokens$[1]
		msg_tokens$[1]=bar_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_JARAON.BAR_DIR",bar_dir$)
		callpoint!.setFocus("ADX_JARAON.BAR_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif
	
	rem --- Directory must be a directory
	if ! bar!.isDirectory()
		msg_id$="AD_BAD_DIR"
		dim msg_tokens$[1]
		msg_tokens$[1]=bar_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_JARAON.BAR_DIR",bar_dir$)
		callpoint!.setFocus("ADX_JARAON.BAR_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif

	rem --- Directory must be readable
	if ! bar!.canRead()
		msg_id$="AD_NOT_READABLE"
		dim msg_tokens$[1]
		msg_tokens$[1]=bar_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_JARAON.BAR_DIR",bar_dir$)
		callpoint!.setFocus("ADX_JARAON.BAR_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif

	rem --- Barista installation directory must be under installation base directory
	base!=new File(callpoint!.getColumnData("ADX_JARAON.BASE_DIR"))
	base_dir$=base!.getCanonicalPath()
	if len(bar_dir$)=len(base_dir$) or pos(base_dir$=bar_dir$)<>1 then
		msg_id$="AD_BAD_BAR_INST_DIR"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_JARAON.BAR_DIR",bar_dir$)
		callpoint!.setFocus("ADX_JARAON.BAR_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif

	return

validate_jar_file: rem --- Warn before overwriting an existing file
	path$=base_dir$+File.separator+jar_file$
	base!=new File(path$)
	if base!.exists() then
		if base!.isFile() then
			msg_id$="AD_OVERWRITE_FILE"
			dim msg_tokens$[1]
			msg_tokens$[1]=path$
			gosub disp_message
			if msg_opt$<>"Y"then
				callpoint!.setColumnData("ADX_JARAON.JAR_FILE",jar_file$)
				callpoint!.setFocus("ADX_JARAON.JAR_FILE")
				callpoint!.setStatus("ABORT")
				abort=1
				return
			endif
		else
			msg_id$="AD_EXISTING_DIR"
			dim msg_tokens$[1]
			msg_tokens$[1]=path$
			gosub disp_message
			callpoint!.setColumnData("ADX_JARAON.JAR_FILE",jar_file$)
			callpoint!.setFocus("ADX_JARAON.JAR_FILE")
			callpoint!.setStatus("ABORT")
			abort=1
			return
		endif
	endif

	return
[[ADX_JARAON.ASVA]]
rem --- Validate installation base directory
	base_dir$=callpoint!.getColumnData("ADX_JARAON.BASE_DIR")
	gosub validate_base_dir
	if abort then break

rem --- Validate Barista installation directory
	bar_dir$=callpoint!.getColumnData("ADX_JARAON.BAR_DIR")
	gosub validate_bar_dir
	if abort then break

rem --- Warn before overwriting an existing file
	jar_file$=callpoint!.getColumnData("ADX_JARAON.JAR_FILE")
	base_dir$=callpoint!.getColumnData("ADX_JARAON.BASE_DIR")
	gosub validate_jar_file
	if abort then break
[[ADX_JARAON.JAR_FILE.AVAL]]
rem --- Warn before overwriting an existing file
	jar_file$=callpoint!.getUserInput()
	base_dir$=callpoint!.getColumnData("ADX_JARAON.BASE_DIR")
	gosub validate_jar_file
	if abort then break
[[ADX_JARAON.BAR_DIR.AVAL]]
rem --- Validate Barista installation directory
	bar_dir$=callpoint!.getUserInput()
	gosub validate_bar_dir
	if abort then break

	rem --- Use canonical path
	callpoint!.setUserInput(bar_dir$)
[[ADX_JARAON.BASE_DIR.AVAL]]
rem --- Validate installation base directory
	base_dir$=callpoint!.getUserInput()
	gosub validate_base_dir
	if abort then break

	rem --- Use canonical path
	base_dir$=base!.getCanonicalPath()
	callpoint!.setUserInput(base_dir$)

	rem --- Initialize Barista installation directory
	if cvs(callpoint!.getColumnData("ADX_JARAON.BAR_DIR"),2)="" then
		callpoint!.setColumnData("ADX_JARAON.BAR_DIR",base_dir$,1)
	endif
[[ADX_JARAON.BSHO]]
rem --- Inits
	use java.io.File
