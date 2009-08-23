//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_RANKING - AR Customer Ranking Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0105
BEGIN
    NAME "win_arr_ranking"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Secuencia:", 92, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03001, "", 156, 10, 103, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Tipo de informe:", 57, 34, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_type"
    END
    
    LISTBUTTON 03002, "", 156, 31, 124, 300
    BEGIN
        NAME "lbx_report_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03003, "¿Salto de página?", 154, 52, 130, 19
    BEGIN
        NAME "cbx_page_break"
        NOT OPAQUE
    END
END

