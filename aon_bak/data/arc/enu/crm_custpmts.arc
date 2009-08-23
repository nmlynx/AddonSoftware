//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// CRM_CUSTPMTS - Customer Payment Summary
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0456 0311
BEGIN
    NAME "win_crm_custpmts"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Customer ID:", 70, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 150, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 236, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 210, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Last Invoice Date:", 45, 34, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstinv_date"
    END
    
    INPUTD 03002, "", 150, 31, 85, 19
    BEGIN
        NAME "ind_lstinv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02003, "Last Payment Date:", 37, 55, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstpay_date"
    END
    
    INPUTD 03003, "", 150, 52, 85, 19
    BEGIN
        NAME "ind_lstpay_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02004, "Average Days to Pay:", 245, -71, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days"
    END
    INPUTN 03004, "", 370, -74, 56, 19
    BEGIN
        NAME "inn_avg_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Sales:", 304, -50, 33, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_sales"
    END
    INPUTN 03005, "", 340, -53, 64, 19
    BEGIN
        NAME "inn_mtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    TOOLBUTTON 22005, "", 404, -53, 20, 19
    BEGIN
        NAME "tbnd_mtd_sales"
    END
    INPUTN 03006, "", 310, -32, 64, 19
    BEGIN
        NAME "inn_ytd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03007, "", 300, -11, 64, 19
    BEGIN
        NAME "inn_pyr_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03008, "", 300, 10, 64, 19
    BEGIN
        NAME "inn_nmtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Cost:", 267, 34, 30, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cost"
    END
    INPUTN 03009, "", 300, 31, 64, 19
    BEGIN
        NAME "inn_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03010, "", 300, 52, 64, 19
    BEGIN
        NAME "inn_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03011, "", 300, 73, 64, 19
    BEGIN
        NAME "inn_pri_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03012, "", 300, 94, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Avg Days to Pay:", 201, 118, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days_mtd"
    END
    INPUTN 03013, "", 300, 115, 64, 19
    BEGIN
        NAME "inn_avg_days_mtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03014, "", 300, 136, 64, 19
    BEGIN
        NAME "inn_avg_days_ytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03015, "", 300, 157, 64, 19
    BEGIN
        NAME "inn_avg_dtp_pytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03016, "", 300, 178, 64, 19
    BEGIN
        NAME "inn_avg_dtp_nmtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02017, "High Credit:", 227, 202, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_high_crd"
    END
    INPUTN 03017, "", 300, 199, 64, 19
    BEGIN
        NAME "inn_mtd_high_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03018, "", 300, 220, 64, 19
    BEGIN
        NAME "inn_ytd_hi_cred"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03019, "", 300, 241, 64, 19
    BEGIN
        NAME "inn_pyr_hi_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03020, "", 300, 262, 64, 19
    BEGIN
        NAME "inn_nmtd_high_cr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
END

