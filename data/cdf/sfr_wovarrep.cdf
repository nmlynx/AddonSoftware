[[SFR_WOVARREP.ASVA]]
rem --- Ensure that at least one status option (Open/Closed) is checked

if callpoint!.getColumnData("SFR_WOVARREP.OPEN")="N" AND callpoint!.getColumnData("SFR_WOVARREP.CLOSED")="N"
	msg_id$="SF_STATUS_REQUIRED"
	gosub disp_message
	callpoint!.setStatus("ABORT")
	callpoint!.setFocus("SFR_WOVARREP.OPEN")
endif
[[SFR_WOVARREP.REPORT_SEQ.AVAL]]
rem ---- If By Bill and a whse hasn't been entered, default whse

whse_columndat$=callpoint!.getColumnData("SFR_WOVARREP.WAREHOUSE_ID")

if callpoint!.getUserInput()="B"
	if cvs(whse_columndat$,2)="" then 
		whse$=callpoint!.getDevObject("dflt_whse")
		callpoint!.setColumnData("SFR_WOVARREP.WAREHOUSE_ID",whse$,1)
	endif
endif
[[SFR_WOVARREP.AREC]]
rem --- Set default Warehouse

	whse$=callpoint!.getDevObject("dflt_whse")
	callpoint!.setColumnData("SFR_WOVARREP.WAREHOUSE_ID",whse$,1)

rem --- Set initial values for descriptions

	callpoint!.setColumnData("<<DISPLAY>>.BEG_DESC","First",1)
	callpoint!.setColumnData("<<DISPLAY>>.END_DESC","Last",1)
[[SFR_WOVARREP.BILL_NO.AVAL]]
rem --- Set descriptions

	ivm_itemmast=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")
	item$=callpoint!.getUserInput()
	read record (ivm_itemmast,key=firm_id$+item$,dom=*next) ivm_itemmast$

	if num(callpoint!.getControlID()) = num(callpoint!.getControl("BILL_NO_1").getID()) then
		if cvs(item$,2)<>""
			callpoint!.setColumnData("<<DISPLAY>>.BEG_DESC",ivm_itemmast.item_desc$,1)
		else
			callpoint!.setColumnData("<<DISPLAY>>.BEG_DESC","First",1)
		endif
	endif
	if num(callpoint!.getControlID()) = num(callpoint!.getControl("BILL_NO_2").getID()) then
		if cvs(item$,2)<>""
			callpoint!.setColumnData("<<DISPLAY>>.END_DESC",ivm_itemmast.item_desc$,1)
		else
			callpoint!.setColumnData("<<DISPLAY>>.END_DESC","Last",1)
		endif
	endif
[[SFR_WOVARREP.<CUSTOM>]]
#include std_missing_params.src
[[SFR_WOVARREP.BSHO]]
rem --- Open needed IV tables
rem --- Get default warehouse from IV params
	num_files=2
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS",open_opts$[1]="OTA"
	open_tables$[2]="IVM_ITEMMAST",open_opts$[2]="OTA"
	gosub open_tables

	ivs01_dev=num(open_chans$[1])
	dim ivs01a$:open_tpls$[1]

	read record (ivs01_dev,key=firm_id$+"IV00")ivs01a$

	callpoint!.setDevObject("multi_wh",ivs01a.multi_whse$)	
	callpoint!.setDevObject("dflt_whse",ivs01a.warehouse_id$)

rem --- open and read shop floor param to see if BOM and/or OP are installed
rem --- then add Bill and/or Cust to report sequence listbutton accordingly

num_files=1
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="sfs_params",open_opts$[1]="OTA"
gosub open_tables
sfs01_dev=num(open_chans$[1]),sfs_params_tpl$=open_tpls$[1]

dim sfs01a$:sfs_params_tpl$

readrecord(sfs01_dev,key=firm_id$+"SF00",dom=std_missing_params)sfs01a$
bm$=sfs01a.bm_interface$
op$=sfs01a.ar_interface$

seq_list$=callpoint!.getTableColumnAttribute("SFR_WOVARREP.REPORT_SEQ","LDAT")
desc_len=pos("~"=seq_list$)
code_len=pos(";"=seq_list$)
bill_no$=""
cust_no$=""

listID=num(callpoint!.getTableColumnAttribute("SFR_WOVARREP.REPORT_SEQ","CTLI"))
list!=Form!.getControl(listID)

if bm$="Y"
	dim bill_no$(code_len)
	bill_no$(1)=Translate!.getTranslation("AON_BILL_NUMBER")
	bill_no$(desc_len,1)="~"
	bill_no$(desc_len+1,1)="B"
	bill_no$(code_len,1)=";"
	list!.addItem(bill_no$(1,desc_len-1))
endif

if op$="Y"
	dim cust_no$(code_len)
	cust_no$(1)=Translate!.getTranslation("AON_CUSTOMER_NUMBER")
	cust_no$(desc_len,1)="~"
	cust_no$(desc_len+1,1)="C"
	cust_no$(code_len,1)=";"
	list!.addItem(cust_no$(1,desc_len-1))
endif

seq_list$=seq_list$+bill_no$+cust_no$
callpoint!.setTableColumnAttribute("SFR_WOVARREP.REPORT_SEQ","LDAT",seq_list$)
