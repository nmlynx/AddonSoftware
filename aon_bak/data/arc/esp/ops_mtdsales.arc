//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPS_MTDSALES - Month To Date Sales Totals
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0514 0249
BEGIN
    NAME "win_ops_mtdsales"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Ventas de MTD:", 63, 13, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_sales"
    END
    INPUTN 03001, "", 156, 10, 64, 19
    BEGIN
        NAME "inn_mtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "MTD Returns:", 74, 34, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_returns"
    END
    INPUTN 03002, "", 156, 31, 64, 19
    BEGIN
        NAME "inn_mtd_returns"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "MTD Tax:", 98, 55, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_tax"
    END
    INPUTN 03003, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_mtd_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "MTD Freight:", 79, 76, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_freight"
    END
    INPUTN 03004, "", 156, 73, 64, 19
    BEGIN
        NAME "inn_mtd_freight"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Costo de MTD:", 68, 97, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cost"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "MTD Discount:", 68, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_discount"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_mtd_discount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "MTD Cash Sales:", 58, 139, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_sale"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_mtd_csh_sale"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Efectivo de MTD:", 57, 160, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cash"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Descuento de efectivo de MTD:", 0, 181, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_disc"
    END
    INPUTN 03009, "", 156, 178, 64, 19
    BEGIN
        NAME "inn_mtd_csh_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Efectivo de MTD para el GL:", 0, 202, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_gl"
    END
    INPUTN 03010, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_mtd_csh_gl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Ventas de próximo MTD:", 273, 13, 144, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_sales"
    END
    INPUTN 03011, "", 420, 10, 64, 19
    BEGIN
        NAME "inn_nmtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Next MTD Returns:", 307, 34, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_returns"
    END
    INPUTN 03012, "", 420, 31, 64, 19
    BEGIN
        NAME "inn_nmtd_returns"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Next MTD Tax Amount:", 281, 55, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_tax"
    END
    INPUTN 03013, "", 420, 52, 64, 19
    BEGIN
        NAME "inn_nmtd_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Next MTD Freight:", 312, 76, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_frgt"
    END
    INPUTN 03014, "", 420, 73, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_frgt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Costo de próximo MTD:", 278, 97, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_cost"
    END
    INPUTN 03015, "", 420, 94, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Next MTD Discount:", 301, 118, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_disc"
    END
    INPUTN 03016, "", 420, 115, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Next MTD Cash Sales:", 291, 139, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cashsl"
    END
    INPUTN 03017, "", 420, 136, 64, 19
    BEGIN
        NAME "inn_nmtd_cashsl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Efectivo de próximo MTD:", 267, 160, 150, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_cash"
    END
    INPUTN 03018, "", 420, 157, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Descuento de efectivo de próximo MTD:", 183, 181, 234, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cash_ds"
    END
    INPUTN 03019, "", 420, 178, 64, 19
    BEGIN
        NAME "inn_nmtd_cash_ds"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Efectivo de próximo MTD para el GL:", 205, 202, 212, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cashgl"
    END
    INPUTN 03020, "", 420, 199, 64, 19
    BEGIN
        NAME "inn_nmtd_cashgl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

