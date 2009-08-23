//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POE_ORDDET - Suggested Order Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0480
BEGIN
    NAME "win_poe_orddet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de comprador:", 20, 13, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_buyer_code"
    END
    
    INPUTE 03001, "", 156, 10, 39, 19
    BEGIN
        NAME "ine_buyer_code"
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
        NAME "dis_buyer_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 195, 10, 20, 19
    BEGIN
        NAME "tbnf_buyer_code"
    END
    
    STATICTEXT 02002, "ID del proveedor:", 52, 34, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03002, "", 156, 31, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04002, "", 260, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 234, 31, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02003, "Product Type:", 72, 55, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03003, "", 156, 52, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04003, "", 221, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 195, 52, 20, 19
    BEGIN
        NAME "tbnf_product_type"
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
    
    STATICTEXT 02005, "Warehouse ID:", 70, 97, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02006, "Item Stocking Level:", 38, 118, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_stock_level"
    END
    
    LISTBUTTON 03006, "", 156, 115, 94, 300
    BEGIN
        NAME "lbx_stock_level"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02007, "Usage Is Estimated:", 40, 139, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_usage_is_est"
    END
    
    INPUTE 03007, "", 156, 136, 35, 19
    BEGIN
        NAME "ine_usage_is_est"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02008, "Line Point [Calculated]:", 19, 160, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_point"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_line_point"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Order Point:", 82, 181, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_point"
    END
    INPUTN 03009, "", 156, 178, 64, 19
    BEGIN
        NAME "inn_order_point"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Available Quantity:", 43, 202, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03010, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Quantity On-Order:", 37, 223, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03011, "", 156, 220, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Economic Order Quantity:", 1, 244, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq"
    END
    INPUTN 03012, "", 156, 241, 64, 19
    BEGIN
        NAME "inn_eoq"
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
    
    STATICTEXT 02014, "Maximum Quantity:", 39, 286, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_maximum_qty"
    END
    INPUTN 03014, "", 156, 283, 64, 19
    BEGIN
        NAME "inn_maximum_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Lead Time:", 91, 307, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lead_time"
    END
    INPUTN 03015, "", 156, 304, 64, 19
    BEGIN
        NAME "inn_lead_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Weight:", 111, 328, 42, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_weight"
    END
    INPUTN 03016, "", 156, 325, 56, 19
    BEGIN
        NAME "inn_weight"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0.00"
    END
    
    STATICTEXT 02017, "Suggested Order Quantity:", 0, 349, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sugg_ord_qty"
    END
    INPUTN 03017, "", 156, 346, 64, 19
    BEGIN
        NAME "inn_sugg_ord_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Estimated Unit Cost:", 35, 370, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_est_unit_cst"
    END
    INPUTN 03018, "", 156, 367, 64, 19
    BEGIN
        NAME "inn_est_unit_cst"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Annual Usage Quantity:", 15, 391, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_annual_usage"
    END
    INPUTN 03019, "", 156, 388, 64, 19
    BEGIN
        NAME "inn_annual_usage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Average Usage:", 62, 412, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_usage"
    END
    INPUTN 03020, "", 156, 409, 64, 19
    BEGIN
        NAME "inn_avg_usage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###.0000"
    END
    
    STATICTEXT 02021, "Extended Amount:", 45, 433, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_extended_amt"
    END
    INPUTN 03021, "", 156, 430, 128, 19
    BEGIN
        NAME "inn_extended_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##############0-"
    END
END

