//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED1F - Final Record 1F
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0186
BEGIN
    NAME "win_prs_magmed1f"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 Number of Employees:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_no_empl"
    END
    
    INPUTE 03001, "", 130, 10, 70, 19
    BEGIN
        NAME "ine_w2_no_empl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "W2 SS Wages:", 49, 34, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_wage_f"
    END
    
    INPUTE 03002, "", 130, 31, 160, 19
    BEGIN
        NAME "ine_w2_ss_wage_f"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
    
    STATICTEXT 02003, "W2 SS Tips:", 61, 55, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_tips_f"
    END
    
    INPUTE 03003, "", 130, 52, 160, 19
    BEGIN
        NAME "ine_w2_ss_tips_f"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
    
    STATICTEXT 02004, "W2 Wages:", 66, 76, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_wages_f"
    END
    
    INPUTE 03004, "", 130, 73, 160, 19
    BEGIN
        NAME "ine_w2_wages_f"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
    
    STATICTEXT 02005, "W2 SS Tax Withheld:", 11, 97, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_tax_f"
    END
    
    INPUTE 03005, "", 130, 94, 160, 19
    BEGIN
        NAME "ine_w2_ss_tax_f"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
    
    STATICTEXT 02006, "W2 Federal Taxes Withheld:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_fed_tax_f"
    END
    
    INPUTE 03006, "", 130, 115, 160, 19
    BEGIN
        NAME "ine_w2_fed_tax_f"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
    
    STATICTEXT 02007, "W2 Advanced Earned Inc Credit:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_aeic_f"
    END
    
    INPUTE 03007, "", 130, 136, 160, 19
    BEGIN
        NAME "ine_w2_aeic_f"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000000"
    END
END

