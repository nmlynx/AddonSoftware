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
    
    STATICTEXT 02001, "Next Purchase Order Number:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_po_no"
    END
    INPUTN 03001, "", 156, 10, 64, 19
    BEGIN
        NAME "inn_next_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "Next Requisition Number:", 3, 34, 150, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_req_no"
    END
    INPUTN 03002, "", 156, 31, 64, 19
    BEGIN
        NAME "inn_next_req_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "Next Receiver Number:", 19, 55, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_rec_no"
    END
    INPUTN 03003, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_next_rec_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Line Count Increment:", 24, 76, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_increment"
    END
    INPUTN 03004, "", 156, 73, 30, 19
    BEGIN
        NAME "inn_increment"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
END

