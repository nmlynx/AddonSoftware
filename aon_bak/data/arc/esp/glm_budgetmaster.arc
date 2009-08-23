//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_BUDGETMASTER - Budget Revisions
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0354
BEGIN
    NAME "win_glm_budgetmaster"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de revisión:", 39, 13, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_budget_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_budget_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Montos o unidades:", 38, 34, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amt_or_units"
    END
    
    LISTBUTTON 03002, "", 156, 31, 79, 300
    BEGIN
        NAME "lbx_amt_or_units"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Descripción:", 80, 55, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03003, "", 156, 52, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02004, "Título de la columna:", 31, 76, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rev_title"
    END
    
    INPUTE 03004, "", 156, 73, 120, 19
    BEGIN
        NAME "ine_rev_title"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    GROUPBOX 19005, "Información adicional ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_revision_src"
    END
    
    STATICTEXT 02005, "Fuente de revisión:", 42, 118, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_revision_src"
    END
    
    LISTBUTTON 03005, "", 156, 115, 251, 300
    BEGIN
        NAME "lbx_revision_src"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Beginning Cuenta del GL:", 7, 139, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03006, "", 156, 136, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 262, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 236, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02007, "Ending Cuenta del GL:", 25, 160, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03007, "", 156, 157, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 262, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 236, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02008, "Máscara comodín:", 47, 181, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_wildcard"
    END
    
    INPUTE 03008, "", 156, 178, 80, 19
    BEGIN
        NAME "ine_gl_wildcard"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02009, "Monto/porcentaje:", 43, 202, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amt_or_pct"
    END
    
    LISTBUTTON 03009, "", 156, 199, 91, 300
    BEGIN
        NAME "lbx_amt_or_pct"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02010, "Valor:", 119, 223, 34, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amtpct_val"
    END
    INPUTN 03010, "", 156, 220, 56, 19
    BEGIN
        NAME "inn_amtpct_val"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03011, "¿sobrescribir", 154, 241, 108, 19
    BEGIN
        NAME "cbx_overwrite"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Factor de redondeo:", 35, 265, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rounding"
    END
    
    LISTBUTTON 03012, "", 156, 262, 85, 300
    BEGIN
        NAME "lbx_rounding"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02013, "Fecha de creación:", 45, 286, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_created_date"
    END
    
    INPUTD 03013, "", 156, 283, 85, 19
    BEGIN
        NAME "ind_created_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02014, "Última revisión:", 62, 307, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstrev_date"
    END
    
    INPUTD 03014, "", 156, 304, 85, 19
    BEGIN
        NAME "ind_lstrev_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
END

