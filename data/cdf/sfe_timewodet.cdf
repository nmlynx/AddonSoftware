[[SFE_TIMEWODET.BGDS]]
rem wgh ... stopped here
rem wgh ... 0785 IF P3$(13,1)="Y" THEN PRINT @(Q[4],6),"Start",@(Q[5],6),"Stop" ... time clock entry
rem wgh ... 0788 IF P3$(4,1)="Y" THEN PRINT @(Q[2],6),"PC TC" ... pr enabled
[[SFE_TIMEWODET.AGCL]]
rem --- set preset val for batch_no
	callpoint!.setTableColumnAttribute("SFE_TIMEWODET.BATCH_NO","PVAL",$22$+stbl("+BATCH_NO")+$22$)
