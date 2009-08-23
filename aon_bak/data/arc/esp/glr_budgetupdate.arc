//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLR_BUDGETUPDATE - Budget Revision Register
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0191
BEGIN
    NAME "win_glr_budgetupdate"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Revisiones del presupuesto:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_budget_revs"
    END
    
    LISTBUTTON 03001, "", 156, 10, 245, 300
    BEGIN
        NAME "lbx_budget_revs"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    GROUPBOX 19002, "Adicional ", -4, 34, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_gl_account"
    END
    
    STATICTEXT 02002, "Beginning Cuenta del GL:", 7, 55, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03002, "", 156, 52, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 262, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 236, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02003, "Ending Cuenta del GL:", 25, 76, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03003, "", 156, 73, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 262, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 236, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02004, "Máscara comodín:", 47, 97, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_wildcard"
    END
    
    INPUTE 03004, "", 156, 94, 80, 19
    BEGIN
        NAME "ine_gl_wildcard"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02005, "Factor de redondeo:", 35, 118, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rounding"
    END
    
    LISTBUTTON 03005, "", 156, 115, 85, 300
    BEGIN
        NAME "lbx_rounding"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Actualizar tipo:", 64, 139, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_update_type"
    END
    
    LISTBUTTON 03006, "", 156, 136, 103, 300
    BEGIN
        NAME "lbx_update_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

