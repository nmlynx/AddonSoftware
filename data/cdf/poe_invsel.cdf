[[POE_INVSEL.AWRI]]
gosub write_poe_invdet
[[POE_INVSEL.AGRE]]
gosub receiver_already_selected
[[POE_INVSEL.AGCL]]
rem print 'show';rem debug

use ::ado_util.src::util
[[POE_INVSEL.AGDR]]
rem --- disable existing rows; user can delete/re-add if necessary
rem --- this way, delete will cascade to poe_invdet and poe_invgl
util.disableGridRow(Form!,num(callpoint!.getValidationRow()))
[[POE_INVSEL.RECEIVER_NO.AVAL]]
gosub accum_receiver_tot
[[POE_INVSEL.<CUSTOM>]]
receiver_already_selected:
rem --- given a po/receiver (or po w/ no receiver) see if it's already in gridvect

curr_row=callpoint!.getValidationRow()
curr_po_no$=callpoint!.getColumnData("POE_INVSEL.PO_NO")
curr_receiver_no$=callpoint!.getColumnData("POE_INVSEL.RECEIVER_NO")
already_sel$=""
g!=gridVect!.getItem(0)
if g!.size()
	dim rec$:dtlg_param$[1,3]
	for x=0 to g!.size()-1
		if x<>curr_row
			rec$=g!.getItem(x)
			if cvs(rec$,3)<>"" and callpoint!.getGridRowDeleteStatus(x)<>"Y"
				this_po_no$=rec.po_no$
				this_receiver_no$=rec.receiver_no$
				if this_po_no$+this_receiver_no$=curr_po_no$+curr_receiver_no$ then already_sel$="Y"
				if cvs(this_receiver_no$,3)="" then if this_po_no$=curr_po_no$ then already_sel$="Y"
				if cvs(curr_receiver_no$,3)="" then if this_po_no$=curr_po_no$ then already_sel$="Y"						
			endif
		endif
	next x
endif

if already_sel$="Y"
	msg_id$="PO_REC_SEL"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif

return

accum_receiver_tot:
rem --- given a po/receiver (or po w/ no receiver), retrieve/display pot-14 info
rem --- this routine invoked from rec# AVAL and from AWRI

pot_rechdr_dev=fnget_dev("POT_RECHDR")
pot_recdet_dev=fnget_dev("POT_RECDET")
poc_linecode_dev=fnget_dev("POC_LINECODE")
apc_termscode_dev=fnget_dev("APC_TERMSCODE")

dim pot_rechdr$:fnget_tpl$("POT_RECHDR")
dim pot_recdet$:fnget_tpl$("POT_RECDET")
dim poc_linecode$:fnget_tpl$("POC_LINECODE")
dim apc_termscode$:fnget_tpl$("APC_TERMSCODE")

event$=callpoint!.getCallpointEvent()
po_no$=callpoint!.getColumnData("POE_INVSEL.PO_NO")
receiver_no$=callpoint!.getColumnData("POE_INVSEL.RECEIVER_NO")

if pos("POE_INVSEL.RECEIVER_NO.AVAL"=event$)
	receiver_no$=callpoint!.getUserInput()
endif

wk$=firm_id$+po_no$+receiver_no$
foundone=0

read (pot_recdet_dev,key=wk$,dom=*next)
while 1
	read record (pot_recdet_dev,end=*break)pot_recdet$
	if pos(pot_recdet.firm_id$+pot_recdet.po_no$=wk$)<>1 then break
	if receiver_no$<>"" and pot_recdet.receiver_no$<>receiver_no$ then break
	find record (poc_linecode_dev,key=firm_id$+pot_recdet.po_line_code$,dom=*next)poc_linecode$
	if pos(poc_linecode.line_type$="VM")<>0 then continue
	if poc_linecode.line_type$<>"O"
		if (pot_recdet.qty_received>=0 and pot_recdet.qty_received<=pot_recdet.qty_invoiced) or
:			(pot_recdet.qty_received<=0 and pot_recdet.qty_received>=pot_recdet.qty_invoiced) then continue
	endif
	foundone=1
	line_tot=line_tot+(pot_recdet.qty_received*pot_recdet.unit_cost)
	if pos(".AWRI"=event$)<>0 then gosub write_poe_invdet
wend

if pos(".AVAL"=event$)<>0
	if foundone
		read record (pot_rechdr_dev,key=firm_id$+pot_recdet.po_no$+pot_recdet.receiver_no$,dom=*next)pot_rechdr$
		find record (apc_termscode_dev,key=firm_id$+"C"+pot_rechdr.ap_terms_code$,dom=*next)apc_termscode$
		disp_info$="Ordered: "+fndate$(pot_rechdr.ord_date$)+", Received: "+fndate$(pot_rechdr.recpt_date$)+", Terms: "+pot_rechdr.ap_terms_code$+"("+cvs(apc_termscode.code_desc$,3)+")"
		callpoint!.setColumnData("POE_INVSEL.TOTAL_AMOUNT",str(line_tot))
		rem callpoint!.setColumnData("<<DISPLAY>>.DISP_REC_INFO",disp_info$)
		callpoint!.setStatus("REFRESH")
	else
		msg_id$="PO_REC_INVOICED"
		gosub disp_message
		callpoint!.setStatus("ABORT")
	endif
endif


rem 6500 REM " --- Explode POT-14 detail records into POE-25"
rem 6510 LET B0$(1)=N0$(1,2)+A0$(5,6)+W1$(1,7),B1$(1)=""
rem 6520 IF FNP$(W1$(8,7))<>"" THEN LET B0$(16)=W1$(8,7)
rem 6530 LET X=LEN(FNP$(B0$)),D0$(1)=A0$,W[0]=0,FOUNDONE=0
rem 6590 READ (POT14_DEV,KEY=B0$,DOM=6600)
rem 6600 REM " --- Read next detail"
rem 6610 LET K$=KEY(POT14_DEV,END=6900)
rem 6620 IF POS(B0$(1,X)=K$)<>1 THEN GOTO 6900
rem 6625 READ (POT14_DEV)IOL=POT14A
rem 6640 IF Y0$(1,4)=N0$+C1$(1,2) THEN GOTO 6700
rem 6650 LET Y0$(1)=N0$+C1$(1,2),Y1$(1)="",SEQ=0
rem 6660 FIND (POM02_DEV,KEY=Y0$,DOM=6700)IOL=POM02A
rem 6700 REM " --- Determine next sequence number"
rem 6710 IF POS(Y1$(21,1)="VM") THEN GOTO 6600
rem 6715 IF Y1$(21,1)<>"O" THEN IF (C[7]>=0 AND C[7]<=C[8]) OR (C[7]<0 AND C[7]>=C[8]) THEN GOTO 6890
rem 6717 LET FOUNDONE=1
rem 6720 IF EXPLODE=0 THEN GOTO 6800
rem 6730 READ (POE25_DEV,KEY=D0$(1,20)+$FF$,DOM=6740)
rem 6740 LET K$=KEYP(POE25_DEV,END=6750)
rem 6750 IF POS(A0$=K$)=1 THEN LET SEQ=NUM(K$(21,3))
rem 6760 LET SEQ=SEQ+INCDETAIL
rem 6770 IF SEQ>999 THEN GOTO 6950
rem 6780 LET D0$(21)=STR(SEQ:"000")
rem 6800 REM " --- Write POE-25 detail record"
rem 6810 LET D1$(1)=C0$(9,7)+C0$(23,3)+C0$(16,7),D1$(18,2)=C1$(1,2)
rem 6820 LET D1$(20)=C4$,D[0]=C[1],D[1]=C[7],D[2]=C[1]
rem 6840 IF Y1$(21,1)="O" THEN LET D[1]=1
rem 6850 LET W[0]=W[0]+(D[0]*D[1])
rem 6860 PRECISION I[1]
rem 6870 IF EXPLODE THEN WRITE (POE25_DEV,KEY=D0$)IOL=POE25A
rem 6880 PRECISION 2
rem 6890 GOTO 6600

return

write_poe_invdet:
	
	poe_invdet_dev=fnget_dev("POE_INVDET")
	dim poe_invdet$:fnget_tpl$("POE_INVDET")

	poe_invdet.firm_id$=firm_id$
	poe_invdet.ap_type$=poe_invhdr.ap_type$
	poe_invdet.vendor_id$=poe_invhdr.vendor_id$
	poe_invdet.ap_inv_no$=poe_invhdr.ap_inv_no$

	read (poe_invdet_dev,key=poe_invdet.firm_id$+poe_invdet.ap_type$+poe_invdet.vendor_id$+poe_invdet.ap_inv_no$+$FF$,dom=*next)

	wk$=keyp(poe_invdet_dev,end=*next)
	if pos(poe_invdet.firm_id$+poe_invdet.ap_type$+poe_invdet.vendor_id$+poe_invdet.ap_inv_no$=wk$)=1
		seq=num(poe_invdet.line_no$)
	else
		seq=0
	endif
	poe_invdet.po_no$=pot_recdet.po_no$
	poe_invdet.po_line_no$=pot_recdet.po_line_no$
	poe_invdet.receiver_no$=pot_recdet.receiver_no$
	poe_invdet.po_line_code$=pot_recdet.po_line_code$
	poe_invdet.order_memo$=pot_recdet.order_memo$
	poe_invdet.unit_cost$=pot_recdet.unit_cost$
	poe_invdet.qty_received$=pot_recdet.qty_received$
	poe_invdet.recpt_cost$=pot_recdet.unit_cost$
	if poc_linecode.line_type$="O" then let poe_invdet.qty_received$="1"
	write record (poe_invdet)poe_invdet$
return

rem #include fndate.src

    def fndate$(q$)
        q1$=""
        q1$=date(jul(num(q$(1,4)),num(q$(5,2)),num(q$(7,2)),err=*next),err=*next)
        if q1$="" q1$=q$
        return q1$
    fnend

rem #endinclude fndate.src
