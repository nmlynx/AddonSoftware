//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_BUDGETMAINT - Budget Maintenance
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0105
BEGIN
    NAME "win_glm_budgetmaint"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Cuenta del GL:", 69, 13, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 156, 10, 130, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 312, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 286, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02002, "Tipo de cuenta:", 63, 34, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_acct_type"
    END
    
    LISTBUTTON 03002, "", 156, 31, 76, 300
    BEGIN
        NAME "lbx_gl_acct_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    CHECKBOX 03003, "¿Registrar detalle?", 154, 52, 136, 19
    BEGIN
        NAME "cbx_detail_flag"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
END

