//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLS_SUSPENSE - Suspense Account Information
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0123
BEGIN
    NAME "win_gls_suspense"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Use Suspense Account?", 128, 10, 169, 19
    BEGIN
        NAME "cbx_use_suspense"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "GL Account:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03002, "", 130, 31, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 236, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 210, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02003, "Posting Limit:", 48, 55, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_max_limit"
    END
    INPUTN 03003, "", 130, 52, 56, 19
    BEGIN
        NAME "inn_gl_max_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Account Balance Limit:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_balance"
    END
    INPUTN 03004, "", 130, 73, 56, 19
    BEGIN
        NAME "inn_max_balance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

