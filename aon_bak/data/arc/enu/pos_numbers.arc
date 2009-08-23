//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POS_NUMBERS - Next Sequence Number Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0123
BEGIN
    NAME "win_pos_numbers"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Next Purchase Order Number:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_po_no"
    END
    INPUTN 03001, "", 130, 10, 64, 19
    BEGIN
        NAME "inn_next_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "Next Requisition Number:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_req_no"
    END
    INPUTN 03002, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_next_req_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "Next Receiver Number:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_rec_no"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_next_rec_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Line Count Increment:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_increment"
    END
    INPUTN 03004, "", 130, 73, 30, 19
    BEGIN
        NAME "inn_increment"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
END

