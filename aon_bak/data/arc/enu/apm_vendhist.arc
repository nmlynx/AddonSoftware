//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APM_VENDHIST - Vendor Codes and History
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0620 0417
BEGIN
    NAME "win_apm_vendhist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Vendor ID:", 66, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03001, "", 130, 10, 60, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    STATICTEXT 02002, "AP Type:", 77, 34, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_type"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_ap_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_ap_type"
    END
    
    GROUPBOX 19003, "Detail Information ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_ap_dist_code"
    END
    
    STATICTEXT 02003, "Distribution Code:", 20, 76, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_dist_code"
    END
    
    INPUTE 03003, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_ap_dist_code"
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
        NAME "dis_ap_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_ap_dist_code"
    END
    
    STATICTEXT 02004, "Payment Group:", 34, 97, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_payment_grp"
    END
    
    INPUTE 03004, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_payment_grp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_payment_grp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_payment_grp"
    END
    
    STATICTEXT 02005, "Terms Code:", 53, 118, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_terms_code"
    END
    
    INPUTE 03005, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_ap_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_ap_terms_code"
    END
    
    STATICTEXT 02006, "GL Account:", 56, 139, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03006, "", 130, 136, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 236, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 210, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    GROUPBOX 19007, "Purchase History Inquiry ", -4, 181, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_open_invs"
    END
    
    STATICTEXT 02007, "Open Invoices:", 41, 202, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_open_invs"
    END
    INPUTN 03007, "", 130, 199, 80, 19
    BEGIN
        NAME "inn_open_invs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Open Retention:", 33, 223, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_open_ret"
    END
    INPUTN 03008, "", 130, 220, 80, 19
    BEGIN
        NAME "inn_open_ret"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Last Invoice Date:", 25, 265, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstinv_date"
    END
    
    INPUTD 03009, "", 130, 262, 85, 19
    BEGIN
        NAME "ind_lstinv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02010, "Last Payment Date:", 17, 286, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstpay_date"
    END
    
    INPUTD 03010, "", 130, 283, 85, 19
    BEGIN
        NAME "ind_lstpay_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02011, "YTD-Purchases:", 33, 328, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ytd_purch"
    END
    INPUTN 03011, "", 130, 325, 80, 19
    BEGIN
        NAME "inn_ytd_purch"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Prior Year-Purchases:", 0, 349, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pyr_purch"
    END
    INPUTN 03012, "", 130, 346, 80, 19
    BEGIN
        NAME "inn_pyr_purch"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Next Year-Purchases:", 0, 370, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nyr_purch"
    END
    INPUTN 03013, "", 130, 367, 80, 19
    BEGIN
        NAME "inn_nyr_purch"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Disc:", 209, 328, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ytd_discs"
    END
    INPUTN 03014, "", 240, 325, 80, 19
    BEGIN
        NAME "inn_ytd_discs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Disc:", 209, 349, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_yr_discs"
    END
    INPUTN 03015, "", 240, 346, 80, 19
    BEGIN
        NAME "inn_pri_yr_discs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Disc:", 209, 370, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nyr_disc"
    END
    INPUTN 03016, "", 240, 367, 80, 19
    BEGIN
        NAME "inn_nyr_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Pmts:", 326, 328, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ytd_payments"
    END
    INPUTN 03017, "", 360, 325, 80, 19
    BEGIN
        NAME "inn_ytd_payments"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Pmts:", 326, 349, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pyr_payments"
    END
    INPUTN 03018, "", 360, 346, 80, 19
    BEGIN
        NAME "inn_pyr_payments"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Pmts:", 326, 370, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nyr_payments"
    END
    INPUTN 03019, "", 360, 367, 80, 19
    BEGIN
        NAME "inn_nyr_payments"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Cal Yr Pmts:", 437, 328, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_cal_pmts"
    END
    INPUTN 03020, "", 510, 325, 80, 19
    BEGIN
        NAME "inn_cur_cal_pmts"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Cal Yr Pmts:", 437, 349, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_cal_pmt"
    END
    INPUTN 03021, "", 510, 346, 80, 19
    BEGIN
        NAME "inn_pri_cal_pmt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Cal Yr Pmts:", 437, 370, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_cyr_pmts"
    END
    INPUTN 03022, "", 510, 367, 80, 19
    BEGIN
        NAME "inn_nxt_cyr_pmts"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
END

