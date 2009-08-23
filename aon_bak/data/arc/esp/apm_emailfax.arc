//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APM_EMAILFAX - Vendor Master, Fax & Email
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0586 0228
BEGIN
    NAME "win_apm_emailfax"
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
    
    INPUTE 03001, "", 156, 10, 60, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04001, "", 242, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 216, 10, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    GROUPBOX 19002, "Información de correo electrónico y fax ", -4, 34, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_email_to"
    END
    
    STATICTEXT 02002, "Enviar correo electrónico a:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_to"
    END
    
    INPUTE 03002, "", 156, 52, 400, 19
    BEGIN
        NAME "ine_email_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02003, "Correo electrónico cc:", 23, 76, 130, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_email_cc"
    END
    
    INPUTE 03003, "", 156, 73, 400, 19
    BEGIN
        NAME "ine_email_cc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02004, "Fax para:", 100, 118, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_to"
    END
    
    INPUTE 03004, "", 156, 115, 400, 19
    BEGIN
        NAME "ine_fax_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02005, "N.º de fax:", 93, 139, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_nos"
    END
    
    INPUTE 03005, "", 156, 136, 400, 19
    BEGIN
        NAME "ine_fax_nos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02006, "Página web:", 85, 181, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_web_page"
    END
    
    INPUTE 03006, "", 156, 178, 400, 19
    BEGIN
        NAME "ine_web_page"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
END

