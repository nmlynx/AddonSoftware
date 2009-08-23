//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_USERFIRM - Operator/Firm Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0100
BEGIN
    NAME "win_adm_userfirm"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "User ID:", 81, 13, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03001, "", 130, 10, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 306, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 280, 10, 20, 19
    BEGIN
        NAME "tbnf_user_id"
    END
    
    STATICTEXT 02002, "Company ID:", 53, 34, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_company_id"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_company_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_company_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_company_id"
    END
END

