[[SFE_WOMATISH.ADIS]]
rem --- Init <<DISPLAY>> fields
	sfe_womastr_dev=fnget_dev("SFE_WOMASTR")
	dim sfe_womastr$:fnget_tpl$("SFE_WOMASTR")

	findrecord(sfe_womastr_dev,key=firm_id$+"  "+callpoint!.getColumnData("SFE_WOMATISH.WO_NO"))sfe_womastr$

	callpoint!.setColumnData("<<DISPLAY>>.DESCRIPTION_01",sfe_womastr.description_01$,1)
	callpoint!.setColumnData("<<DISPLAY>>.DESCRIPTION_02",sfe_womastr.description_02$,1)
	callpoint!.setColumnData("<<DISPLAY>>.WO_STATUS",sfe_womastr.wo_status$,1)

rem --- Existing materials issues?
	wotrans=0
	sfe_wotrans_dev=fnget_dev("SFE_WOTRANS")
	sfe_wotrans_key$=firm_id$+callpoint!.getColumnData("SFE_WOMATISH.WO_LOCATION")+callpoint!.getColumnData("SFE_WOMATISH.WO_NO")
	find(sfe_wotrans_dev,key=sfe_wotrans_key$,dom=*next); wotrans=1

rem wgh ... stopped
	if wotrans then
rem wgh ... O9$ affects 4100 processing in issue_date aval at 4150
rem wgh ... 1320 LET O9$="1" ... this is like callpoint!.getRecordMode()<>"A"
	else
rem wgh ... O9$ affects 4100 processing in issue_date aval at 4150
rem wgh ... O9$="0" ... this is like callpoint!.getRecordMode()="A"
		rem --- Materials already commited?
		wocommit=0
		sfe_wocommit_dev=fnget_dev("SFE_WOCOMMIT")
		sfe_wocommit_key$=firm_id$+callpoint!.getColumnData("SFE_WOMATISH.WO_LOCATION")+callpoint!.getColumnData("SFE_WOMATISH.WO_NO")
		find(sfe_wocommit_dev,key=sfe_wocommit_key$,dom=*next); wocommit=1

		if wocommit then
			msg_id$="WO_PICKLIST_NOT_DONE"
			gosub disp_message
		endif
	endif
[[SFE_WOMATISH.ISSUED_DATE.AVAL]]
rem --- When GL installed, verify date is in an open period.
	issue_date$=callpoint!.getUserInput()
	if callpoint!.getDevObject("gl")="Y" then
		call stbl("+DIR_PGM")+"glc_datecheck.aon",issue_date$,"Y",per$,yr$,status
		if status>99 then callpoint!.setStatus("ABORT")
		break
	endif

rem --- New materials issues entry
	if callpoint!.getRecordMode()="A" then

		rem --- Write SFE_WOMATISH and SFE_WOMATISD so can be reloaded to display new detail in grid
		sfe_womatish_dev=fnget_dev("SFE_WOMATISH")
		dim sfe_womatish$:fnget_tpl$("SFE_WOMATISH")
		sfe_womatish.firm_id$=firm_id$
		sfe_womatish.wo_location$=callpoint!.getColumnData("SFE_WOMATISH.WO_LOCATION")
		sfe_womatish.wo_no$=callpoint!.getColumnData("SFE_WOMATISH.WO_NO")
		sfe_womatish.wo_type$=callpoint!.getColumnData("SFE_WOMATISH.WO_TYPE")
		sfe_womatish.wo_category$=callpoint!.getColumnData("SFE_WOMATISH.WO_CATEGORY")
		sfe_womatish.unit_measure$=callpoint!.getColumnData("SFE_WOMATISH.UNIT_MEASURE")
		sfe_womatish.warehouse_id$=callpoint!.getColumnData("SFE_WOMATISH.WAREHOUSE_ID")
		sfe_womatish.item_id$=callpoint!.getColumnData("SFE_WOMATISH.ITEM_ID")
		sfe_womatish.issued_date$=callpoint!.getColumnData("SFE_WOMATISH.ISSUED_DATE")

		sfe_womatish_key$=sfe_womatish.firm_id$+sfe_womatish.wo_location$+sfe_womatish.wo_no$
		callpoint!.setDevObject("sfe_womatish_key",sfe_womatish_key$)
		writerecord(sfe_womatish_dev)sfe_womatish$

		rem --- Initialize SFE_WOMATISD Material Issues from SFE_WOMATDTL Material Detail
		sfe_womatisd_dev=fnget_dev("SFE_WOMATISD")
		dim sfe_womatisd$:fnget_tpl$("SFE_WOMATISD")
		sfe_womatdtl_dev=fnget_dev("SFE_WOMATDTL")
		dim sfe_womatdtl$:fnget_tpl$("SFE_WOMATDTL")

		read(sfe_womatdtl_dev,key=sfe_womatish_key$,dom=*next)
		while 1
			sfe_womatdtl_key$=key(sfe_womatdtl_dev,end=*break)
			if pos(sfe_womatish_key$=sfe_womatdtl_key$)<>1 then break
			readrecord(sfe_womatdtl_dev)sfe_womatdtl$

			sfe_womatisd.firm_id$=sfe_womatdtl.firm_id$
			sfe_womatisd.wo_location$=sfe_womatdtl.wo_location$
			sfe_womatisd.wo_no$=sfe_womatdtl.wo_no$
			sfe_womatisd.material_seq$=sfe_womatdtl.material_seq$
			sfe_womatisd.womatisd_seq_no$=sfe_womatdtl.womatdtl_seq_no$
			sfe_womatisd.unit_measure$=sfe_womatdtl.unit_measure$
			sfe_womatisd.womatdtl_seq_ref$=sfe_womatdtl.womatdtl_seq_no$
			sfe_womatisd.warehouse_id$=sfe_womatdtl.warehouse_id$
			sfe_womatisd.item_id$=sfe_womatdtl.item_id$
			sfe_womatisd.require_date$=sfe_womatdtl.require_date$
			sfe_womatisd.qty_ordered=sfe_womatdtl.qty_ordered
			sfe_womatisd.tot_qty_iss=sfe_womatdtl.tot_qty_iss
			sfe_womatisd.unit_cost=sfe_womatdtl.unit_cost
			sfe_womatisd.qty_issued=sfe_womatdtl.qty_issued
			sfe_womatisd.issue_cost=sfe_womatdtl.issue_cost

			writerecord(sfe_womatisd_dev)sfe_womatisd$
		wend

		rem --- Issue all?
		ivm_itemwhse_dev=fnget_dev("IVM_ITEMWHSE")
		ivm_itemwhse_tpl$=fnget_tpl$("IVM_ITEMWHSE")

		msg_id$="WO_PULLED_COMPLETE"
		gosub disp_message
		if msg_opt$="Y" then

			rem --- Pull complete
			read(sfe_womatisd_dev,key=sfe_womatish_key$,dom=*next)
			while 1
				sfe_womatisd_key$=key(sfe_womatisd_dev,end=*break)
				if pos(sfe_womatish_key$=sfe_womatisd_key$)<>1 then break
				readrecord(sfe_womatisd_dev)sfe_womatisd$

				dim ivm_itemwhse$:ivm_itemwhse_tpl$
				findrecord(ivm_itemwhse_dev,key=firm_id$+sfe_womatisd.warehouse_id$+sfe_womatisd.item_id$,dom=*next)ivm_itemwhse$

				sfe_womatisd.qty_issued=sfe_womatisd.qty_ordered-sfe_womatisd.tot_qty_iss
				sfe_womatisd.issue_cost=ivm_itemwhse.unit_cost

				writerecord(sfe_womatisd_dev)sfe_womatisd$
			wend

		else

			rem --- Partial issue
			rem --- Launch form to get operation sequence and production quantity
			call stbl("+DIR_SYP")+"bam_run_prog.bbj", "SFE_WOMATISO", stbl("+USER_ID"), "MNT", "", table_chans$[all]
			qty_to_issue=callpoint!.getDevObject("qty_to_issue")
			selected_ops!=callpoint!.getDevObject("selected_ops")
			rem --- Check if all operations were selected
			all_selected=1
			iter!=selected_ops!.values().iterator()
			while iter!.hasNext()
				op$=iter!.next()
				if op$="" then
					all_selected=0
					break
				endif
			wend

			rem --- Calculate quantities     
			if qty_to_issue<>0 then
				sfe_womastr_dev=fnget_dev("SFE_WOMASTR")
				dim sfe_womastr$:fnget_tpl$("SFE_WOMASTR")
				sfe_womatl_dev=fnget_dev("SFE_WOMATL")

				findrecord(sfe_womastr_dev,key=firm_id$+"  "+callpoint!.getColumnData("SFE_WOMATISH.WO_NO"))sfe_womastr$

				read(sfe_womatisd_dev,key=sfe_womatish_key$,dom=*next)
				while 1
					sfe_womatisd_key$=key(sfe_womatisd_dev,end=*break)
					if pos(sfe_womatish_key$=sfe_womatisd_key$)<>1 then break
					readrecord(sfe_womatisd_dev)sfe_womatisd$

					dim sfe_womatl$:fnget_tpl$("SFE_WOMATL")
					findrecord(sfe_womatl_dev,key=sfe_womatish_key$+sfe_womatisd.womatdtl_seq_ref$,dom=*next)sfe_womatl$
					if sfe_womatl.oprtn_int_seq$="" then continue

					rem --- Was this operation selected?
					if !all_selected then
						oprtn_selected=0
						iter!=selected_ops!.keySet().iterator()
						while iter!.hasNext()
							op_seq$=iter!.next()
							if selected_ops!.get(op_seq$)="" then continue
							if selected_ops!.get(op_seq$)=sfe_womatl.oprtn_int_seq$ then
								oprtn_selected=1
								break
							endif
						wend
						if !oprtn_selected then continue
					endif

					dim ivm_itemwhse$:ivm_itemwhse_tpl$
					findrecord(ivm_itemwhse_dev,key=firm_id$+sfe_womatisd.warehouse_id$+sfe_womatisd.item_id$,dom=*next)ivm_itemwhse$

					if sfe_womastr.sch_prod_qty=0 then sfe_womastr.sch_prod_qty=1
					sfe_womatisd.qty_issued=sfe_womatisd.qty_ordered*qty_to_issue/sfe_womastr.sch_prod_qty
					sfe_womatisd.issue_cost=ivm_itemwhse.unit_cost

					writerecord(sfe_womatisd_dev)sfe_womatisd$
				wend
            		endif

		endif

		sfe_wotrans_dev=fnget_dev("SFE_WOTRANS")
		dim sfe_wotrans$:fnget_tpl$("SFE_WOTRANS")
		sfe_wotrans.firm_id$=firm_id$
		sfe_wotrans.wo_location$=sfe_womatish.wo_location$
		sfe_wotrans.wo_no$=sfe_womatish.wo_no$
		writerecord(sfe_wotrans_dev)sfe_wotrans$

	        rem --- Reload and display with new detail
	        callpoint!.setStatus("RECORD:["+sfe_womatish_key$+"]")
	endif

rem wgh ... stopped
rem wgh ... need to use display mask for qty_to_issue???
rem wgh ... v6 displays int, but doesn't force int entry

rem wgh ... stopped
rem wgh ... need to finish ADIS
rem wgh ... when should issued_date be disabled ???

rem wgh ... 4190 IF O0=0 THEN GOTO 4900 <<<< need to be careful here
rem wgh ... 4200 REM " --- Check For More Issues"
rem wgh ... 4210 GOSUB 6100
rem wgh ... 4220 IF ISS$<>"Y" THEN GOTO 4900
rem wgh ... 4230 GOSUB 6000
rem wgh ... 4240 IF OPSEQ$="NONE" THEN GOTO 4900
rem wgh ... 4250 GOSUB 3400
rem wgh ... 4900 RUN "WOE.DB"
[[SFE_WOMATISH.ISSUED_DATE.BINP]]
rem -- Verify WO status
	gosub verify_wo_status
	if bad_wo then break

rem --- Default issued_date to today
	if callpoint!.getColumnData("SFE_WOMATISH.ISSUED_DATE")="" then
		dim sysinfo$:stbl("+SYSINFO_TPL")
		sysinfo$=stbl("+SYSINFO")
		callpoint!.setColumnData("SFE_WOMATISH.ISSUED_DATE",sysinfo.system_date$,1)
		callpoint!.setStatus("MODIFIED")
	endif
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
rem escape; rem wgh ... this is a BATCHED process

rem --- Init Java classes

	use java.util.HashMap
	use java.util.Iterator

rem --- Open Files
	num_files=14
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="SFS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="IVS_PARAMS",open_opts$[2]="OTA"
	open_tables$[3]="SFE_WOMASTR",open_opts$[3]="OTA"
	open_tables$[4]="SFE_WOOPRTN",open_opts$[4]="OTA"
	open_tables$[5]="SFE_OPENEDWO",open_opts$[5]="OTA"
	open_tables$[6]="SFE_WOCOMMIT",open_opts$[6]="OTA"
	open_tables$[7]="SFE_WOTRANS",open_opts$[7]="OTA"
	open_tables$[8]="SFE_WOMATHDR",open_opts$[8]="OTA"
	open_tables$[9]="SFE_WOMATDTL",open_opts$[9]="OTA"
	open_tables$[10]="SFE_WOMATL",open_opts$[10]="OTA"
	open_tables$[11]="SFC_OPRTNCOD",open_opts$[11]="OTA"
	open_tables$[12]="SFC_WOTYPECD",open_opts$[12]="OTA"
	open_tables$[13]="IVM_ITEMMAST",open_opts$[13]="OTA"
	open_tables$[14]="IVM_ITEMWHSE",open_opts$[14]="OTA"

	gosub open_tables

	sfs_params_dev=num(open_chans$[1]),sfs_params_tpl$=open_tpls$[1]
	ivs_params_dev=num(open_chans$[2]),ivs_params_tpl$=open_tpls$[2]
	sfe_womastr_dev=num(open_chans$[3]),sfe_womastr_tpl$=open_tpls$[3]
	callpoint!.setDevObject("opcode_dev",num(open_chans$[11]))
	callpoint!.setDevObject("opcode_tpl",open_tpls$[11])

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
		gl$="N"
		status=0
		source$=pgm(-2)
		call stbl("+DIR_PGM")+"glc_ctlcreate.aon",err=*next,source$,"SF",glw11$,gl$,status
		if status<>0 goto std_exit
	endif
	callpoint!.setDevObject("gl",gl$)

rem --- Get IV parameters
	dim ivs_params$:ivs_params_tpl$
	read record (ivs_params_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs_params$
	lotser$=ivs_params.lotser_flag$
	callpoint!.setDevObject("lotser",lotser$)
	precision$=ivs_params.precision$
	callpoint!.setDevObject("precision",precision$)
	precision num(precision$)

rem --- Additional file opens
	num_files=7
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

	gosub open_tables

	if bm$="Y" then
		callpoint!.setDevObject("opcode_dev",num(open_chans$[1]))
		callpoint!.setDevObject("opcode_tpl",open_tpls$[1])
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
