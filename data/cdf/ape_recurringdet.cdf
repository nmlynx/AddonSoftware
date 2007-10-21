[[APE_RECURRINGDET.UNITS.AVEC]]
escape;rem check user_tpl.inv_amt$ and tot_dist$; also dist_bal! ?
[[APE_RECURRINGDET.GL_POST_AMT.AVEC]]
rem --- add up dist lines and display diff between total inv amt entered and dist line total

gosub calc_grid_tots
gosub disp_totals
[[APE_RECURRINGDET.<CUSTOM>]]
calc_grid_tots:

	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	if numrecs>0
		for reccnt=0 to numrecs-1
			gridrec$=recVect!.getItem(reccnt)
			tdist=tdist+num(gridrec.gl_post_amt$)
		next reccnt
		user_tpl.tot_dist$=str(tdist)
	endif
return


disp_totals:

rem --- get context and ID of display controls, and redisplay w/ amts from calc_grid_tots
    	
	inv_amt=num(user_tpl.inv_amt$)
	dist_bal!=UserObj!.getItem(num(user_tpl.dist_bal_ofst$))
	dist_bal!.setValue(inv_amt-num(user_tpl.tot_dist$))

return
