[[GLM_BUDGETMASTER.BUDGET_CODE.AVAL]]
if callpoint!.getColumnData("GLM_BUDGETMASTER.BUDGET_CODE")<="5"
	msg_id$="GL_RECID"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
