//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVC_ITEMLOOKUP - Inventory Item Lookup
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0400 0100
BEGIN
    NAME "win_ivc_itemlookup"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Search by:", 67, 13, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_search_by"
    END
    
    LISTBUTTON 03001, "", 130, 10, 106, 300
    BEGIN
        NAME "lbx_search_by"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Search text:", 58, 34, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_search_key"
    END
    
    INPUTE 03002, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_search_key"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
END

