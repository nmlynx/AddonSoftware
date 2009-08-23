//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADR_LAYOUTS - Table Layouts Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0105
BEGIN
    NAME "win_adr_layouts"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Alias de tabla:", 10, 13, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dd_table_alias"
    END
    
    INPUTE 03001, "", 156, 10, 160, 19
    BEGIN
        NAME "ine_dd_table_alias"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 342, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_dd_table_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 316, 10, 20, 19
    BEGIN
        NAME "tbnf_dd_table_alias"
    END
    
    STATICTEXT 02002, "Ending Alias de tabla:", 28, 34, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dd_table_alias"
    END
    
    INPUTE 03002, "", 156, 31, 160, 19
    BEGIN
        NAME "ine_dd_table_alias"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 342, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_dd_table_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 316, 31, 20, 19
    BEGIN
        NAME "tbnf_dd_table_alias"
    END
    
    CHECKBOX 03003, "¿Solamente diseños?", 154, 52, 151, 19
    BEGIN
        NAME "cbx_layouts_only"
        NOT OPAQUE
    END
END

