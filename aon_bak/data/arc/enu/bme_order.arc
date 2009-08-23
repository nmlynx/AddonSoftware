//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// BME_ORDER - Sales Order Entry
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0147
BEGIN
    NAME "win_bme_order"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Production Date:", 30, 13, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prod_date"
    END
    
    INPUTD 03001, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_prod_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 215, 10, 20, 19
    BEGIN
        NAME "tbnc_prod_date"
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
    
    STATICTEXT 02003, "Sales Order Number:", 5, 55, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03003, "", 130, 52, 91, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02004, "Reference:", 66, 76, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bm_reference"
    END
    
    INPUTE 03004, "", 130, 73, 70, 19
    BEGIN
        NAME "ine_bm_reference"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    CHECKBOX 03005, "Update Flag", 128, 94, 99, 19
    BEGIN
        NAME "cbx_update_flag"
        NOT OPAQUE
    END
END

