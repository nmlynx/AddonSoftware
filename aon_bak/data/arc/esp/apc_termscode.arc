//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APC_TERMSCODE - Terms Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0346 0186
BEGIN
    NAME "win_apc_termscode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de condiciones:", 15, 13, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terms_codeap"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_terms_codeap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 156, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    GROUPBOX 19003, "Adicional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_prox_or_days"
    END
    
    STATICTEXT 02003, "Próx. o días:", 69, 76, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prox_or_days"
    END
    
    LISTBUTTON 03003, "", 144, 73, 97, 300
    BEGIN
        NAME "lbx_prox_or_days"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Porcentaje de descuento:", 0, 97, 141, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_percent"
    END
    INPUTN 03004, "", 144, 94, 56, 19
    BEGIN
        NAME "inn_disc_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0.00#-"
    END
    
    STATICTEXT 02005, "Días de vencimiento:", 20, 118, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_due_days"
    END
    INPUTN 03005, "", 144, 115, 56, 19
    BEGIN
        NAME "inn_due_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Días de descuento:", 30, 139, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_days"
    END
    INPUTN 03006, "", 144, 136, 56, 19
    BEGIN
        NAME "inn_disc_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

