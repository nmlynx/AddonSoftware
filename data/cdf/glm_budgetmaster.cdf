[[GLM_BUDGETMASTER.AMT_OR_UNITS.AVAL]]
wk$=callpoint!.getTableColumnAttribute("GLM_BUDGETMASTER.REVISION_SRC","LDAT")


wk$(1,30)="Hi there"
wk$(37,30)="How are you"
wk$(73,30)="Piece of pie?"

callpoint!.setTableColumnAttribute("GLM_BUDGETMASTER.REVISION_SRC","LDAT",wk$)

callpoint!.setStatus("REFRESH")
[[GLM_BUDGETMASTER.BUDGET_CODE.AVAL]]
if callpoint!.getColumnData("GLM_BUDGETMASTER.BUDGET_CODE")<="5"
	msg_id$="GL_RECID"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
