//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARM_CUSTPMTS - Customer Payment Summary
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0562 0332
BEGIN
    NAME "win_arm_custpmts"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del cliente:", 99, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 180, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 266, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 240, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Fecha de última factura:", 38, 55, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstinv_date"
    END
    
    INPUTD 03002, "", 180, 52, 85, 19
    BEGIN
        NAME "ind_lstinv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 265, 52, 20, 19
    BEGIN
        NAME "tbnc_lstinv_date"
    END
    
    STATICTEXT 02003, "Fecha de último pago:", 49, 76, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstpay_date"
    END
    
    INPUTD 03003, "", 180, 73, 85, 19
    BEGIN
        NAME "ind_lstpay_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 265, 73, 20, 19
    BEGIN
        NAME "tbnc_lstpay_date"
    END
    
    STATICTEXT 02004, "Plazo promedio de pago en días:", 275, -50, 190, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days"
    END
    INPUTN 03004, "", 468, -53, 56, 19
    BEGIN
        NAME "inn_avg_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Ventas MTD:", 393, -29, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_sales"
    END
    INPUTN 03005, "", 468, -32, 64, 19
    BEGIN
        NAME "inn_mtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03006, "", 468, -11, 64, 19
    BEGIN
        NAME "inn_ytd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03007, "", 468, 10, 64, 19
    BEGIN
        NAME "inn_pyr_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03008, "", 468, 31, 64, 19
    BEGIN
        NAME "inn_nmtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Costo MTD:", 397, 55, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cost"
    END
    INPUTN 03009, "", 468, 52, 64, 19
    BEGIN
        NAME "inn_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03010, "", 468, 73, 64, 19
    BEGIN
        NAME "inn_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03011, "", 468, 94, 64, 19
    BEGIN
        NAME "inn_pri_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03012, "", 468, 115, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Plazo prom. de pago en días MTD:", 267, 139, 198, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days_mtd"
    END
    INPUTN 03013, "", 468, 136, 64, 19
    BEGIN
        NAME "inn_avg_days_mtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03014, "", 468, 157, 64, 19
    BEGIN
        NAME "inn_avg_days_ytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03015, "", 468, 178, 64, 19
    BEGIN
        NAME "inn_avg_dtp_pytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03016, "", 468, 199, 64, 19
    BEGIN
        NAME "inn_avg_dtp_nmtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Crédito máximo MTD:", 338, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_high_crd"
    END
    INPUTN 03017, "", 468, 220, 64, 19
    BEGIN
        NAME "inn_mtd_high_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03018, "", 468, 241, 64, 19
    BEGIN
        NAME "inn_ytd_hi_cred"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03019, "", 468, 262, 64, 19
    BEGIN
        NAME "inn_pyr_hi_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03020, "", 468, 283, 64, 19
    BEGIN
        NAME "inn_nmtd_high_cr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

