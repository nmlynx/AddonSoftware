//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_ACCT - Account Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0126
BEGIN
    NAME "win_glm_acct"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Account:", 75, 13, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 130, 10, 100, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_acct_desc"
    END
    
    INPUTE 03002, "", 130, 31, 280, 19
    BEGIN
        NAME "ine_gl_acct_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 35
    END
    
    STATICTEXT 02003, "Type:", 96, 55, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_acct_type"
    END
    
    LISTBUTTON 03003, "", 130, 52, 71, 300
    BEGIN
        NAME "lbx_gl_acct_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03004, "Detail", 128, 73, 63, 19
    BEGIN
        NAME "cbx_detail_flag"
        NOT OPAQUE
    END
END

