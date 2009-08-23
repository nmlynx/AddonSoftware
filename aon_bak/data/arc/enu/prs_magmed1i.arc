//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED1I - Intermed Total Record 1I
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0291
BEGIN
    NAME "win_prs_magmed1i"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 SS Wages:", 49, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_wage_i"
    END
    
    INPUTE 03001, "", 130, 10, 100, 19
    BEGIN
        NAME "ine_w2_ss_wage_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02002, "W2 SS Tips:", 61, 34, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_tips_i"
    END
    
    INPUTE 03002, "", 130, 31, 100, 19
    BEGIN
        NAME "ine_w2_ss_tips_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02003, "W2 Wages:", 66, 55, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_wages_i"
    END
    
    INPUTE 03003, "", 130, 52, 100, 19
    BEGIN
        NAME "ine_w2_wages_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02004, "W2 SS Tax Withheld:", 11, 76, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_tax_i"
    END
    
    INPUTE 03004, "", 130, 73, 100, 19
    BEGIN
        NAME "ine_w2_ss_tax_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02005, "W2 Federal Taxes Withheld:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_fed_tax_i"
    END
    
    INPUTE 03005, "", 130, 94, 100, 19
    BEGIN
        NAME "ine_w2_fed_tax_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02006, "W2 Control Number:", 8, 118, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_cntl_no"
    END
    
    INPUTE 03006, "", 130, 115, 70, 19
    BEGIN
        NAME "ine_w2_cntl_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02007, "W2 Employer Paid Grp Insurance:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_grp_ins_i"
    END
    
    INPUTE 03007, "", 130, 136, 100, 19
    BEGIN
        NAME "ine_w2_grp_ins_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02008, "W2 Uncollect SS Tax On Tips:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_unc_tax_i"
    END
    
    INPUTE 03008, "", 130, 157, 100, 19
    BEGIN
        NAME "ine_w2_unc_tax_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02009, "W2 Advanced Earned Inc Credit:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_aeic_i"
    END
    
    INPUTE 03009, "", 130, 178, 110, 19
    BEGIN
        NAME "ine_w2_aeic_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000"
    END
    
    STATICTEXT 02010, "W2 Allocated Tips:", 20, 202, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_all_tip_i"
    END
    
    INPUTE 03010, "", 130, 199, 100, 19
    BEGIN
        NAME "ine_w2_all_tip_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02011, "W2 Fringe Benefits:", 16, 223, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_frg_ben_i"
    END
    
    INPUTE 03011, "", 130, 220, 100, 19
    BEGIN
        NAME "ine_w2_frg_ben_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02012, "W2 Deferred Compensation:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_def_cmp_i"
    END
    
    INPUTE 03012, "", 130, 241, 100, 19
    BEGIN
        NAME "ine_w2_def_cmp_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
END

