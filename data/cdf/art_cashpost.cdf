[[ART_CASHPOST.BGDR]]
rem --- set display field with reverse of data file

callpoint!.setColumnData("<<DISPLAY>>.ENTRY_AMOUNT",str(-num(callpoint!.getColumnData("ART_CASHPOST.TRANS_AMOUNT"))))
[[<<DISPLAY>>.ENTRY_AMOUNT.AVAL]]
rem --- inverse the sign for storage

callpoint!.setColumnData("ART_CASHPOST.TRANS_AMOUNT",str(-num(callpoint!.getUserInput())))
[[ART_CASHPOST.AREC]]
if cvs(callpoint!.getColumnData("ART_CASHPOST.GL_TRANS_TYPE"),3)=""
	callpoint!.setColumnData("ART_CASHPOST.GL_TRANS_TYPE","M")
endif
[[ART_CASHPOST.BWAR]]
rem --- << In manually entering in this form - force "M" >>
	callpoint!.setColumnData("art_cashpost.gl_trans_type","M")
