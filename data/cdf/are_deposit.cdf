[[ARE_DEPOSIT.TOT_DEPOSIT_AMT.AVAL]]
rem wgh ... 8336 ... check the Deposit’s TOT_DEPOSIT_AMT when ending a Deposit
rem wgh ... 8336 ... if zero, set it equal to the sum of the PAYMENT_AMTs
rem wgh ... 8336 ... else, warn if it is not equal to the sum of the PAYMENT_AMTs
[[ARE_DEPOSIT.BSHO]]
rem --- Open/Lock files
	num_files=2
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARC_CASHCODE",open_opts$[1]="OTA@"
	open_tables$[2]="GLM_BANKMASTER",open_opts$[2]="OTA@"

	gosub open_tables
	if status$ <> ""  then goto std_exit
[[ARE_DEPOSIT.DEPOSIT_ID.AVAL]]
rem wgh ... 8336 ... check the Deposit’s TOT_DEPOSIT_AMT

rem wgh ... 8336 ... new deposit isn't working right ... should work same as new WO in WO entry

rem wgh ... 8336 ... add deposit detail button

rem wgh ... 8336 ... add drilldown to deposit lookup
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
[[ARE_DEPOSIT.ASVA]]
rem --- Set devObjects for data being returned
	callpoint!.setDevObject("deposit_id",callpoint!.getColumnData("ARE_DEPOSIT.DEPOSIT_ID"))
	callpoint!.setDevObject("deposit_date",callpoint!.getColumnData("ARE_DEPOSIT.DEPOSIT_DATE"))
	callpoint!.setDevObject("cash_rec_id",callpoint!.getColumnData("ARE_DEPOSIT.CASH_REC_CD"))
[[ARE_DEPOSIT.AWRI]]
rem --- Exit form
	callpoint!.setStatus("EXIT")
[[ARE_DEPOSIT.BWRI]]
rem --- Initialize RTP modified fields for modified existing records
	if callpoint!.getRecordMode()="C" then
		rec_data.mod_user$=sysinfo.user_id$
		rec_data.mod_date$=date(0:"%Yd%Mz%Dz")
		rec_data.mod_time$=date(0:"%Hz%mz")
		callpoint!.setDevObject("initial_rec_data$",rec_data$)
	endif

rem wgh ... 8336 ... after entering a new deposit have to click OK twice to exit
[[ARE_DEPOSIT.AREC]]
rem --- Initialize RTP trans_status and created fields
	rem --- TRANS_STATUS set to "E" via form Preset Value
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_USER",sysinfo.user_id$)
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_DATE",date(0:"%Yd%Mz%Dz"))
	callpoint!.setColumnData("ARE_DEPOSIT.CREATED_TIME",date(0:"%Hz%mz"))
	callpoint!.setColumnData("ARE_DEPOSIT.AUDIT_NUMBER","0")

rem --- Initialize devObjects for data being returned, if not previously entered
	if callpoint!.getDevObject("deposit_id")=null() then
		rem --- Continue using previously entered devObjects if Deposit entry is Cancelled/Aborted
		callpoint!.setDevObject("deposit_id","")
		callpoint!.setDevObject("deposit_date","")
		callpoint!.setDevObject("cash_rec_id","")
	endif

rem wgh ... 8336 ... when attempt to edit record, it shows as being locked
