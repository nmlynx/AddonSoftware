//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APM_VENDRPT_CTL - Vendor Report Control
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0586 0480
BEGIN
    NAME "win_apm_vendrpt_ctl"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del proveedor:", 52, 13, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03001, "", 156, 10, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04001, "", 260, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 234, 10, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02002, "Alias de informe:", 54, 34, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_alias"
    END
    
    INPUTE 03002, "", 156, 31, 208, 19
    BEGIN
        NAME "ine_report_alias"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 390, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_report_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 364, 31, 20, 19
    BEGIN
        NAME "tbnf_report_alias"
    END
    
    CHECKBOX 03003, "Imprimir", 154, 52, 80, 19
    BEGIN
        NAME "cbx_print_yn"
        NOT OPAQUE
    END
    
    GROUPBOX 19004, "Información de fax ", -4, 76, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_fax_yn"
    END
    
    CHECKBOX 03004, "Fax", 154, 94, 50, 19
    BEGIN
        NAME "cbx_fax_yn"
        NOT OPAQUE
    END
    
    STATICTEXT 02005, "De la compañía:", 61, 118, 92, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_company"
    END
    
    INPUTE 03005, "", 156, 115, 240, 19
    BEGIN
        NAME "ine_from_company"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02006, "De nombre:", 85, 139, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_name"
    END
    
    INPUTE 03006, "", 156, 136, 240, 19
    BEGIN
        NAME "ine_from_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02007, "Nombre del proveedor:", 17, 160, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_name"
    END
    
    INPUTE 03007, "", 156, 157, 240, 19
    BEGIN
        NAME "ine_vendor_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02008, "Fax para:", 100, 181, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_to"
    END
    
    INPUTE 03008, "", 156, 178, 400, 19
    BEGIN
        NAME "ine_fax_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02009, "Número(s) de fax:", 48, 202, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_nos"
    END
    
    INPUTE 03009, "", 156, 199, 400, 19
    BEGIN
        NAME "ine_fax_nos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02010, "Asunto:", 107, 223, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_subject"
    END
    
    INPUTE 03010, "", 156, 220, 240, 19
    BEGIN
        NAME "ine_fax_subject"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02011, "Mensaje:", 103, 244, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_message"
    END
    
    INPUTE 03011, "", 156, 241, 240, 19
    BEGIN
        NAME "ine_fax_message"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    GROUPBOX 19012, "Información del correo electrónico ", -4, 265, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_email_yn"
    END
    
    CHECKBOX 03012, "Correo electrónico", 154, 283, 141, 19
    BEGIN
        NAME "cbx_email_yn"
        NOT OPAQUE
    END
    
    STATICTEXT 02013, "De:", 135, 307, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_from"
    END
    
    INPUTE 03013, "", 156, 304, 240, 19
    BEGIN
        NAME "ine_email_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02014, "Responder a:", 76, 328, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_replyto"
    END
    
    INPUTE 03014, "", 156, 325, 240, 19
    BEGIN
        NAME "ine_email_replyto"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02015, "Para:", 125, 349, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_to"
    END
    
    INPUTE 03015, "", 156, 346, 400, 19
    BEGIN
        NAME "ine_email_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02016, "Cc:", 135, 370, 18, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_cc"
    END
    
    INPUTE 03016, "", 156, 367, 400, 19
    BEGIN
        NAME "ine_email_cc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02017, "Cco:", 127, 391, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_bcc"
    END
    
    INPUTE 03017, "", 156, 388, 240, 19
    BEGIN
        NAME "ine_email_bcc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02018, "Asunto:", 107, 412, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_subject"
    END
    
    INPUTE 03018, "", 156, 409, 240, 19
    BEGIN
        NAME "ine_email_subject"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02019, "Mensaje:", 103, 433, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_message"
    END
    
    INPUTE 03019, "", 156, 430, 240, 19
    BEGIN
        NAME "ine_email_message"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
END

