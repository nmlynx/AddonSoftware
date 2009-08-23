//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLS_PARAMS - GL Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0340 0147
BEGIN
    NAME "win_gls_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Método de registro:", 38, 13, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_post_code"
    END
    
    LISTBUTTON 03001, "", 156, 10, 128, 300
    BEGIN
        NAME "lbx_gl_post_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03002, "¿Registrar transacciones de detalles?", 142, 31, 246, 19
    BEGIN
        NAME "cbx_detail_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03003, "¿Conservar historial de transacciones?", 142, 52, 257, 19
    BEGIN
        NAME "cbx_retain_det"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "¿Utilizar presupuestos?", 142, 73, 167, 19
    BEGIN
        NAME "cbx_budget_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "¿Utilizar unidades?", 142, 94, 140, 19
    BEGIN
        NAME "cbx_units_flag"
        NOT OPAQUE
    END
END

