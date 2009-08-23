//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APR_CASHREQUIRE - AP Cash Requirements Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0189
BEGIN
    NAME "win_apr_cashrequire"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Fecha de antigüedad:", 29, 13, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_date"
    END
    
    INPUTD 03001, "", 156, 10, 85, 19
    BEGIN
        NAME "ind_aging_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 241, 10, 20, 19
    BEGIN
        NAME "tbnc_aging_date"
    END
    
    STATICTEXT 02002, "Antigüedad por:", 58, 34, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_option"
    END
    
    LISTBUTTON 03002, "", 156, 31, 109, 300
    BEGIN
        NAME "lbx_report_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Secuencia de informe:", 25, 55, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03003, "", 156, 52, 125, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Resumen o detalle:", 43, 76, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_summ_det"
    END
    
    LISTBUTTON 03004, "", 156, 73, 74, 300
    BEGIN
        NAME "lbx_report_summ_det"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Período o días:", 67, 97, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_type"
    END
    
    LISTBUTTON 03005, "", 156, 94, 60, 300
    BEGIN
        NAME "lbx_report_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Cantidad de días:", 52, 118, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_integer"
    END
    INPUTN 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "inn_pick_integer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "-#####0"
    END
    
    CHECKBOX 03007, "Formato para exportar", 154, 136, 164, 19
    BEGIN
        NAME "cbx_export_format"
        NOT OPAQUE
    END
END

