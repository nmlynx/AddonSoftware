//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SAM_NONSTOCK - Product/Non-Stock Item Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0417
BEGIN
    NAME "win_sam_nonstock"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Year:", 98, 13, 29, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_year"
    END
    
    INPUTE 03001, "", 130, 10, 40, 19
    BEGIN
        NAME "ine_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Product Type:", 46, 34, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02003, "Non-Stock Item Number:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nonstock_no"
    END
    
    INPUTE 03003, "", 130, 52, 400, 19
    BEGIN
        NAME "ine_nonstock_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02004, "Units", 130, 76, 28, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_unit"
    END
    
    STATICTEXT 02005, "Period 01:", 68, 97, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03005, "", 130, 94, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Period 02:", 68, 118, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03006, "", 130, 115, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Period 03:", 68, 139, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03007, "", 130, 136, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Period 04:", 68, 160, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03008, "", 130, 157, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Period 05:", 68, 181, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03009, "", 130, 178, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Period 06:", 68, 202, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03010, "", 130, 199, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Period 07:", 68, 223, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03011, "", 130, 220, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Period 08:", 68, 244, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03012, "", 130, 241, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Period 09:", 68, 265, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03013, "", 130, 262, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Period 10:", 68, 286, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03014, "", 130, 283, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Period 11:", 68, 307, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03015, "", 130, 304, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Period 12:", 68, 328, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03016, "", 130, 325, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Period 13:", 68, 349, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03017, "", 130, 346, 80, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Cost", 220, 76, 25, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_cost"
    END
    INPUTN 03019, "", 220, 94, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03020, "", 220, 115, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03021, "", 220, 136, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03022, "", 220, 157, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03023, "", 220, 178, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03024, "", 220, 199, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03025, "", 220, 220, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03026, "", 220, 241, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03027, "", 220, 262, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03028, "", 220, 283, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03029, "", 220, 304, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03030, "", 220, 325, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03031, "", 220, 346, 80, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Sales", 310, 76, 27, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_sls"
    END
    INPUTN 03033, "", 310, 94, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03034, "", 310, 115, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03035, "", 310, 136, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03036, "", 310, 157, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03037, "", 310, 178, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03038, "", 310, 199, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03039, "", 310, 220, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03040, "", 310, 241, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03041, "", 310, 262, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03042, "", 310, 283, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03043, "", 310, 304, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03044, "", 310, 325, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03045, "", 310, 346, 80, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02046, "Totals:", 88, 370, 39, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tqty"
    END
    INPUTN 03046, "", 130, 367, 80, 19
    BEGIN
        NAME "inn_tqty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03047, "", 220, 367, 80, 19
    BEGIN
        NAME "inn_tcst"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03048, "", 310, 367, 80, 19
    BEGIN
        NAME "inn_tsls"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
END

