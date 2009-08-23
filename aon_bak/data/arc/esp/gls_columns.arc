//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLS_COLUMNS - Default Display Columns
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0254
BEGIN
    NAME "win_gls_columns"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    GROUPBOX 19001, "Códigos de registro ", -4, 13, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_record_cd_1"
    END
    
    LISTBUTTON 03001, "", 72, 31, 200, 300
    BEGIN
        NAME "lbx_record_cd_1"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03002, "", 72, 52, 200, 300
    BEGIN
        NAME "lbx_record_cd_2"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03003, "", 72, 73, 200, 300
    BEGIN
        NAME "lbx_record_cd_3"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03004, "", 72, 94, 200, 300
    BEGIN
        NAME "lbx_record_cd_4"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    GROUPBOX 19005, "Códigos del presupuesto ", -4, 118, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_bud_cd_1"
    END
    
    LISTBUTTON 03005, "", 72, 136, 200, 300
    BEGIN
        NAME "lbx_bud_cd_1"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03006, "", 72, 157, 200, 300
    BEGIN
        NAME "lbx_bud_cd_2"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03007, "", 72, 178, 200, 300
    BEGIN
        NAME "lbx_bud_cd_3"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03008, "", 72, 199, 200, 300
    BEGIN
        NAME "lbx_bud_cd_4"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
END

