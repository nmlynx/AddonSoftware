[[ADM_PROCMASTER.AOPT-ACTL]]
rem call up adm_auditcontrol form

cp_processID$=callpoint!.getColumnData("ADM_PROCMASTER.PROCESS_ID")

user_id$=stbl("+USER_ID")
dim dflt_data$[2,1]
dflt_data$[1,0]="FIRM_ID"
dflt_data$[1,1]=firm_id$
dflt_data$[2,0]="PROCESS_ID"
dflt_data$[2,1]=cp_processID$

call stbl("+DIR_SYP")+"bam_run_prog.bbj",
:	"ADM_AUDITCONTROL",
:	user_id$,
:	"",
:	"",
:	table_chans$[all],
:	"",
:	dflt_data$[all]
