//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POR_REPLENREG - PO Replenishment Register
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_por_replenreg"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Print Warehouse Detail", 154, 10, 162, 19
    BEGIN
        NAME "cbx_whse_detail"
        NOT OPAQUE
    END
    
    CHECKBOX 03002, "Print Suggested Items Only", 154, 31, 188, 19
    BEGIN
        NAME "cbx_sugg_itemsonly"
        NOT OPAQUE
    END
END

