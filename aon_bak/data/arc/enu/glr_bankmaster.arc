//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLR_BANKMASTER - Bank Rec Master Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_glr_bankmaster"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Only include Open Items?", 128, 10, 179, 19
    BEGIN
        NAME "cbx_include_open"
        NOT OPAQUE
    END
END

