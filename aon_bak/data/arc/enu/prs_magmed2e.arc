//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED2E - Employer Record 2E
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0360 0228
BEGIN
    NAME "win_prs_magmed2e"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 City Name:", 44, 13, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_city"
    END
    
    INPUTE 03001, "", 130, 10, 200, 19
    BEGIN
        NAME "ine_w2_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 25
    END
    
    STATICTEXT 02002, "W2 State:", 75, 34, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_state"
    END
    
    INPUTE 03002, "", 130, 31, 100, 19
    BEGIN
        NAME "ine_w2_state"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02003, "W2 Zip Code Suffix:", 13, 55, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_zip_suffx"
    END
    
    INPUTE 03003, "", 130, 52, 50, 19
    BEGIN
        NAME "ine_w2_zip_suffx"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02004, "W2 Zip Code Prefix:", 13, 76, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_zip_prefx"
    END
    
    INPUTE 03004, "", 130, 73, 50, 19
    BEGIN
        NAME "ine_w2_zip_prefx"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02005, "W2 Name Code:", 36, 97, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_name_code"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_w2_name_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02006, "W2 Employment Type:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_empl_type"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_w2_empl_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02007, "W2 Establishment Number:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_est_no"
    END
    
    INPUTE 03007, "", 130, 136, 40, 19
    BEGIN
        NAME "ine_w2_est_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02008, "W2 Liability Limit Indicator:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_liab_lim"
    END
    
    INPUTE 03008, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_w2_liab_lim"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02009, "W2 Federal ID [EIN] Number:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_fed_id"
    END
    
    INPUTE 03009, "", 130, 178, 90, 19
    BEGIN
        NAME "ine_w2_fed_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
END

