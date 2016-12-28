[[ARU_FINANCECHARG.ASVA]]
rem --- Get user approval to clearing non-updated previously created/entered finance charges
	if num(callpoint!.getColumnData("ARU_FINANCECHARG.CLEAR_ARE02")) then
		msg_id$="AR_DEL_FIN_CHRG"
		gosub disp_message
		if msg_opt$="Y" then
			are02_dev=fnget_dev("ARE_FINCHG")
			dim are02a$:fnget_tpl$("ARE_FINCHG")

			read (are02_dev,key=firm_id$,dom=*next)
			while 1
				k$=key(are02_dev,end=*break)
				if pos(firm_id$=k$)<>1 break
				read record (are02_dev) are02a$
				if num(are02a.batch_no$)<>0 then continue; rem --- skip if in a batch
				if are02a.invoice_type$="F" remove (are02_dev,key=k$)
			wend
		endif
	endif
[[ARU_FINANCECHARG.BSHO]]
rem --- Open/Lock files
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARE_FINCHG",open_opts$[1]="OTA"

	gosub open_tables
[[ARU_FINANCECHARG.AREC]]
rem --- Default to clearing non-updated previously created/entered finance charges
	callpoint!.setColumnData("ARU_FINANCECHARG.CLEAR_ARE02","1",1)
