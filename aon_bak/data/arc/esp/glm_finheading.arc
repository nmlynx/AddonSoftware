//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_FINHEADING - Financial Report Headings
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 1161 0148
BEGIN
    NAME "win_glm_finheading"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    HSCROLLBAR
    VSCROLLBAR
    ENTERASTAB
    
    STATICTEXT 02001, "Número de encabezamiento:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_heading_no"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_heading_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Sequence Number:", 43, 34, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_no"
    END
    
    INPUTE 03002, "", 156, 31, 39, 19
    BEGIN
        NAME "ine_sequence_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    INPUTE 03003, "", 156, 52, 940, 19
    BEGIN
        NAME "ine_guide"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 135
    END
    
    STATICTEXT 02004, "Encabezamiento:", 54, 76, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rpt_heading"
    END
    
    INPUTE 03004, "", 156, 73, 940, 19
    BEGIN
        NAME "ine_rpt_heading"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 132
    END
END

