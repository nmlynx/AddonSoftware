//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SAW_CUSTOM12 - 12 Period Report Records
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0396
BEGIN
    NAME "win_saw_custom12"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Sales Analysis Sort Amount:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sort_amount"
    END
    
    INPUTE 03001, "", 156, 10, 208, 19
    BEGIN
        NAME "ine_sort_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
    
    STATICTEXT 02002, "ID del cliente:", 75, 34, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03002, "", 156, 31, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04002, "", 260, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 234, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
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
    
    STATICTEXT 02005, "Sales -Or- Quantity:", 35, 97, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Sales -Or- Quantity:", 35, 118, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Sales -Or- Quantity:", 35, 139, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Sales -Or- Quantity:", 35, 160, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Sales -Or- Quantity:", 35, 181, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03009, "", 156, 178, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Sales -Or- Quantity:", 35, 202, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03010, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Sales -Or- Quantity:", 35, 223, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03011, "", 156, 220, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Sales -Or- Quantity:", 35, 244, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03012, "", 156, 241, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Sales -Or- Quantity:", 35, 265, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03013, "", 156, 262, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Sales -Or- Quantity:", 35, 286, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03014, "", 156, 283, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Sales -Or- Quantity:", 35, 307, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03015, "", 156, 304, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Sales -Or- Quantity:", 35, 328, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03016, "", 156, 325, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Total Amount:", 70, 349, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_amount"
    END
    INPUTN 03017, "", 156, 346, 64, 19
    BEGIN
        NAME "inn_total_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

