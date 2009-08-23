//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPE_CREDMOD - Modify Credit Information
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0102
BEGIN
    NAME "win_ope_credmod"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Credit Hold:", 57, 13, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cred_hold"
    END
    
    LISTBUTTON 03001, "", 130, 10, 75, 300
    BEGIN
        NAME "lbx_cred_hold"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Credit Limit:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_limit"
    END
    INPUTN 03002, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_credit_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "Tickler Date:", 55, 55, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tickler_date"
    END
    
    INPUTD 03003, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_tickler_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_tickler_date"
    END
END

