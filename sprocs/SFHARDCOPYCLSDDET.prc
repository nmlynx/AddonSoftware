rem ----------------------------------------------------------------------------
rem Program: SFHARDCOPYClsdDet.prc
rem Description: Stored Procedure to get the Shop Floor Hard Copy WO Close Detail into iReports
rem Used for Hard Copy, Traveler, Work Order Closed Detail and Work Order Detail
rem
rem Author(s): C. Johnson
rem Revised: 05.01.2012
rem
rem AddonSoftware
rem Copyright BASIS International Ltd.
rem ----------------------------------------------------------------------------
	
rem --- Set of utility methods

	use ::ado_func.src::func

rem --- Declare some variables ahead of time

	declare BBjStoredProcedureData sp!
	declare BBjRecordSet rs!
	declare BBjRecordData data!

rem --- Get the infomation object for the Stored Procedure

	sp! = BBjAPI().getFileSystem().getStoredProcedureData()

rem --- Get the IN parameters used by the procedure

	firm_id$      = sp!.getParameter("FIRM_ID")
	wo_loc$       = sp!.getParameter("WO_LOCATION")
	wo_no$        = sp!.getParameter("WO_NO")
	barista_wd$   = sp!.getParameter("BARISTA_WD")
	masks$        = sp!.getParameter("MASKS")

rem --- masks$ will contain pairs of fields in a single string mask_name^mask|

	if len(masks$)>0
		if masks$(len(masks$),1)<>"|"
			masks$=masks$+"|"
		endif
	endif

rem ---
	
	sv_wd$=dir("")
	chdir barista_wd$

rem --- Create a memory record set to hold results.
rem --- Columns for the record set are defined using a string template

	      temp$="CLOSED_DATE:C(1*), WO_TYPE:C(1*), WO_TYPE_DESC:C(1*), "
	temp$=temp$+"COMPLETE_YN:C(1*), CLOSE_AT_STD_ACT:C(1*), "
	temp$=temp$+"CURR_PROD_QTY:C(1*), PRIOR_CLSD_QTY:C(1*), THIS_CLOSE_QTY:C(1*), "
	temp$=temp$+"BAL_STILL_OPEN_QTY:C(1*), IV_UNIT_COST:C(1*), WO_COST_AT_STD:C(1*), "
	temp$=temp$+"WO_COST_AT_ACT:C(1*), PRIOR_CLOSED_AMT:C(1*), CURR_WIP_VALUE:C(1*), "
	temp$=temp$+"CURR_CLOSE_VALUE:C(1*), "
rem -- GL
rem	temp$=temp$+"GL_ACCT_NUM:C(1*), GL_ACCT_DESC:C(1*), GL_ACCT_TYPE:C(1*), "
rem	temp$=temp$+"GL_DEBIT_AMT:C(1*), GL_CREDIT_AMT:C(1*), GL_DEBIT_PERUNIT:C(1*), GL_CREDIT_PERUNIT:C(1*)"	

	temp$=temp$+"WIP_GL_ACCT_NUM:C(1*), WIP_GL_ACCT_DESC:C(1*), WIP_GL_ACCT_TYPE:C(1*), "
	temp$=temp$+"WIP_GL_DEBIT_AMT:C(1*), WIP_GL_CREDIT_AMT:C(1*), WIP_GL_DEBIT_PERUNIT:C(1*), "
	temp$=temp$+"WIP_GL_CREDIT_PERUNIT:C(1*), "
	
	temp$=temp$+"CLS_To_GL_ACCT_NUM:C(1*), CLS_To_GL_ACCT_DESC:C(1*), CLS_To_GL_ACCT_TYPE:C(1*), "
	temp$=temp$+"CLS_To_GL_DEBIT_AMT:C(1*), CLS_To_GL_CREDIT_AMT:C(1*), CLS_To_GL_DEBIT_PERUNIT:C(1*), "
	temp$=temp$+"CLS_To_GL_CREDIT_PERUNIT:C(1*), "
	
	temp$=temp$+"DIR_VAR_GL_ACCT_NUM:C(1*), DIR_VAR_GL_ACCT_DESC:C(1*), DIR_VAR_GL_ACCT_TYPE:C(1*), "
	temp$=temp$+"DIR_VAR_GL_DEBIT_AMT:C(1*), DIR_VAR_GL_CREDIT_AMT:C(1*), DIR_VAR_GL_DEBIT_PERUNIT:C(1*), "
	temp$=temp$+"DIR_VAR_GL_CREDIT_PERUNIT:C(1*), "
	
	temp$=temp$+"OVRH_VAR_GL_ACCT_NUM:C(1*), OVRH_VAR_GL_ACCT_DESC:C(1*), OVRH_VAR_GL_ACCT_TYPE:C(1*), "
	temp$=temp$+"OVRH_VAR_GL_DEBIT_AMT:C(1*), OVRH_VAR_GL_CREDIT_AMT:C(1*), OVRH_VAR_GL_DEBIT_PERUNIT:C(1*), "
	temp$=temp$+"OVRH_VAR_GL_CREDIT_PERUNIT:C(1*), "
	
	temp$=temp$+"MAT_VAR_GL_ACCT_NUM:C(1*), MAT_VAR_GL_ACCT_DESC:C(1*), MAT_VAR_GL_ACCT_TYPE:C(1*), "
	temp$=temp$+"MAT_VAR_GL_DEBIT_AMT:C(1*), MAT_VAR_GL_CREDIT_AMT:C(1*), MAT_VAR_GL_DEBIT_PERUNIT:C(1*), "
	temp$=temp$+"MAT_VAR_GL_CREDIT_PERUNIT:C(1*), "
	
	temp$=temp$+"SUB_VAR_GL_ACCT_NUM:C(1*), SUB_VAR_GL_ACCT_DESC:C(1*), SUB_VAR_GL_ACCT_TYPE:C(1*), "
	temp$=temp$+"SUB_VAR_GL_DEBIT_AMT:C(1*), SUB_VAR_GL_CREDIT_AMT:C(1*), SUB_VAR_GL_DEBIT_PERUNIT:C(1*), "
	temp$=temp$+"SUB_VAR_GL_CREDIT_PERUNIT:C(1*)"

	
	rs! = BBJAPI().createMemoryRecordSet(temp$)

rem --- Get Barista System Program directory

	sypdir$=""
	sypdir$=stbl("+DIR_SYP",err=*next)

rem --- Get masks

	pgmdir$=stbl("+DIR_PGM",err=*next)

	iv_cost_mask$=fngetmask$("iv_cost_mask","##,##0.00-",masks$)
	sf_cost_mask$=fngetmask$("sf_cost_mask","##,##0.0000-",masks$)
	sf_units_mask$=fngetmask$("sf_units_mask","#,##0.00-",masks$)
	sf_amt_mask$=fngetmask$("sf_amt_mask","###,##0.00-",masks$)
	sf_rate_mask$=fngetmask$("sf_rate_mask","#,##0.000-",masks$)	
	gl_acct_mask$=fngetmask$("gl_acct_mask","###-####",masks$)

rem --- TEMPORARILY HARDCODED FOR iReport layout development <<======================
CLOSED_DATE$ = "06/15/2012"
WO_TYPE$ = "01"
WO_TYPE_DESC$ = "Standard WO Type"
CURR_PROD_QTY = 20
PRIOR_CLSD_QTY = 20
THIS_CLOSE_QTY = 5
BAL_STILL_OPEN_QTY = 0
COMPLETE_YN$ = "Y"
IV_UNIT_COST = 285.89
WO_COST_AT_STD = 4881.8
CLOSE_AT_STD_ACT$ = "S"
WO_COST_AT_ACT = 0
PRIOR_CLOSED_AMT = 4881.8
CURR_WIP_VALUE = -4881.8
CURR_CLOSE_VALUE = 0
GL_ACCT_NUM$ = "12500110"
GL_ACCT_DESC$ = "Work In Process"
GL_DEBIT_AMT = 4881.8
GL_CREDIT_AMT = 0
GL_DEBIT_PERUNIT = 0
GL_CREDIT_PERUNIT = 0
GL_ACCT_TYPE$ = "WIP"

rem --- Print totals

	data! = rs!.getEmptyRecordData()
	data!.setFieldValue("CLOSED_DATE",fndate$(closed_date$))
	data!.setFieldValue("WO_TYPE",wo_type$)
	data!.setFieldValue("WO_TYPE_DESC",wo_type_desc$)
	
	data!.setFieldValue("CURR_PROD_QTY",str(curr_prod_qty))
	data!.setFieldValue("PRIOR_CLSD_QTY",str(prior_clsd_qty))
	data!.setFieldValue("THIS_CLOSE_QTY",str(this_close_qty))
	data!.setFieldValue("BAL_STILL_OPEN_QTY",str(bal_still_open_qty))
	
	data!.setFieldValue("COMPLETE_YN",complete_yn$)

	data!.setFieldValue("IV_UNIT_COST",str(iv_unit_cost))
	data!.setFieldValue("WO_COST_AT_STD",str(wo_cost_at_std))

	data!.setFieldValue("CLOSE_AT_STD_ACT",close_at_std_act$)

	data!.setFieldValue("WO_COST_AT_ACT",str(wo_cost_at_act))
	data!.setFieldValue("PRIOR_CLOSED_AMT",str(prior_closed_amt))
	data!.setFieldValue("CURR_WIP_VALUE",str(curr_wip_value))
	data!.setFieldValue("CURR_CLOSE_VALUE",str(curr_close_value))

	rem --- GL
	rem 	The accounts (Logic in iReports to print if all amts not-zero):
	rem			Work in Process
	rem			Close to Account
	rem			Direct Variance
	rem 		Overhead Variance
	rem			Material Variance
	rem			Subcontract Variance
	
	for x = 0 to 5
		switch x
			case 0
				AcctAbrv$ = "WIP_";      rem Work in Process
			break
			case 1	
				AcctAbrv$ = "CLS_To_";   rem Close to Account
			break
			case 2
				AcctAbrv$ = "DIR_VAR_";  rem Direct Variance
			break
			case 3	
				AcctAbrv$ = "OVRH_VAR_"; rem Overhead Variance
			break
			case 4
				AcctAbrv$ = "MAT_VAR_";  rem Material Variance
			break
			case 5	
				AcctAbrv$ = "SUB_VAR_";  rem Subcontract Variance
			break
		swend

		
		data!.setFieldValue(AcctAbrv$+"GL_ACCT_NUM",fnmask$(gl_acct_num$,gl_acct_mask$))
		data!.setFieldValue(AcctAbrv$+"GL_ACCT_DESC",gl_acct_desc$)
		
		data!.setFieldValue(AcctAbrv$+"GL_DEBIT_AMT",str(gl_debit_amt))
		data!.setFieldValue(AcctAbrv$+"GL_CREDIT_AMT",str(gl_credit_amt))
		data!.setFieldValue(AcctAbrv$+"GL_DEBIT_PERUNIT",str(gl_debit_perunit))
		data!.setFieldValue(AcctAbrv$+"GL_CREDIT_PERUNIT",str(gl_credit_perunit))
		
		data!.setFieldValue(AcctAbrv$+"GL_ACCT_TYPE",gl_acct_type$)
	
	next x
	

	rs!.insert(data!)
	
rem --- Tell the stored procedure to return the result set.

	sp!.setRecordSet(rs!)
	goto std_exit

rem --- Subroutines
		
rem --- Functions

rem --- Format inventory item description

	def fnitem$(q$,q1,q2,q3)
		q$=pad(q$,q1+q2+q3)
		return cvs(q$(1,q1)+" "+q$(q1+1,q2)+" "+q$(q1+q2+1,q3),32)
	fnend

rem --- Date/time handling functions

    def fndate$(q$)
        q1$=""
        q1$=date(jul(num(q$(1,4)),num(q$(5,2)),num(q$(7,2)),err=*next),err=*next)
        if q1$="" q1$=q$
        return q1$
    fnend
    
    def fnyy$(q$)=q$(3,2)
    def fnclock$(q$)=date(0:"%hz:%mz %p")
    def fntime$(q$)=date(0:"%Hz%mz")
    def fnh$(q1$)=q1$(5,2)+"/"+q1$(1,4)

rem --- fnmask$: Alphanumeric Masking Function (formerly fnf$)

    def fnmask$(q1$,q2$)
        if q2$="" q2$=fill(len(q1$),"0")
        return str(-num(q1$,err=*next):q2$,err=*next)
        q=1
        q0=0
        while len(q2$(q))
              if pos(q2$(q,1)="-()") q0=q0+1 else q2$(q,1)="X"
              q=q+1
        wend
        if len(q1$)>len(q2$)-q0 q1$=q1$(1,len(q2$)-q0)
        return str(q1$:q2$)
    fnend

	def fngetmask$(q1$,q2$,q3$)
		rem --- q1$=mask name, q2$=default mask if not found in mask string, q3$=mask string from parameters
		q$=q2$
		if len(q1$)=0 return q$
		if q1$(len(q1$),1)<>"^" q1$=q1$+"^"
		q=pos(q1$=q3$)
		if q=0 return q$
		q$=q3$(q)
		q=pos("^"=q$)
		q$=q$(q+1)
		q=pos("|"=q$)
		q$=q$(1,q-1)
		return q$
	fnend



	std_exit:
	
	end
