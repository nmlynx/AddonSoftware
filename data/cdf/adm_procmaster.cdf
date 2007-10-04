[[ADM_PROCMASTER.AOPT-ACTL]]
rem call up adm_auditcontrol form

cp_processID$=callpoint!.getColumnData("ADM_PROCMASTER.PROCESS_ID")

user_id$=stbl("+USER_ID")
key_pfx$=firm_id$+cp_processID$

call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:	"ADM_AUDITCONTROL",
:	user_id$,
:	"",
:	key_pfx$,
:	table_chans$[all],
:	"",
:	""
