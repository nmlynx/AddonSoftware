//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVE_ABCITEM - ABC Analysis By Item
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0249
BEGIN
    NAME "win_ive_abcitem"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Inventory Item ID:", 50, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03001, "", 156, 10, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 442, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 416, 10, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02002, "ABC Analysis Code:", 39, 34, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_code"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_abc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02003, "ABC Analysis Code:", 39, 55, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_code"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_abc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02004, "Annual Usage Quantity:", 15, 76, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_annual_usage"
    END
    INPUTN 03004, "", 156, 73, 64, 19
    BEGIN
        NAME "inn_annual_usage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Quantity On-Hand:", 41, 97, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Ending Balance:", 62, 118, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_balance"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_end_balance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Unit Cost:", 95, 139, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "ABC Total Value:", 58, 160, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03008, "", 156, 157, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02009, "ABC Total Value:", 58, 181, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03009, "", 156, 178, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02010, "ABC Total Value:", 58, 202, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03010, "", 156, 199, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
END

