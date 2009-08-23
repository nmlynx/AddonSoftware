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
    
    STATICTEXT 02001, "MTD Cash:", 65, 13, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cash"
    END
    INPUTN 03001, "", 130, 10, 64, 19
    BEGIN
        NAME "inn_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "MTD Cash Discount:", 9, 34, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_disc"
    END
    INPUTN 03002, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_mtd_csh_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "MTD Cash to GL:", 31, 55, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_csh_gl"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_mtd_csh_gl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Next MTD Cash:", 34, 76, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_mtd_cash"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cash"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Next MTD Cash Discount:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cash_ds"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_nmtd_cash_ds"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Next MTD Cash to GL:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_cashgl"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_nmtd_cashgl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

