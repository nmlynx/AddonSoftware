//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_COPYITEM - Copy Item
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0420 0100
BEGIN
    NAME "win_ivm_copyitem"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Inventory Item ID:", 24, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_old_item"
    END
    
    INPUTE 03001, "", 130, 10, 260, 19
    BEGIN
        NAME "ine_old_item"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 395, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_old_item"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    STATICTEXT 02002, "New Item ID:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_item_id"
    END
    
    INPUTE 03002, "", 130, 31, 260, 19
    BEGIN
        NAME "ine_new_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
END

