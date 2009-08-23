//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_FINDETAIL - Financial Report Detail Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0585
BEGIN
    NAME "win_glm_findetail"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "N.º de línea de informe financiero:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_line"
    END
    
    INPUTE 03001, "", 156, 10, 40, 19
    BEGIN
        NAME "ine_gl_rpt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Tipo de línea:", 75, 34, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_type"
    END
    
    LISTBUTTON 03002, "", 156, 31, 89, 300
    BEGIN
        NAME "lbx_line_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Descripción de la línea:", 18, 55, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_line_desc"
    END
    
    INPUTE 03003, "", 156, 52, 280, 19
    BEGIN
        NAME "ine_gl_line_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 35
    END
    
    STATICTEXT 02004, "Posición de impresión predeterminada:", 0, 76, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_default_pos"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_default_pos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02005, "Edición [S/U/D/P/-/C/F/$]:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_editing_code"
    END
    
    INPUTE 03005, "", 156, 94, 40, 19
    BEGIN
        NAME "ine_editing_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02006, "Número total de entrada:", 7, 118, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_input_total"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_input_total"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02007, "Número de porcentaje de entrada:", 0, 139, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_input_percnt"
    END
    
    INPUTE 03007, "", 156, 136, 35, 19
    BEGIN
        NAME "ine_input_percnt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    CHECKBOX 03008, "¿Acumular porcentaje?", 154, 157, 164, 19
    BEGIN
        NAME "cbx_accum_pct"
        NOT OPAQUE
    END
    
    STATICTEXT 02009, "Número total de salida:", 18, 181, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_01"
    END
    
    INPUTE 03009, "", 156, 178, 35, 19
    BEGIN
        NAME "ine_output_total_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02010, "Operador total de salida:", 8, 202, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_01"
    END
    
    LISTBUTTON 03010, "", 156, 199, 35, 300
    BEGIN
        NAME "lbx_output_oper_01"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02011, "Número total de salida:", 18, 223, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_02"
    END
    
    INPUTE 03011, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_output_total_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02012, "Operador total de salida:", 8, 244, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_02"
    END
    
    LISTBUTTON 03012, "", 156, 241, 35, 300
    BEGIN
        NAME "lbx_output_oper_02"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02013, "Número total de salida:", 18, 265, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_03"
    END
    
    INPUTE 03013, "", 156, 262, 35, 19
    BEGIN
        NAME "ine_output_total_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02014, "Operador total de salida:", 8, 286, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_03"
    END
    
    LISTBUTTON 03014, "", 156, 283, 35, 300
    BEGIN
        NAME "lbx_output_oper_03"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02015, "Número total de salida:", 18, 307, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_04"
    END
    
    INPUTE 03015, "", 156, 304, 35, 19
    BEGIN
        NAME "ine_output_total_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02016, "Operador total de salida:", 8, 328, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_04"
    END
    
    LISTBUTTON 03016, "", 156, 325, 35, 300
    BEGIN
        NAME "lbx_output_oper_04"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02017, "Número total de salida:", 18, 349, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_05"
    END
    
    INPUTE 03017, "", 156, 346, 35, 19
    BEGIN
        NAME "ine_output_total_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02018, "Operador:", 93, 370, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_05"
    END
    
    LISTBUTTON 03018, "", 156, 367, 35, 300
    BEGIN
        NAME "lbx_output_oper_05"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02019, "1:", 142, 391, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_01"
    END
    
    INPUTE 03019, "", 156, 388, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02020, "2:", 142, 412, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_02"
    END
    
    INPUTE 03020, "", 156, 409, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02021, "3:", 142, 433, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_03"
    END
    
    INPUTE 03021, "", 156, 430, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02022, "4:", 142, 454, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_04"
    END
    
    INPUTE 03022, "", 156, 451, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02023, "5:", 142, 475, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_05"
    END
    
    INPUTE 03023, "", 156, 472, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02024, "6:", 142, 496, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_06"
    END
    
    INPUTE 03024, "", 156, 493, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02025, "7:", 142, 517, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_07"
    END
    
    INPUTE 03025, "", 156, 514, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02026, "8:", 142, 538, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_08"
    END
    
    INPUTE 03026, "", 156, 535, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
END

