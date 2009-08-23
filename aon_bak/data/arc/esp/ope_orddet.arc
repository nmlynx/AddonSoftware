//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPE_ORDDET - Order/Invoice Entry Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0438
BEGIN
    NAME "win_ope_orddet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Line Code:", 80, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_code"
    END
    
    LISTBUTTON 03001, "", 144, 10, 35, 300
    BEGIN
        NAME "lbx_line_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Warehouse ID:", 58, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03002, "", 144, 31, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 205, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 179, 31, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02003, "Inventory Item ID:", 38, 55, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03003, "", 144, 52, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 330, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 304, 52, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02004, "Memo / Non-Stock Description:", 0, 76, 141, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_memo"
    END
    
    INPUTE 03004, "", 144, 73, 200, 19
    BEGIN
        NAME "ine_order_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    CHECKBOX 03005, "Committed?", 142, 94, 100, 19
    BEGIN
        NAME "cbx_commit_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "ID del proveedor:", 40, 118, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03006, "", 144, 115, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04006, "", 218, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 192, 115, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02007, "Estimated Ship Date:", 23, 139, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_est_shp_date"
    END
    
    INPUTD 03007, "", 144, 136, 85, 19
    BEGIN
        NAME "ind_est_shp_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 229, 136, 20, 19
    BEGIN
        NAME "tbnc_est_shp_date"
    END
    
    STATICTEXT 02008, "Unit Cost:", 83, 160, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03008, "", 144, 157, 70, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Quantity Ordered:", 35, 181, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_ordered"
    END
    INPUTN 03009, "", 144, 178, 56, 19
    BEGIN
        NAME "inn_qty_ordered"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Unit Price:", 82, 202, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_price"
    END
    INPUTN 03010, "", 144, 199, 56, 19
    BEGIN
        NAME "inn_unit_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Back-Order Quantity:", 16, 223, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_backord"
    END
    INPUTN 03011, "", 144, 220, 56, 19
    BEGIN
        NAME "inn_qty_backord"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Quantity Shipped:", 37, 244, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03012, "", 144, 241, 56, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Standard List Price:", 29, 265, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_std_list_prc"
    END
    INPUTN 03013, "", 144, 262, 56, 19
    BEGIN
        NAME "inn_std_list_prc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Precio extendido:", 39, 286, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ext_price"
    END
    INPUTN 03014, "", 144, 283, 56, 19
    BEGIN
        NAME "inn_ext_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Monto imponible:", 39, 307, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_taxable_amt"
    END
    INPUTN 03015, "", 144, 304, 56, 19
    BEGIN
        NAME "inn_taxable_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Porcentaje de descuento:", 0, 328, 141, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_percent"
    END
    INPUTN 03016, "", 144, 325, 56, 19
    BEGIN
        NAME "inn_disc_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0.00#-"
    END
    
    STATICTEXT 02017, "Commission Percent:", 17, 349, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_percent"
    END
    INPUTN 03017, "", 144, 346, 56, 19
    BEGIN
        NAME "inn_comm_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Commission Amount:", 14, 370, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_amt"
    END
    INPUTN 03018, "", 144, 367, 56, 19
    BEGIN
        NAME "inn_comm_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Comm Split %:", 60, 391, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_spl_comm_pct"
    END
    INPUTN 03019, "", 144, 388, 56, 19
    BEGIN
        NAME "inn_spl_comm_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

