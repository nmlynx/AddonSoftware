//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APS_NUMBERS - Next Sequence Number Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_aps_numbers"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Número de próximo proveedor:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_vendor_id"
    END
    INPUTN 03001, "", 156, 10, 49, 19
    BEGIN
        NAME "inn_nxt_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "00-0000"
    END
END

