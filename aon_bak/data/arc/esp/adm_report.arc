//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_REPORT - Report Name Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0506 0100
BEGIN
    NAME "win_adm_report"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Nombre del informe UnForm:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_name"
    END
    
    INPUTE 03001, "", 156, 10, 260, 19
    BEGIN
        NAME "ine_report_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 02002, "Descripción del informe:", 9, 34, 144, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_desc"
    END
    
    INPUTE 03002, "", 156, 31, 320, 19
    BEGIN
        NAME "ine_report_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
END

