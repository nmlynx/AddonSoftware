//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARM_EMAILFAX - Customer Master, Fax and Email
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0186
BEGIN
    NAME "win_arm_emailfax"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Customer ID:", 50, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 130, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 216, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 190, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    GROUPBOX 19002, "E-mail and Fax Printing Defaults ", -4, 34, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_email_to"
    END
    
    STATICTEXT 02002, "Email To:", 75, 55, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_to"
    END
    
    INPUTE 03002, "", 130, 52, 400, 19
    BEGIN
        NAME "ine_email_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02003, "Email Cc:", 75, 76, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_cc"
    END
    
    INPUTE 03003, "", 130, 73, 400, 19
    BEGIN
        NAME "ine_email_cc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02004, "Fax To:", 85, 97, 42, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_to"
    END
    
    INPUTE 03004, "", 130, 94, 400, 19
    BEGIN
        NAME "ine_fax_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02005, "Fax No:", 83, 118, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_nos"
    END
    
    INPUTE 03005, "", 130, 115, 400, 19
    BEGIN
        NAME "ine_fax_nos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02006, "Web Page:", 69, 139, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_web_page"
    END
    
    INPUTE 03006, "", 130, 136, 400, 19
    BEGIN
        NAME "ine_web_page"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
END

