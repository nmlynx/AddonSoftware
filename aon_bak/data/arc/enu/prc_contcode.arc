//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRC_CONTCODE - Contribution Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0422
BEGIN
    NAME "win_prc_contcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Contribution Code:", 14, 13, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_contrib_code"
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
        NAME "ghl_check_code"
    END
    
    STATICTEXT 02003, "Report Code:", 50, 76, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_code"
    END
    
    INPUTE 03003, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_check_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02004, "Calculation Type:", 26, 97, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_calc_type"
    END
    
    LISTBUTTON 03004, "", 130, 94, 73, 300
    BEGIN
        NAME "lbx_calc_type"
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
    
    STATICTEXT 02008, "Calculation Rate:", 30, 181, 97, 16
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
    
    CHECKBOX 03011, "Special Code Flag", 128, 241, 132, 19
    BEGIN
        NAME "cbx_special_flag"
        NOT OPAQUE
    END
    
    GROUPBOX 19012, "Totals ", -4, 265, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_pr_total_to"
    END
    
    STATICTEXT 02012, "Total To 01:", 57, 286, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03012, "", 130, 283, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04012, "", 191, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 165, 283, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02013, "Total To 02:", 57, 307, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03013, "", 130, 304, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04013, "", 191, 308, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20013, "", 165, 304, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02014, "Total To 03:", 57, 328, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03014, "", 130, 325, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04014, "", 191, 329, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20014, "", 165, 325, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02015, "Total To 04:", 57, 349, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03015, "", 130, 346, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04015, "", 191, 350, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20015, "", 165, 346, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02016, "Total To 05:", 57, 370, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03016, "", 130, 367, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04016, "", 191, 371, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20016, "", 165, 367, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02017, "Operator:", 240, 286, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03017, "", 300, 283, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02018, "Operator:", 240, 307, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03018, "", 300, 304, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02019, "Operator:", 240, 328, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03019, "", 300, 325, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02020, "Operator:", 240, 349, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03020, "", 300, 346, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02021, "Operator:", 240, 370, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03021, "", 300, 367, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

