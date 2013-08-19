[[ART_CASHHEADER.BWRI]]

	file$="ART_CASHHEADER"
	dim cashheader$ : fnget_tpl$(file$)
	cashhdr_dev=fnget_dev(file$)

	if callpoint!.getColumnData(cvs(cashheader.status$,3))="" 
		callpoint!.setColumnData(cashheader.status$,"O ")
	endif

	callpoint!.setColumnData("cashheader.cash_rec_cd","A")
	callpoint!.setColumnData("cashheader.cr_source","CR")
	escape; rem << check defaults

[[ART_CASHHEADER.<CUSTOM>]]
rem ==================================================================
get_customer_balance:
rem ==================================================================
	rem --- tmp_cust_id$ being set prior to gosub
	arm_custdet_dev=fnget_dev("ARM_CUSTDET")
	dim arm02a$:fnget_tpl$("ARM_CUSTDET")
	arm02a.firm_id$=firm_id$,arm02a.customer_id$=tmp_cust_id$,arm02a.ar_type$="  "
	readrecord(arm_custdet_dev,key=arm02a.firm_id$+arm02a.customer_id$+arm02a.ar_type$,err=*next)arm02a$
	callpoint!.setColumnData("<<DISPLAY>>.DISP_CUST_BAL",
:	str(num(arm02a.aging_future$)+num(arm02a.aging_cur$)+num(arm02a.aging_30$)+
:       num(arm02a.aging_60$)+num(arm02a.aging_90$)+num(arm02a.aging_120$)))
return

rem ==================================================================
apply_on_acct:
rem ==================================================================
	
	file$ = "ART_CASHHEADER"
	cashheader_dev = fnget_dev(file$)
	dim cashheader$:fnget_tpl$(file$)

	oa_date$=callpoint!.getColumnData("ART_CASHHDR.RECEIPT_DATE")
	oa_date$=oa_date$(4)
	dim wk$(40)
	wk$(1)=callpoint!.getColumnData("ART_CASHHDR.AR_CHECK_NO")
	wk$(11)="OA"+oa_date$
	wk$(21)=str(num((callpoint!.getColumnData("<<DISPLAY>>.DISP_BAL"))))

	if num(wk$(21,10))<>0
		pymt_dist$=UserObj!.getItem(num(user_tpl.pymt_dist$))
		wk=pos(wk$(1,20)=pymt_dist$)
			if wk<>0
				pymt_dist$(wk+20,10)=str(num(pymt_dist$(wk+20,10))+num(wk$(21,10)))
				pymt_dist$(wk+30,10)=str(num(pymt_dist$(wk+30,10))+num(wk$(31,10)))
			else
				pymt_dist$=pymt_dist$+wk$
			endif
		UserObj!.setItem(num(user_tpl.pymt_dist$),pymt_dist$)
		rem << gosub update_cashhdr_cashdet_cashbal

		REM << callpoint!.setStatus("RECORD:["+firm_id$+
:			callpoint!.getColumnData("ART_CASHHEADER.CR_TRANS_ID")
	endif
return

return

REM ==============================
GL_DISTRIBUTION:
rem ==============================
return
 

rem ==============================
Scroll_rcds:
rem ==============================
REM =============================
rem <<<< hold_for_bnex_callpoint:
REM =============================
print "Hdr:BNEK"; rem debug

rem --- Is next record an order and not void?

	file$ = "ART_CASHHEADER"
	cashheader_dev = fnget_dev(file$)
	dim cashheader$:fnget_tpl$(file$)

rem --- Position the file at the correct record

	if callpoint!.getDevObject("new_rec")="Y"
		start_key$=firm_id$
		cust_id$=callpoint!.getColumnData("ART_CASHHEADER.CUSTOMER_ID")
		cr_trans_id$=callpoint!.getColumnData("ART_CASHHEADER.CR_TRANS_ID")
		REM << Reading by CR TRANS ID >> if cvs(cust_id$,2)<>""
			REM << start_key$=start_key$+cust_id$
			if cvs(cr_trans_id$,2)<>""
				start_key$=start_key$+cr_trans_id$
			endif
		endif

		while 1
			read record (cashheader_dev,key=start_key$,dom=*break)
			
			break
		wend
	endif

	hit_eof=0
	while 1
		read record (cashheader_dev, dir=0, end=eof) cashheader$

		if cashheader.firm_id$ = firm_id$ then
			if cashheader.status$ = "O" then
				rem --- Have a keeper, stop looking
				break
			else
				rem --- Keep looking
				rem << for extract >> read (cashheader_dev, end=*endif)
				continue
			endif
		endif
		rem --- End-of-firm

eof: rem --- If end-of-file or end-of-firm, rewind to first record of the firm
		read (cashheader_dev, key=firm_id$, dom=*next)
		hit_eof=hit_eof+1
		if hit_eof>1 then
			msg_id$ = "OP_ALL_WRONG_TYPE"
			gosub disp_message
			callpoint!.setStatus("ABORT")
			break
		endif
	wend
[[ART_CASHHEADER.AWIN]]

rem --- Open/Lock files
use ::ado_util.src::util

rem --- program paths
	pgmdir$=stbl("+DIR_PGM",err=*next) 
	sypdir$=stbl("+DIR_SYP",err=*next) 
	datdir$=stbl("+ADDATA",err=*next) 

rem --- sysinfo
	sysinfo_template$=stbl("+SYSINFO_TPL",err=*next)
    	dim sysinfo$:sysinfo_template$
    	sysinfo$=stbl("+SYSINFO",err=*next)
    	milestone=num(stbl("+MILESTONE",err=*next),err=*next)
    	firm_id$=sysinfo.firm_id$

rem --- setup arrays
	opts$="OTA@",eop=0
	files=3,  open_beg=1,open_end=files,open_batch=0,open_status$=""
	dim open_tables$[files],open_opts$[files],open_chans$[files],open_tpls$[files]

	open_tables$[1]="ART_INVHEADER",open_opts$[1]=opts$
	open_tables$[2]="ART_CASHPOST",open_opts$[2]=opts$
	open_tables$[3]="ARM_CUSTDET",open_opts$[3]=opts$

rem --- open tables
	gosub open_tables

rem --- setup channels
	invheader_dev=num(open_chans$[1])
	cashpost_dev=num(open_chans$[2])
	custdet_dev=num(open_chans$[3])
	cashheader_dev=fnget_dev("ART_CASHHEADER")
	cashtrans_dev=fnget_dev("ART_CASHTRANS")

rem --- dim string templates
	dim invheader$:open_tpls$[1]
	dim cashpost$:open_tpls$[2]
	dim custdet$:open_tpls$[3]
	dim cashheader$: fnget_tpl$("ART_CASHHEADER")
	dim cashtrans$: fnget_tpl$("ART_CASHTRANS")

rem --- setup optional lookup on invoice
	rem << callpoint!.setDevObject("opt_invlookup",open_chans$[invheader_dev])
	

rem --- est. globals
	callpoint!.setDevObject("cashheader_dev",cashheader_dev)
	callpoint!.setDevObject("cashtrans_dev",cashtrans_dev)
	callpoint!.setDevObject("invheader_dev",invheader_dev)
	callpoint!.setDevObject("cashpost_dev",cashpost_dev)
	callpoint!.setDevObject("custdet_dev",custdet_dev)

rem --- set defaults
	callpoint!.setDevObject("new_rec","Y")
[[ART_CASHHEADER.AOPT-GLP]]
rem --- call up GL Dist grid if GL installed
if user_tpl.glint$="Y"
	gosub gl_distribution
else
	msg_id$="AR_NO_GL"
	gosub disp_message							
endif
[[ART_CASHHEADER.AOPT-AOA]]
gosub apply_on_acct
