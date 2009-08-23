//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_SHIPPINGR - Shipping Schedule Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0228
BEGIN
    NAME "win_opr_shippingr"
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
    
    STATICTEXT 02002, "Product Type:", 72, 34, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03002, "", 156, 31, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04002, "", 221, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 195, 31, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    CHECKBOX 03003, "Open?", 154, 52, 67, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "Quoted?", 154, 73, 79, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Backorders?", 154, 94, 101, 19
    BEGIN
        NAME "cbx_backorders"
        NOT OPAQUE
    END
    
    CHECKBOX 03006, "Credit", 154, 115, 66, 19
    BEGIN
        NAME "cbx_credit"
        NOT OPAQUE
    END
    
    STATICTEXT 02007, "Resumen o detalle:", 43, 139, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summ_dtl"
    END
    
    LISTBUTTON 03007, "", 156, 136, 84, 300
    BEGIN
        NAME "lbx_summ_dtl"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02008, "Fecha de antigüedad:", 29, 160, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_date"
    END
    
    INPUTD 03008, "", 156, 157, 85, 19
    BEGIN
        NAME "ind_aging_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21008, "", 241, 157, 20, 19
    BEGIN
        NAME "tbnc_aging_date"
    END
    
    STATICTEXT 02009, "Days:", 122, 181, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_mth"
    END
    
    INPUTE 03009, "", 156, 178, 35, 19
    BEGIN
        NAME "ine_days_in_mth"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
END

