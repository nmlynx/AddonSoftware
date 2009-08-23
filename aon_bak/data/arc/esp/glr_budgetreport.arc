//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLR_BUDGETREPORT - Budget Revision Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0212
BEGIN
    NAME "win_glr_budgetreport"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Cuenta:", 47, 13, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 156, 10, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 262, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 236, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02002, "Ending Cuenta:", 64, 34, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03002, "", 156, 31, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 262, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 236, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02003, "Máscara comodín:", 47, 55, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_wildcard"
    END
    
    INPUTE 03003, "", 156, 52, 80, 19
    BEGIN
        NAME "ine_gl_wildcard"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    GROUPBOX 19004, "Códigos del presupuesto ", -4, 76, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_bud_cd_1"
    END
    
    STATICTEXT 02004, "01:", 135, 97, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bud_cd_1"
    END
    
    LISTBUTTON 03004, "", 156, 94, 200, 300
    BEGIN
        NAME "lbx_bud_cd_1"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02005, "02:", 135, 118, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bud_cd_2"
    END
    
    LISTBUTTON 03005, "", 156, 115, 200, 300
    BEGIN
        NAME "lbx_bud_cd_2"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02006, "03:", 135, 139, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bud_cd_3"
    END
    
    LISTBUTTON 03006, "", 156, 136, 200, 300
    BEGIN
        NAME "lbx_bud_cd_3"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02007, "04:", 135, 160, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bud_cd_4"
    END
    
    LISTBUTTON 03007, "", 156, 157, 200, 300
    BEGIN
        NAME "lbx_bud_cd_4"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
END

