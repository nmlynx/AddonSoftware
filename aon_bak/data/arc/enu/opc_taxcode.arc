//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPC_TAXCODE - Tax Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0554 0395
BEGIN
    NAME "win_opc_taxcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Tax Code:", 68, 13, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_tax_code"
    END
    
    INPUTE 03001, "", 130, 10, 130, 19
    BEGIN
        NAME "ine_op_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
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
    
    STATICTEXT 02003, "Tax Rate:", 74, 55, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "GL Account:", 56, 76, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03004, "", 130, 73, 130, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 286, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 260, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    CHECKBOX 03005, "Freight Taxable?", 128, 94, 126, 19
    BEGIN
        NAME "cbx_tax_frt_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Maximum Limit:", 35, 118, 92, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_max_limit"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_op_max_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Tax Code 01:", 49, 139, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_01"
    END
    
    INPUTE 03007, "", 130, 136, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02008, "Tax Code 02:", 49, 160, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_02"
    END
    
    INPUTE 03008, "", 130, 157, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02009, "Tax Code 03:", 49, 181, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_03"
    END
    
    INPUTE 03009, "", 130, 178, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02010, "Tax Code 04:", 49, 202, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_04"
    END
    
    INPUTE 03010, "", 130, 199, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02011, "Tax Code 05:", 49, 223, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_05"
    END
    
    INPUTE 03011, "", 130, 220, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02012, "Tax Code 06:", 49, 244, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_06"
    END
    
    INPUTE 03012, "", 130, 241, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02013, "Tax Code 07:", 49, 265, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_07"
    END
    
    INPUTE 03013, "", 130, 262, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02014, "Tax Code 08:", 49, 286, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_08"
    END
    
    INPUTE 03014, "", 130, 283, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02015, "Tax Code 09:", 49, 307, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_09"
    END
    
    INPUTE 03015, "", 130, 304, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02016, "Tax Code 10:", 49, 328, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_tot_code_10"
    END
    
    INPUTE 03016, "", 130, 325, 130, 19
    BEGIN
        NAME "ine_ar_tot_code_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    INPUTE 03017, "", 270, 136, 180, 19
    BEGIN
        NAME "ine_tax_desc_01"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03018, "", 270, 157, 180, 19
    BEGIN
        NAME "ine_tax_desc_02"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03019, "", 270, 178, 180, 19
    BEGIN
        NAME "ine_tax_desc_03"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03020, "", 270, 199, 180, 19
    BEGIN
        NAME "ine_tax_desc_04"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03021, "", 270, 220, 180, 19
    BEGIN
        NAME "ine_tax_desc_05"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03022, "", 270, 241, 180, 19
    BEGIN
        NAME "ine_tax_desc_06"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03023, "", 270, 262, 180, 19
    BEGIN
        NAME "ine_tax_desc_07"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03024, "", 270, 283, 180, 19
    BEGIN
        NAME "ine_tax_desc_08"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03025, "", 270, 304, 180, 19
    BEGIN
        NAME "ine_tax_desc_09"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    INPUTE 03026, "", 270, 325, 180, 19
    BEGIN
        NAME "ine_tax_desc_10"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02027, "Rate", 460, 118, 23, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_trat"
    END
    INPUTN 03028, "", 460, 136, 64, 19
    BEGIN
        NAME "inn_tax_rate_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03029, "", 460, 157, 64, 19
    BEGIN
        NAME "inn_tax_rate_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03030, "", 460, 178, 64, 19
    BEGIN
        NAME "inn_tax_rate_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03031, "", 460, 199, 64, 19
    BEGIN
        NAME "inn_tax_rate_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03032, "", 460, 220, 64, 19
    BEGIN
        NAME "inn_tax_rate_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03033, "", 460, 241, 64, 19
    BEGIN
        NAME "inn_tax_rate_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03034, "", 460, 262, 64, 19
    BEGIN
        NAME "inn_tax_rate_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03035, "", 460, 283, 64, 19
    BEGIN
        NAME "inn_tax_rate_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03036, "", 460, 304, 64, 19
    BEGIN
        NAME "inn_tax_rate_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03037, "", 460, 325, 64, 19
    BEGIN
        NAME "inn_tax_rate_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03038, "", 460, 346, 64, 19
    BEGIN
        NAME "inn_tax_total"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02039, "Total Tax Rate", 350, 349, 76, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_ttrt"
    END
END

