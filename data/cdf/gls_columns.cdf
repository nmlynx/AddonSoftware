[[GLS_COLUMNS.BFMC]]
rem --- Initialize displayColumns! object
use ::glo_DisplayColumns.aon::DisplayColumns
displayColumns!=new DisplayColumns(firm_id$)

rem create list for column zero of grid -- column type drop-down
none_list$=pad(Translate!.getTranslation("AON_(NONE)"),20)+"~"+"  ;"
button_list$=displayColumns!.getStringButtonList()
ldat_list$=none_list$+button_list$

for x=1 to 4
	callpoint!.setTableColumnAttribute("<<DISPLAY>>.RECORD_CD_"+str(x),"LDAT",ldat_list$)
next x

for x=1 to 4
	callpoint!.setTableColumnAttribute("<<DISPLAY>>.BUD_CD_"+str(x),"LDAT",ldat_list$)
next x
[[GLS_COLUMNS.<CUSTOM>]]
#include std_missing_params.src
[[GLS_COLUMNS.ADIS]]
rem look at cols and tps in param rec; translate those to matching entry in the <<DISPLAY>> lists and set selected index

for x=1 to 4
	cd$=callpoint!.getColumnData("GLS_COLUMNS.ACCT_MN_COLS_"+str(x:"00"))
	tp$=callpoint!.getColumnData("GLS_COLUMNS.ACCT_MN_TYPE_"+str(x:"00"))
 	callpoint!.setColumnData("<<DISPLAY>>.RECORD_CD_"+str(x),cd$+tp$)
next x

for x=1 to 4
	cd$=callpoint!.getColumnData("GLS_COLUMNS.BUD_MN_COLS_"+str(x:"00"))
	tp$=callpoint!.getColumnData("GLS_COLUMNS.BUD_MN_TYPE_"+str(x:"00"))
	callpoint!.setColumnData("<<DISPLAY>>.BUD_CD_"+str(x),cd$+tp$)
next x

callpoint!.setStatus("REFRESH")
[[GLS_COLUMNS.BWAR]]
rem "set column and type in gl param rec based on items selected from pulldowns

for x=1 to 4
	cd_tp$=pad(callpoint!.getColumnData("<<DISPLAY>>.RECORD_CD_"+str(x)),2)
	callpoint!.setColumnData("GLS_COLUMNS.ACCT_MN_COLS_"+str(x:"00"),cd_tp$(1,1))
	callpoint!.setColumnData("GLS_COLUMNS.ACCT_MN_TYPE_"+str(x:"00"),cd_tp$(2,1))
next x

for x=1 to 4
	cd_tp$=pad(callpoint!.getColumnData("<<DISPLAY>>.BUD_CD_"+str(x)),2)
	callpoint!.setColumnData("GLS_COLUMNS.BUD_MN_COLS_"+str(x:"00"),cd_tp$(1,1))
	callpoint!.setColumnData("GLS_COLUMNS.BUD_MN_TYPE_"+str(x:"00"),cd_tp$(2,1))
next x
