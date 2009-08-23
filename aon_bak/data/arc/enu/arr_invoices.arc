//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_INVOICES - AR Simple Invoice Printing
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0123
BEGIN
    NAME "win_arr_invoices"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Restart", 128, 10, 71, 19
    BEGIN
        NAME "cbx_pick_check"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Invoice Number:", 32, 34, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_ar_inv_no"
    END
    
    INPUTE 03002, "", 130, 31, 56, 19
    BEGIN
        NAME "ine_pick_ar_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 04002, "", 212, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pick_ar_inv_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 186, 31, 20, 19
    BEGIN
        NAME "tbnf_pick_ar_inv_no"
    END
    
    STATICTEXT 02003, "Message:", 74, 55, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_text"
    END
    
    INPUTE 03003, "", 130, 52, 400, 19
    BEGIN
        NAME "ine_pick_text"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02004, "Number of Copies:", 17, 76, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_integer"
    END
    INPUTN 03004, "", 130, 73, 49, 19
    BEGIN
        NAME "inn_pick_integer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "-#####0"
    END
END

