//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPE_CREDREV - Credit Review and Release
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_ope_credrev"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Selection:", 97, 13, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cust_ord"
    END
    
    LISTBUTTON 03001, "", 156, 10, 130, 300
    BEGIN
        NAME "lbx_cust_ord"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

