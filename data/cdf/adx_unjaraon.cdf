[[ADX_UNJARAON.ASVA]]
rem --- Validate installation base directory
	base_dir$=callpoint!.getColumnData("ADX_UNJARAON.BASE_DIR")
	gosub validate_base_dir
	if abort then break

rem --- Verify jar file exists
	base_dir$=callpoint!.getColumnData("ADX_UNJARAON.BASE_DIR")
	jar_file$=callpoint!.getColumnData("ADX_UNJARAON.JAR_FILE")
	gosub validate_jar_file
	if abort then break

rem --- Validate barista installation location
	base_dir$=callpoint!.getColumnData("ADX_UNJARAON.BASE_DIR")
	gosub validate_bar_install
	if abort then break
[[ADX_UNJARAON.<CUSTOM>]]
validate_base_dir: rem --- Validate installation base directory
	abort=0
	base!=new File(base_dir$)

	rem --- Directory must exist
	if ! base!.exists()
		msg_id$="AD_DIR_MISSING"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_UNJARAON.BASE_DIR",base_dir$)
		callpoint!.setFocus("ADX_UNJARAON.BASE_DIR")
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
		callpoint!.setColumnData("ADX_UNJARAON.BASE_DIR",base_dir$)
		callpoint!.setFocus("ADX_UNJARAON.BASE_DIR")
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
		callpoint!.setColumnData("ADX_UNJARAON.BASE_DIR",base_dir$)
		callpoint!.setFocus("ADX_UNJARAON.BASE_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif

	rem --- Directory must be writable
	if ! base!.canWrite()
		msg_id$="AD_NOT_WRITABLE"
		dim msg_tokens$[1]
		msg_tokens$[1]=base_dir$
		gosub disp_message
		callpoint!.setColumnData("ADX_UNJARAON.BASE_DIR",base_dir$)
		callpoint!.setFocus("ADX_UNJARAON.BASE_DIR")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif

	return

validate_jar_file: rem --- Verify jar file exists
	abort=0

	rem --- Get Source Barista Installation Location from log file
	sourceLog$=base_dir$+File.separator+"adx_jaraon.log"
	sourceLog_dev=unt
	open(sourceLog_dev,isz=-1)sourceLog$; rem --- Error if not found, something is wrong.
	while 1
		read(sourceLog_dev,end=*break)line$

		key$=line$(1,pos(":"=line$))
		switch (BBjAPI().TRUE)
			case key$="Source Installation Base Directory:"
				sourceBaseDir$=cvs(line$(pos(":"=line$)+1),3)
				callpoint!.setDevObject("sourceBaseDir",sourceBaseDir$)
				break
			case key$="Source Barista Installation Location:"
				sourceBarDir$=cvs(line$(pos(":"=line$)+1),3)
				callpoint!.setDevObject("sourceBarDir",sourceBarDir$)
				barDir$=base_dir$+sourceBarDir$(len(sourceBaseDir$)+1)
				callpoint!.setColumnData("ADX_UNJARAON.BAR_DIR",barDir$,1)
				break
		swend
		if cvs(barDir$,2)<>"" then break
	wend
	close(sourceLog_dev,err=*next)

	rem --- Verify jar file exists and is a file
	path$=base_dir$+File.separator+jar_file$
	jar!=new File(path$)

	if jar!.exists() then
		if !jar!.isFile() then
			msg_id$="AD_EXISTING_DIR"
			dim msg_tokens$[1]
			msg_tokens$[1]=jar_file$
			gosub disp_message
			callpoint!.setColumnData("ADX_UNJARAON.JAR_FILE",jar_file$)
			callpoint!.setFocus("ADX_UNJARAON.JAR_FILE")
			callpoint!.setStatus("ABORT")
			abort=1
			return
		endif
	else
		msg_id$="AD_FILE_NOT_FOUND"
		dim msg_tokens$[1]
		msg_tokens$[1]=jar_file$
		gosub disp_message
		callpoint!.setColumnData("ADX_UNJARAON.JAR_FILE",jar_file$)
		callpoint!.setFocus("ADX_UNJARAON.JAR_FILE")
		callpoint!.setStatus("ABORT")
		abort=1
		return
	endif
	callpoint!.setColumnData("ADX_UNJARAON.JAR_FILE",jar_file$)

	return

validate_bar_install: rem --- Validate barista installation location
	abort=0
	sourceBaseDir$=callpoint!.getDevObject("sourceBaseDir")
	sourceBarDir$=callpoint!.getDevObject("sourceBarDir")

	rem --- Barista installation can NOT already exist at Source Barista Installation Location. Empty directory is okay.
	if sourceBaseDir$<>"" and sourceBarDir$<>"" then
		barDir$=callpoint!.getColumnData("ADX_UNJARAON.BAR_DIR")
		barDir!=new File(barDir$+File.separator+"sys/data/ddm_tables.dat")
		if barDir!.exists() then
			msg_id$="AD_BAR_EXISTS"
			dim msg_tokens$[1]
			msg_tokens$[1]=barDir$
			gosub disp_message
			callpoint!.setColumnData("ADX_UNJARAON.BAR_DIR",barDir$,1)
			callpoint!.setColumnData("ADX_UNJARAON.BASE_DIR",base_dir$,1)
			callpoint!.setFocus("ADX_UNJARAON.BASE_DIR")
			callpoint!.setStatus("ABORT")
			abort=1
			return
		endif
	endif

	return
[[ADX_UNJARAON.JAR_FILE.AVAL]]
rem --- Verify jar file exists
	jar_file$=callpoint!.getUserInput()
	base_dir$=callpoint!.getColumnData("ADX_UNJARAON.BASE_DIR")
	gosub validate_jar_file
	if abort then break

rem --- Extract log file from jar file
	x=scall("jar -xf "+jar_file$+" adx_jaraon.log")

rem --- Validate barista installation location
	base_dir$=callpoint!.getColumnData("ADX_UNJARAON.BASE_DIR")
	gosub validate_bar_install
	if abort then break
[[ADX_UNJARAON.BSHO]]
rem --- Inits
	use java.io.File

	callpoint!.setDevObject("sourceBaseDir","")
	callpoint!.setDevObject("sourceBarDir","")
[[ADX_UNJARAON.BASE_DIR.AVAL]]
rem --- Validate installation base directory
	base_dir$=callpoint!.getUserInput()
	gosub validate_base_dir
	if abort then break

	rem --- Use canonical path
	base_dir$=base!.getCanonicalPath()
	callpoint!.setUserInput(base_dir$)


rem --- Verify jar file exists
	jar_file$=callpoint!.getColumnData("ADX_UNJARAON.JAR_FILE")
	if cvs(jar_file$,2)<>"" then
		gosub validate_jar_file
		if abort then break
	endif

rem --- Validate barista installation location
	gosub validate_bar_install
	if abort then break
