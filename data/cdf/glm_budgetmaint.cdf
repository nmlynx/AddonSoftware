[[GLM_BUDGETMAINT.ALIGN_PERIODS.AVAL]]
rem --- Update grid data when leave checkbox and value has changed

	alignPeriods$=callpoint!.getUserInput()
	if align_periods$<>callpoint!.getColumnData("GLM_BUDGETMAINT.ALIGN_PERIODS") then
		callpoint!.setDevObject("align_fiscal_periods",alignPeriods$)
		gl_account$=callpoint!.getColumnData("GLM_BUDGETMAINT.GL_ACCOUNT")

		rem --- If aligning fiscal periods, need to update GLW_ACCTSUMMARY using
		rem --- transactions from GLT_TRANSDETAIL for non-aligned selected fiscal years.
		if alignPeriods$="Y" then
			cols!=UserObj!.getItem(num(user_tpl.cols_ofst$))
			recordType$=":"
			for i=0 to cols!.size()-1
				recordType$=recordType$+cols!.getItem(i)+":"
			next i
			alignCalendar! = callpoint!.getDevObject("alignCalendar")
			if pos(":2:"=recordType$) then
				priorYear$=str(num(callpoint!.getDevObject("gls_cur_yr"))-1:"0000")
				align_prior=alignCalendar!.canAlignCalendar(priorYear$)
				if align_prior then priorTripKey$=alignCalendar!.alignCalendar(priorYear$)
			endif
			if pos(":4:"=recordType$) then
				nextYear$=str(num(callpoint!.getDevObject("gls_cur_yr"))+1:"0000")
				align_next=alignCalendar!.canAlignCalendar(nextYear$)
				if align_next then nextTripKey$=alignCalendar!.alignCalendar(nextYear$)
			endif
			rem --- Check tripKey$ in case of error
			if (prorYear$<>"" and priorTripKey$="") or (nextYear$<>"" and nextTripKey$="") then
				msg_id$="GL_CANNOT_ALIGN_PERS"
				dim msg_tokens$[1]
				msg_tokens$[1]=begyear$
				gosub disp_message
				callpoint!.setStatus("ABORT")
				break
			endif

			rem --- Update grid rows from not aligned to aligned
			gosub fill_gridBudgets
		else
			rem --- Update grid rows from aligned to not aligned
			gosub fill_gridBudgets
		endif
	endif
[[GLM_BUDGETMAINT.AWIN]]
rem --- Initialize displayColumns! object
use ::glo_DisplayColumns.aon::DisplayColumns
displayColumns!=new DisplayColumns(firm_id$)
callpoint!.setDevObject("displayColumns",displayColumns!)

rem --- Needed classes
use ::glo_AlignFiscalCalendar.aon::AlignFiscalCalendar
use ::ado_util.src::util

num_files=7
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="GLS_PARAMS",open_opts$[1]="OTA"
open_tables$[2]="GLM_ACCTSUMMARY",open_opts$[2]="OTA"
open_tables$[4]="GLS_CALENDAR",open_opts$[4]="OTA"
open_tables$[5]="GLW_ACCTSUMMARY",open_opts$[5]="OTA"
open_tables$[6]="GLM_ACCTBUDGET",open_opts$[6]="OTA"
open_tables$[7]="GLM_BUDGETPLANS",open_opts$[7]="OTA"

gosub open_tables

gls01_dev=num(open_chans$[1])
gls_calendar_dev=num(open_chans$[4])

dim gls01a$:open_tpls$[1]
dim gls_calendar$:open_tpls$[4]

readrecord(gls01_dev,key=firm_id$+"GL00",dom=std_missing_params)gls01a$
if gls01a.budget_flag$<>"Y"
	msg_id$="GL_NO_BUDG"
	gosub disp_message
	rem --- remove process bar:
	bbjAPI!=bbjAPI()
	rdFuncSpace!=bbjAPI!.getGroupNamespace()
	rdFuncSpace!.setValue("+build_task","OFF")
	release
endif
callpoint!.setDevObject("gls_cur_yr",gls01a.current_year$)

call stbl("+DIR_PGM")+"adc_getmask.aon","","GL","A","",m1$,0,0

rem load up budget column codes and types from gls_params
cols!=SysGUI!.makeVector()
tps!=SysGUI!.makeVector()
for x=1 to 4
	cols!.addItem(field(gls01a$,"bud_mn_cols_"+str(x:"00")))
	tps!.addItem(field(gls01a$,"bud_mn_type_"+str(x:"00")))
next x

rem --- Need to handle possible year in grid with more periods than the current fiscal year
readrecord(gls_calendar_dev,key=firm_id$+gls01a.current_year$,dom=std_missing_params)gls_calendar$
num_pers=num(gls_calendar.total_pers$)
for i=0 to cols!.size()-1
	recordType$=cols!.getItem(i)
	if len(recordType$)=1 and pos(recordType$="23") then
		dim priorCalendar$:fattr(gls_calendar$)
		priorYear$=str(num(gls01a.current_year$)-1)
		readrecord(gls_calendar_dev,key=firm_id$+priorYear$,dom=*next)priorCalendar$
		if num(priorCalendar.total_pers$)>num_pers then num_pers=num(priorCalendar.total_pers$)
	endif
	if len(recordType$)=1 and pos(recordType$="45") then
		dim nextCalendar$:fattr(gls_calendar$)
		nextYear$=str(num(gls01a.current_year$)+1)
		readrecord(gls_calendar_dev,key=firm_id$+nextYear$,dom=*next)nextCalendar$
		if num(nextCalendar.total_pers$)>num_pers then num_pers=num(nextCalendar.total_pers$)
	endif
next i

rem load up period abbr names from gls_params
per_names!=SysGUI!.makeVector()
for x=1 to num_pers
	per_names!.addItem(field(gls_calendar$,"ABBR_NAME_"+str(x:"00")))
next x
			
rem create list for column zero of grid -- column type drop-down

displayColumns!=new DisplayColumns(firm_id$)
codeList!=displayColumns!.getVectorButtonList()
codes!=SysGUI!.makeVector()
for i=0 to codeList!.size()-1
	rem ... label$=rev_title$+" ("+record_id$+amt_or_units$+")"
	label$=codeList!.getItem(i)
	record_id$=label$(pos(" ("=label$,-1)+2)
	record_id$=record_id$(1,len(record_id$)-2)
	amt_or_units$=label$(len(label$)-1,1)
	codes!.addItem(record_id$+amt_or_units$)
next i

rem set up grid
nxt_ctlID=num(stbl("+CUSTOM_CTL",err=std_error))
gridBudgets!=Form!.addGrid(nxt_ctlID,5,120,1000,105)
gridBudgets!.setTabAction(SysGUI!.GRID_NAVIGATE_LEGACY)
gridBudgets!.setSelectionMode(gridBudgets!.GRID_SELECT_CELL)
gridBudgets!.setSelectedRow(0)
gridBudgets!.setSelectedColumn(0)

gridBudgets!.setCallback(gridBudgets!.ON_GRID_EDIT_START,"custom_event")
gridBudgets!.setCallback(gridBudgets!.ON_GRID_EDIT_STOP,"custom_event")

rem store desired data (mostly offsets of items in UserObj) in user_tpl
tpl_str$="pers:c(5),pers_ofst:c(5),codes_ofst:c(5),codeList_ofst:c(5),grid_ctlID:c(5),grid_ofst:c(5),"+
:		  "cols_ofst:c(5),tps_ofst:c(5),amt_mask:c(15),sv_budget_tp:c(30*)"

dim user_tpl$:tpl_str$

user_tpl.pers$=str(num_pers)
user_tpl.pers_ofst$="0"
user_tpl.codes_ofst$="1"
user_tpl.codeList_ofst$="2"
user_tpl.grid_ctlID$=str(nxt_ctlID)
user_tpl.grid_ofst$="3"
user_tpl.cols_ofst$="4"
user_tpl.tps_ofst$="5"
user_tpl.amt_mask$=m1$

rem store desired vectors/objects in UserObj!
UserObj!=SysGUI!.makeVector()

UserObj!.addItem(per_names!)
UserObj!.addItem(codes!)
UserObj!.addItem(codeList!)
UserObj!.addItem(gridBudgets!)
UserObj!.addItem(cols!)
UserObj!.addItem(tps!)

rem format the grid, and set first column to be a pull-down
gosub format_gridBudgets
gosub set_column1_list
util.resizeWindow(Form!, SysGUI!)

rem --- Initialize align_periods
callpoint!.setDevObject("align_fiscal_periods","N")
callpoint!.setDevObject("alignCalendar",new AlignFiscalCalendar(firm_id$))
pick_year$=gls01a.current_year$
gosub init_align_periods
[[GLM_BUDGETMAINT.AOPT-REPL]]
gosub replicate_amt

if vectGLSummary!<>null()
	gosub update_glm_acctsummary
else
	callpoint!.setMessage("GL_REPLICATE")
	callpoint!.setStatus("ABORT")
endif
[[GLM_BUDGETMAINT.ASIZ]]
if UserObj!<>null()
	gridBudgets!=UserObj!.getItem(num(user_tpl.grid_ofst$))
	gridBudgets!.setSize(Form!.getWidth()-(gridBudgets!.getX()*2),Form!.getHeight()-(gridBudgets!.getY()+40))
rem	gridBudgets!.setFitToGrid(1)

endif
[[GLM_BUDGETMAINT.GL_ACCOUNT.AVAL]]
rem only do this aval on actual acct# entry -- skip it on record save

if callpoint!.getRecordMode()<>"C"

	glm01_dev=fnget_dev("GLM_ACCT")
	dim glm01a$:fnget_tpl$("GLM_ACCT")


	read record (glm01_dev,key=firm_id$+callpoint!.getUserInput(),dom=*next)glm01a$
	if cvs(glm01a.gl_account$,3)<>""
		callpoint!.setColumnData("GLM_BUDGETMAINT.GL_ACCT_TYPE",glm01a.gl_acct_type$)
		callpoint!.setColumnData("GLM_BUDGETMAINT.DETAIL_FLAG",glm01a.detail_flag$)
		gl_account$=callpoint!.getUserInput()
		gosub fill_gridBudgets
		callpoint!.setStatus("REFRESH")
	else
		callpoint!.setStatus("ABORT")
	endif
endif
[[GLM_BUDGETMAINT.AREC]]
rem compare budget columns/types from gls01 with defined display columns
rem set the 4 listbuttons accordingly, and read/display corres glm02 data

cols!=UserObj!.getItem(num(user_tpl.cols_ofst$))
tps!=UserObj!.getItem(num(user_tpl.tps_ofst$))
codes!=UserObj!.getItem(num(user_tpl.codes_ofst$))
gridBudgets!=UserObj!.getItem(num(user_tpl.grid_ofst$))
gridBudgets!.clearMainGrid()

for x=0 to cols!.size()-1
	this_col$=cols!.getItem(x)
	this_tp$=tps!.getItem(x)
	x1=0
	while x1<codes!.size()-1
		wcd$=codes!.getItem(x1)
		col$=pad(wcd$(1,len(wcd$)-1),len(this_col$))
		tp$=wcd$(len(wcd$))
		if col$=this_col$ and tp$=this_tp$
			gridBudgets!.setCellListSelection(x,0,x1,1)
			if len(col$)=1 and pos(col$="024") then
				gridBudgets!.setRowEditable(x,0)
			endif
			break
		else
			x1=x1+1
		endif
	wend
next x
[[GLM_BUDGETMAINT.ACUS]]
rem process custom event
rem see basis docs notice() function, noticetpl() function, notify event, grid control notify events for more info
rem this routine is executed when callbacks have been set to run a 'custom event'
rem analyze gui_event$ and notice$ to see which control's callback triggered the event, and what kind of event it is
			
dim gui_event$:tmpl(gui_dev)
dim notify_base$:noticetpl(0,0)
gui_event$=SysGUI!.getLastEventString()
ctl_ID=dec(gui_event.ID$)
if ctl_ID=num(user_tpl.grid_ctlID$)
	if gui_event.code$="N"
		notify_base$=notice(gui_dev,gui_event.x%)
		dim notice$:noticetpl(notify_base.objtype%,gui_event.flags%)
		notice$=notify_base$
	endif

gridBudgets!=UserObj!.getItem(num(user_tpl.grid_ofst$))
curr_row=dec(notice.row$)
curr_col=dec(notice.col$)

switch notice.code
	
	case 7;rem edit stop

		if curr_col=0
			label$=gridBudgets!.getCellText(curr_row,curr_col)
			record_type$=label$(pos(" ("=label$,-1)+2)
			record_type$=record_type$(1,len(record_type$)-2)
			amt_or_units$=label$(len(label$)-1,1)

			displayColumns!=callpoint!.getDevObject("displayColumns")
			thisYear$=displayColumns!.getYear(record_type$)
			actbud$=displayColumns!.getActBud(record_type$)
			if callpoint!.getDevObject("align_fiscal_periods")="Y" and len(cvs(record_type$,2))=1 and pos(record_type$="24") then
				rem --- Use GLW_ACCTSUMMARY when fiscal periods are aligned
				gls_cur_yr$=callpoint!.getDevObject("gls_cur_yr")
				glm02_key$=firm_id$+thisYear$+gls_cur_yr$+callpoint!.getColumnData("GLM_BUDGETMAINT.GL_ACCOUNT")
			else
				if actbud$="P" then
					glm02_key$=firm_id$+callpoint!.getColumnData("GLM_BUDGETMAINT.GL_ACCOUNT")+record_type$
				else
					glm02_key$=firm_id$+callpoint!.getColumnData("GLM_BUDGETMAINT.GL_ACCOUNT")+thisYear$
				endif
			endif

			col_type$=amt_or_units$
			x=curr_row
			if len(cvs(record_type$,2))>1 or pos(record_type$="024")=0
				gosub build_vectGLSummary
				gridBudgets!.setCellText(curr_row,1,vectGLSummary!)
			else
				msg_id$="GL_RECID_BUD"
				gosub disp_message
				gridBudgets!.setCellText(curr_row,curr_col,user_tpl.sv_budget_tp$)

			endif

			rem --- May need to update the list of records in the grid
			cols!=UserObj!.getItem(num(user_tpl.cols_ofst$))
			if record_type$<>cols!.getItem(curr_row) then
				cols!.setItem(curr_row,record_type$)
				UserObj!.setItem(num(user_tpl.cols_ofst$),cols!)
			endif
			tps!=UserObj!.getItem(num(user_tpl.tps_ofst$))
			if amt_or_units$<>tps!.getItem(curr_row) then
				tps!.setItem(curr_row,amt_or_units$)
				UserObj!.setItem(num(user_tpl.tps_ofst$),tps!)
			endif
		else
			vectGLSummary!=SysGUI!.makeVector() 
			for x=1 to num(user_tpl.pers$)+1
				vectGLSummary!.addItem(gridBudgets!.getCellText(curr_row,x))
			next x
			gosub calculate_end_bal
			gridBudgets!.setCellText(curr_row,1,vectGLSummary!)
			gosub update_glm_acctsummary
		endif
		
	break

	case 8;rem edit start
		if curr_col=0 then user_tpl.sv_budget_tp$=gridBudgets!.getCellText(curr_row,curr_col)
	break

swend

endif
[[GLM_BUDGETMAINT.<CUSTOM>]]
update_glm_acctsummary:
rem ---  Parse thru gridBudgets! and write back any budget recs to glm-02
rem --- Only budget and planned budget rows are editable. Actual rows are disabled

cols=vectGLSummary!.size()-2
if cols>0
	label$=gridBudgets!.getCellText(curr_row,0)
	record_type$=label$(pos(" ("=label$,-1)+2)
	record_type$=record_type$(1,len(record_type$)-2)
	amt_or_units$=label$(len(label$)-1,1)

	displayColumns!=callpoint!.getDevObject("displayColumns")
	actbud$=displayColumns!.getActBud(record_type$)
	if actbud$="P" then
		budget_dev=fnget_dev("GLM_BUDGETPLANS")
		dim budget$:fnget_tpl$("GLM_BUDGETPLANS")
	else
		budget_dev=fnget_dev("GLM_ACCTBUDGET")
		dim budget$:fnget_tpl$("GLM_ACCTBUDGET")
	endif

	budget.firm_id$=firm_id$
	budget.gl_account$=callpoint!.getColumnData("GLM_BUDGETMAINT.GL_ACCOUNT")
	if actbud$="P" then
		budget.budget_code$=record_type$
		budget_key$=budget.firm_id$+budget.gl_account$+budget.budget_code$
	else
		budget.year$=displayColumns!.getYear(record_type$)
		budget_key$=budget.firm_id$+budget.gl_account$+budget.year$
	endif
	extractrecord(budget_dev,key=budget_key$,dom=*next)budget$; rem Advisory Locking

		switch pos(amt_or_units$="AU")
			case 1;rem amounts
				budget.begin_amt$=vectGLSummary!.getItem(0)
				for x=1 to cols
					field budget$,"PERIOD_AMT_"+str(x:"00")=vectGLSummary!.getItem(x)
				next x
			break

			case 2; rem units
				budget.begin_units$=vectGLSummary!.getItem(0)
				for x=1 to cols
					field budget$,"PERIOD_UNITS_"+str(x:"00")=vectGLSummary!.getItem(x)
				next x
			break
		swend

	rem --- write budget

	budget$=field(budget$)
	writerecord(budget_dev)budget$

endif

return

format_gridBudgets:

	dim attr_def_col_str$[0,0]
	attr_def_col_str$[0,0]=callpoint!.getColumnAttributeTypes()
	def_grid_cols=num(user_tpl.pers$)+3
	num_rows=4;rem max 4 recs as defined in gls01 rec
	dim attr_grid_col$[def_grid_cols,len(attr_def_col_str$[0,0])/5]
	m1$=user_tpl.amt_mask$

	attr_grid_col$[1,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="BUDGET TP"
	attr_grid_col$[1,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_BUDGET_TYPE")
	attr_grid_col$[1,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="50"

	attr_grid_col$[2,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="BEGIN BAL"
	attr_grid_col$[2,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_BEGINNING")
	attr_grid_col$[2,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[2,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"
	attr_grid_col$[2,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$

	nxt_col=3

	for x=0 to num(user_tpl.pers$)-1
		per_name!=UserObj!.getItem(num(user_tpl.pers_ofst$))
		attr_grid_col$[nxt_col+x,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="PER "+str(x+1)
		attr_grid_col$[nxt_col+x,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=per_name!.getItem(x)
		attr_grid_col$[nxt_col+x,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
		attr_grid_col$[nxt_col+x,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"
		attr_grid_col$[nxt_col+x,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$
	next x

	attr_grid_col$[nxt_col+x,fnstr_pos("DVAR",attr_def_col_str$[0,0],5)]="END BAL"
	attr_grid_col$[nxt_col+x,fnstr_pos("LABS",attr_def_col_str$[0,0],5)]=Translate!.getTranslation("AON_ENDING")
	attr_grid_col$[nxt_col+x,fnstr_pos("DTYP",attr_def_col_str$[0,0],5)]="N"
	attr_grid_col$[nxt_col+x,fnstr_pos("CTLW",attr_def_col_str$[0,0],5)]="80"
	attr_grid_col$[nxt_col+x,fnstr_pos("MSKO",attr_def_col_str$[0,0],5)]=m1$
	attr_grid_col$[nxt_col+x,fnstr_pos("OPTS",attr_def_col_str$[0,0],5)]="C"

	for curr_attr=1 to def_grid_cols

		attr_grid_col$[0,1]=attr_grid_col$[0,1]+pad("GLM_BUDGETMAINT."+attr_grid_col$[curr_attr,
:			fnstr_pos("DVAR",attr_def_col_str$[0,0],5)],40)

	next curr_attr

	attr_disp_col$=attr_grid_col$[0,1]

	call stbl("+DIR_SYP")+"bam_grid_init.bbj",gui_dev,gridBudgets!,"DESC-COLH-ROWH-EDIT-LINES-LIGHT-HIGHO-CELL",num_rows,
:		attr_def_col_str$[all],attr_disp_col$,attr_grid_col$[all]

return

set_column1_list:
	rem create invisible listButton object with list=previously-built codeList! vector (description + code)
	rem set first column in grid to use the listButton to create drop-down

	tmpListCtl!=Form!.addListButton(nxt_ctlID+1,10,10,100,100,"",$0810$)
	codeList!=UserObj!.getItem(num(user_tpl.codeList_ofst$))
	tmpListCtl!.insertItems(0,codeList!)

	gridBudgets!=UserObj!.getItem(num(user_tpl.grid_ofst$))
	gridBudgets!.setColumnListControl(0,tmpListCtl!) 
return

fill_gridBudgets:
rem gl_account$:	input

	rem --- gl_account$ set prior to gosub
	gridBudgets!=UserObj!.getItem(num(user_tpl.grid_ofst$))
	cols!=UserObj!.getItem(num(user_tpl.cols_ofst$))
	tps!=UserObj!.getItem(num(user_tpl.tps_ofst$))
	
	for x=0 to cols!.size()-1
		budgetType$=cols!.getItem(x)
		displayColumns!=callpoint!.getDevObject("displayColumns")
		thisYear$=displayColumns!.getYear(budgetType$)
		actbud$=displayColumns!.getActBud(budgetType$)
		if callpoint!.getDevObject("align_fiscal_periods")="Y" and len(budgetType$)=1 and pos(budgetType$="24") then
			rem --- Use GLW_ACCTSUMMARY when fiscal periods are aligned
			gls_cur_yr$=callpoint!.getDevObject("gls_cur_yr")
			glm02_key$=firm_id$+thisYear$+gls_cur_yr$+gl_account$
		else
			if actbud$="P" then
				glm02_key$=firm_id$+gl_account$+budgetType$
			else
				glm02_key$=firm_id$+gl_account$+thisYear$
			endif
		endif

		col_type$=tps!.getItem(x)
		gosub build_vectGLSummary
		gridBudgets!.setCellText(x,1,vectGLSummary!)
	next x

	callpoint!.setStatus("REFRESH")

return

build_vectGLSummary:
rem glm02_key$:	input
rem actbud$:		input
rem col_type$:		input

	if actbud$="P" then
		glm_budgetplans_dev=fnget_dev("GLM_BUDGETPLANS")
		glm_budgetplans_tpl$=fnget_tpl$("GLM_BUDGETPLANS")
		dim glm_budgetplans$:glm_budgetplans_tpl$

		readrecord(glm_budgetplans_dev,key=glm02_key$,dom=*next)glm_budgetplans$
	else
		if actbud$="A" then
			glm02_dev=fnget_dev("GLM_ACCTSUMMARY")
			glm02_tpl$=fnget_tpl$("GLM_ACCTSUMMARY")
			dim glm02a$:glm02_tpl$

			glm02_key_len=len(glm02a.firm_id$)+len(glm02a.gl_account$)+len(glm02a.year$)	
			if callpoint!.getDevObject("align_fiscal_periods")="Y" and len(glm02_key$)>glm02_key_len then
				rem --- Use GLW_ACCTSUMMARY when fiscal periods are aligned
				glm02_dev=fnget_dev("GLW_ACCTSUMMARY")
				glm02_tpl$=fnget_tpl$("GLW_ACCTSUMMARY")
				dim glm02a$:glm02_tpl$
			endif
		else
			glm02_dev=fnget_dev("GLM_ACCTBUDGET")
			glm02_tpl$=fnget_tpl$("GLM_ACCTBUDGET")
			dim glm02a$:glm02_tpl$
		endif

		readrecord(glm02_dev,key=glm02_key$,dom=*next)glm02a$
	endif

	rem --- Display message when calendars have been aligned
	if callpoint!.getDevObject("align_fiscal_periods")="Y" then
		align_message$=Translate!.getTranslation("AON_ACTUALS")+" "+Translate!.getTranslation("AON_ALIGNED_WITH","Aligned With")+" "+callpoint!.getDevObject("gls_cur_yr")
	else
		align_message$=""
	endif
	callpoint!.setColumnData("GLM_BUDGETMAINT.ALIGN_MESSAGE",align_message$,1)

	num_pers=num(user_tpl.pers$)
	vectGLSummary!=SysGUI!.makeVector()
	m1$=user_tpl.amt_mask$

	switch pos(col_type$="AU")
		case 1
			if actbud$="P" then
				vectGLSummary!.addItem(str(num(glm_budgetplans.begin_amt$)))
				for x1=1 to num_pers
					vectGLSummary!.addItem(str(num(field(glm_budgetplans$,"PERIOD_AMT_"+str(x1:"00")))))
				next x1
			else
				vectGLSummary!.addItem(str(num(glm02a.begin_amt$)))
				for x1=1 to num_pers
					vectGLSummary!.addItem(str(num(field(glm02a$,"PERIOD_AMT_"+str(x1:"00")))))
				next x1
			endif
			gosub calculate_end_bal			
		break
		case 2
			if actbud$="P" then
				vectGLSummary!.addItem(glm_budgetplans.begin_units$)
				for x1=1 to num_pers
					vectGLSummary!.addItem(field(glm_budgetplans$,"PERIOD_UNITS_"+str(x1:"00")))
				next x1
			else
				vectGLSummary!.addItem(glm02a.begin_units$)
				for x1=1 to num_pers
					vectGLSummary!.addItem(field(glm02a$,"PERIOD_UNITS_"+str(x1:"00")))
				next x1
			endif
		break
		case default

		break
	swend
return

calculate_end_bal:
	end_bal=0
	wk=vectGLSummary!.size()
	if wk>0
		for x2=0 to wk-1
			end_bal=end_bal+num(vectGLSummary!.getItem(x2),err=*next)
		next x2
		vectGLSummary!.addItem(str(end_bal))
	endif
return

replicate_amt:
		
	gridBudgets!=UserObj!.getItem(num(user_tpl.grid_ofst$))
	curr_row=gridBudgets!.getSelectedRow()
	if gridBudgets!.isRowEditable(curr_row)
		curr_col=gridBudgets!.getSelectedColumn()
		curr_amt$=gridBudgets!.getCellText(curr_row,curr_col)
		vectGLSummary!=SysGUI!.makeVector()		
		num_pers=num(user_tpl.pers$)

		valid_num$="N"
		while 1
			valid_num=num(curr_amt$,err=*break)
			valid_num$="Y"
			break
		wend

		if valid_num$="Y"
			for x=1 to num_pers+1
				if x>=curr_col
					vectGLSummary!.addItem(curr_amt$)
				else
					vectGLSummary!.addItem(gridBudgets!.getCellText(curr_row,x))
				endif
			next x
			gosub calculate_end_bal
			gridBudgets!.setCellText(curr_row,1,vectGLSummary!)
		else
			vectGLSummary!=null()
		endif
	endif
return

disable_fields:
	rem --- used to disable/enable controls
	rem --- ctl_name$ sent in with name of control to enable/disable (format "ALIAS.CONTROL_NAME")
	rem --- ctl_stat$ sent in as D or space, meaning disable/enable, respectively

	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP-REFRESH-ACTIVATE")

return

rem ==========================================================================
init_align_periods: rem --- Initialize align_periods for prior and next year
rem		pick_year$: input
rem ==========================================================================
	
	alignCalendar! = callpoint!.getDevObject("alignCalendar")
	align_prior=alignCalendar!.canAlignCalendar(str(num(pick_year$)-1))
	align_next=alignCalendar!.canAlignCalendar(str(num(pick_year$)+1))
	if align_prior or align_next then
		rem --- can align calendar
		callpoint!.setColumnEnabled("GLM_BUDGETMAINT.ALIGN_PERIODS",1)
	else
		rem --- canNOT align calendar
		callpoint!.setColumnEnabled("GLM_BUDGETMAINT.ALIGN_PERIODS",0)
		callpoint!.setDevObject("align_fiscal_periods","N")
	endif
	align_fiscal_periods$=callpoint!.getDevObject("align_fiscal_periods")
	callpoint!.setColumnData("GLM_BUDGETMAINT.ALIGN_PERIODS",align_fiscal_periods$,1)

	return

#include std_missing_params.src
