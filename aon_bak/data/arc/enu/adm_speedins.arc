//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_SPEEDINS - SpeedInstall Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0165
BEGIN
    NAME "win_adm_speedins"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "File Name:", 68, 13, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_file_name"
    END
    
    INPUTE 03001, "", 130, 10, 78, 19
    BEGIN
        NAME "ine_file_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 02002, "Record ID:", 67, 34, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_record_id"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_record_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02003, "Description:", 56, 55, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03003, "", 130, 52, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    CHECKBOX 03004, "Use Record ID?", 128, 73, 118, 19
    BEGIN
        NAME "cbx_use_rec_id"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Installed?", 128, 94, 85, 19
    BEGIN
        NAME "cbx_installed"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Application:", 57, 118, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_system_id"
    END
    
    INPUTE 03006, "", 130, 115, 156, 19
    BEGIN
        NAME "ine_system_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00-000000AAA"
    END
    
    STATICTEXT 04006, "", 312, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_system_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 286, 115, 20, 19
    BEGIN
        NAME "tbnf_system_id"
    END
END

