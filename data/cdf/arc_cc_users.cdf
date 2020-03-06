[[ARC_CC_USERS.BDEL]]
rem --- Remove deleted user from Enterprise Manager
	admin!=callpoint!.getDevObject("admin")
	cc_username$=cvs(callpoint!.getColumnData("ARC_CC_USERS.CC_USERNAME"),2)
	thisUser!=new CCUserModel()
	admin!.dropUser(thisUser!.getEMUserName(cc_username$),err=*next)
	admin!.commit(err=*next)

[[ARC_CC_USERS.BSHO]]
rem --- Get needed classes
	use ::aro_CCUtil.aon::CCUtil
	use ::aro_CCUserModel.aon::CCUserModel

rem --- Get BBjAdmin object
	admin!=CCUtil.getAdmin()
	callpoint!.setDevObject("admin",admin!)

