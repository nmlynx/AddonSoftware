//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARU_CASHJOURNAL - Monthly Cash Receipts Purge
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0144
BEGIN
    NAME "win_aru_cashjournal"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning ID del cliente:", 14, 13, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 230, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 204, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Ending ID del cliente:", 31, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03002, "", 156, 31, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04002, "", 230, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 204, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02003, "Beginning Fecha de recibo:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receipt_date"
    END
    
    INPUTD 03003, "", 156, 52, 85, 19
    BEGIN
        NAME "ind_receipt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 241, 52, 20, 19
    BEGIN
        NAME "tbnc_receipt_date"
    END
    
    STATICTEXT 02004, "Ending Fecha de recibo:", 14, 76, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receipt_date"
    END
    
    INPUTD 03004, "", 156, 73, 85, 19
    BEGIN
        NAME "ind_receipt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 241, 73, 20, 19
    BEGIN
        NAME "tbnc_receipt_date"
    END
    
    STATICTEXT 02005, "Código de recibo de efectivo:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_rec_cd"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_cash_rec_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_cash_rec_cd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_cash_rec_cd"
    END
END

