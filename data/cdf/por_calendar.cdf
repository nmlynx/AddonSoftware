[[POR_CALENDAR.ASVA]]
rem --- make sure beg mo/yr and end mo/yr are in calendar, and that ending > beginning

begdt$=callpoint!.getDevObject("begdt")
enddt$=callpoint!.getDevObject("enddt")

if begdt$<>""
	if callpoint!.getColumnData("POR_CALENDAR.BEGINNING_YEAR")+
:	callpoint!.getColumnData("POR_CALENDAR.BEGINNING_MONTH") < begdt$
		callpoint!.setStatus("ABORT")
endif

if enddt$<>""
	if callpoint!.getColumnData("POR_CALENDAR.ENDING_YEAR")+
:	callpoint!.getColumnData("POR_CALENDAR.ENDING_MONTH") > enddt$
		callpoint!.setStatus("ABORT")
endif

if callpoint!.getColumnData("POR_CALENDAR.BEGINNING_YEAR")+
:	callpoint!.getColumnData("POR_CALENDAR.BEGINNING_MONTH") >
:	callpoint!.getColumnData("POR_CALENDAR.ENDING_YEAR")+
:	callpoint!.getColumnData("POR_CALENDAR.ENDING_MONTH")		
		callpoint!.setStatus("ABORT")
endif
[[POR_CALENDAR.ARAR]]
pom_calendar_dev=fnget_dev("POM_CALENDAR")
dim pom_calendar$:fnget_tpl$("POM_CALENDAR")

more=1
firm_id$=sysinfo.firm_id$

rem --- Init Data

    begdate$="None"
    enddate$="None"
    begdt$=""
    enddt$=""

rem --- Position file

    read (pom_calendar_dev,key=firm_id$,dom=*next)

rem --- Get First Day Scheduled

    k$=key(pom_calendar_dev,err=*next); read record(pom_calendar_dev,key=k$)pom_calendar$
    if pom_calendar.firm_id$=firm_id$ 
       for i = 1 to 31
            workday$=field(pom_calendar$,"day_status_"+str(i:"00"))
            if workday$<>" " then 
                workday$ = str(i:"00")
                break
            endif   
       next i 
       if workday$="00" then  workday$="01"
       callpoint!.setDevObject("begdt",pom_calendar.year$+pom_calendar.month$)
       begdate$=fndate$(pom_calendar.year$+pom_calendar.month$+workday$)
    endif 

rem --- Position file

    read (pom_calendar_dev,key=firm_id$+$ff$,dom=*next)

rem --- Get Last Day Scheduled

    k$=keyp(pom_calendar_dev,end=*next); read record(pom_calendar_dev,key=k$)pom_calendar$
    if pom_calendar.firm_id$=firm_id$
        i = 31
	while i >= 1
            workday$=field(pom_calendar$,"day_status_"+str(i:"00")) 
            if workday$<>" " then 
                workday$ = str(i:"00")
                break   
            endif    
            i=i-1
	wend
        if workday$="00" then workday$="01"
        callpoint!.setDevObject("enddt",pom_calendar.year$+pom_calendar.month$)
        enddate$=fndate$(pom_calendar.year$+pom_calendar.month$+workday$)
    endif

callpoint!.setColumnData("POR_CALENDAR.FIRST_DATE",begdate$)
callpoint!.setColumnData("POR_CALENDAR.LAST_DATE",enddate$)
if len(begdate$)=10
  callpoint!.setColumnData("POR_CALENDAR.BEGINNING_MONTH",begdate$(1,2))
  callpoint!.setColumnData("POR_CALENDAR.BEGINNING_YEAR",begdate$(7,4))
endif
if len(enddate$)=10
  callpoint!.setColumnData("POR_CALENDAR.ENDING_MONTH",enddate$(1,2))
  callpoint!.setColumnData("POR_CALENDAR.ENDING_YEAR",enddate$(7,4))
endif
callpoint!.setStatus("REFRESH")
[[POR_CALENDAR.BSHO]]
files=1,begfile=1,endfile=1
dim files$[files],options$[files],chans$[files],templates$[files]
files$[1]="POM_CALENDAR";options$[1]="OTA"

call stbl("+DIR_SYP")+"bac_open_tables.bbj",
:	begfile,
:	endfile,
:	files$[all],
:	options$[all],
:	chans$[all],
:	templates$[all],
:	table_chans$[all],
:	batch,
:	status$

if status$<>"" goto std_exit
[[POR_CALENDAR.<CUSTOM>]]
#include std_missing_params.src
