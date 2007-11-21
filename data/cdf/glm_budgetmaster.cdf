[[GLM_BUDGETMASTER.ADEL]]
glm18_dev=fnget_dev("GLM_RECORDTYPE")
glm18_tpl$=fnget_tpl$("GLM_RECORDTYPE")

dim glm18a$:glm18_tpl$

glm18a.record_id$=callpoint!.getColumnData("GLM_BUDGETMASTER.BUDGET_CODE")
glm18a.actbud$="B"
glm18a.amt_or_units$=callpoint!.getColumnData("GLM_BUDGETMASTER.AMT_OR_UNITS")

remove(glm18_dev,key=glm18a.record_id$+glm18a.actbud$+glm18a.amt_or_units$,dom=*next)
[[GLM_BUDGETMASTER.AWRI]]
glm18_dev=fnget_dev("GLM_RECORDTYPE")
glm18_tpl$=fnget_tpl$("GLM_RECORDTYPE")

dim glm18a$:glm18_tpl$

glm18a.record_id$=callpoint!.getColumnData("GLM_BUDGETMASTER.BUDGET_CODE")
glm18a.actbud$="B"
glm18a.amt_or_units$=callpoint!.getColumnData("GLM_BUDGETMASTER.AMT_OR_UNITS")
glm18a.description$=callpoint!.getColumnData("GLM_BUDGETMASTER.DESCRIPTION")
glm18a.rev_title$=callpoint!.getColumnData("GLM_BUDGETMASTER.REV_TITLE")

glm18a$=field(glm18a$)
writerecord(glm18_dev)glm18a$
[[GLM_BUDGETMASTER.BWRI]]
gosub validate_revision_source
[[GLM_BUDGETMASTER.<CUSTOM>]]
validate_revision_source:

	rev_src$=callpoint!.getColumnData("GLM_BUDGETMASTER.REVISION_SRC")
	amt_units$=callpoint!.getColumnData("GLM_BUDGETMASTER.AMT_OR_UNITS")

	if cvs(rev_src$,3)<>"" and cvs(amt_units$,3)<>""

		if rev_src$(len(rev_src$),1)<>amt_units$ or rev_src$(1,1)<"0" or rev_src$(1,1)>"5"
			msg_id$="GL_BAD_RECID"
			gosub disp_message
			callpoint!.setStatus("ABORT")
		endif

	endif

return
[[GLM_BUDGETMASTER.REVISION_SRC.AVAL]]
gosub validate_revision_source
[[GLM_BUDGETMASTER.BUDGET_CODE.AVAL]]
if callpoint!.getColumnData("GLM_BUDGETMASTER.BUDGET_CODE")<="5"
	msg_id$="GL_RECID"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
