//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APE_ORDDATE - Invoice Entry Default Date
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0375 0100
BEGIN
    NAME "win_ape_orddate"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Usar fecha de la factura", 238, 10, 168, 19
    BEGIN
        NAME "cbx_use_inv_date"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Fecha contable predeterminada:", 49, 34, 188, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_acct_date"
    END
    
    INPUTD 03002, "", 240, 31, 85, 19
    BEGIN
        NAME "ind_def_acct_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 325, 31, 20, 19
    BEGIN
        NAME "tbnc_def_acct_date"
    END
END

