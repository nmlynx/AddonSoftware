//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_ITEMSTATUS - Order Status Report By Item
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0186
BEGIN
    NAME "win_opr_itemstatus"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Product Type:", 46, 13, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    CHECKBOX 03002, "Open", 128, 31, 61, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03003, "Quoted?", 128, 52, 79, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "Backorders?", 128, 73, 101, 19
    BEGIN
        NAME "cbx_backorders"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Credit", 128, 94, 66, 19
    BEGIN
        NAME "cbx_credit"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Summary or Detail:", 16, 118, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summ_dtl"
    END
    
    LISTBUTTON 03006, "", 130, 115, 85, 300
    BEGIN
        NAME "lbx_summ_dtl"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02007, "Warehouse ID:", 44, 139, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03007, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04007, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
END

