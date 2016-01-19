[[ARE_DEPOSIT.DEPOSIT_ID.AVAL]]
rem wgh ... 8336 ... Don't allow exiting deposit_id with trans_status R or U
[[ARE_DEPOSIT.BDEL]]
rem --- Cannot delete a Deposit that contains receipts
	are01_dev=fnget_dev("@ARE_CASHHDR")
	dim are01a$:fnget_tpl$("@ARE_CASHHDR")
	are01_trip$=firm_id$+callpoint!.getColumnData("ARE_DEPOSIT.DEPOSIT_ID")
	readrecord(are01_dev,key=are01_trip$,knum="AO_DEPOSIT",dom=*next)are01a$
	are01_key$=key(are01_dev,end=*next)
	if pos(are01_trip$=are01_key$)=1 then
		rem --- Warn Deposit contains receipts
		msg_id$="AR_DEPOSIT_HAS_RCPTS"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif
[[ARE_DEPOSIT.AOPT-SELD]]
rem --- Check the Deposit’s TOT_DEPOSIT_AMT when ending a Deposit
	deposit_id$=callpoint!.getDevObject("deposit_id")
	if deposit_id$<>callpoint!.getColumnData("ARE_DEPOSIT.DEPOSIT_ID") then
		if deposit_id$<>"" then
			tot_deposit_amt=num(callpoint!.getDevObject("tot_deposit_amt"))
			tot_receipts_amt=num(callpoint!.getDevObject("tot_receipts_amt"))
			if tot_deposit_amt=0 then
				rem --- When TOT_DEPOSIT_AMT is zero, set it equal to the sum of the PAYMENT_AMTs, i.e., tot_receipts_amt
				gosub set_TotDepositAmt_to_TotReceiptsAmt
			else
				rem --- Warn TOT_DEPOSIT_AMT it is not equal to the sum of the PAYMENT_AMTs, i.e., tot_receipts_amt
				if tot_depost_amt<>tot_receipts_amt then
					call stbl("+DIR_PGM")+"adc_getmask.aon","","AR","A","",AmtMsk$,0,0
					msg_id$="AR_DEPOSIT_AMT_BAD"
					dim msg_tokens$[2]
					msg_tokens$[1]=cvs(str(tot_deposit_amt:AmtMsk$),3)
					msg_tokens$[2]=cvs(str(tot_receipts_amt:AmtMsk$),3)
					gosub disp_message
					if msg_opt$="C" then
						rem --- Change the deposit amount, set it equal to the sum of the PAYMENT_AMTs, i.e., tot_receipts_amt
						gosub set_TotDepositAmt_to_TotReceiptsAmt
					endif
					if msg_opt$="E" then
						rem --- Edit the cash receipts for previously selected Deposit
						callpoint!.setStatus("EXIT")
						break
					endif
					if msg_opt$="L" then
						rem --- Exit as-is
						rem --- Warn that Cash Receipt Register can't be updated
						msg_id$="AR_NO_UPDT_CSHRCPT"
						gosub disp_message
					endif
				endif
			endif
		endif

		rem --- Reset tot_receipts_amt for new Deposit.
		rem --- When switching to an existing Deposit, need to total payment_amt for receipts already in that Deposit.
		are01_dev=fnget_dev("@ARE_CASHHDR")
		dim are01a$:fnget_tpl$("@ARE_CASHHDR")
		tot_receipts_amt=0
		are01_trip$=firm_id$+callpoint!.getColumnData("ARE_DEPOSIT.DEPOSIT_ID")
		readrecord(are01_dev,key=are01_trip$,knum="AO_DEPOSIT",dom=*next)are01a$
		while 1
			are01_key$=key(are01_dev,end=*break)
			if pos(are01_trip$=are01_key$)<>1 then break
			readrecord(are01_dev)are01a$
			tot_receipts_amt=tot_receipts_amt+are01a.payment_amt
		wend
		callpoint!.setDevObject("tot_receipts_amt",tot_receipts_amt)
	endif

rem --- Set devObjects for data being returned
	callpoint!.setDevObject("deposit_id",callpoint!.getColumnData("ARE_DEPOSIT.DEPOSIT_ID"))
	callpoint!.setDevObject("deposit_date",callpoint!.getColumnData("ARE_DEPOSIT.DEPOSIT_DATE"))
	callpoint!.setDevObject("cash_rec_cd",callpoint!.getColumnData("ARE_DEPOSIT.CASH_REC_CD"))
	callpoint!.setDevObject("tot_deposit_amt",num(callpoint!.getColumnData("ARE_DEPOSIT.TOT_DEPOSIT_AMT")))

rem --- Exit form
	callpoint!.setStatus("EXIT")
[[ARE_DEPOSIT.<CUSTOM>]]
rem ==================================================================
set_TotDepositAmt_to_TotReceiptsAmt:
	rem --- input data:
		rem --- deposit_date$
		rem --- tot_deposit_amt
		rem --- tot_receipts_amt
rem ==================================================================
	rem --- Set Deposit's tot_deposit_amt equal the total of the receipt payments in the deposit tot_receipts_amt
	deposit_dev=fnget_dev("ARE_DEPOSIT")
	dim deposit_tpl$:fnget_tpl$("ARE_DEPOSIT")
	rem --- Reading with knum=AO_STATUS already
	readrecord(deposit_dev,key=firm_id$+"E"+deposit_id$,dom=*next)deposit_tpl$
	if deposit_tpl.deposit_id$=deposit_id$ then
		deposit_tpl.tot_deposit_amt=tot_receipts_amt
		deposit_tpl$=field(deposit_tpl$)
		writerecord(deposit_dev)deposit_tpl$
	endif
	return
[[ARE_DEPOSIT.DEPOSIT_DATE.AVAL]]
rem --- Validate entered date
	deposit_date$=callpoint!.getUserInput()        
	call stbl("+DIR_PGM")+"glc_datecheck.aon",deposit_date$,"Y",per$,yr$,status
	if status>99
		callpoint!.setStatus("ABORT")
		break
	endif
[[ARE_DEPOSIT.BSHO]]
rem --- Open/Lock files
	num_files=3
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARC_CASHCODE",open_opts$[1]="OTA@"
	open_tables$[2]="ARE_CASHHDR",open_opts$[2]="OTA@"
	open_tables$[3]="GLM_BANKMASTER",open_opts$[3]="OTA@"

	gosub open_tables
	if status$ <> ""  then goto std_exit
[[ARE_DEPOSIT.CASH_REC_CD.AVAL]]
rem --- The Cash Receipts Code’s GL Cash Account must be set up in the Bank Account Master file GLM_BANKMASTER (glm-05)
	cashcode_dev=fnget_dev("@ARC_CASHCODE")
	dim cashcode_tpl$:fnget_tpl$("@ARC_CASHCODE")
	glm05_dev=fnget_dev("@GLM_BANKMASTER")
	dim glm05a$:fnget_tpl$("@GLM_BANKMASTER")

	cash_rec_cd$=callpoint!.getUserInput()
	findrecord(cashcode_dev,key=firm_id$+"C"+cash_rec_cd$,dom=*next)cashcode_tpl$
	findrecord(glm05_dev,key=firm_id$+cashcode_tpl.gl_cash_acct$,dom=*next)glm05a$
	if cvs(glm05a.gl_account$,2)="" then
		msg_id$="AR_NOT_BNKREC_CASHCD"
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif
[[ARE_DEPOSIT.BWRI]]
rem --- Initialize RTP modified fields for modified existing records
	if callpoint!.getRecordMode()="C" then
		rec_data.mod_user$=sysinfo.user_id$
		rec_data.mod_date$=date(0:"%Yd%Mz%Dz")
		rec_data.mod_time$=date(0:"%Hz%mz")
		callpoint!.setDevObject("initial_rec_data$",rec_data$)
	endif
[[ARE_DEPOSIT.AREC]]
rem --- Initialize RTP trans_status and created fields
	rem --- TRANS_STATUS set to "E" via form Preset Value
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_USER",sysinfo.user_id$)
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_DATE",date(0:"%Yd%Mz%Dz"))
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_TIME",date(0:"%Hz%mz"))
	callpoint!.setColumnData("ARE_DEPOSIT.AUDIT_NUMBER","0")

rem --- Continue using previously entered devObjects if Deposit entry is Cancelled/Aborted
	if callpoint!.getDevObject("deposit_id")=null() then
		rem --- Initialize devObjects for data being returned for a new Deposit
		callpoint!.setDevObject("deposit_id","")
		callpoint!.setDevObject("deposit_date","")
		callpoint!.setDevObject("cash_rec_cd","")
		callpoint!.setDevObject("tot_deposit_amt",0)
		callpoint!.setDevObject("tot_receipts_amt",0)
	endif
