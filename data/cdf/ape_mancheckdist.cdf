[[APE_MANCHECKDIST.GL_POST_AMT.AVEC]]
glns!=bbjapi().getNamespace("GLNS","GL Dist",1)
dist_amt$=glns!.getValue("dist_amt")
new_dist=0
dim rec$:fattr(rec_data$)
num_recs=gridVect!.size()
for wk=0 to num_recs-1
	rec$=gridVect!.getItem(wk)
	new_dist=new_dist+num(rec.gl_post_amt$)
next wk

glns!.setValue("dist_amt",str(new_dist))

	
[[APE_MANCHECKDIST.GL_ACCOUNT.AVAL]]
rem --- need to be able to disable GL Account column if not interfacing to GL... ?
glns!=bbjapi().getNamespace("GLNS","GL Dist",1)
gl_misc$=glns!.getValue("GLMisc")
gl_units$=glns!.getValue("GLUnits")

c!=Form!.getAllControls().getItem(0)

if gl_misc$="Y" 
	c!.setColumnEditable(2,1)
else
	c!.setColumnEditable(2,0)
endif

if gl_units$="Y" 
	c!.setColumnEditable(4,1)
else
	c!.setColumnEditable(4,0)
endif
