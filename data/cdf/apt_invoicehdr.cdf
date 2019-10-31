[[APT_INVOICEHDR.AWIN]]
	use ::BBUtils.bbj::BBUtils
[[APT_INVOICEHDR.BEND]]
rem --- Remove images copied temporarily to web servier for viewing
	urlVect!=callpoint!.getDevObject("urlVect")
	if urlVect!.size()
		for wk=0 to urlVect!.size()-1
			BBUtils.deleteFromWebServer(urlVect!.get(wk))
		next wk
	endif
[[APT_INVOICEHDR.AOPT-VIDI]]
rem --- Display invoice images in the browser
	invimage_dev=fnget_dev("APT_INVIMAGE")
	dim invimage$:fnget_tpl$("APT_INVIMAGE")
	vendor_id$ = callpoint!.getColumnData("APT_INVOICEHDR.VENDOR_ID")
	ap_inv_no$ = callpoint!.getColumnData("APT_INVOICEHDR.AP_INV_NO")

	read(invimage_dev, key=firm_id$+vendor_id$+ap_inv_no$, dom=*next)
	while 1
		invimage_key$=key(invimage_dev,end=*break)
		if pos(firm_id$+vendor_id$+ap_inv_no$=invimage_key$)<>1 then break
		redim invimage$
		read record(invimage_dev)invimage$

		switch (BBjAPI().TRUE)
			case invimage.scan_docs_to$="BDA"
				rem --- Do Barista Doc Archive
				sslReq = BBUtils.isWebServerSSLEnabled()
				url$ = BBUtils.copyFileToWebServer(cvs(invimage.doc_url$,2),"appreviewtemp", sslReq)
				BBjAPI().getThinClient().browse(url$)
				urlVect!=callpoint!.getDevObject("urlVect")
				urlVect!.add(url$)
				callpoint!.setDevObject("urlVect",urlVect!)
				break
			case invimage.scan_docs_to$="GD "
				rem --- Do Google Docs
				BBjAPI().getThinClient().browse(cvs(invimage.doc_url$,2))
				break
			case default
				rem --- Unknown ... skip
				break
		swend
	wend
[[APT_INVOICEHDR.ADIS]]
rem --- Enable/Disable View Image button
	invimage_dev=fnget_dev("APT_INVIMAGE")
	dim invimage$:fnget_tpl$("APT_INVIMAGE")
	vendor_id$ = callpoint!.getColumnData("APT_INVOICEHDR.VENDOR_ID")
	ap_inv_no$ = callpoint!.getColumnData("APT_INVOICEHDR.AP_INV_NO")

	read(invimage_dev, key=firm_id$+vendor_id$+ap_inv_no$, dom=*next)
	invimage_key$=key(invimage_dev,end=*next)
	if pos(firm_id$+vendor_id$+ap_inv_no$=invimage_key$)<>1 then
		rem --- No invoice images available
		callpoint!.setOptionEnabled("VIDI",0)
	else
		rem --- Have invoice image
		callpoint!.setOptionEnabled("VIDI",1)
	endif
[[APT_INVOICEHDR.BSHO]]
rem --- Open files

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="APT_INVIMAGE",open_opts$[1]="OTA"
	gosub open_tables

rem --- Init a vector to store urls for viewed images

	urlVect!=BBjAPI().makeVector()
	callpoint!.setDevObject("urlVect",urlVect!)
[[APT_INVOICEHDR.ARAR]]
rem --- Initialize MAN_CK_* check boxes
	if callpoint!.getColumnData("APT_INVOICEHDR.MC_INV_FLAG")="M" then
		callpoint!.setColumnData("<<DISPLAY>>.MAN_CK_INV","Y",1)
	endif
	if callpoint!.getColumnData("APT_INVOICEHDR.MC_INV_ADJ")="A" then
		callpoint!.setColumnData("<<DISPLAY>>.MAN_CK_ADJ","Y",1)
	endif
	if callpoint!.getColumnData("APT_INVOICEHDR.MC_INV_REV")="R" then
		callpoint!.setColumnData("<<DISPLAY>>.MAN_CK_REV","Y",1)
	endif
