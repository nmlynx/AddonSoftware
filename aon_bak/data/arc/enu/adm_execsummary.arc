//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_EXECSUMMARY - Executive Summary Definitions
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0570 0249
BEGIN
    NAME "win_adm_execsummary"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Summary ID:", 64, 13, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_id"
    END
    
    INPUTE 03001, "", 140, 10, 160, 19
    BEGIN
        NAME "ine_summary_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 02002, "Description:", 66, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_desc"
    END
    
    INPUTE 03002, "", 140, 31, 240, 19
    BEGIN
        NAME "ine_summary_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02003, "Menu Description:", 31, 55, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_menu_desc"
    END
    
    INPUTE 03003, "", 140, 52, 240, 19
    BEGIN
        NAME "ine_menu_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02004, "Summary Type:", 47, 97, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_type"
    END
    
    LISTBUTTON 03004, "", 140, 94, 75, 300
    BEGIN
        NAME "lbx_summary_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03005, "Expand Summary Category", 138, 115, 189, 19
    BEGIN
        NAME "cbx_summary_expand"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Parent Summary ID:", 23, 139, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_id_par"
    END
    
    INPUTE 03006, "", 140, 136, 128, 19
    BEGIN
        NAME "ine_summary_id_par"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 294, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_summary_id_par"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 268, 136, 20, 19
    BEGIN
        NAME "tbnf_summary_id_par"
    END
    
    STATICTEXT 02007, "Update Program Path:", 10, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prog_path_ud"
    END
    
    INPUTE 03007, "", 140, 157, 400, 19
    BEGIN
        NAME "ine_prog_path_ud"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 50
    END
    
    STATICTEXT 02008, "Display Program Path:", 9, 181, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prog_path_disp"
    END
    
    INPUTE 03008, "", 140, 178, 400, 19
    BEGIN
        NAME "ine_prog_path_disp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 50
    END
    
    STATICTEXT 02009, "Summary Category Cd:", 2, 202, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_cd"
    END
    
    INPUTE 03009, "", 140, 199, 50, 19
    BEGIN
        NAME "ine_summary_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUU"
    END
END

