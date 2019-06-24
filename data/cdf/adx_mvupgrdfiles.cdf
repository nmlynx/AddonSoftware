[[ADX_MVUPGRDFILES.ARAR]]
rem --- Provide default Updated Files Location
	callpoint!.setColumnData("ADX_MVUPGRDFILES.FILE_LOC",stbl("+DIR_DAT"),1)

rem --- Provide default New Database Name
	callpoint!.setColumnData("ADX_MVUPGRDFILES.DB_NAME",stbl("+DBNAME_API"),1)
[[ADX_MVUPGRDFILES.DB_NAME.AVAL]]
rem --- Validate database

	focus$="ADX_MVUPGRDFILES.DB_NAME"
	db_name$ = cvs(callpoint!.getUserInput(),3)
	gosub validate_db
[[ADX_MVUPGRDFILES.<CUSTOM>]]
validate_db: rem --- Validate database

	rem --- Currently this utility can only use the database used by this Barista/Addon instance.
	if db_name$<>stbl("+DBNAME_API") then
		msg_id$="AD_DB_NOT_ACCESSIBLE"
		dim msg_tokens$[1]
		msg_tokens$[1]=db_name$
		gosub disp_message

		callpoint!.setFocus(focus$)
		callpoint!.setStatus("ABORT")
		return
	endif

	return
[[ADX_MVUPGRDFILES.ASVA]]
rem --- Validate database

	focus$="ADX_MVUPGRDFILES.DB_NAME"
	db_name$ = cvs(callpoint!.getColumnData(focus$),3)
	gosub validate_db
