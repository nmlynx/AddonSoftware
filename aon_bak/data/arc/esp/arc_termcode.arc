//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARC_TERMCODE - Terms Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0346 0210
BEGIN
    NAME "win_arc_termcode"
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
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
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
    
    STATICTEXT 02003, "Próx. o días:", 81, 76, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prox_or_days"
    END
    
    LISTBUTTON 03003, "", 156, 73, 60, 300
    BEGIN
        NAME "lbx_prox_or_days"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Porcentaje de descuento:", 6, 97, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_percent"
    END
    INPUTN 03004, "", 156, 94, 56, 19
    BEGIN
        NAME "inn_disc_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0.00#-"
    END
    
    STATICTEXT 02005, "Días de vencimiento de la factura:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_days_due"
    END
    INPUTN 03005, "", 156, 115, 56, 19
    BEGIN
        NAME "inn_inv_days_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Días de descuento:", 42, 139, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_days"
    END
    INPUTN 03006, "", 156, 136, 56, 19
    BEGIN
        NAME "inn_disc_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03007, "Credit Hold", 154, 157, 97, 19
    BEGIN
        NAME "cbx_cred_hold"
        NOT OPAQUE
    END
END

