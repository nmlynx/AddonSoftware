//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFS_NUMBERS - Next Work Order Number
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_sfs_numbers"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Next Work Order Number:", 1, 13, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_next_wo_no"
    END
    INPUTN 03001, "", 156, 10, 64, 19
    BEGIN
        NAME "inn_next_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

