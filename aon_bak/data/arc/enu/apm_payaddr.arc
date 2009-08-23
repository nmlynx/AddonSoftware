//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APM_PAYADDR - Vendor Pay-to Address
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0270
BEGIN
    NAME "win_apm_payaddr"
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
    
    STATICTEXT 02002, "Pay To Name:", 49, 34, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_to_name"
    END
    
    INPUTE 03002, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_pay_to_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02003, "Address:", 75, 55, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_1"
    END
    
    INPUTE 03003, "", 130, 52, 192, 19
    BEGIN
        NAME "ine_addr_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02004, "Address Line 2:", 36, 76, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_2"
    END
    
    INPUTE 03004, "", 130, 73, 192, 19
    BEGIN
        NAME "ine_addr_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02005, "City:", 101, 97, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_city"
    END
    
    INPUTE 03005, "", 130, 94, 176, 19
    BEGIN
        NAME "ine_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02006, "State/Province:", 38, 118, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_state_code"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_state_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02007, "Zip/Postal Code:", 30, 139, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_zip_code"
    END
    
    INPUTE 03007, "", 130, 136, 117, 19
    BEGIN
        NAME "ine_zip_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02008, "Telephone Number:", 12, 160, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_no"
    END
    
    INPUTE 03008, "", 130, 157, 200, 19
    BEGIN
        NAME "ine_phone_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02009, "Extension:", 66, 181, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_exten"
    END
    
    INPUTE 03009, "", 130, 178, 40, 19
    BEGIN
        NAME "ine_phone_exten"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02010, "Contact Name:", 42, 202, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contact_name"
    END
    
    INPUTE 03010, "", 130, 199, 200, 19
    BEGIN
        NAME "ine_contact_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02011, "Fax Number:", 53, 223, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_no"
    END
    
    INPUTE 03011, "", 130, 220, 200, 19
    BEGIN
        NAME "ine_fax_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
END

