[[ARC_CC_USERS.ADEL]]
rem --- Remove deleted user from Enterprise Manager
	admin!=callpoint!.getDevObject("admin")
	customer_id$=cvs(callpoint!.getColumnData("ARC_CC_USERS.CUSTOMER_ID"),2)
	admin!.removeUser(CCUtil.getEMUserName(customer_id$))

[[ARC_CC_USERS.BSHO]]
rem --- Get BBjAdmin object
	use ::aro_CCUtil.bbj::CCUtil
	admin!=CCUtil.getAdmin()
	callpoint!.setDevObject("admin",admin!)

