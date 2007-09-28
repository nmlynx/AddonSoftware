[[GLE_JRNLHDR.ADIS]]
gosub display_dates
gosub calc_grid_tots
gosub disp_totals
[[GLE_JRNLHDR.REVERSE_DATE.AVAL]]
gosub display_dates
[[GLE_JRNLHDR.TRANS_DATE.AVAL]]
rem gosub date validation (calls glc_datecheck); if status <> 0 after return, assume setStatus("ABORT")
rem since I think the public will have displayed a message?

gosub display_dates
[[GLE_JRNLHDR.AREC]]
Form!.getControl(num(user_tpl.text1_ID$)).setText("")
[[GLE_JRNLHDR.AREA]]
gosub display_dates
[[GLE_JRNLHDR.ARNF]]
rem I think this will be the place
rem set trans_date to sysinfo date
rem call glc_datecheck



	sysinfo_template$=stbl("+SYSINFO_TPL",err=*next)
	dim sysinfo$:sysinfo_template$
	sysinfo$=stbl("+SYSINFO",err=*next)

	callpoint!.setColumnData("GLE_JRNLHDR.TRANS_DATE",sysinfo.system_date$)
	gosub display_dates
	
[[GLE_JRNLHDR.JOURNAL_ID.AVAL]]
rem "read glm03 -- make sure PERMIT_JE is "Y",
rem " and update +GLCONTROL with POST_YR_END and POST_LOCKED flags, plus PERMIT_JE, if "Y"

rem 6500 REM " --- Verify Journal ID Code"
rem 6510 LET STATUS=0
rem 6520 FIND (GLM03_DEV,KEY=D0$(1,4),DOM=6680)IOL=GLM03A
rem 6530 PRINT @(V1,V2),D0$(3,2)," ",D0$(5,20),
rem 6535 IF GL$<>"Y" THEN GOTO 6690
rem 6540 IF D0$(25,1)<>"Y" THEN GOTO 6600
rem 6550 DIM GLCONTROL$(640)
rem 6560 LET GLCONTROL$(1)=STBL("!GLCONTROL",ERR=6600)
rem 6570 LET GLCONTROL$(18,2)=D0$(3,2),GLCONTROL$(46,2)=D0$(26,2)
rem 6575 IF JE$="Y" THEN LET GLCONTROL$(45,1)=JE$
rem 6580 LET GLCONTROL$(1)=STBL("!GLCONTROL",GLCONTROL$)
rem 6590 GOTO 6690
rem 6600 REM
rem 6610 DIM MESSAGE$[1]
rem 6620 LET MESSAGE$[0]="This Journal ID May Not Be Used For Entry (<Enter>=Continu
rem e)"
rem 6630 CALL "SYC.XA",2,MESSAGE$[ALL],0,22,-1,V$,V3
rem 6680 LET STATUS=1
rem 6690 RETURN
[[GLE_JRNLHDR.<CUSTOM>]]
display_dates:

if user_tpl.glint$="Y"
	
	call stbl("+DIR_PGM")+"glc_datecheck.aon",callpoint!.getColumnData("GLE_JRNLHDR.TRANS_DATE"),"N",period$,year$,status	
	Form!.getControl(num(user_tpl.text1_ID$)).setText("curr period: "+period$+"/"+year$)

	if cvs(callpoint!.getColumnData("GLE_JRNLHDR.REVERSE_DATE"),3)<>""
		call stbl("+DIR_PGM")+"glc_datecheck.aon",callpoint!.getColumnData("GLE_JRNLHDR.REVERSE_DATE"),"N",period$,year$,status
		Form!.getControl(num(user_tpl.text2_ID$)).setText("curr period: "+period$+"/"+year$)
	endif

rem	callpoint!.setStatus("REFRESH")

endif
return

disable_ctls:rem --- disable selected control

	dctl=dctls!.size()	
	for wk=0 to dctl-1
		dctl$=dctls!.getItem(wk)
		if dctl$<>""
			wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
			wmap$=callpoint!.getAbleMap()
			wpos=pos(wctl$=wmap$,8)
			wmap$(wpos+6,1)="I"
			callpoint!.setAbleMap(wmap$)
			callpoint!.setStatus("ABLEMAP")
		endif
	next wk
	return

rem calculate total debits/credits/units and display in form header

calc_grid_tots:

        recVect!=GridVect!.getItem(0)
        dim gridrec$:dtlg_param$[1,3]
        numrecs=recVect!.size()
        if numrecs>0
            for reccnt=0 to numrecs-1
                gridrec$=recVect!.getItem(reccnt)
                tdb=tddb+num(gridrec.debit_amt$)
                tcr=tcr+num(gridrec.credit_amt$)
	        tunits=tunits+num(gridrec.units$)

            next reccnt

	   tbal=tdb-tcr
            user_tpl.tot_db$=str(tdb)
	    user_tpl.tot_cr$=str(tcr)
	    user_tpl.tot_units$=str(tunits)
	    user_tpl.tot_bal$=str(tbal)

        endif
    return


disp_totals:

    rem --- get context and ID of display controls, and redisplay w/ amts from calc_grid_tots
    
    debits!=UserObj!.getItem(num(user_tpl.debits_ofst$))
    debits!.setValue(num(user_tpl.tot_db$))

    credits!=UserObj!.getItem(num(user_tpl.credits_ofst$))
    credits!.setValue(num(user_tpl.tot_cr$))

    bal!=UserObj!.getItem(num(user_tpl.bal_ofst$))
    bal!.setValue(num(user_tpl.tot_bal$))

    units!=UserObj!.getItem(num(user_tpl.units_ofst$))
    units!.setValue(num(user_tpl.tot_units$))

    return

#include std_missing_params.src
[[GLE_JRNLHDR.BSHO]]
num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="GLS_PARAMS",open_opts$[1]="OTA"
gosub open_tables
gls01_dev=num(open_chans$[1]),gls_params_tpl$=open_tpls$[1]
dim gls01a$:gls_params_tpl$

read record(gls01_dev,key=firm_id$+"GL00",dom=std_missing_params)gls01a$

user_tpl_str$="glint:c(5*),glworkfile:c(16*),je:c(1*),debits_ofst:c(5*),credits_ofst:c(5*),bal_ofst:c(5*),units_ofst:c(5*)," +
:			"gls01a_ofst:c(5*),text1_ID:c(5*),text2_ID:c(5*),tot_db:c(10*),tot_cr:c(10*),tot_bal:c(10*),tot_units:c(10*)"

dim user_tpl$:user_tpl_str$

gl$="N"
status=0
source$=pgm(-2)
call stbl("+DIR_PGM")+"glc_ctlcreate.aon",err=*next,source$,"GL",glw11$,gl$,status
if status<>0 goto std_exit

user_tpl.glint$=gl$
user_tpl.glworkfile$=glw11$
user_tpl.je$="Y"

rem --- set up UserObj! as vector to store display controls (total debits, total credits, balance, units) and store param rec
UserObj!=SysGUI!.makeVector()

ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DEBIT_AMT","CTLC"))
ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.DEBIT_AMT","CTLI"))
debits!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.CREDIT_AMT","CTLC"))
ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.CREDIT_AMT","CTLI"))
credits!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.BALANCE","CTLC"))
ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.BALANCE","CTLI"))
bal!=SysGUI!.getWindow(ctlContext).getControl(ctlID)

ctlContext=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.UNITS","CTLC"))
ctlID=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.UNITS","CTLI"))
units!=SysGUI!.getWindow(ctlContext).getControl(ctlID)


UserObj!.addItem(debits!)
user_tpl.debits_ofst$="0"

UserObj!.addItem(credits!)
user_tpl.credits_ofst$="1"

UserObj!.addItem(bal!)
user_tpl.bal_ofst$="2"

UserObj!.addItem(units!)
user_tpl.units_ofst$="3"

UserObj!.addItem(gls01a$)
user_tpl.gls01a_ofst$="4"

rem put label on form to show GL period/year corres to date entered

nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
Form!.addStaticText(nxt_ctlID,225,75,100,18,"")
user_tpl.text1_ID$=str(nxt_ctlID)

Form!.addStaticText(nxt_ctlID+1,225,95,100,18,"")
user_tpl.text2_ID$=str(nxt_ctlID+1)
	
rem need to disable units column in grid if gls01a.units_flag$ isn't "Y"

if gls01a.units_flag$="Y"
	w!=Form!.getChildWindow(1109)
	c!=w!.getControl(5900)
	c!.setColumnEditable(5,0)
endif

rem --- Disable display only columns

	dctls!=SysGUI!.makeVector()
	dctls!.addItem("<<DISPLAY>>.DEBIT_AMT")
	dctls!.addItem("<<DISPLAY>>.CREDIT_AMT")
	dctls!.addItem("<<DISPLAY>>.BALANCE")
	dctls!.addItem("<<DISPLAY>>.UNITS")
	gosub disable_ctls
