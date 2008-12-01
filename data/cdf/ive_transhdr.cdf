[[IVE_TRANSHDR.ADEQ]]
print "HEADER: After delete query (ADEQ)"; rem debug
[[IVE_TRANSHDR.BOVE]]
print "HEADER: before table overview (BOVE)"; rem debug
[[IVE_TRANSHDR.BDEQ]]
print "HEADER: before delete query (BDEQ)"; rem debug
[[IVE_TRANSHDR.BDEL]]
print "HEADER: before record delete (BDEL)"; rem debug

rem --- Uncommit all detail lines

	rem --- Receipts do not commit
	if user_tpl.trans_type$ = "R" then break; rem exit this callpoint

	rem --- Get detail lines vector and record template
	curDtl! = SysGUI!.makeVector()
	curDtl! = GridVect!.getItem(0)
	dim curr_rec$:dtlg_param$[1,3]

	rem --- Initialize inventory item update
	status = 999
	call pgmdir$+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	if status then goto std_exit
	escape

	rem --- Roll through detail lines
	for i=0 to curDtl!.size()
		curr_rec$ = curDtl!.getItem(i)
		
		if curr_rec$ = "" then break

		curr_whse$   = curr_rec.warehouse_id$
		curr_item$   = curr_rec.item_id$
		curr_qty     = num( curr_rec.trans_qty$ )
		curr_lotser$ = curr_rec.lotser_no$

		if curr_whse$ <> "" and curr_item$ <>"" then 

			rem --- Adjustments reverse the commitment
			if user_tpl.trans_type$ = "A" then 
				refs[0] = -curr_qty 
			else 
				refs[0] = curr_qty
			endif

			items$[1] = curr_whse$
			items$[2] = curr_item$
			items$[3] = curr_lotser$
			call pgmdir$+"ivc_itemupdt.aon","UC",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
		endif

	next i
[[IVE_TRANSHDR.ADIS]]
print "HEADER: After display record (ADIS)"; rem debug
[[IVE_TRANSHDR.AWRI]]
print "HEADER: after write record (AWRI)"
[[IVE_TRANSHDR.ARER]]
print "HEADER: after new record ready (ARER)"
[[IVE_TRANSHDR.ARAR]]
print "HEADER: after array transfer (ARAR)"
[[IVE_TRANSHDR.BWRI]]
print "HEADER: before record write (BWRI)"; rem debug

rem --- Check for lines marked deleted

	rem --- Get detail lines vector and record template
	curDtl!  = SysGUI!.makeVector()
	undoDtl! = SysGUI!.makeVector()
	diskDtl! = SysGUI!.makeVector()

	curDtl!  = GridVect!.getItem(0)
	undoDtl! = GridVect!.getItem(1)
	diskDtl! = GridVect!.getItem(2)

	dim curr_rec$:dtlg_param$[1,3]
	dim undo_rec$:dtlg_param$[1,3]
	dim disk_rec$:dtlg_param$[1,3]	

	rem --- Roll through detail lines
	for i=0 to curDtl!.size() - 1
		print "Row", i

		curr_rec$ = curDtl!.getItem(i)
		undo_rec$ = undoDtl!.getItem(i)
		disk_rec$ = diskDtl!.getItem(i)

		if curr_rec$ = "" then break

		if undo_rec$ = "" then 
			print "Nothing to undo"
			undo_trans_qty = 0
		else
			undo_trans_qty = undo_rec.trans_qty
		endif

		if disk_rec$ = "" then 
			print "New record"
			disk_trans_qty = 0
		else
			disk_trans_qty = disk_rec.trans_qty
		endif

		if callpoint!.getGridRowDeleteStatus(i) = "Y" then print "Row", i, " was deleted"

		print "Current qty", curr_rec.trans_qty
		print "   Undo qty", undo_trans_qty
		print "   Disk qty", disk_trans_qty

	next i
[[IVE_TRANSHDR.AREA]]
print "HEADER: after record read (AREA)"; rem debug

rem --- Get trans code record and set flags
	
	rem can't use this method because the data is not displayed yet
	rem trans_code$ = callpoint!.getColumnData("IVE_TRANSHDR.TRANS_CODE")
	trans_code$ = rec_data.trans_code$
	gosub get_trans_rec
[[IVE_TRANSHDR.AREC]]
print "HEADER: after new record (AREC)"; rem debug
[[IVE_TRANSHDR.TRANS_CODE.AINP]]
rem --- You can't modify the trans code use you've entered the record

	trans_code$      = pad( callpoint!.getUserInput(), 2)
	orig_trans_code$ = callpoint!.getColumnDiskData("IVE_TRANSHDR.TRANS_CODE")

	if cvs( orig_trans_code$, 2 ) <> "" and trans_code$ <> orig_trans_code$ then
		call stbl("+DIR_SYP")+"bac_message.bbj","IV_TRANS_CODE_CHANGE",msg_tokens$[all],msg_opt$,table_chans$[all]
		callpoint!.setStatus("ABORT")
	endif
[[IVE_TRANSHDR.TRANS_CODE.AVAL]]
print "in TRANS_CODE.AVAL"; rem debug

rem --- Get trans code record and set flags

	trans_code$ = callpoint!.getUserInput()
	gosub get_trans_rec

rem --- Disable grid columns based on params (does this work?)

	w!=Form!.getChildWindow(1109)
	c!=w!.getControl(5900)

	if user_tpl.gl$ <> "Y" or user_tpl.trans_post_gl$ <> "Y" then 
		c!.setColumnEditable(3,0); rem G/L entry
		print "G/L entry should be dissabled"; rem debug
	endif
[[IVE_TRANSHDR.TRANS_DATE.AVAL]]
rem --- Does date fall into the GL period?

if user_tpl.gl$ = "Y" then
	date$ = callpoint!.getUserInput()
	call stbl("+DIR_PGM")+"glc_datecheck.aon",date$,"Y",period$,year$,status
	if status > 99 then callpoint!.setStatus("ABORT")
endif
[[IVE_TRANSHDR.<CUSTOM>]]
get_trans_rec: rem --- Get Transaction Code Record
               rem  IN: trans_code$, file opened
               rem OUT: flags set

	transcode_dev  = fnget_dev("IVC_TRANCODE")
	trans_rec_tpl$ = fnget_tpl$("IVC_TRANCODE")
	dim trans_rec$:trans_rec_tpl$

	trans_key$ = firm_id$ + "B" + trans_code$
	find record(transcode_dev,key=trans_key$) trans_rec$

	user_tpl.trans_type$     = trans_rec.trans_type$
	user_tpl.trans_post_gl$  = trans_rec.post_gl$
	user_tpl.trans_adj_acct$ = trans_rec.gl_adj_acct$

	print "in get_trans_rec: Got transaction code and set user_tpl$; post to GL = ", user_tpl.trans_post_gl$; rem debug

return

rem #include fnget_control.src

	rem   IN: ctl_name$    = name of control
	rem  OUT: get_control! = control object

	def fnget_control!(ctl_name$)
		ctlContext   = num( callpoint!.getTableColumnAttribute(ctl_name$,"CTLC") )
		ctlID        = num( callpoint!.getTableColumnAttribute(ctl_name$,"CTLI") )
		get_control! = SysGUI!.getWindow(ctlContext).getControl(ctlID)
		return get_control!
	fnend

rem #endinclude fnget_control.src

#include std_missing_params.src
[[IVE_TRANSHDR.BSHO]]
print 'show', ; rem debug

rem --- Pre-inits
	
	pgmdir$ = stbl("+DIR_PGM")

rem --- Open files

	num_files=6
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS",   open_opts$[1]="OTA"
	open_tables$[2]="GLS_PARAMS",   open_opts$[2]="OTA"
	open_tables$[3]="IVC_TRANCODE", open_opts$[3]="OTA"
	open_tables$[4]="IVE_TRANSDET", open_opts$[4]="OTA"
	open_tables$[5]="IVM_ITEMMAST", open_opts$[5]="OTA"
	open_tables$[6]="IVM_ITEMWHSE", open_opts$[6]="OTA"
	gosub open_tables
	ivs01_dev=num(open_chans$[1])
	gls01_dev=num(open_chans$[2])
	dim ivs01a$:open_tpls$[1]
	dim gls01a$:open_tpls$[2]

rem --- Setup user template and object

	UserObj! = SysGUI!.makeVector(); rem to store objects in

	user_tpl_str$ = ""
	user_tpl_str$ = user_tpl_str$ + "gl:c(1),ls:c(1),glw11:c(1*),m9:c(1*),prod_type:c(3),"
	user_tpl_str$ = user_tpl_str$ + "location_obj:u(1),qoh_obj:u(1),commit_obj:u(1),avail_obj:u(1),"
	user_tpl_str$ = user_tpl_str$ + "trans_post_gl:c(1),trans_type:c(1),trans_adj_acct:c(1*),"
	user_tpl_str$ = user_tpl_str$ + "prev_wh_item:c(1*),prev_lot_ser:c(1*),prev_qty:n(1),this_item_lot_or_ser:u(1),"
	user_tpl_str$ = user_tpl_str$ + "lotted:u(1),serialized:u(1)"
	dim user_tpl$:user_tpl_str$

rem --- Setup for display fields on header

	location!    = fnget_control!( "<<DISPLAY>>.LOCATION" )
	qty_on_hand! = fnget_control!( "<<DISPLAY>>.QTY_ON_HAND" )
	qty_commit!  = fnget_control!( "<<DISPLAY>>.QTY_COMMIT" )
	qty_avail!   = fnget_control!( "<<DISPLAY>>.QTY_AVAIL" )

	user_tpl.location_obj = 0
	user_tpl.qoh_obj      = 1
	user_tpl.commit_obj   = 2
	user_tpl.avail_obj    = 3

	UserObj!.addItem( location! )
	UserObj!.addItem( qty_on_hand! )
	UserObj!.addItem( qty_commit! )
	UserObj!.addItem( qty_avail! )

rem --- Get parameter records

	dim i[5],g[1]
	findrecord(ivs01_dev,key=firm_id$+"IV00",dom=std_missing_params)ivs01a$; rem p1$, p2$, p3$, p4$, m0$, m1$, m2$, m3$
	findrecord(gls01_dev,key=firm_id$+"GL00",err=set_iv_params)gls01a$; rem g1$, g2$, g5$
	rem g[0] = num(gls01a.acct_length$)
	rem g[1] = num(gls01a.max_acct_len$)
	rem lf$ = "N"
	ls$ = "N"

	set_iv_params:
	rem i[0] = ivs01a.item_id_len
	rem i[1] = ivs01a.ls_no_len$
	rem i[3] = num(ivs01a.desc_len_01$)
	rem i[4] = num(ivs01a.desc_len_02$)
	rem i[5] = num(ivs01a.desc_len_03$)

rem --- Numeric masks

	user_tpl.m9$ = ivs01a.price_mask$
	call pgmdir$+"adc_sizemask.aon",user_tpl.m9$,ignore,8,10

rem --- Lotted flags

	rem p8$=""
	user_tpl.lotted=0
	user_tpl.serialized=0

	if ivs01a.lotser_flag$="L" then 
		user_tpl.ls$="Y"
		user_tpl.lotted=1
		rem p8$="Lot Number" 
	else 
		if ivs01a.lotser_flag$="S" then 
			user_tpl.ls$="Y"
			user_tpl.serialized=1
			rem p8$="Serial Number"
		endif
	endif

	rem if pos(ivs01a.lifofifo$="LF") then lf$="Y"

rem --- Is GL installed?

	status=0
	call pgmdir$+"glc_ctlcreate.aon",err=*next,pgm(-2),"IV",glw11$,gl$,status
	if status then goto std_exit
	user_tpl.gl$    = gl$
	user_tpl.glw11$ = glw11$

rem --- Final inits

	precision num(ivs01a.precision$)
