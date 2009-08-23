//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPE_CREDITACTION - Credit Action for an Order / Invoice
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0207
BEGIN
    NAME "win_ope_creditaction"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Message:", 74, 13, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_status_message"
    END
    
    INPUTE 03001, "", 130, 10, 240, 19
    BEGIN
        NAME "ine_status_message"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02002, "Credit Status:", 48, 34, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_status"
    END
    
    INPUTE 03002, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_credit_status"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02003, "Credit Action to Take:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_action"
    END
    RADIOBUTTON 03003, "Hold This Order", 130, 53, 240, 19
    BEGIN
        NAME "rad_credit_action"
        NOT OPAQUE
        GROUP
    END
    RADIOBUTTON 03004, "Hold All Future Orders", 130, 74, 240, 19
    BEGIN
        NAME "rad_credit_action"
        NOT OPAQUE
        GROUP
    END
    RADIOBUTTON 03005, "Release This Order", 130, 95, 240, 19
    BEGIN
        NAME "rad_credit_action"
        NOT OPAQUE
        GROUP
    END
    RADIOBUTTON 03006, "Delete This Order", 130, 116, 240, 19
    BEGIN
        NAME "rad_credit_action"
        NOT OPAQUE
        GROUP
    END
    
    STATICTEXT 02007, "Terms Code:", 53, 139, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03007, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04007, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02008, "Enter Password:", 34, 160, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_enter_cred_pswrd"
    END
    
    EDIT 03008, "", 130, 157, 48, 19
    BEGIN
        NAME "edp_enter_cred_pswrd"
        CLIENTEDGE
        PASSWORDENTRY
    END
END

