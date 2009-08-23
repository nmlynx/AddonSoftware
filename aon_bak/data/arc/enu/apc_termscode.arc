//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APC_TERMSCODE - Terms Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0186
BEGIN
    NAME "win_apc_termscode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Terms Code:", 53, 13, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terms_codeap"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_terms_codeap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 130, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    GROUPBOX 19003, "Additional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_prox_or_days"
    END
    
    STATICTEXT 02003, "Prox Or Days:", 36, 76, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prox_or_days"
    END
    
    LISTBUTTON 03003, "", 120, 73, 97, 300
    BEGIN
        NAME "lbx_prox_or_days"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Discount Percent:", 14, 97, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_percent"
    END
    INPUTN 03004, "", 120, 94, 56, 19
    BEGIN
        NAME "inn_disc_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0.00#-"
    END
    
    STATICTEXT 02005, "Due Days:", 59, 118, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_due_days"
    END
    INPUTN 03005, "", 120, 115, 56, 19
    BEGIN
        NAME "inn_due_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Discount Days:", 29, 139, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_days"
    END
    INPUTN 03006, "", 120, 136, 56, 19
    BEGIN
        NAME "inn_disc_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

