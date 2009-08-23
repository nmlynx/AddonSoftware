//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ART_CASHDET - Cash Receipts History Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0186
BEGIN
    NAME "win_art_cashdet"
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
    
    INPUTE 03001, "", 130, 10, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 234, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 208, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Receipt Date:", 52, 34, 75, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receipt_date"
    END
    
    INPUTD 03002, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_receipt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_receipt_date"
    END
    
    STATICTEXT 02003, "Cash Receipt Code:", 14, 55, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_rec_cd"
    END
    
    INPUTE 03003, "", 130, 52, 39, 19
    BEGIN
        NAME "ine_cash_rec_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04003, "", 195, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_cash_rec_cd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 169, 52, 20, 19
    BEGIN
        NAME "tbnf_cash_rec_cd"
    END
    
    STATICTEXT 02004, "Check Number:", 37, 76, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_check_no"
    END
    
    INPUTE 03004, "", 130, 73, 91, 19
    BEGIN
        NAME "ine_ar_check_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02005, "AR Invoice Number:", 12, 97, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no"
    END
    
    INPUTE 03005, "", 130, 94, 91, 19
    BEGIN
        NAME "ine_ar_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 02006, "Cash Applied:", 46, 118, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_apply_amt"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_apply_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Discount Amount:", 21, 139, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

