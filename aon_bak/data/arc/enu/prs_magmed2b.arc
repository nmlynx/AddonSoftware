//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED2B - Basic Author Record 2B
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0512 0165
BEGIN
    NAME "win_prs_magmed2b"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 File Return Name:", 4, 13, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ret_name"
    END
    
    INPUTE 03001, "", 130, 10, 352, 19
    BEGIN
        NAME "ine_w2_ret_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 44
    END
    
    STATICTEXT 02002, "W2 Return Address:", 11, 34, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ret_addr"
    END
    
    INPUTE 03002, "", 130, 31, 280, 19
    BEGIN
        NAME "ine_w2_ret_addr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 35
    END
    
    STATICTEXT 02003, "W2 File Return City:", 14, 55, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ret_city"
    END
    
    INPUTE 03003, "", 130, 52, 200, 19
    BEGIN
        NAME "ine_w2_ret_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02004, "W2 File Return State [FIPS]:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ret_state"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_w2_ret_state"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02005, "W2 Foreign Postal Code:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_for_post"
    END
    
    INPUTE 03005, "", 130, 94, 50, 19
    BEGIN
        NAME "ine_w2_for_post"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02006, "W2 Zip Code Prefix:", 13, 118, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_zip_prefx"
    END
    
    INPUTE 03006, "", 130, 115, 50, 19
    BEGIN
        NAME "ine_w2_zip_prefx"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
END

