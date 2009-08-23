//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POW_INVLAND - PO Invoice Landed Cost Work
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0102
BEGIN
    NAME "win_pow_invland"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Warehouse ID:", 70, 13, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 217, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 191, 10, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02002, "Inventory Item ID:", 50, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03002, "", 156, 31, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 442, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 416, 31, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02003, "Landed Cost:", 76, 55, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_landed_cost"
    END
    INPUTN 03003, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_landed_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

