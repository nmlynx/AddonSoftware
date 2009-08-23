//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED1S - Supplement State Rec 1S
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0480 0228
BEGIN
    NAME "win_prs_magmed1s"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Social Security Number:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_soc_sec_no"
    END
    
    INPUTE 03001, "", 130, 10, 90, 19
    BEGIN
        NAME "ine_soc_sec_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02002, "W2 Employee Name:", 11, 34, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_empe_name"
    END
    
    INPUTE 03002, "", 130, 31, 216, 19
    BEGIN
        NAME "ine_w2_empe_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 27
    END
    
    STATICTEXT 02003, "W2 Street Address:", 16, 55, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_str_addr"
    END
    
    INPUTE 03003, "", 130, 52, 320, 19
    BEGIN
        NAME "ine_w2_str_addr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02004, "W2 City Name:", 44, 76, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_city"
    END
    
    INPUTE 03004, "", 130, 73, 200, 19
    BEGIN
        NAME "ine_w2_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 25
    END
    
    STATICTEXT 02005, "W2 State:", 75, 97, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_state"
    END
    
    INPUTE 03005, "", 130, 94, 100, 19
    BEGIN
        NAME "ine_w2_state"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02006, "W2 Zip Code Suffix:", 13, 118, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_zip_suffx"
    END
    
    INPUTE 03006, "", 130, 115, 50, 19
    BEGIN
        NAME "ine_w2_zip_suffx"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02007, "W2 Zip Code Prefix:", 13, 139, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_zip_prefx"
    END
    
    INPUTE 03007, "", 130, 136, 50, 19
    BEGIN
        NAME "ine_w2_zip_prefx"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02008, "W2 State Code:", 41, 160, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_state_id"
    END
    
    INPUTE 03008, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_w2_state_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02009, "W2 State Optional Codes:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_state_opt"
    END
    
    INPUTE 03009, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_w2_state_opt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
END

