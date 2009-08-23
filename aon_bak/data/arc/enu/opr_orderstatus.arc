//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_ORDERSTATUS - Order Staus Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0126
BEGIN
    NAME "win_opr_orderstatus"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Open?", 128, 10, 67, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03002, "Quoted?", 128, 31, 79, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
    
    CHECKBOX 03003, "Backorders?", 128, 52, 101, 19
    BEGIN
        NAME "cbx_backorders"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "Credit", 128, 73, 66, 19
    BEGIN
        NAME "cbx_credit"
        NOT OPAQUE
    END
END

