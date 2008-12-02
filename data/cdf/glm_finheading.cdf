[[GLM_FINHEADING.AWIN]]
heading_id=num(callpoint!.getTableColumnAttribute("GLM_FINHEADING.RPT_HEADING","CTLI"))
heading!=form!.getControl(heading_id)
currFont!=heading!.getFont()
myFont!=SysGUI!.makeFont("courier",currFont!.getSize(),currFont!.getStyle())
heading!.setFont(myFont!)

guide_id=num(callpoint!.getTableColumnAttribute("<<DISPLAY>>.GUIDE","CTLI"))
guide!=form!.getControl(guide_id)
currFont!=guide!.getFont()
myFont!=SysGUI!.makeFont("courier",currFont!.getSize(),currFont!.getStyle())
guide!.setFont(myFont!)

gosub resize_window

ctl_name$="<<DISPLAY>>.GUIDE"
ctl_stat$="I"
gosub disable_fields

dim user_tpl$:"ruler:c(135*)"

for x=1 to 13
	wk$=wk$+"----+----"+str(mod(x,10))
next x

user_tpl.ruler$=wk$
[[GLM_FINHEADING.ADIS]]
gosub show_guide
[[GLM_FINHEADING.<CUSTOM>]]
resize_window: rem --- Resize window based on new controls

	controls! = Form!.getAllControls()
	ScreenSize! = SysGUI!.getSystemMetrics().getScreenSize()
	screen_width = ScreenSize!.width - 40
	screen_height = ScreenSize!.height - 40
	group_box = 21
	push_button = 11
	new_width = 0
	new_height = 0
	extra_width = 10
	extra_height = 10
	no_buttons_yet = 1

	rem --- Roll throught all controls, setting the max width and height
	for i=0 to controls!.size() - 1
		this_ctrl! = controls!.getItem(i)
		type = this_ctrl!.getControlType()

		rem --- Group boxes dimesions can mess up the calculation
		if type = group_box then continue
		
		rem --- Push Buttons (e.g. "OK", "Cancel") need extra room at the bottum
		if type = push_button then
			if no_buttons_yet then
				extra_height = extra_height + this_ctrl!.getHeight() + 5
				no_buttons_yet = 0
			endif
		else
		
			rem --- Most controls go here
			new_width  = max( new_width,  this_ctrl!.getX() + this_ctrl!.getWidth() )
			new_height = max( new_height, this_ctrl!.getY() + this_ctrl!.getHeight() )
		endif
		
	next i

	rem --- Set new size, but not bigger than the screen
	new_width = min( screen_width, new_width + extra_width )
	new_height = min( screen_height, new_height + extra_height )
	Form!.setSize(new_width, new_height)
	
	rem --- Will the form still fit on the screen?
	new_position = 0
	form_x = Form!.getX()
	form_y = Form!.getY()
	
	if form_x + new_width > screen_width then
		form_x = int( (screen_width - new_width) / 2 )
		new_position = 1
	endif
	
	if form_y + new_height > screen_height then
		form_y = int( (screen_height - new_height) / 2 )
		new_position = 1
	endif
	
	if new_position then
		Form!.setLocation(form_x, form_y)
	endif

return

show_guide:

callpoint!.setColumnData("<<DISPLAY>>.GUIDE",user_tpl.ruler$)
callpoint!.setStatus("REFRESH")

return


rem #include disable_fields.src

disable_fields:
	rem --- used to disable/enable controls
	rem --- ctl_name$ sent in with name of control to enable/disable (format "ALIAS.CONTROL_NAME")
	rem --- ctl_stat$ sent in as D or space, meaning disable/enable, respectively

	wctl$=str(num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)=ctl_stat$
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP-REFRESH-ACTIVATE")

return

rem #endinclude disable_fields.src
[[GLM_FINHEADING.AREC]]
gosub show_guide
