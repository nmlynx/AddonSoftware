//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_WOTRAV - Work Order Traveler Print
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_sfr_wotrav"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Restart", 128, 10, 71, 19
    BEGIN
        NAME "cbx_restart"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Work Order Number:", 5, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03002, "", 130, 31, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
END

