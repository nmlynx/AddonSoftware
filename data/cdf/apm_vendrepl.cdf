[[APM_VENDREPL.<CUSTOM>]]
#include std_missing_params.src
[[APM_VENDREPL.BDEL]]
rem --- check knum3 of ivm-01; if firm/buyer/vendor key is present, disallow deletion

ivm01_dev=fnget_dev("IVM_ITEMMAST")
wky$=firm_id$+callpoint!.getColumnData("APM_VENDREPL.BUYER_CODE")+callpoint!.getColumnData("APM_VENDREPL.VENDOR_ID")
wky1$=""
read(ivm01_dev,knum=9,key=wky$,dom=*next)
wky1$=key(ivm01_dev,end=*next)
if pos(wky$=wky1$)=1
	msg_id$="AP_DEL_REPL"
	gosub disp_message
	callpoint!.setStatus("ABORT")
endif
