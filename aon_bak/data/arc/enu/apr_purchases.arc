//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APR_PURCHASES - AP Purchase Journal
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0107
BEGIN
    NAME "win_apr_purchases"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Period:", 87, 13, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Year:", 98, 34, 29, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_year"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02003, "Sequence:", 68, 55, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03003, "", 130, 52, 126, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

