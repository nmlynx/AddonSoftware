//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRC_TAXTABLE - Tax Table
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0494 0417
BEGIN
    NAME "win_prc_taxtable"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Payroll Tax Table Code:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_tbl_code"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_tax_tbl_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 130, 31, 200, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    GROUPBOX 19003, "Additional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_low_inc_lim"
    END
    
    STATICTEXT 02003, "Low Income Limit:", 23, 76, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_low_inc_lim"
    END
    INPUTN 03003, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_low_inc_lim"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Standard Deduction:", 8, 97, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_std_deduct"
    END
    INPUTN 03004, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_std_deduct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Itemized Deduction:", 11, 118, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_itemized_ded"
    END
    INPUTN 03005, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_itemized_ded"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    GROUPBOX 19006, "Tax Level ", -4, 139, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_earnings_lev"
    END
    
    STATICTEXT 02006, "Earnings Level:", 39, 160, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03006, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Earnings Level:", 39, 181, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03007, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Earnings Level:", 39, 202, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03008, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Earnings Level:", 39, 223, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03009, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Earnings Level:", 39, 244, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03010, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Earnings Level:", 39, 265, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03011, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Earnings Level:", 39, 286, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03012, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Earnings Level:", 39, 307, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03013, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Earnings Level:", 39, 328, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03014, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Earnings Level:", 39, 349, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03015, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Earnings Level:", 39, 370, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_earnings_lev"
    END
    INPUTN 03016, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_earnings_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Tax:", 222, 160, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03017, "", 250, 157, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Tax:", 222, 181, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03018, "", 250, 178, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Tax:", 222, 202, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03019, "", 250, 199, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Tax:", 222, 223, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03020, "", 250, 220, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Tax:", 222, 244, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03021, "", 250, 241, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Tax:", 222, 265, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03022, "", 250, 262, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Tax:", 222, 286, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03023, "", 250, 283, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Tax:", 222, 307, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03024, "", 250, 304, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Tax:", 222, 328, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03025, "", 250, 325, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Tax:", 222, 349, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03026, "", 250, 346, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Tax:", 222, 370, 25, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03027, "", 250, 367, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Percent:", 350, 160, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03028, "", 400, 157, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Percent:", 350, 181, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03029, "", 400, 178, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Percent:", 350, 202, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03030, "", 400, 199, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Percent:", 350, 223, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03031, "", 400, 220, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Percent:", 350, 244, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03032, "", 400, 241, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Percent:", 350, 265, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03033, "", 400, 262, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Percent:", 350, 286, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03034, "", 400, 283, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02035, "Percent:", 350, 307, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03035, "", 400, 304, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02036, "Percent:", 350, 328, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03036, "", 400, 325, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02037, "Percent:", 350, 349, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03037, "", 400, 346, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02038, "Percent:", 350, 370, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addtl_pctage"
    END
    INPUTN 03038, "", 400, 367, 64, 19
    BEGIN
        NAME "inn_addtl_pctage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

