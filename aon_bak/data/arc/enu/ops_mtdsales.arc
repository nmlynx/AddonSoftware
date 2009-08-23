//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPS_MTDSALES - Month To Date Sales Totals
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0444 0249
BEGIN
    NAME "win_ops_mtdsales"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "MTD Sales:", 65, 13, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_sales"
    END
    INPUTN 03001, "", 130, 10, 64, 19
    BEGIN
        NAME "inn_mtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "MTD Returns:", 48, 34, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_returns"
    END
    INPUTN 03002, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_mtd_returns"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "MTD Tax:", 72, 55, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_tax"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_mtd_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "MTD Freight:", 53, 76, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_freight"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_mtd_freight"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "MTD Cost:", 67, 97, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cost"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "MTD Discount:", 42, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_discount"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_mtd_discount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "MTD Cash Sales:", 32, 139, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_sale"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_mtd_csh_sale"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "MTD Cash:", 65, 160, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cash"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "MTD Cash Discount:", 9, 181, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_disc"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_mtd_csh_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "MTD Cash to GL:", 31, 202, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_gl"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_mtd_csh_gl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Next MTD Sales:", 254, 13, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_sales"
    END
    INPUTN 03011, "", 350, 10, 64, 19
    BEGIN
        NAME "inn_nmtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Next MTD Returns:", 237, 34, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_returns"
    END
    INPUTN 03012, "", 350, 31, 64, 19
    BEGIN
        NAME "inn_nmtd_returns"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Next MTD Tax Amount:", 211, 55, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_tax"
    END
    INPUTN 03013, "", 350, 52, 64, 19
    BEGIN
        NAME "inn_nmtd_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Next MTD Freight:", 242, 76, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_frgt"
    END
    INPUTN 03014, "", 350, 73, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_frgt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Next MTD Cost:", 256, 97, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_cost"
    END
    INPUTN 03015, "", 350, 94, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Next MTD Discount:", 231, 118, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_disc"
    END
    INPUTN 03016, "", 350, 115, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Next MTD Cash Sales:", 221, 139, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cashsl"
    END
    INPUTN 03017, "", 350, 136, 64, 19
    BEGIN
        NAME "inn_nmtd_cashsl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Next MTD Cash:", 254, 160, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_cash"
    END
    INPUTN 03018, "", 350, 157, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Next MTD Cash Discount:", 198, 181, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cash_ds"
    END
    INPUTN 03019, "", 350, 178, 64, 19
    BEGIN
        NAME "inn_nmtd_cash_ds"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Next MTD Cash to GL:", 220, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cashgl"
    END
    INPUTN 03020, "", 350, 199, 64, 19
    BEGIN
        NAME "inn_nmtd_cashgl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

