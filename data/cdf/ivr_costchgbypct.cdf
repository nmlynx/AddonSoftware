[[IVR_COSTCHGBYPCT.ASVA]]
print "in ASVA"; rem debug

rem --- Is percent in range?

	pct = num( callpoint!.getColumnData("IVR_COSTCHGBYPCT.PERCENT_CHANGE") )

	print "percentage (callpoint):", pct; rem debug

	rem if pct < -999.99 or pct > 999.99 or pct = 0 then
		rem percentChangeControl! = util.getControl(callpoint!, "IVR_COSTCHGBYPCT.PERCENT_CHANGE")
		rem percentChangeControl!.focus()
		rem callpoint!.setMessage("IV_PCT_CHG_INVALID")
		rem callpoint!.setStatus("ABORT")
	rem endif

	print "date: ", callpoint!.getColumnData("IVR_COSTCHGBYPCT.EFFECT_DATE"); rem debug
[[IVR_COSTCHGBYPCT.PERCENT_CHANGE.AVAL]]
rem --- Is percent in range?

	pct = num( callpoint!.getColumnData("IVR_COSTCHGBYPCT.PERCENT_CHANGE") )

	if pct < -999.99 or pct > 999.99 or pct = 0 then
		callpoint!.setStatus("ABORT")
	endif
[[IVR_COSTCHGBYPCT.<CUSTOM>]]
#include std_missing_params.src
[[IVR_COSTCHGBYPCT.BSHO]]
print 'show',"in BSHO"; rem debug

rem --- Inits

	use ::ado_util.src::util

	pgmdir$=""
	pgmdir$=stbl("+DIR_PGM")

rem --- Open files

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS", open_opts$[1]="OTA"

	gosub open_tables

	ivs_params_dev = num(open_chans$[1])
	dim ivs_params_rec$:open_tpls$[1]

rem --- Get parameter record

	find record(ivs_params_dev, key=firm_id$+"IV00", dom=std_missing_params) ivs_params_rec$

rem --- Must be standard costing

	if ivs_params_rec.cost_method$ <> "S" then
		callpoint!.setMessage("IV_NO_STD_COST")
		callpoint!.setStatus("EXIT")
		goto bsho_end
	endif

rem --- is AP installed?  If not, disable vendor fields

	call pgmdir$ + "adc_application.aon", "AP", info$[all]
	ap_installed = (info$[20] = "Y")

	if !ap_installed then
		util.disableField(callpoint!, "IVR_COSTCHGBYPCT.VENDOR_ID_1")
		util.disableField(callpoint!, "IVR_COSTCHGBYPCT.VENDOR_ID_2")
	endif

bsho_end:
