//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED2T - Total Records 2T
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0228
BEGIN
    NAME "win_prs_magmed2t"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 Fringe Benefits:", 16, 13, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_frg_ben_t"
    END
    
    INPUTE 03001, "", 130, 10, 120, 19
    BEGIN
        NAME "ine_w2_frg_ben_t"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
    
    STATICTEXT 02002, "W2 Deferred Compensation:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_def_cmp_t"
    END
    
    INPUTE 03002, "", 130, 31, 130, 19
    BEGIN
        NAME "ine_w2_def_cmp_t"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000"
    END
    
    STATICTEXT 02003, "W2 Dependent Care:", 9, 55, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_dep_car_t"
    END
    
    INPUTE 03003, "", 130, 52, 120, 19
    BEGIN
        NAME "ine_w2_dep_car_t"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
    
    STATICTEXT 02004, "W2 Non Qualified Sec 457:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_nonq_457t"
    END
    
    INPUTE 03004, "", 130, 73, 130, 19
    BEGIN
        NAME "ine_w2_nonq_457t"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000"
    END
    
    STATICTEXT 02005, "W2 Non Sec 457 Non Qual Plan:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_non_457_t"
    END
    
    INPUTE 03005, "", 130, 94, 130, 19
    BEGIN
        NAME "ine_w2_non_457_t"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000"
    END
    
    STATICTEXT 02006, "W2 Medicare Wages:", 10, 118, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_med_wag_t"
    END
    
    INPUTE 03006, "", 130, 115, 130, 19
    BEGIN
        NAME "ine_w2_med_wag_t"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000000"
    END
    
    STATICTEXT 02007, "W2 Medicare Tax Withheld:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_med_tax_t"
    END
    
    INPUTE 03007, "", 130, 136, 120, 19
    BEGIN
        NAME "ine_w2_med_tax_t"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
    
    STATICTEXT 02008, "Tax Withheld by 3rd Party Payr:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_3_pty_tax"
    END
    
    INPUTE 03008, "", 130, 157, 120, 19
    BEGIN
        NAME "ine_w2_3_pty_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02009, "Military employee and combat:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_military2"
    END
    
    INPUTE 03009, "", 130, 178, 120, 19
    BEGIN
        NAME "ine_w2_military2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
END

