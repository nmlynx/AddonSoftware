//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVW_EOQPROD - EOQ/Ord Pnt/Safety Prod Totals
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0586 0417
BEGIN
    NAME "win_ivw_eoqprod"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Product Type:", 72, 13, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03001, "", 156, 10, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 221, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 195, 10, 20, 19
    BEGIN
        NAME "tbnf_product_type"
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
    
    STATICTEXT 02003, "Inventory Item Description:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_desc"
    END
    
    INPUTE 03003, "", 156, 52, 400, 19
    BEGIN
        NAME "ine_item_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02004, "ABC Analysis Code:", 39, 76, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_code"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_abc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02005, "EOQ Code:", 90, 97, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq_code"
    END
    
    LISTBUTTON 03005, "", 156, 94, 124, 300
    BEGIN
        NAME "lbx_eoq_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Order Point Code:", 48, 118, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_pnt_code"
    END
    
    LISTBUTTON 03006, "", 156, 115, 124, 300
    BEGIN
        NAME "lbx_ord_pnt_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02007, "Safety Stock Code:", 46, 139, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_saf_stk_code"
    END
    
    LISTBUTTON 03007, "", 156, 136, 124, 300
    BEGIN
        NAME "lbx_saf_stk_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02008, "Item Stocking Level:", 38, 160, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_stock_level"
    END
    
    LISTBUTTON 03008, "", 156, 157, 94, 300
    BEGIN
        NAME "lbx_stock_level"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02009, "Lead Time:", 91, 181, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lead_time"
    END
    INPUTN 03009, "", 156, 178, 64, 19
    BEGIN
        NAME "inn_lead_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Usage Quantity:", 60, 202, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_usage_qty"
    END
    INPUTN 03010, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_usage_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Usage Quantity:", 60, 223, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_usage_qty"
    END
    INPUTN 03011, "", 156, 220, 64, 19
    BEGIN
        NAME "inn_usage_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Safety Stock:", 80, 244, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_safety_stock"
    END
    INPUTN 03012, "", 156, 241, 64, 19
    BEGIN
        NAME "inn_safety_stock"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Safety Stock:", 80, 265, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_safety_stock"
    END
    INPUTN 03013, "", 156, 262, 64, 19
    BEGIN
        NAME "inn_safety_stock"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Order Point:", 82, 286, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_point"
    END
    INPUTN 03014, "", 156, 283, 64, 19
    BEGIN
        NAME "inn_order_point"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Order Point:", 82, 307, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_point"
    END
    INPUTN 03015, "", 156, 304, 64, 19
    BEGIN
        NAME "inn_order_point"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Economic Order Quantity:", 1, 328, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq"
    END
    INPUTN 03016, "", 156, 325, 64, 19
    BEGIN
        NAME "inn_eoq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Economic Order Quantity:", 1, 349, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq"
    END
    INPUTN 03017, "", 156, 346, 64, 19
    BEGIN
        NAME "inn_eoq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Unit Cost:", 95, 370, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03018, "", 156, 367, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

