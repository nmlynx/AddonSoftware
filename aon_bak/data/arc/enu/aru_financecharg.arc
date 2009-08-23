//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARU_FINANCECHARG - Generate Finance Charges
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0186
BEGIN
    NAME "win_aru_financecharg"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Finance Charge Date:", 43, 13, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_date"
    END
    
    INPUTD 03001, "", 170, 10, 85, 19
    BEGIN
        NAME "ind_invoice_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 255, 10, 20, 19
    BEGIN
        NAME "tbnc_invoice_date"
    END
    
    STATICTEXT 02002, "Days Overdue:", 82, 34, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_integer"
    END
    INPUTN 03002, "", 170, 31, 49, 19
    BEGIN
        NAME "inn_pick_integer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "-#####0"
    END
    
    STATICTEXT 02003, "Minimum Past Due Amount:", 6, 55, 161, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pastdue_amt"
    END
    INPUTN 03003, "", 170, 52, 56, 19
    BEGIN
        NAME "inn_pastdue_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Finance Charge Percentage:", 5, 76, 162, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_percentage"
    END
    INPUTN 03004, "", 170, 73, 49, 19
    BEGIN
        NAME "inn_percentage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0.00"
    END
    
    STATICTEXT 02005, "Minimum Finance Charge Amount:", 0, 97, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_minimum_amt"
    END
    INPUTN 03005, "", 170, 94, 56, 19
    BEGIN
        NAME "inn_minimum_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Distribution Code:", 60, 118, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03006, "", 170, 115, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04006, "", 231, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 205, 115, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02007, "Terms Code:", 93, 139, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03007, "", 170, 136, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04007, "", 231, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 205, 136, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
END

