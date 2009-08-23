//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVW_ITEMTOTS - Inventory Analysis Item Totals
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0186
BEGIN
    NAME "win_ivw_itemtots"
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
    
    STATICTEXT 02002, "Sign Of Receiprocal Amount:", 0, 34, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_recip_sign"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_recip_sign"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02003, "Reciprical Amount:", 42, 55, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_recip_amount"
    END
    
    INPUTE 03003, "", 156, 52, 221, 19
    BEGIN
        NAME "ine_recip_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 17
    END
    
    STATICTEXT 02004, "Inventory Item ID:", 50, 76, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03004, "", 156, 73, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 442, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 416, 73, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02005, "Unit Cost:", 95, 97, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Usage Quantity:", 60, 118, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_usage_qty"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_usage_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Quantity On-Hand:", 41, 139, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

