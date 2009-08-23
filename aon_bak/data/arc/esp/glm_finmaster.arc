//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_FINMASTER - Financial Report Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0704 0386
BEGIN
    NAME "win_glm_finmaster"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Número de informe:", 36, 13, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_no"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_gl_rpt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_desc"
    END
    
    INPUTE 03002, "", 156, 31, 160, 19
    BEGIN
        NAME "ine_gl_rpt_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02003, "N.º de encabezamiento:", 16, 55, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_heading_no"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_heading_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02004, "Máscara de dólar:", 50, 76, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amount_mask"
    END
    
    INPUTE 03004, "", 156, 73, 120, 19
    BEGIN
        NAME "ine_amount_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02005, "Máscara de la unidad:", 27, 97, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_mask"
    END
    
    INPUTE 03005, "", 156, 94, 96, 19
    BEGIN
        NAME "ine_unit_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02006, "Máscara del índice:", 42, 118, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ratio_mask"
    END
    
    INPUTE 03006, "", 156, 115, 120, 19
    BEGIN
        NAME "ine_ratio_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02007, "Máscara del porcentaje:", 15, 139, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_percent_mask"
    END
    
    INPUTE 03007, "", 156, 136, 80, 19
    BEGIN
        NAME "ine_percent_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02008, "Grid 'Editing' Choices:", 492, 76, 118, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lab1"
    END
    
    STATICTEXT 02009, "S=Space,  U=Underline, P=Page", 492, 97, 170, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lab2"
    END
    
    STATICTEXT 02010, "C=Clear Total, -=Sign Change", 492, 118, 163, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lab3"
    END
    
    STATICTEXT 02011, "F=Unfav, $=$ Mask D=Dbl Underl", 492, 139, 182, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lab4"
    END
    CHILD-WINDOW 1109 1109 5 0190
END
CHILD-WINDOW 1109 0694 0016
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0692 100
    BEGIN
        NAME "grd_GLM_FINDETAIL"
        CLIENTEDGE
        ROWHEAD 20, 05902
        ROWS 20
        COLUMNHEAD 18, 05901
        USERSIZE
        HORIZLINES
        HSCROLLBAR
        VERTLINES
        VSCROLLBAR
        GRIDROWDEFAULTHEIGHT 18
        COLUMNS 27
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 35
        GRIDCOLTITLE 1, "Line #"
        GRIDCOLWIDTH 2, 35
        GRIDCOLTITLE 2, "Type"
        GRIDCOLWIDTH 3, 280
        GRIDCOLTITLE 3, "Description"
        GRIDCOLWIDTH 4, 35
        GRIDCOLTITLE 4, "Prnt Pos"
        GRIDCOLWIDTH 5, 40
        GRIDCOLTITLE 5, "Editing"
        GRIDCOLWIDTH 6, 35
        GRIDCOLTITLE 6, "Input Tot#"
        GRIDCOLWIDTH 7, 35
        GRIDCOLTITLE 7, "Input %"
        GRIDCOLWIDTH 8, 35
        GRIDCOLTITLE 8, "Accum"
        GRIDCOLWIDTH 9, 35
        GRIDCOLTITLE 9, "Tot #"
        GRIDCOLWIDTH 10, 35
        GRIDCOLTITLE 10, "Oper"
        GRIDCOLWIDTH 11, 35
        GRIDCOLTITLE 11, "Tot #"
        GRIDCOLWIDTH 12, 35
        GRIDCOLTITLE 12, "Oper"
        GRIDCOLWIDTH 13, 35
        GRIDCOLTITLE 13, "Tot #"
        GRIDCOLWIDTH 14, 35
        GRIDCOLTITLE 14, "Oper"
        GRIDCOLWIDTH 15, 35
        GRIDCOLTITLE 15, "Tot #"
        GRIDCOLWIDTH 16, 35
        GRIDCOLTITLE 16, "Oper"
        GRIDCOLWIDTH 17, 35
        GRIDCOLTITLE 17, "Tot #"
        GRIDCOLWIDTH 18, 35
        GRIDCOLTITLE 18, "Oper"
        GRIDCOLWIDTH 19, 35
        GRIDCOLTITLE 19, "Col 1"
        GRIDCOLWIDTH 20, 35
        GRIDCOLTITLE 20, "Col 2"
        GRIDCOLWIDTH 21, 35
        GRIDCOLTITLE 21, "Col 3"
        GRIDCOLWIDTH 22, 35
        GRIDCOLTITLE 22, "Col 4"
        GRIDCOLWIDTH 23, 35
        GRIDCOLTITLE 23, "Col 5"
        GRIDCOLWIDTH 24, 35
        GRIDCOLTITLE 24, "Col 6"
        GRIDCOLWIDTH 25, 35
        GRIDCOLTITLE 25, "Col 7"
        GRIDCOLWIDTH 26, 35
        GRIDCOLTITLE 26, "Col 8"
    END

END

