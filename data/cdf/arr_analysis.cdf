[[ARR_ANALYSIS.BSHO]]
rem --- Init
	use ::ado_func.src::func

rem --- Open/Lock files
	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ARS_PARAMS",open_opts$[1]="OTA"
	gosub open_tables

	arsParams_dev=num(open_chans$[1])
	dim arsParams$:open_tpls$[1]

rem --- Retrieve parameter data
	findrecord(arsParams_dev,key=firm_id$+"AR00",err=std_missing_params)arsParams$

rem --- Update Aging Period ListButton
	codeVect!=BBjAPI().makeVector()
	descVect!=BBjAPI().makeVector()

	days$=" "+Translate!.getTranslation("AON_DAYS","Days",1)
	codeVect!.add("F")
	descVect!.add(Translate!.getTranslation("AON_FUTURE"))
	codeVect!.add("C")
	descVect!.add(Translate!.getTranslation("AON_CURRENT"))
	codeVect!.add("3")
	descVect!.add(str(arsParams.age_per_days_1)+days$)
	codeVect!.add("6")
	descVect!.add(str(arsParams.age_per_days_2)+days$)
	codeVect!.add("9")
	descVect!.add(str(arsParams.age_per_days_3)+days$)
	codeVect!.add("1")
	descVect!.add(str(arsParams.age_per_days_4)+"+"+days$)

	ldat$=func.buildListButtonList(descVect!,codeVect!)
	callpoint!.setTableColumnAttribute("ARR_ANALYSIS.PICK_LISTBUTTON","LDAT",ldat$)
	pickList!=callpoint!.getControl("ARR_ANALYSIS.PICK_LISTBUTTON")
	pickList!.removeAllItems()
	pickList!.insertItems(0,descVect!)
	pickList!.selectIndex(0)

[[ARR_ANALYSIS.<CUSTOM>]]
#include [+ADDON_LIB]std_missing_params.aon



