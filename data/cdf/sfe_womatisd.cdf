[[SFE_WOMATISD.ADGE]]
rem --- Set precision
	precision num(callpoint!.getDevObject("precision"))
[[SFE_WOMATISD.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::grid_entry"
