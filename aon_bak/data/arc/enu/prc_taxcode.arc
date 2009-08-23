//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRC_TAXCODE - Tax Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0630 0401
BEGIN
    NAME "win_prc_taxcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Tax Code:", 68, 13, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_code_desc"
    END
    
    INPUTE 03002, "", 130, 31, 160, 19
    BEGIN
        NAME "ine_pr_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    GROUPBOX 19003, "Additional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_report_code"
    END
    
    STATICTEXT 02003, "Report Code:", 50, 76, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_code"
    END
    
    INPUTE 03003, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_report_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02004, "Tax Type:", 70, 97, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_type"
    END
    
    LISTBUTTON 03004, "", 130, 94, 77, 300
    BEGIN
        NAME "lbx_tax_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Periods Taken:", 42, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pers_taken"
    END
    
    INPUTE 03005, "", 130, 115, 50, 19
    BEGIN
        NAME "ine_pers_taken"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02006, "Reg/Prem:", 66, 139, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_regprem_flg"
    END
    
    LISTBUTTON 03006, "", 130, 136, 82, 300
    BEGIN
        NAME "lbx_regprem_flg"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02007, "Total Code:", 60, 160, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_basis_tot_cd"
    END
    
    INPUTE 03007, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_basis_tot_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04007, "", 191, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_basis_tot_cd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 165, 157, 20, 19
    BEGIN
        NAME "tbnf_basis_tot_cd"
    END
    
    STATICTEXT 02008, "Tax Rate:", 74, 181, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_calc_rtamt"
    END
    INPUTN 03008, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_calc_rtamt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Minimum Limit:", 38, 202, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_limit"
    END
    INPUTN 03009, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_min_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Maximum Limit:", 35, 223, 92, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_limit"
    END
    INPUTN 03010, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_max_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03011, "Special Tax", 448, 73, 96, 19
    BEGIN
        NAME "cbx_special_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Jurisdiction Name:", 341, 97, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_juris"
    END
    
    INPUTE 03012, "", 450, 94, 100, 19
    BEGIN
        NAME "ine_tax_juris"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02013, "Tax Jurisdiction Type:", 320, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_jur_type"
    END
    
    INPUTE 03013, "", 450, 115, 35, 19
    BEGIN
        NAME "ine_tax_jur_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02014, "Federal ID Number:", 335, 139, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_federal_id"
    END
    
    INPUTE 03014, "", 450, 136, 150, 19
    BEGIN
        NAME "ine_federal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02015, "Calculation Sequence:", 319, 160, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_calc_seq"
    END
    
    INPUTE 03015, "", 450, 157, 100, 19
    BEGIN
        NAME "ine_pr_calc_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02016, "State ID Code:", 366, 181, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_state_id"
    END
    
    INPUTE 03016, "", 450, 178, 150, 19
    BEGIN
        NAME "ine_state_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    GROUPBOX 19017, "Totals ", -4, 244, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_pr_total_to"
    END
    
    STATICTEXT 02017, "Total To:", 76, 265, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03017, "", 130, 262, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04017, "", 191, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20017, "", 165, 262, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02018, "Total To:", 76, 286, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03018, "", 130, 283, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04018, "", 191, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20018, "", 165, 283, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02019, "Total To:", 76, 307, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03019, "", 130, 304, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04019, "", 191, 308, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20019, "", 165, 304, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02020, "Total To:", 76, 328, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03020, "", 130, 325, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04020, "", 191, 329, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20020, "", 165, 325, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02021, "Total To:", 76, 349, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03021, "", 130, 346, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04021, "", 191, 350, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20021, "", 165, 346, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02022, "Operator:", 390, 265, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03022, "", 450, 262, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02023, "Operator:", 390, 286, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03023, "", 450, 283, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02024, "Operator:", 390, 307, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03024, "", 450, 304, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02025, "Operator:", 390, 328, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03025, "", 450, 325, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02026, "Operator:", 390, 349, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03026, "", 450, 346, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

