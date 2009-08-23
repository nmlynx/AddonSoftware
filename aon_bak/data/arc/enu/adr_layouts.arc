//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADR_LAYOUTS - Table Layouts Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0105
BEGIN
    NAME "win_adr_layouts"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Table Alias:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dd_table_alias"
    END
    
    INPUTE 03001, "", 130, 10, 160, 19
    BEGIN
        NAME "ine_dd_table_alias"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 316, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_dd_table_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 290, 10, 20, 19
    BEGIN
        NAME "tbnf_dd_table_alias"
    END
    
    STATICTEXT 02002, "Ending Table Alias:", 16, 34, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dd_table_alias"
    END
    
    INPUTE 03002, "", 130, 31, 160, 19
    BEGIN
        NAME "ine_dd_table_alias"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 316, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_dd_table_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 290, 31, 20, 19
    BEGIN
        NAME "tbnf_dd_table_alias"
    END
    
    CHECKBOX 03003, "Layouts Only?", 128, 52, 112, 19
    BEGIN
        NAME "cbx_layouts_only"
        NOT OPAQUE
    END
END

