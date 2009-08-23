//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED2I - Intermed Total Record 2I
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0165
BEGIN
    NAME "win_prs_magmed2i"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 Dependent Care:", 9, 13, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_dep_car_i"
    END
    
    INPUTE 03001, "", 130, 10, 100, 19
    BEGIN
        NAME "ine_w2_dep_car_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02002, "W2 Non Qualified Sec 457:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_nonq_457i"
    END
    
    INPUTE 03002, "", 130, 31, 100, 19
    BEGIN
        NAME "ine_w2_nonq_457i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02003, "W2 Non Sec 457 Non Qual Plan:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_non_457_i"
    END
    
    INPUTE 03003, "", 130, 52, 100, 19
    BEGIN
        NAME "ine_w2_non_457_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02004, "W2 Medicare Wages:", 10, 76, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_med_wag_i"
    END
    
    INPUTE 03004, "", 130, 73, 110, 19
    BEGIN
        NAME "ine_w2_med_wag_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000"
    END
    
    STATICTEXT 02005, "W2 Medicare Tax Withheld:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_med_tax_i"
    END
    
    INPUTE 03005, "", 130, 94, 100, 19
    BEGIN
        NAME "ine_w2_med_tax_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000000"
    END
    
    STATICTEXT 02006, "Military employee and combat:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_military2"
    END
    
    INPUTE 03006, "", 130, 115, 120, 19
    BEGIN
        NAME "ine_w2_military2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
END

