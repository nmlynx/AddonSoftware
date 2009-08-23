//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_REPORT - Report Form Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0400 0237
BEGIN
    NAME "win_ars_report"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_ars_report", 4, 0030, 0393, 0232
    BEGIN
        NAME "tab_ars_report"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Reports" 0 1100
        TAB "Remit To" 1 1101
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_ars_report_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_ars_report_1101"
    END
    
END
CHILD-WINDOW 1100 0 0 0390 0210
BEGIN
    NAME "chw_ars_report_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Company Name:", 32, 13, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_name"
    END
    
    INPUTE 03101, "", 130, 10, 240, 19
    BEGIN
        NAME "ine_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02102, "Address:", 75, 34, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_1"
    END
    
    INPUTE 03102, "", 130, 31, 192, 19
    BEGIN
        NAME "ine_addr_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03103, "", 130, 52, 192, 19
    BEGIN
        NAME "ine_addr_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02104, "City:", 101, 76, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_city"
    END
    
    INPUTE 03104, "", 130, 73, 176, 19
    BEGIN
        NAME "ine_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02105, "State:", 96, 97, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_state_code"
    END
    
    INPUTE 03105, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_state_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02106, "Zip Code:", 71, 118, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_zip_code"
    END
    
    INPUTE 03106, "", 130, 115, 80, 19
    BEGIN
        NAME "ine_zip_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02107, "Phone:", 88, 139, 39, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_no"
    END
    
    INPUTE 03107, "", 130, 136, 112, 19
    BEGIN
        NAME "ine_phone_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02108, "Federal ID:", 66, 160, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_federal_id"
    END
    
    INPUTE 03108, "", 130, 157, 120, 19
    BEGIN
        NAME "ine_federal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END

END
CHILD-WINDOW 1101 0 0 0390 0210
BEGIN
    NAME "chw_ars_report_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Name:", 91, 13, 36, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_remit_name"
    END
    
    INPUTE 03201, "", 130, 10, 240, 19
    BEGIN
        NAME "ine_remit_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02202, "Address:", 75, 34, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_remit_addr_1"
    END
    
    INPUTE 03202, "", 130, 31, 192, 19
    BEGIN
        NAME "ine_remit_addr_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02203, "Address Line 2:", 36, 55, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_remit_addr_2"
    END
    
    INPUTE 03203, "", 130, 52, 192, 19
    BEGIN
        NAME "ine_remit_addr_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02204, "City:", 101, 76, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_remit_city"
    END
    
    INPUTE 03204, "", 130, 73, 176, 19
    BEGIN
        NAME "ine_remit_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02205, "State/Province:", 38, 97, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_remit_state"
    END
    
    INPUTE 03205, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_remit_state"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02206, "Zip/Postal Code:", 30, 118, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_remit_zip"
    END
    
    INPUTE 03206, "", 130, 115, 117, 19
    BEGIN
        NAME "ine_remit_zip"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END

END

