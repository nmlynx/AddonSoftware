[[SFE_WOOPRTN.OP_CODE.AVAL]]
rem --- Display Queue time

	op_code$=callpoint!.getUserInput()
	gosub disp_queue
[[SFE_WOOPRTN.<CUSTOM>]]
rem ===============================================================
disp_queue:
rem	op_code$:	input
rem ===============================================================

	opcode_dev=num(callpoint!.getDevObject("opcode_chan"))
	dim opcode$:callpoint!.getDevObject("opcode_tpl")
	callpoint!.setColumnData("SFE_WOOPRTN.CODE_DESC","",0)

	while 1
		read record (opcode_dev,key=firm_id$+op_code$,dom=*break)opcode$
		callpoint!.setColumnData("<<DISPLAY>>.QUEUE_TIME",opcode.queue_time$,1)
		callpoint!.setColumnData("SFE_WOOPRTN.CODE_DESC",opcode.code_desc$,0)
		break
	wend

	if opcode.pcs_per_hour=0 opcode.pcs_per_hour=1
	if num(callpoint!.getColumnData("SFE_WOOPRTN.PCS_PER_HOUR"))=0
		callpoint!.setColumnData("SFE_WOOPRTN.PCS_PER_HOUR",opcode.pcs_per_hour$,1)
	endif
	if num(callpoint!.getColumnData("SFE_WOOPRTN.DIRECT_RATE"))=0
		callpoint!.setColumnData("SFE_WOOPRTN.DIRECT_RATE",opcode.direct_rate$,1)
	endif
	if num(callpoint!.getColumnData("SFE_WOOPRTN.OVHD_RATE"))=0
		dir_rate=num(callpoint!.getColumnData("SFE_WOOPRTN.DIRECT_RATE"))
		callpoint!.setColumnData("SFE_WOOPRTN.OVHD_RATE",str(dir_rate*opcode.ovhd_factor),1)
	endif
	if callpoint!.getRecordMode()="A"
		callpoint!.setColumnData("SFE_WOOPRTN.SETUP_TIME",opcode.setup_time$,1)
		callpoint!.setColumnData("SFE_WOOPRTN.MOVE_TIME",opcode.move_time$,1)
	endif

	return
[[SFE_WOOPRTN.AGDR]]
rem --- Display Queue time

	op_code$=callpoint!.getColumnData("SFE_WOOPRTN.OP_CODE")
	gosub disp_queue
[[SFE_WOOPRTN.BSHO]]
rem --- Disable grid if Closed Work Order

	if callpoint!.getDevObject("wo_status")="C"
		opts$=callpoint!.getTableAttribute("OPTS")
		callpoint!.setTableAttribute("OPTS",opts$+"BID")

		x$=callpoint!.getTableColumns()
		for x=1 to len(x$) step 40
			opts$=callpoint!.getTableColumnAttribute(cvs(x$(x,40),2),"OPTS")
			callpoint!.setTableColumnAttribute(cvs(x$(x,40),2),"OPTS",o$+"C"); rem - makes cells read only
		next x
	endif
