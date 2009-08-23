//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_MTDCASH - Month To Date Cash Totals
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0165
BEGIN
    NAME "win_ars_mtdcash"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Efectivo de MTD:", 57, 13, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cash"
    END
    INPUTN 03001, "", 156, 10, 64, 19
    BEGIN
        NAME "inn_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "Descuento de efectivo de MTD:", 0, 34, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_disc"
    END
    INPUTN 03002, "", 156, 31, 64, 19
    BEGIN
        NAME "inn_mtd_csh_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "Efectivo de MTD para el GL:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_gl"
    END
    INPUTN 03003, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_mtd_csh_gl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Efectivo de próximo MTD:", 3, 76, 150, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_cash"
    END
    INPUTN 03004, "", 156, 73, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Descuento de efectivo de próximo MTD:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cash_ds"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_nmtd_cash_ds"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Efectivo de próximo MTD para el GL:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cashgl"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_nmtd_cashgl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

