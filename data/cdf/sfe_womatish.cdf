[[SFE_WOMATISH.ISSUED_DATE.BINP]]
rem -- Verify WO status

	gosub verify_wo_status
	if bad_wo then break

rem wgh ... stopped here
rem wgh 1265 READ (WOE15_DEV,KEY=A0$(1,11)+"000",DOM=1400)IOL=WOE15A ... SFE_WOMATISH dom=new entry?
rem wgh 1270 PRINT @(13,8),FNB$(A1$(7,3)), ... issue date
rem wgh 1300 REM " --- Process Valid Work Order "
rem wgh 1310 FIND (WOE04_DEV,KEY=A0$(1,4)+"D"+A0$(5,7),DOM=1350) ... SFE_WOTRANS (issue iv trans -- sort for woe-23 ???)
rem wgh 1320 LET O9$="1"
rem wgh 1340 GOTO 4000 ... run overlay?
rem wgh 1350 FIND (WOE04_DEV,KEY=A0$(1,4)+"C"+A0$(5,7),DOM=2000) ... ??? (commit iv trans -- sort for woe-23 ???) dom=issue date
rem wgh 1355 DIM MESS$[1]
rem wgh 1360 LET MESS$[0]="Pick List Has Not Been Printed (<Enter>=Continue)"
rem wgh 1370 CALL "SYC.XA",0,MESS$[ALL],0,22,-1,V$,V3
rem wgh 1380 GOTO 2000 ... issue date

rem --- Default issued_date to today
	if callpoint!.getColumnData("SFE_WOMATISH.ISSUED_DATE")="" then
		dim sysinfo$:stbl("+SYSINFO_TPL")
		sysinfo$=stbl("+SYSINFO")
		callpoint!.setColumnData("SFE_WOMATISH.ISSUED_DATE",sysinfo.system_date$,1)
	endif

rem wgh ... where to set modified???
callpoint!.setStatus("MODIFIED")
[[SFE_WOMATISH.<CUSTOM>]]
#include std_missing_params.src

verify_wo_status: rem -- Verify WO status
	status$=callpoint!.getColumnData("<<DISPLAY>>.WO_STATUS")
	bad_wo=0

	if status$="C" then
		msg_id$="WO_CLOSED"
		gosub disp_message
		callpoint!.setStatus("NEWREC")
		bad_wo=1
	endif

	if !bad_wo and pos(status$="PQ") then
		msg_id$="WO_NOT_RELEASED"
		gosub disp_message
		callpoint!.setStatus("NEWREC")
		bad_wo=1
	endif

	return
[[SFE_WOMATISH.BSHO]]
rem --- Open Files
	num_files=11
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="IVS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="SFE_WOMASTR",open_opts$[3]="OTA"
	open_tables$[4]="SFE_WOOPRTN",open_opts$[4]="OTA"
	open_tables$[5]="SFE_OPENEDWO",open_opts$[5]="OTA"
	open_tables$[6]="SFE_WOMATHDR",open_opts$[6]="OTA"
	open_tables$[7]="SFE_WOMATDTL",open_opts$[7]="OTA"
	open_tables$[8]="SFE_WOMATL",open_opts$[8]="OTA"
	open_tables$[9]="SFC_WOTYPECD",open_opts$[9]="OTA"
	open_tables$[10]="IVM_ITEMMAST",open_opts$[10]="OTA"
	open_tables$[11]="IVM_ITEMWHSE",open_opts$[11]="OTA"

	gosub open_tables

	sfs_params_dev=num(open_chans$[1]),sfs_params_tpl$=open_tpls$[1]
	ivs_params_dev=num(open_chans$[2]),ivs_params_tpl$=open_tpls$[2]
	sfe_womastr_dev=num(open_chans$[3]),sfe_womastr_tpl$=open_tpls$[3]

rem --- Get SF parameters
	dim sfs_params$:sfs_params_tpl$
	read record (sfs_params_dev,key=firm_id$+"SF00",dom=std_missing_params) sfs_params$
	bm$=sfs_params.bm_interface$
	op$=sfs_params.ar_interface$
	po$=sfs_params.po_interface$
	gl$=sfs_params.post_to_gl$

	if bm$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","BM",info$[all]
		bm$=info$[20]
	endif
	callpoint!.setDevObject("bm",bm$)

	if op$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","OP",info$[all]
		op$=info$[20]
	endif
	callpoint!.setDevObject("op",op$)

	if po$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","PO",info$[all]
		po$=info$[20]
	endif
	callpoint!.setDevObject("po",po$)

	if gl$="Y"
		call stbl("+DIR_PGM")+"adc_application.aon","GL",info$[all]
		gl$=info$[20]
	endif
	callpoint!.setDevObject("gl",gl$)

rem --- Get IV parameters
	dim ivs_params$:ivs_params_tpl$
	read record (ivs_params_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs_params$
	lotser$=ivs_params.lotser_flag$
	callpoint!.setDevObject("lotser",lotser$)

rem --- Additional file opens
	num_files=8
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	if bm$="Y" then
		open_tables$[1]="BMC_OPCODES",open_opts$[1]="OTA"
rem wgh ... may not be needed, verify actually used
		open_tables$[2]="BMS_PARAMS",open_opts$[2]="OTA"
	else
		open_tables$[1]="SFC_OPRTNCOD",open_opts$[1]="OTA"
	endif
	if op$="Y" then
rem wgh ... may not be needed, verify actually used
		open_tables$[3]="OPS_PARAMS",open_opts$[3]="OTA"
	endif
	if po$="Y" then
rem wgh ... may not be needed, verify actually used
		open_tables$[4]="POS_PARAMS",open_opts$[4]="OTA"
	endif
	if lotser$="Y" then
		open_tables$[5]="SFE_WOLSISSU",open_opts$[5]="OTA"
		open_tables$[6]="IVM_LSMASTER",open_opts$[6]="OTA"
		open_tables$[7]="IVM_LSACT",open_opts$[7]="OTA"
	endif
	if gl$="Y" then
		open_tables$[8]="GLS_PARAMS",open_opts$[4]="OTA"
	endif

	gosub open_tables

rem --- Get additional parameters
	callpoint!.setDevObject("opcode_chan",num(open_chans$[1]))
	callpoint!.setDevObject("opcode_tpl",open_tpls$[1])

	if bm$="Y" then
rem wgh ... may not be needed, verify actually used
		bms_params_dev=num(open_chans$[2]),bms_params_tpl$=open_tpls$[2]
	endif

	if op$="Y" then
rem wgh ... may not be needed, verify actually used
		ops_params_dev=num(open_chans$[3]),ops_params_tpl$=open_tpls$[3]
	endif

	if po$="Y" then
rem wgh ... may not be needed, verify actually used
		pos_params_dev=num(open_chans$[4]),pos_params_tpl$=open_tpls$[4]
	endif

	if lotser$="Y" then
		sfe_wolsissu_dev=num(open_chans$[5]),sfe_wolsissu_tpl$=open_tpls$[5]
		ivm_lsmaster_dev=num(open_chans$[6]),ivm_lsmaster_tpl$=open_tpls$[6]
		ivm_lsact_dev=num(open_chans$[7]),ivm_lsact_tpl$=open_tpls$[7]
	endif

	if gl$="Y" then
		gls_params_dev=num(open_chans$[8]),gls_params_tpl$=open_tpls$[8]
		dim gls_params$:gls_params_tpl$
		read record (gls_params_dev,key=firm_id$+"GL00",dom=std_missing_params) gls_params$
		if gls_params.gl_post_code$="N" then
			gl$="N"
			callpoint!.setDevObject("gl",gl$)
		endif
	endif
[[SFE_WOMATISH.ARNF]]
rem --- Init new Materials Issues Entry record

	sfe_womastr_dev=fnget_dev("SFE_WOMASTR")
	dim sfe_womastr$:fnget_tpl$("SFE_WOMASTR")

	findrecord(sfe_womastr_dev,key=firm_id$+"  "+callpoint!.getColumnData("SFE_WOMATISH.WO_NO"))sfe_womastr$

	callpoint!.setColumnData("SFE_WOMATISH.WO_TYPE",sfe_womastr.wo_type$,1)
	callpoint!.setColumnData("SFE_WOMATISH.ITEM_ID",sfe_womastr.item_id$,1)
	callpoint!.setColumnData("<<DISPLAY>>.DESCRIPTION_01",sfe_womastr.description_01$,1)
	callpoint!.setColumnData("<<DISPLAY>>.DESCRIPTION_02",sfe_womastr.description_02$,1)
	callpoint!.setColumnData("<<DISPLAY>>.WO_STATUS",sfe_womastr.wo_status$,1)
	callpoint!.setColumnData("SFE_WOMATISH.WO_CATEGORY",sfe_womastr.wo_category$,1)
	callpoint!.setColumnData("SFE_WOMATISH.WAREHOUSE_ID",sfe_womastr.warehouse_id$,1)
	callpoint!.setColumnData("SFE_WOMATISH.UNIT_MEASURE",sfe_womastr.unit_measure$,1)
	callpoint!.setColumnData("SFE_WOMATISH.ISSUED_DATE","",1)
