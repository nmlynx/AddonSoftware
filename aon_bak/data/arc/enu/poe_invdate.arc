//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POE_INVDATE - Invoice Entry Default Date
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0335 0100
BEGIN
    NAME "win_poe_invdate"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Use Invoice Date", 198, 10, 126, 19
    BEGIN
        NAME "cbx_use_inv_date"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Default Accounting Date:", 51, 34, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_acct_date"
    END
    
    INPUTD 03002, "", 200, 31, 85, 19
    BEGIN
        NAME "ind_def_acct_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 285, 31, 20, 19
    BEGIN
        NAME "tbnc_def_acct_date"
    END
END

