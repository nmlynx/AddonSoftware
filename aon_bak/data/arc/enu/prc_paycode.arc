//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRC_PAYCODE - Pay Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0435 0590
BEGIN
    NAME "win_prc_paycode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Pay Code:", 70, 13, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_pay_code"
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
    
    CHECKBOX 03004, "Units", 128, 94, 60, 19
    BEGIN
        NAME "cbx_units_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Auto Deduct", 128, 115, 103, 19
    BEGIN
        NAME "cbx_auto_deduct"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Accrual Type:", 47, 139, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_calc_type"
    END
    
    LISTBUTTON 03006, "", 130, 136, 73, 300
    BEGIN
        NAME "lbx_calc_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02007, "Accrual Basis:", 46, 160, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_accr_basis"
    END
    
    INPUTE 03007, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_accr_basis"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02008, "Accrual Total:", 46, 181, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_basis_tot_cd"
    END
    
    INPUTE 03008, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_basis_tot_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04008, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_basis_tot_cd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_basis_tot_cd"
    END
    
    STATICTEXT 02009, "Calculation Rate:", 30, 202, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_calc_rtamt"
    END
    INPUTN 03009, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_calc_rtamt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Premium Rate:", 44, 223, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prem_factor"
    END
    INPUTN 03010, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_prem_factor"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Standard Pay Units:", 14, 244, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_units"
    END
    INPUTN 03011, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_pay_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Accrual Rate or Amount:", 0, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_accr_ramt"
    END
    INPUTN 03012, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_accr_ramt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03013, "Productive Flag", 128, 283, 120, 19
    BEGIN
        NAME "cbx_productive"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Special Code Flag", 128, 304, 132, 19
    BEGIN
        NAME "cbx_special_flag"
        NOT OPAQUE
    END
    
    GROUPBOX 19015, "Totals ", -4, 328, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_pr_total_to"
    END
    
    STATICTEXT 02015, "Total To:", 26, 349, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03015, "", 80, 346, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04015, "", 141, 350, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20015, "", 115, 346, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02016, "Total To:", 26, 370, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03016, "", 80, 367, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04016, "", 141, 371, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20016, "", 115, 367, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02017, "Total To:", 26, 391, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03017, "", 80, 388, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04017, "", 141, 392, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20017, "", 115, 388, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02018, "Total To:", 26, 412, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03018, "", 80, 409, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04018, "", 141, 413, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20018, "", 115, 409, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02019, "Total To:", 26, 433, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03019, "", 80, 430, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04019, "", 141, 434, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20019, "", 115, 430, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02020, "Total To:", 26, 454, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03020, "", 80, 451, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04020, "", 141, 455, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20020, "", 115, 451, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02021, "Total To:", 26, 475, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03021, "", 80, 472, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04021, "", 141, 476, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20021, "", 115, 472, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02022, "Total To:", 26, 496, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03022, "", 80, 493, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04022, "", 141, 497, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20022, "", 115, 493, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02023, "Total To:", 26, 517, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03023, "", 80, 514, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04023, "", 141, 518, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20023, "", 115, 514, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02024, "Total To:", 26, 538, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_total_to"
    END
    
    INPUTE 03024, "", 80, 535, 35, 19
    BEGIN
        NAME "ine_pr_total_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04024, "", 141, 539, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pr_total_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20024, "", 115, 535, 20, 19
    BEGIN
        NAME "tbnf_pr_total_to"
    END
    
    STATICTEXT 02025, "Special Function:", 268, 349, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03025, "", 370, 346, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02026, "Special Function:", 268, 370, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03026, "", 370, 367, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02027, "Special Function:", 268, 391, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03027, "", 370, 388, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02028, "Special Function:", 268, 412, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03028, "", 370, 409, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02029, "Special Function:", 268, 433, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03029, "", 370, 430, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02030, "Special Function:", 268, 454, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03030, "", 370, 451, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02031, "Special Function:", 268, 475, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03031, "", 370, 472, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02032, "Special Function:", 268, 496, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03032, "", 370, 493, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02033, "Special Function:", 268, 517, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03033, "", 370, 514, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02034, "Special Function:", 268, 538, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_spec_func"
    END
    
    INPUTE 03034, "", 370, 535, 35, 19
    BEGIN
        NAME "ine_pr_spec_func"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02035, "Operator:", 170, 349, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03035, "", 230, 346, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02036, "Operator:", 170, 370, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03036, "", 230, 367, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02037, "Operator:", 170, 391, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03037, "", 230, 388, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02038, "Operator:", 170, 412, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03038, "", 230, 409, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02039, "Operator:", 170, 433, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03039, "", 230, 430, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02040, "Operator:", 170, 454, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03040, "", 230, 451, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02041, "Operator:", 170, 475, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03041, "", 230, 472, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02042, "Operator:", 170, 496, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03042, "", 230, 493, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02043, "Operator:", 170, 517, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03043, "", 230, 514, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02044, "Operator:", 170, 538, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_tot_oper"
    END
    
    LISTBUTTON 03044, "", 230, 535, 70, 300
    BEGIN
        NAME "lbx_pr_tot_oper"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

