[[BMM_BILLSUB.BSHO]]
rem --- Only show form if A/P is installed

	if callpoint!.getDevObject("ap_installed") <> "Y"
		callpoint!.setMessage("AP_NOT_INST")
		callpoint!.setStatus("EXIT")
	endif
