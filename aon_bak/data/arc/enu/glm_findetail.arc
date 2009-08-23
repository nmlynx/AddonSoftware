//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_FINDETAIL - Financial Report Detail Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0585
BEGIN
    NAME "win_glm_findetail"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Financial Report Line Nbr:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_line"
    END
    
    INPUTE 03001, "", 130, 10, 40, 19
    BEGIN
        NAME "ine_gl_rpt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Line Type:", 68, 34, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_type"
    END
    
    LISTBUTTON 03002, "", 130, 31, 89, 300
    BEGIN
        NAME "lbx_line_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Line Description:", 28, 55, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_line_desc"
    END
    
    INPUTE 03003, "", 130, 52, 280, 19
    BEGIN
        NAME "ine_gl_line_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 35
    END
    
    STATICTEXT 02004, "Default Print Position:", 1, 76, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_default_pos"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_default_pos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02005, "Editing [S/U/D/P/-/C/F/$]:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_editing_code"
    END
    
    INPUTE 03005, "", 130, 94, 40, 19
    BEGIN
        NAME "ine_editing_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02006, "Input Total Number:", 10, 118, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_input_total"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_input_total"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02007, "Input Percentage Number:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_input_percnt"
    END
    
    INPUTE 03007, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_input_percnt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    CHECKBOX 03008, "Accumulate Percent?", 128, 157, 152, 19
    BEGIN
        NAME "cbx_accum_pct"
        NOT OPAQUE
    END
    
    STATICTEXT 02009, "Output Total Number:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_01"
    END
    
    INPUTE 03009, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_output_total_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02010, "Output Total Operator:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_01"
    END
    
    LISTBUTTON 03010, "", 130, 199, 35, 300
    BEGIN
        NAME "lbx_output_oper_01"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02011, "Output Total Number:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_02"
    END
    
    INPUTE 03011, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_output_total_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02012, "Output Total Operator:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_02"
    END
    
    LISTBUTTON 03012, "", 130, 241, 35, 300
    BEGIN
        NAME "lbx_output_oper_02"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02013, "Output Total Number:", 0, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_03"
    END
    
    INPUTE 03013, "", 130, 262, 35, 19
    BEGIN
        NAME "ine_output_total_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02014, "Output Total Operator:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_03"
    END
    
    LISTBUTTON 03014, "", 130, 283, 35, 300
    BEGIN
        NAME "lbx_output_oper_03"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02015, "Output Total Number:", 0, 307, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_04"
    END
    
    INPUTE 03015, "", 130, 304, 35, 19
    BEGIN
        NAME "ine_output_total_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02016, "Output Total Operator:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_04"
    END
    
    LISTBUTTON 03016, "", 130, 325, 35, 300
    BEGIN
        NAME "lbx_output_oper_04"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02017, "Output Total Number:", 0, 349, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_total_05"
    END
    
    INPUTE 03017, "", 130, 346, 35, 19
    BEGIN
        NAME "ine_output_total_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02018, "Operator:", 70, 370, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_output_oper_05"
    END
    
    LISTBUTTON 03018, "", 130, 367, 35, 300
    BEGIN
        NAME "lbx_output_oper_05"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02019, "1:", 116, 391, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_01"
    END
    
    INPUTE 03019, "", 130, 388, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02020, "2:", 116, 412, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_02"
    END
    
    INPUTE 03020, "", 130, 409, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02021, "3:", 116, 433, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_03"
    END
    
    INPUTE 03021, "", 130, 430, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02022, "4:", 116, 454, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_04"
    END
    
    INPUTE 03022, "", 130, 451, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02023, "5:", 116, 475, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_05"
    END
    
    INPUTE 03023, "", 130, 472, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02024, "6:", 116, 496, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_06"
    END
    
    INPUTE 03024, "", 130, 493, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02025, "7:", 116, 517, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_07"
    END
    
    INPUTE 03025, "", 130, 514, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02026, "8:", 116, 538, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_col_08"
    END
    
    INPUTE 03026, "", 130, 535, 35, 19
    BEGIN
        NAME "ine_gl_rpt_col_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
END

