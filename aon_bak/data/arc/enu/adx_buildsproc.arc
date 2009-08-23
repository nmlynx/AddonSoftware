//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADX_BUILDSPROC - Build Sproc Utility
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0430 0102
BEGIN
    NAME "win_adx_buildsproc"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Database:", 70, 13, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_database"
    END
    
    LISTBUTTON 03001, "", 130, 10, 100, 300
    BEGIN
        NAME "lbx_database"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Path to SPROC .prc files:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sproc_path"
    END
    
    INPUTE 03002, "", 130, 31, 250, 19
    BEGIN
        NAME "ine_sproc_path"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    TOOLBUTTON 20002, "", 380, 31, 20, 19
    BEGIN
        NAME "tbnf_sproc_path"
    END
    
    STATICTEXT 02003, "Path to barista.cfg file:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_barista_cfg_path"
    END
    
    INPUTE 03003, "", 130, 52, 250, 19
    BEGIN
        NAME "ine_barista_cfg_path"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    TOOLBUTTON 20003, "", 380, 52, 20, 19
    BEGIN
        NAME "tbnf_barista_cfg_path"
    END
END

