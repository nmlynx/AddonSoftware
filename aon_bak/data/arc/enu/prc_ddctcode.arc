//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRC_DDCTCODE - Deduction Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0422
BEGIN
    NAME "win_prc_ddctcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Deduction Code:", 30, 13, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_deduct_code"
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
    
    STATICTEXT 02004, "Deduction Type:", 32, 97, 95, 16
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
    
    STATICTEXT 02006, "Total Code:", 60, 139, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_basis_tot_cd"
    END
    
    INPUTE 03006, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_basis_tot_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04006, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_basis_tot_cd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_basis_tot_cd"
    END
    
    STATICTEXT 02007, "GL Account:", 56, 160, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03007, "", 130, 157, 130, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 286, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 260, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02008, "Deduction Rate:", 35, 181, 92, 16
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
    
    STATICTEXT 02009, "Deduction Limit:", 32, 202, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_limit"
    END
    INPUTN 03009, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_deduct_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03010, "Special Deduction", 128, 220, 134, 19
    BEGIN
        NAME "cbx_special_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02011, "Balance or Limit:", 32, 244, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bal_or_limit"
    END
    
    LISTBUTTON 03011, "", 130, 241, 75, 300
    BEGIN
        NAME "lbx_bal_or_limit"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    GROUPBOX 19012, "Totals ", -4, 265, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_pr_total_to"
    END
    
    STATICTEXT 02012, "Total To 01'':", 50, 286, 77, 16
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
    
    STATICTEXT 02013, "Total To 02'':", 50, 307, 77, 16
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
    
    STATICTEXT 02014, "Total To 03'':", 50, 328, 77, 16
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
    
    STATICTEXT 02015, "Total To 04'':", 50, 349, 77, 16
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
    
    STATICTEXT 02016, "Total To 05'':", 50, 370, 77, 16
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
    
    STATICTEXT 02017, "Operator:", 265, 286, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03017, "", 325, 283, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02018, "Operator:", 265, 307, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03018, "", 325, 304, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02019, "Operator:", 265, 328, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03019, "", 325, 325, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02020, "Operator:", 265, 349, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03020, "", 325, 346, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02021, "Operator:", 265, 370, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03021, "", 325, 367, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

