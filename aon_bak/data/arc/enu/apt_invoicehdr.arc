//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APT_INVOICEHDR - Invoice Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0483
BEGIN
    NAME "win_apt_invoicehdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "AP Type:", 77, 13, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_type"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_ap_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_ap_type"
    END
    
    STATICTEXT 02002, "Vendor ID:", 66, 34, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03002, "", 130, 31, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04002, "", 234, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 208, 31, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02003, "AP Invoice Number:", 13, 55, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_inv_no"
    END
    
    INPUTE 03003, "", 130, 52, 130, 19
    BEGIN
        NAME "ine_ap_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02004, "0:", 116, 76, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_00"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_sequence_00"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02005, "Distribution Code:", 20, 97, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_dist_code"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_ap_dist_code"
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
        NAME "dis_ap_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_ap_dist_code"
    END
    
    STATICTEXT 02006, "Payment Group:", 34, 118, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_payment_grp"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_payment_grp"
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
        NAME "dis_payment_grp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_payment_grp"
    END
    
    STATICTEXT 02007, "Terms Code:", 53, 139, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_terms_code"
    END
    
    INPUTE 03007, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_ap_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04007, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_ap_terms_code"
    END
    
    STATICTEXT 02008, "Reference:", 66, 160, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reference"
    END
    
    INPUTE 03008, "", 130, 157, 100, 19
    BEGIN
        NAME "ine_reference"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02009, "AP Invoice Memo:", 25, 181, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_inv_memo"
    END
    
    INPUTE 03009, "", 130, 178, 160, 19
    BEGIN
        NAME "ine_ap_inv_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    CHECKBOX 03010, "Hold For Manual Release?", 128, 199, 178, 19
    BEGIN
        NAME "cbx_hold_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02011, "MC Invoice Flag:", 33, 223, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mc_inv_flag"
    END
    
    INPUTE 03011, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_mc_inv_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02012, "MC Invoice Adjustment Flag:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mc_inv_adj"
    END
    
    INPUTE 03012, "", 130, 241, 35, 19
    BEGIN
        NAME "ine_mc_inv_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02013, "MC Invoice Reversal Flag:", 0, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mc_inv_rev"
    END
    
    INPUTE 03013, "", 130, 262, 35, 19
    BEGIN
        NAME "ine_mc_inv_rev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02014, "Invoice Date:", 53, 286, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_date"
    END
    
    INPUTD 03014, "", 130, 283, 85, 19
    BEGIN
        NAME "ind_invoice_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21014, "", 215, 283, 20, 19
    BEGIN
        NAME "tbnc_invoice_date"
    END
    
    STATICTEXT 02015, "Accounting Date:", 26, 307, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_accting_date"
    END
    
    INPUTD 03015, "", 130, 304, 85, 19
    BEGIN
        NAME "ind_accting_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 215, 304, 20, 19
    BEGIN
        NAME "tbnc_accting_date"
    END
    
    STATICTEXT 02016, "Invoice Due Date:", 26, 328, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_date"
    END
    
    INPUTD 03016, "", 130, 325, 85, 19
    BEGIN
        NAME "ind_inv_due_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21016, "", 215, 325, 20, 19
    BEGIN
        NAME "tbnc_inv_due_date"
    END
    
    STATICTEXT 02017, "Discount Date:", 42, 349, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_date"
    END
    
    INPUTD 03017, "", 130, 346, 85, 19
    BEGIN
        NAME "ind_disc_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21017, "", 215, 346, 20, 19
    BEGIN
        NAME "tbnc_disc_date"
    END
    
    STATICTEXT 02018, "Invoice Amount:", 32, 370, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_amt"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_invoice_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Discount Amount:", 21, 391, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Retention Amount:", 17, 412, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_retention"
    END
    INPUTN 03020, "", 130, 409, 64, 19
    BEGIN
        NAME "inn_retention"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03021, "selected", 128, 430, 78, 19
    BEGIN
        NAME "cbx_selected_for_pay"
        NOT OPAQUE
    END
END

