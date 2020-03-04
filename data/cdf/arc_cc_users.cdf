[[ARC_CC_USERS.ADEL]]
rem --- Remove deleted user from Enterprise Manager
	admin!=callpoint!.getDevObject("admin")
	customer_id$=cvs(callpoint!.getColumnData("ARC_CC_USERS.CUSTOMER_ID"),2)
	admin!.removeUser(CCUserModel.getEMUserName(customer_id$))

[[ARC_CC_USERS.BSHO]]
rem --- Get needed classes
	use ::aro_CCUtil.aon::CCUtil
	use ::aro_CCUserModel.aon::CCUserModel

rem --- Get BBjAdmin object
	admin!=CCUtil.getAdmin()
	callpoint!.setDevObject("admin",admin!)

