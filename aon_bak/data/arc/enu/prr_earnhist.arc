//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRR_EARNHIST - Earnings History Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_prr_earnhist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Option:", 83, 13, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_option"
    END
    
    LISTBUTTON 03001, "", 130, 10, 77, 300
    BEGIN
        NAME "lbx_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Quarter:", 78, 34, 49, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_qtr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
END

