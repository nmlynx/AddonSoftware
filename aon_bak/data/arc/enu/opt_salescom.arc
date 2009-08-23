//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPT_SALESCOM - Sales Commission Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0228
BEGIN
    NAME "win_opt_salescom"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Salesperson Code:", 19, 13, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_slspsn_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_slspsn_code"
    END
    
    STATICTEXT 02002, "AR Invoice Number:", 12, 34, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no"
    END
    
    INPUTE 03002, "", 130, 31, 91, 19
    BEGIN
        NAME "ine_ar_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 02003, "Customer ID:", 50, 55, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03003, "", 130, 52, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04003, "", 216, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 190, 52, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02004, "Invoice Type:", 50, 76, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_type"
    END
    
    LISTBUTTON 03004, "", 130, 73, 70, 300
    BEGIN
        NAME "lbx_invoice_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Invoice Date:", 53, 97, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_date"
    END
    
    INPUTD 03005, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_invoice_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_invoice_date"
    END
    
    STATICTEXT 02006, "Commission Percent:", 3, 118, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_percent"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_comm_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Commission Amount:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_amt"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_comm_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Total Sales Amount:", 11, 160, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_sales"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Total Cost Amount:", 13, 181, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_cost"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

