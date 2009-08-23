//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POE_RECDFLTS - PO Receipt Defaults
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_poe_recdflts"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Receive Complete?", 128, 10, 138, 19
    BEGIN
        NAME "cbx_dflt_rec_comp"
        NOT OPAQUE
    END
    
    CHECKBOX 03002, "Default to Qty Ordered?", 128, 31, 169, 19
    BEGIN
        NAME "cbx_dflt_rec_qty"
        NOT OPAQUE
    END
END

