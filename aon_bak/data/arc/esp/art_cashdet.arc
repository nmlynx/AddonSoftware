//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ART_CASHDET - Cash Receipts History Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0186
BEGIN
    NAME "win_art_cashdet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del cliente:", 75, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 260, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 234, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Fecha de recibo:", 58, 34, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receipt_date"
    END
    
    INPUTD 03002, "", 156, 31, 85, 19
    BEGIN
        NAME "ind_receipt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 241, 31, 20, 19
    BEGIN
        NAME "tbnc_receipt_date"
    END
    
    STATICTEXT 02003, "Código de recibo de efectivo:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_rec_cd"
    END
    
    INPUTE 03003, "", 156, 52, 39, 19
    BEGIN
        NAME "ine_cash_rec_cd"
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
        NAME "dis_cash_rec_cd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 195, 52, 20, 19
    BEGIN
        NAME "tbnf_cash_rec_cd"
    END
    
    STATICTEXT 02004, "Número de cheque:", 39, 76, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_check_no"
    END
    
    INPUTE 03004, "", 156, 73, 91, 19
    BEGIN
        NAME "ine_ar_check_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02005, "Número de factura de AR:", 3, 97, 150, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no"
    END
    
    INPUTE 03005, "", 156, 94, 91, 19
    BEGIN
        NAME "ine_ar_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 02006, "Efectivo aplicado:", 51, 118, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_apply_amt"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_apply_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Monto de descuento:", 30, 139, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

