[[POE_INVSEL.AGCL]]
ESCAPE
[[POE_INVSEL.PO_NO.BINQ]]
alias_id$ = "POT_RECHDR"
inq_mode$ = "LOOKUP"
key_pfx$  = firm_id$+callpoint!.getColumnData("POE_INVSEL.VENDOR_ID")
key_id$   = "VEND_PO_REC"

ESCAPE

call stbl("+DIR_SYP")+"bam_inquiry.bbj",gui_dev,Form!,alias_id$,inq_mode$, 
:        table_chans$[all],key_pfx$,key_id$,selected_key$,filter_defs$[all],search_defs$[all]

if selected_key$ <> "" then callpoint!.setStatus("RECORD:[" + selected_key$ + "]") else callpoint!.setStatus("ABORT")
