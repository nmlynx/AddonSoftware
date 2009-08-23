//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_CREDIT - Credit Management Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0340 0252
BEGIN
    NAME "win_ars_credit"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "¿Instalada la gestión de créditos?", 214, 10, 223, 19
    BEGIN
        NAME "cbx_sys_install"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Contraseña del crédito:", 76, 34, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cred_passwd"
    END
    
    EDIT 03002, "", 216, 31, 48, 19
    BEGIN
        NAME "edp_cred_passwd"
        CLIENTEDGE
        PASSWORDENTRY
    END
    
    STATICTEXT 02003, "Grupo de antigüedad para retener:", 10, 55, 203, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_bucket"
    END
    
    LISTBUTTON 03003, "", 216, 52, 74, 300
    BEGIN
        NAME "lbx_aging_bucket"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Saldo mínimo para retener:", 55, 76, 158, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_past_due_lim"
    END
    INPUTN 03004, "", 216, 73, 56, 19
    BEGIN
        NAME "inn_past_due_lim"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Retener todos los pedidos sobre este monto:", 0, 97, 213, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hold_amount"
    END
    INPUTN 03005, "", 216, 94, 72, 19
    BEGIN
        NAME "inn_hold_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "########0-"
    END
    
    STATICTEXT 02006, "¿Mostrar crédito en entrada de pedido?:", 0, 118, 213, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_display_bal"
    END
    
    LISTBUTTON 03006, "", 216, 115, 94, 300
    BEGIN
        NAME "lbx_display_bal"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03007, "¿Retener automáticamente sobre límite de crédito?", 214, 136, 325, 19
    BEGIN
        NAME "cbx_auto_hold"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "¿Permitir retenciones manuales?", 214, 157, 219, 19
    BEGIN
        NAME "cbx_man_hold"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "¿Elegir lista para pedidos retenidos?", 214, 178, 241, 19
    BEGIN
        NAME "cbx_pick_hold"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "¿Retener todos los clientes nuevos?", 214, 199, 239, 19
    BEGIN
        NAME "cbx_hold_new"
        NOT OPAQUE
    END
END

