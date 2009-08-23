//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARC_SALECODE - Salesperson Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0346 0123
BEGIN
    NAME "win_arc_salecode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de vendedor:", 30, 13, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 156, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    GROUPBOX 19003, "Adicional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_comm_rate"
    END
    
    STATICTEXT 02003, "Tasa de comisión:", 48, 76, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_rate"
    END
    INPUTN 03003, "", 156, 73, 56, 19
    BEGIN
        NAME "inn_comm_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "-##0.00%"
    END
END

