//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRR_LBRDISTREPOR - Labor Distribution Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_prr_lbrdistrepor"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Report Sequence:", 25, 13, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_option"
    END
    
    LISTBUTTON 03001, "", 130, 10, 87, 300
    BEGIN
        NAME "lbx_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

