//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADS_TERMINAL - Terminal Control Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0586 0333
BEGIN
    NAME "win_ads_terminal"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID de la terminal:", 56, 13, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terminal_id"
    END
    
    INPUTE 03001, "", 156, 10, 52, 19
    BEGIN
        NAME "ine_terminal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02002, "ID del usuario:", 69, 34, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03002, "", 156, 31, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 332, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 306, 31, 20, 19
    BEGIN
        NAME "tbnf_user_id"
    END
    
    STATICTEXT 02003, "ID de la impresora:", 43, 55, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_printer_id"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_printer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02004, "Nivel de seguridad:", 41, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_security_lev"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_security_lev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    CHECKBOX 03005, "¿Impresora?", 154, 94, 101, 19
    BEGIN
        NAME "cbx_printer_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Código de opción de la impresora:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_printer_opt"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_printer_opt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02007, "Fecha del sistema actual:", 8, 139, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_system_date"
    END
    
    INPUTD 03007, "", 156, 136, 85, 19
    BEGIN
        NAME "ind_system_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 241, 136, 20, 19
    BEGIN
        NAME "tbnc_system_date"
    END
    
    STATICTEXT 02008, "Fecha del sistema actual:", 8, 160, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_date"
    END
    
    INPUTD 03008, "", 156, 157, 85, 19
    BEGIN
        NAME "ind_current_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21008, "", 241, 157, 20, 19
    BEGIN
        NAME "tbnc_current_date"
    END
    
    STATICTEXT 02009, "Nombre del programa:", 20, 181, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_program_name"
    END
    
    INPUTE 03009, "", 156, 178, 192, 19
    BEGIN
        NAME "ine_program_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02010, "ID del menú:", 81, 202, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_menu_id"
    END
    
    INPUTE 03010, "", 156, 199, 100, 19
    BEGIN
        NAME "ine_menu_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02011, "Número de la tarea:", 39, 223, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_task_no"
    END
    
    INPUTE 03011, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_task_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02012, "Parámetros de la tarea:", 19, 244, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_task_params"
    END
    
    INPUTE 03012, "", 156, 241, 400, 19
    BEGIN
        NAME "ine_task_params"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02013, "Nombre de la empresa:", 18, 265, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_firm_name"
    END
    
    INPUTE 03013, "", 156, 262, 320, 19
    BEGIN
        NAME "ine_firm_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02014, "Descripción de la tarea:", 16, 286, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_task_desc"
    END
    
    INPUTE 03014, "", 156, 283, 280, 19
    BEGIN
        NAME "ine_task_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 35
    END
END

