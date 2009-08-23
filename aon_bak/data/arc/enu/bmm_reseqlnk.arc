//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// BMM_RESEQLNK - Operations Link Resequencing
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0102
BEGIN
    NAME "win_bmm_reseqlnk"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Bill of Materials Number:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_no"
    END
    
    INPUTE 03001, "", 130, 10, 260, 19
    BEGIN
        NAME "ine_bill_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04001, "", 416, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_bill_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 390, 10, 20, 19
    BEGIN
        NAME "tbnf_bill_no"
    END
    
    STATICTEXT 02002, "Old Operation Sequence Number:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_old_op_seq"
    END
    
    INPUTE 03002, "", 130, 31, 39, 19
    BEGIN
        NAME "ine_old_op_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02003, "New Operation Sequence Number:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_op_seq"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_new_op_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
END

