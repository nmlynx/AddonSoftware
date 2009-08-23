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
    
    STATICTEXT 02001, "Totals Type:", 56, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_totals_type"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_totals_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Total Number:", 44, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_no"
    END
    
    INPUTE 03002, "", 130, 31, 39, 19
    BEGIN
        NAME "ine_total_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02003, "GL Report Update Sequence:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_updt_seq"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_gl_updt_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    STATICTEXT 02004, "Period Amount:", 36, 76, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Period Amount:", 36, 97, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Period Amount:", 36, 118, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Period Amount:", 36, 139, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Period Amount:", 36, 160, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Period Amount:", 36, 181, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Period Amount:", 36, 202, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Period Amount:", 36, 223, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Period Amount:", 36, 244, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Period Amount:", 36, 265, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Period Amount:", 36, 286, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Period Amount:", 36, 307, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03015, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Period Amount:", 36, 328, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Period Amount:", 36, 349, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_amt"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_period_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Period Units:", 53, 370, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Period Units:", 53, 391, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Period Units:", 53, 412, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03020, "", 130, 409, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Period Units:", 53, 433, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03021, "", 130, 430, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Period Units:", 53, 454, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03022, "", 130, 451, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Period Units:", 53, 475, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03023, "", 130, 472, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Period Units:", 53, 496, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03024, "", 130, 493, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Period Units:", 53, 517, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03025, "", 130, 514, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Period Units:", 53, 538, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03026, "", 130, 535, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Period Units:", 53, 559, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03027, "", 130, 556, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Period Units:", 53, 580, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03028, "", 130, 577, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Period Units:", 53, 601, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03029, "", 130, 598, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Period Units:", 53, 622, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03030, "", 130, 619, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Period Units:", 53, 643, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period_units"
    END
    INPUTN 03031, "", 130, 640, 64, 19
    BEGIN
        NAME "inn_period_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

