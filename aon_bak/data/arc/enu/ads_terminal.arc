//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADS_TERMINAL - Terminal Control Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0333
BEGIN
    NAME "win_ads_terminal"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Terminal ID:", 57, 13, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terminal_id"
    END
    
    INPUTE 03001, "", 130, 10, 52, 19
    BEGIN
        NAME "ine_terminal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02002, "User ID:", 81, 34, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03002, "", 130, 31, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 306, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 280, 31, 20, 19
    BEGIN
        NAME "tbnf_user_id"
    END
    
    STATICTEXT 02003, "Printer ID:", 69, 55, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_printer_id"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_printer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02004, "Security Level:", 44, 76, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_security_lev"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_security_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    CHECKBOX 03005, "Printer?", 128, 94, 75, 19
    BEGIN
        NAME "cbx_printer_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Printer Option Code:", 6, 118, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_printer_opt"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_printer_opt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02007, "Current System Date:", 3, 139, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_system_date"
    END
    
    INPUTD 03007, "", 130, 136, 85, 19
    BEGIN
        NAME "ind_system_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 215, 136, 20, 19
    BEGIN
        NAME "tbnc_system_date"
    END
    
    STATICTEXT 02008, "Current System Date:", 3, 160, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_date"
    END
    
    INPUTD 03008, "", 130, 157, 85, 19
    BEGIN
        NAME "ind_current_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21008, "", 215, 157, 20, 19
    BEGIN
        NAME "tbnc_current_date"
    END
    
    STATICTEXT 02009, "Program Name:", 37, 181, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_program_name"
    END
    
    INPUTE 03009, "", 130, 178, 192, 19
    BEGIN
        NAME "ine_program_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02010, "Menu ID:", 77, 202, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_menu_id"
    END
    
    INPUTE 03010, "", 130, 199, 100, 19
    BEGIN
        NAME "ine_menu_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02011, "Task Number:", 46, 223, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_task_no"
    END
    
    INPUTE 03011, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_task_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02012, "Task Parameters:", 27, 244, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_task_params"
    END
    
    INPUTE 03012, "", 130, 241, 400, 19
    BEGIN
        NAME "ine_task_params"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02013, "Firm Name:", 61, 265, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_firm_name"
    END
    
    INPUTE 03013, "", 130, 262, 320, 19
    BEGIN
        NAME "ine_firm_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02014, "Task Description:", 25, 286, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_task_desc"
    END
    
    INPUTE 03014, "", 130, 283, 280, 19
    BEGIN
        NAME "ine_task_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 35
    END
END

