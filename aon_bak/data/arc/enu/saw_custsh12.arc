//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SAW_CUSTSH12 - 12 Period Report Records
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0396
BEGIN
    NAME "win_saw_custsh12"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Sales Analysis Sort Amount:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sort_amount"
    END
    
    INPUTE 03001, "", 130, 10, 208, 19
    BEGIN
        NAME "ine_sort_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
    
    STATICTEXT 02002, "Customer ID:", 50, 34, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03002, "", 130, 31, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04002, "", 234, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 208, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02003, "Customer Ship-To Number:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_no"
    END
    
    INPUTE 03003, "", 130, 52, 78, 19
    BEGIN
        NAME "ine_shipto_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000"
    END
    
    STATICTEXT 02004, "Inventory Item ID:", 24, 76, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03004, "", 130, 73, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 416, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 390, 73, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02005, "Sales -Or- Quantity:", 9, 97, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Sales -Or- Quantity:", 9, 118, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Sales -Or- Quantity:", 9, 139, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Sales -Or- Quantity:", 9, 160, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Sales -Or- Quantity:", 9, 181, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Sales -Or- Quantity:", 9, 202, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Sales -Or- Quantity:", 9, 223, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Sales -Or- Quantity:", 9, 244, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Sales -Or- Quantity:", 9, 265, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Sales -Or- Quantity:", 9, 286, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Sales -Or- Quantity:", 9, 307, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03015, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Sales -Or- Quantity:", 9, 328, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_qnty"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_sales_qnty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Total Amount:", 44, 349, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_amount"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_total_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

