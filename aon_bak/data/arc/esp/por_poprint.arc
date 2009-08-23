//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POR_POPRINT - Purchase Order Print
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0506 0123
BEGIN
    NAME "win_por_poprint"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Sequence:", 94, 13, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_type"
    END
    
    LISTBUTTON 03001, "", 156, 10, 210, 300
    BEGIN
        NAME "lbx_report_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Message Text:", 70, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_message_text"
    END
    
    INPUTE 03002, "", 156, 31, 320, 19
    BEGIN
        NAME "ine_message_text"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    CHECKBOX 03003, "Restart", 154, 52, 71, 19
    BEGIN
        NAME "cbx_restart"
        NOT OPAQUE
    END
    
    STATICTEXT 02004, "ID del proveedor:", 52, 76, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03004, "", 156, 73, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04004, "", 230, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 204, 73, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
END

