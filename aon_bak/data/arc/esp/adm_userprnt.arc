//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_USERPRNT - Operator/Printer Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0100
BEGIN
    NAME "win_adm_userprnt"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del usuario:", 69, 13, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03001, "", 156, 10, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 332, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 306, 10, 20, 19
    BEGIN
        NAME "tbnf_user_id"
    END
    
    STATICTEXT 02002, "ID de la impresora:", 43, 34, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_printer_id"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_printer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
END

