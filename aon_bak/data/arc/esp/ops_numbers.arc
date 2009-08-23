//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPS_NUMBERS - Next Sequence Number Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0102
BEGIN
    NAME "win_ops_numbers"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Next Temporary Customer Number:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_tmp_cust"
    END
    INPUTN 03001, "", 156, 10, 64, 19
    BEGIN
        NAME "inn_nxt_tmp_cust"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "Next Order Number:", 34, 34, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_ord_no"
    END
    INPUTN 03002, "", 156, 31, 64, 19
    BEGIN
        NAME "inn_nxt_ord_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "Next Invoice Number:", 27, 55, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_inv_no"
    END
    INPUTN 03003, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_next_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

