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
    
    GROUPBOX 19001, "Record Codes ", -4, 13, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_record_cd_1"
    END
    
    LISTBUTTON 03001, "", 60, 31, 200, 300
    BEGIN
        NAME "lbx_record_cd_1"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03002, "", 60, 52, 200, 300
    BEGIN
        NAME "lbx_record_cd_2"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03003, "", 60, 73, 200, 300
    BEGIN
        NAME "lbx_record_cd_3"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03004, "", 60, 94, 200, 300
    BEGIN
        NAME "lbx_record_cd_4"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    GROUPBOX 19005, "Budget Codes ", -4, 118, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_bud_cd_1"
    END
    
    LISTBUTTON 03005, "", 60, 136, 200, 300
    BEGIN
        NAME "lbx_bud_cd_1"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03006, "", 60, 157, 200, 300
    BEGIN
        NAME "lbx_bud_cd_2"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03007, "", 60, 178, 200, 300
    BEGIN
        NAME "lbx_bud_cd_3"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    LISTBUTTON 03008, "", 60, 199, 200, 300
    BEGIN
        NAME "lbx_bud_cd_4"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
END

