//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_STOCK - Populate Stocking Info
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0454 0212
BEGIN
    NAME "win_ivm_stock"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ABC Analysis Code:", 13, 13, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_abc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Buyer Code:", 57, 34, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_buyer_code"
    END
    
    INPUTE 03002, "", 130, 31, 39, 19
    BEGIN
        NAME "ine_buyer_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04002, "", 195, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_buyer_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 169, 31, 20, 19
    BEGIN
        NAME "tbnf_buyer_code"
    END
    
    STATICTEXT 02003, "Vendor ID:", 66, 55, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03003, "", 130, 52, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04003, "", 234, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 208, 52, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02004, "Lead Time:", 65, 76, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lead_time"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_lead_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Maximum Quantity:", 13, 97, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_maximum_qty"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_maximum_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Order Point:", 56, 118, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_point"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_order_point"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Order Point Code:", 192, 118, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_pnt_code"
    END
    
    LISTBUTTON 03007, "", 300, 115, 124, 300
    BEGIN
        NAME "lbx_ord_pnt_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02008, "Economic Order Quantity:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq"
    END
    INPUTN 03008, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_eoq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "EOQ Code:", 234, 139, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq_code"
    END
    
    LISTBUTTON 03009, "", 300, 136, 124, 300
    BEGIN
        NAME "lbx_eoq_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02010, "Safety Stock:", 54, 160, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_safety_stock"
    END
    INPUTN 03010, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_safety_stock"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Safety Stock Code:", 190, 160, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_saf_stk_code"
    END
    
    LISTBUTTON 03011, "", 300, 157, 124, 300
    BEGIN
        NAME "lbx_saf_stk_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

