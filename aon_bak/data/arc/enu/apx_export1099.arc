//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APX_EXPORT1099 - Export 1099 Data
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_apx_export1099"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Minimum Amount:", 20, 13, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_minimum_amt"
    END
    INPUTN 03001, "", 130, 10, 64, 19
    BEGIN
        NAME "inn_minimum_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

