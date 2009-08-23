//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED1E - Employer Records 1E
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0144
BEGIN
    NAME "win_prs_magmed1e"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 Federal ID [EIN] Number:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_fed_id"
    END
    
    INPUTE 03001, "", 130, 10, 90, 19
    BEGIN
        NAME "ine_w2_fed_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02002, "W2 State/Local 69 Number:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_stloc_69"
    END
    
    INPUTE 03002, "", 130, 31, 90, 19
    BEGIN
        NAME "ine_w2_stloc_69"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02003, "W2 Employer Name:", 12, 55, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_empr_name"
    END
    
    INPUTE 03003, "", 130, 52, 400, 19
    BEGIN
        NAME "ine_w2_empr_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 50
    END
    
    STATICTEXT 02004, "W2 Street Address:", 16, 76, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_str_addr"
    END
    
    INPUTE 03004, "", 130, 73, 320, 19
    BEGIN
        NAME "ine_w2_str_addr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02005, "W2 Payment Year:", 24, 97, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_pay_year"
    END
    
    INPUTD 03005, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_w2_pay_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_w2_pay_year"
    END
END

