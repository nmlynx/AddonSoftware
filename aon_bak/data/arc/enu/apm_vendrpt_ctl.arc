//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APM_VENDRPT_CTL - Vendor Report Control
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0480
BEGIN
    NAME "win_apm_vendrpt_ctl"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Vendor ID:", 66, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03001, "", 130, 10, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04001, "", 234, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 208, 10, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02002, "Report Alias:", 53, 34, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_alias"
    END
    
    INPUTE 03002, "", 130, 31, 208, 19
    BEGIN
        NAME "ine_report_alias"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 364, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_report_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 338, 31, 20, 19
    BEGIN
        NAME "tbnf_report_alias"
    END
    
    CHECKBOX 03003, "Print", 128, 52, 57, 19
    BEGIN
        NAME "cbx_print_yn"
        NOT OPAQUE
    END
    
    GROUPBOX 19004, "Fax Information ", -4, 76, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_fax_yn"
    END
    
    CHECKBOX 03004, "Fax", 128, 94, 50, 19
    BEGIN
        NAME "cbx_fax_yn"
        NOT OPAQUE
    END
    
    STATICTEXT 02005, "From Company:", 34, 118, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_company"
    END
    
    INPUTE 03005, "", 130, 115, 240, 19
    BEGIN
        NAME "ine_from_company"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02006, "From Name:", 57, 139, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_name"
    END
    
    INPUTE 03006, "", 130, 136, 240, 19
    BEGIN
        NAME "ine_from_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02007, "Vendor Name:", 45, 160, 82, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_name"
    END
    
    INPUTE 03007, "", 130, 157, 240, 19
    BEGIN
        NAME "ine_vendor_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02008, "Fax To:", 85, 181, 42, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_to"
    END
    
    INPUTE 03008, "", 130, 178, 400, 19
    BEGIN
        NAME "ine_fax_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02009, "Fax Number[s]:", 37, 202, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_nos"
    END
    
    INPUTE 03009, "", 130, 199, 400, 19
    BEGIN
        NAME "ine_fax_nos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02010, "Subject:", 81, 223, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_subject"
    END
    
    INPUTE 03010, "", 130, 220, 240, 19
    BEGIN
        NAME "ine_fax_subject"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02011, "Message:", 74, 244, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_message"
    END
    
    INPUTE 03011, "", 130, 241, 240, 19
    BEGIN
        NAME "ine_fax_message"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    GROUPBOX 19012, "Email Information ", -4, 265, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_email_yn"
    END
    
    CHECKBOX 03012, "Email", 128, 283, 60, 19
    BEGIN
        NAME "cbx_email_yn"
        NOT OPAQUE
    END
    
    STATICTEXT 02013, "From:", 93, 307, 34, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_from"
    END
    
    INPUTE 03013, "", 130, 304, 240, 19
    BEGIN
        NAME "ine_email_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02014, "Reply To:", 74, 328, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_replyto"
    END
    
    INPUTE 03014, "", 130, 325, 240, 19
    BEGIN
        NAME "ine_email_replyto"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02015, "To:", 109, 349, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_to"
    END
    
    INPUTE 03015, "", 130, 346, 400, 19
    BEGIN
        NAME "ine_email_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02016, "Cc:", 109, 370, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_cc"
    END
    
    INPUTE 03016, "", 130, 367, 400, 19
    BEGIN
        NAME "ine_email_cc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02017, "Bcc:", 104, 391, 23, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_bcc"
    END
    
    INPUTE 03017, "", 130, 388, 240, 19
    BEGIN
        NAME "ine_email_bcc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02018, "Subject:", 81, 412, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_subject"
    END
    
    INPUTE 03018, "", 130, 409, 240, 19
    BEGIN
        NAME "ine_email_subject"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02019, "Message:", 74, 433, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_message"
    END
    
    INPUTE 03019, "", 130, 430, 240, 19
    BEGIN
        NAME "ine_email_message"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
END

