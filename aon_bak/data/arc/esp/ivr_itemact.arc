//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVR_ITEMACT - Inventory Item Activity
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0228
BEGIN
    NAME "win_ivr_itemact"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Period/Year:", 18, 13, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_year"
    END
    
    INPUTE 03001, "", 156, 10, 56, 19
    BEGIN
        NAME "ine_period_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/0000"
    END
    
    STATICTEXT 02002, "Ending Period/Year:", 36, 34, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_year"
    END
    
    INPUTE 03002, "", 156, 31, 56, 19
    BEGIN
        NAME "ine_period_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/0000"
    END
    
    STATICTEXT 02003, "Beginning Warehouse:", 24, 55, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04003, "", 217, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 191, 52, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02004, "Ending Warehouse:", 41, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 217, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 191, 73, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02005, "Beginning Product Type:", 10, 97, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02006, "Ending Product Type:", 28, 118, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04006, "", 217, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 191, 115, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02007, "Beginning Item ID:", 48, 139, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03007, "", 156, 136, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 342, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 316, 136, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02008, "Ending Item ID:", 65, 160, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03008, "", 156, 157, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 342, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 316, 157, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02009, "Item Type:", 93, 181, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_type"
    END
    
    INPUTE 03009, "", 156, 178, 35, 19
    BEGIN
        NAME "ine_item_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04009, "", 217, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 191, 178, 20, 19
    BEGIN
        NAME "tbnf_item_type"
    END
END

