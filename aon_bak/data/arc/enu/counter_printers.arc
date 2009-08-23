//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// COUNTER_PRINTERS - Select Valid Counter Printers
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0206
BEGIN
    NAME "win_counter_printers"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Selected Printer:", 33, 13, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_selected_printer"
    END
    
    INPUTE 03001, "", 130, 10, 400, 19
    BEGIN
        NAME "ine_selected_printer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02002, "Double-click to add/remove", 130, 34, 151, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_list_of_printers"
    END
    
    STATICTEXT 02003, "List of Client Printers:", 1, 55, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_client_printers"
    END
    
    LISTBOX 03003, "", 130, 52, 60, 19
    BEGIN
        NAME "lbx_client_printers"
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "List of Server Printers:", 328, 55, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_server_printers"
    END
    
    LISTBOX 03004, "", 460, 52, 60, 19
    BEGIN
        NAME "lbx_server_printers"
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Double-click to select", 130, 160, 116, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_valid_printers"
    END
END

