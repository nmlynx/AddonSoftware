[[ADX_COPYDIR.ASVA]]
rem --- Validate source directory

	loc_dir$ = callpoint!.getColumnData("ADX_COPYDIR.SOURCE_DIR")
	gosub validate_source_dir
[[ADX_COPYDIR.TARGET_DIR.AVAL]]
rem --- Validate target directory

	loc_dir$ = callpoint!.getUserInput()
	gosub validate_target_dir
[[ADX_COPYDIR.SOURCE_DIR.AVAL]]
rem --- Validate source directory

	loc_dir$ = callpoint!.getUserInput()
	gosub validate_source_dir
[[ADX_COPYDIR.<CUSTOM>]]
validate_source_dir: rem --- Validate source directory

	focus$="ADX_COPYDIR.SOURCE_DIR"

	rem --- Directory must exist
	testDir$=loc_dir$
	gosub verify_dir_exists
	if !exists
		callpoint!.setFocus(focus$)
		callpoint!.setStatus("ABORT")
		return
	endif

	rem --- can't be the same as target directory
	if loc_dir$ = callpoint!.getColumnData("ADX_COPYDIR.TARGET_DIR")
		msg_id$="AD_SAME_DIR"
		gosub disp_message
		callpoint!.setFocus(focus$)
		callpoint!.setStatus("ABORT")
		return
	endif

	return

validate_target_dir: rem --- Validate target directory

	focus$="ADX_COPYDIR.TARGET_DIR"

	rem --- can't be the same as source directory
	if loc_dir$ = callpoint!.getColumnData("ADX_COPYDIR.SOURCE_DIR")
		msg_id$="AD_SAME_DIR"
		gosub disp_message
		callpoint!.setFocus(focus$)
		callpoint!.setStatus("ABORT")
		return
	endif

	return

verify_dir_exists: rem --- Directory must exist

	exists=0
	testChan=unt
	open(testChan, err=dir_missing)testDir$
	close(testChan)
	exists=1

dir_missing:
	if !exists
		msg_id$="AD_DIR_MISSING"
		dim msg_tokens$[1]
		msg_tokens$[1]=testDir$
		gosub disp_message
	endif

	return
