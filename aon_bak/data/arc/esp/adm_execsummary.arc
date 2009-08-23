//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_EXECSUMMARY - Executive Summary Definitions
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0598 0249
BEGIN
    NAME "win_adm_execsummary"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del resumen:", 74, 13, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_id"
    END
    
    INPUTE 03001, "", 168, 10, 160, 19
    BEGIN
        NAME "ine_summary_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 02002, "Descripción:", 92, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_desc"
    END
    
    INPUTE 03002, "", 168, 31, 240, 19
    BEGIN
        NAME "ine_summary_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02003, "Descripción del menú:", 35, 55, 130, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_menu_desc"
    END
    
    INPUTE 03003, "", 168, 52, 240, 19
    BEGIN
        NAME "ine_menu_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02004, "Tipo de resumen:", 63, 97, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_type"
    END
    
    LISTBUTTON 03004, "", 168, 94, 75, 300
    BEGIN
        NAME "lbx_summary_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03005, "Ampliar categoría de resumen", 166, 115, 207, 19
    BEGIN
        NAME "cbx_summary_expand"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "ID de resumen primario:", 24, 139, 141, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_id_par"
    END
    
    INPUTE 03006, "", 168, 136, 128, 19
    BEGIN
        NAME "ine_summary_id_par"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 322, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_summary_id_par"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 296, 136, 20, 19
    BEGIN
        NAME "tbnf_summary_id_par"
    END
    
    STATICTEXT 02007, "Actualizar ruta del programa:", 0, 160, 165, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prog_path_ud"
    END
    
    INPUTE 03007, "", 168, 157, 400, 19
    BEGIN
        NAME "ine_prog_path_ud"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 50
    END
    
    STATICTEXT 02008, "Mostrar ruta del programa:", 6, 181, 159, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prog_path_disp"
    END
    
    INPUTE 03008, "", 168, 178, 400, 19
    BEGIN
        NAME "ine_prog_path_disp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 50
    END
    
    STATICTEXT 02009, "Cód. de categoría de resumen:", 0, 202, 165, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_cd"
    END
    
    INPUTE 03009, "", 168, 199, 50, 19
    BEGIN
        NAME "ine_summary_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUU"
    END
END

