//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED2W - Employee Wage Rec 2W
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0396
BEGIN
    NAME "win_prs_magmed2w"
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
        NAME "txt_w2_ss_wage"
    END
    
    INPUTE 03001, "", 130, 10, 70, 19
    BEGIN
        NAME "ine_w2_ss_wage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "W2 SS Tips:", 61, 34, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_tips"
    END
    
    INPUTE 03002, "", 130, 31, 70, 19
    BEGIN
        NAME "ine_w2_ss_tips"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "W2 Wages:", 66, 55, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_wages"
    END
    
    INPUTE 03003, "", 130, 52, 90, 19
    BEGIN
        NAME "ine_w2_wages"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02004, "W2 SS Tax Withheld:", 11, 76, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ss_tax"
    END
    
    INPUTE 03004, "", 130, 73, 60, 19
    BEGIN
        NAME "ine_w2_ss_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000"
    END
    
    STATICTEXT 02005, "W2 Federal Taxes Withheld:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_fed_tax"
    END
    
    INPUTE 03005, "", 130, 94, 90, 19
    BEGIN
        NAME "ine_w2_fed_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02006, "W2 Non Qualified Sec 457:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_nonq_457"
    END
    
    INPUTE 03006, "", 130, 115, 90, 19
    BEGIN
        NAME "ine_w2_nonq_457"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02007, "W2 Non Sec 457 Non Qual Plan:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_non_457"
    END
    
    INPUTE 03007, "", 130, 136, 90, 19
    BEGIN
        NAME "ine_w2_non_457"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02008, "W2 Control Number:", 8, 160, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_cntl_no"
    END
    
    INPUTE 03008, "", 130, 157, 70, 19
    BEGIN
        NAME "ine_w2_cntl_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02009, "W2 Employer Paid Grp Insurance:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_grp_ins"
    END
    
    INPUTE 03009, "", 130, 178, 70, 19
    BEGIN
        NAME "ine_w2_grp_ins"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02010, "W2 Uncollect SS Tax On Tips:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_uncol_tax"
    END
    
    INPUTE 03010, "", 130, 199, 70, 19
    BEGIN
        NAME "ine_w2_uncol_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02011, "W2 Advanced Earned Inc Credit:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_adv_ern"
    END
    
    INPUTE 03011, "", 130, 220, 70, 19
    BEGIN
        NAME "ine_w2_adv_ern"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02012, "W2 Allocated Tips:", 20, 244, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_all_tip"
    END
    
    INPUTE 03012, "", 130, 241, 70, 19
    BEGIN
        NAME "ine_w2_all_tip"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02013, "W2 Fringe Benefits:", 16, 265, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_frg_ben"
    END
    
    INPUTE 03013, "", 130, 262, 90, 19
    BEGIN
        NAME "ine_w2_frg_ben"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02014, "W2 Pension Pln Ind.:", 11, 286, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_pens_pln"
    END
    
    INPUTE 03014, "", 130, 283, 35, 19
    BEGIN
        NAME "ine_w2_pens_pln"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02015, "W2 Deferred Comp Ind:", 0, 307, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_def_cmp_f"
    END
    
    INPUTE 03015, "", 130, 304, 35, 19
    BEGIN
        NAME "ine_w2_def_cmp_f"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02016, "W2 Deferred Compensation:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_def_comp"
    END
    
    INPUTE 03016, "", 130, 325, 90, 19
    BEGIN
        NAME "ine_w2_def_comp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02017, "W2 Dependent Care:", 9, 349, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_dep_care"
    END
    
    INPUTE 03017, "", 130, 346, 70, 19
    BEGIN
        NAME "ine_w2_dep_care"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
END

