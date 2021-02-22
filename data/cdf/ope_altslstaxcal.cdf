[[OPE_ALTSLSTAXCAL.AFMC]]
rem --- Inits
	use ::ado_util.src::util

rem --- Add static label about the sales tax calculation
	tax_amount!=fnget_control!("OPE_ALTSLSTAXCAL.TAX_AMOUNT")
	tax_amount_x=tax_amount!.getX()
	tax_amount_y=tax_amount!.getY()
	tax_amount_height=tax_amount!.getHeight()
	tax_amount_width=tax_amount!.getWidth()
	label_width=270
	nxt_ctlID=util.getNextControlID()
	staticLabel!=Form!.addStaticText(nxt_ctlID,tax_amount_x-90,tax_amount_y-40,label_width,tax_amount_height+10,"")
	staticLabel!.setText(Translate!.getTranslation("AON_ALT_SLS_TAX_CALC"))

[[OPE_ALTSLSTAXCAL.AREC]]
rem --- Return the entered TAX_AMOUNT
	callpoint!.setDevObject("altSlsTaxCal",callpoint!.getColumnData("OPE_ALTSLSTAXCAL.TAX_AMOUNT"))

rem --- How did this form end?
	callpoint!.setDevObject("altSlsTaxCal_end","BEND")

[[OPE_ALTSLSTAXCAL.ASVA]]
rem --- Form ended via ASVA. User did Run Process (F5)
	callpoint!.setDevObject("altSlsTaxCal_end","ASVA")

[[OPE_ALTSLSTAXCAL.BEND]]
rem --- Form ended via BEND. User did Close (Ctrl+F4)
	callpoint!.setDevObject("altSlsTaxCal_end","BEND")

[[OPE_ALTSLSTAXCAL.TAX_AMOUNT.AVAL]]
rem --- Return the entered TAX_AMOUNT
	callpoint!.setDevObject("altSlsTaxCal",callpoint!.getUserInput())

[[OPE_ALTSLSTAXCAL.<CUSTOM>]]
rem #include fnget_control.src
	def fnget_control!(ctl_name$)
	ctlContext=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLC"))
	ctlID=num(callpoint!.getTableColumnAttribute(ctl_name$,"CTLI"))
	get_control!=SysGUI!.getWindow(ctlContext).getControl(ctlID)
	return get_control!
	fnend
rem #endinclude fnget_control.src



