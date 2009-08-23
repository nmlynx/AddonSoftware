//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_CUSTDFLT - New Customer Defaults
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0189
BEGIN
    NAME "win_ars_custdflt"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Sales Discount Code:", 4, 13, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_disc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04001, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_disc_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_disc_code"
    END
    
    STATICTEXT 02002, "Territory Code:", 37, 34, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_territory"
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
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02003, "Salesperson Code:", 19, 55, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04003, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_slspsn_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_slspsn_code"
    END
    
    STATICTEXT 02004, "Tax Code:", 68, 76, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02005, "Terms Code:", 53, 97, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02006, "Distribution Code:", 20, 118, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04006, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    CHECKBOX 03007, "Cust Invoice Detail History", 128, 136, 185, 19
    BEGIN
        NAME "cbx_customer_inv_his"
        NOT OPAQUE
    END
END

