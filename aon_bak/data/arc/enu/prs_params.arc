//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_PARAMS - Payroll Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0335 0480
BEGIN
    NAME "win_prs_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Current Period:", 62, 13, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03001, "", 155, 10, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Current Year:", 73, 34, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03002, "", 155, 31, 40, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02003, "Employee Number Mask:", 9, 76, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_input"
    END
    
    INPUTE 03003, "", 155, 73, 120, 19
    BEGIN
        NAME "ine_empl_input"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02004, "Amount Mask:", 69, 97, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amount_mask"
    END
    
    INPUTE 03004, "", 155, 94, 150, 19
    BEGIN
        NAME "ine_amount_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02005, "Unit Mask:", 92, 118, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_mask"
    END
    
    INPUTE 03005, "", 155, 115, 120, 19
    BEGIN
        NAME "ine_unit_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02006, "Rate Mask:", 91, 139, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rate_mask"
    END
    
    INPUTE 03006, "", 155, 136, 120, 19
    BEGIN
        NAME "ine_rate_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02007, "Regular Pay Code:", 47, 181, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reg_pay_code"
    END
    
    INPUTE 03007, "", 155, 178, 35, 19
    BEGIN
        NAME "ine_reg_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02008, "Maximum Totals:", 52, 202, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_totals"
    END
    
    INPUTE 03008, "", 155, 199, 35, 19
    BEGIN
        NAME "ine_max_totals"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02009, "Precision:", 95, 223, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_precision"
    END
    
    INPUTE 03009, "", 155, 220, 35, 19
    BEGIN
        NAME "ine_precision"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    STATICTEXT 02010, "Department Size:", 53, 244, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dept_size"
    END
    
    INPUTE 03010, "", 155, 241, 35, 19
    BEGIN
        NAME "ine_dept_size"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    STATICTEXT 02011, "Check Printing Program:", 9, 265, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_chk_prnt_pgm"
    END
    
    INPUTE 03011, "", 155, 262, 100, 19
    BEGIN
        NAME "ine_chk_prnt_pgm"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    CHECKBOX 03012, "Multiple Titles?", 153, 283, 116, 19
    BEGIN
        NAME "cbx_multi_titles"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Union History?", 153, 304, 116, 19
    BEGIN
        NAME "cbx_union_hist"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Accrue Taxes At Period End?", 153, 325, 198, 19
    BEGIN
        NAME "cbx_tax_acc_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Bank Reconciliation Installed?", 153, 346, 201, 19
    BEGIN
        NAME "cbx_br_installed"
        NOT OPAQUE
    END
    
    STATICTEXT 02016, "Number of Labels Across:", 1, 391, 151, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03016, "", 155, 388, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02017, "Vertical Lines Per Label:", 15, 412, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03017, "", 155, 409, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02018, "Horizontal Chars Per Label:", 0, 433, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03018, "", 155, 430, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
END

