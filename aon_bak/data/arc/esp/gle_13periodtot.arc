//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLE_13PERIODTOT - 13 Period Report Totals
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0690
BEGIN
    NAME "win_gle_13periodtot"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Tipo de totales:", 63, 13, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_totals_type"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_totals_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Número de total:", 56, 34, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_no"
    END
    
    INPUTE 03002, "", 156, 31, 39, 19
    BEGIN
        NAME "ine_total_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02003, "Secuencia de actualización de informe del GL:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_updt_seq"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_gl_updt_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    STATICTEXT 02004, "Monto del período:", 42, 76, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03004, "", 156, 73, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Monto del período:", 42, 97, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Monto del período:", 42, 118, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Monto del período:", 42, 139, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Monto del período:", 42, 160, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Monto del período:", 42, 181, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03009, "", 156, 178, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Monto del período:", 42, 202, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03010, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Monto del período:", 42, 223, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03011, "", 156, 220, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Monto del período:", 42, 244, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03012, "", 156, 241, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Monto del período:", 42, 265, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03013, "", 156, 262, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Monto del período:", 42, 286, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03014, "", 156, 283, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Monto del período:", 42, 307, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03015, "", 156, 304, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Monto del período:", 42, 328, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03016, "", 156, 325, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Monto del período:", 42, 349, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03017, "", 156, 346, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Unidades del período:", 25, 370, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03018, "", 156, 367, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Unidades del período:", 25, 391, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03019, "", 156, 388, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Unidades del período:", 25, 412, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03020, "", 156, 409, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Unidades del período:", 25, 433, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03021, "", 156, 430, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Unidades del período:", 25, 454, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03022, "", 156, 451, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Unidades del período:", 25, 475, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03023, "", 156, 472, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Unidades del período:", 25, 496, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03024, "", 156, 493, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Unidades del período:", 25, 517, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03025, "", 156, 514, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Unidades del período:", 25, 538, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03026, "", 156, 535, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Unidades del período:", 25, 559, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03027, "", 156, 556, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Unidades del período:", 25, 580, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03028, "", 156, 577, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Unidades del período:", 25, 601, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03029, "", 156, 598, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Unidades del período:", 25, 622, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03030, "", 156, 619, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Unidades del período:", 25, 643, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03031, "", 156, 640, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

