//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARE_DATECHANGE - Invoice Date Change Entry
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0186
BEGIN
    NAME "win_are_datechange"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Customer ID:", 50, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 130, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 216, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 190, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    GROUPBOX 19002, "Invoice Information ", -4, 34, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_ar_inv_no_ver"
    END
    
    STATICTEXT 02002, "Invoice Number:", 32, 55, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no_ver"
    END
    
    INPUTE 03002, "", 130, 52, 70, 19
    BEGIN
        NAME "ine_ar_inv_no_ver"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 04002, "", 226, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_inv_no_ver"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 200, 52, 20, 19
    BEGIN
        NAME "tbnf_ar_inv_no_ver"
    END
    
    STATICTEXT 02003, "Terms Code:", 53, 76, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03003, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04003, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02004, "Invoice Date:", 53, 97, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_date"
    END
    
    INPUTD 03004, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_invoice_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_invoice_date"
    END
    
    STATICTEXT 02005, "Invoice Due Date:", 26, 118, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_date"
    END
    
    INPUTD 03005, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_inv_due_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_inv_due_date"
    END
    
    STATICTEXT 02006, "Discount Due Date:", 15, 139, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_date"
    END
    
    INPUTD 03006, "", 130, 136, 85, 19
    BEGIN
        NAME "ind_disc_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 215, 136, 20, 19
    BEGIN
        NAME "tbnc_disc_date"
    END
    
    STATICTEXT 02007, "Invoice Amount:", 242, 118, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_amt"
    END
    INPUTN 03007, "", 340, 115, 56, 19
    BEGIN
        NAME "inn_invoice_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Discount Amount:", 231, 139, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03008, "", 340, 136, 56, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
END

