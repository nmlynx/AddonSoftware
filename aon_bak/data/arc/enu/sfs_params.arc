//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFS_PARAMS - Work Order Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0522
BEGIN
    NAME "win_sfs_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Employee Number Mask:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_input"
    END
    
    INPUTE 03001, "", 130, 10, 120, 19
    BEGIN
        NAME "ine_empl_input"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02002, "Employee Number Size:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_no_len"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_empl_no_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Maximum Employee Number Size:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_empl_no"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_max_empl_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03004, "Bill of Mat Interface Enabled?", 128, 73, 196, 19
    BEGIN
        NAME "cbx_bm_interface"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Accts Rec Interface Enabled?", 128, 94, 197, 19
    BEGIN
        NAME "cbx_ar_interface"
        NOT OPAQUE
    END
    
    CHECKBOX 03006, "Purch Order Interface Enabled?", 128, 115, 212, 19
    BEGIN
        NAME "cbx_po_interface"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "Payroll Interface Enabled?", 128, 136, 179, 19
    BEGIN
        NAME "cbx_pr_interface"
        NOT OPAQUE
    END
    
    STATICTEXT 02008, "Number of Labels Across:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03008, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02009, "Vertical Lines Per Label:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03009, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02010, "Horizontal Chars Per Label:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03010, "", 130, 199, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02011, "Use Payroll At Actual Or Std:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_actstd"
    END
    
    INPUTE 03011, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_pay_actstd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02012, "Overhead Calc Type:", 6, 244, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_overhd_type"
    END
    
    INPUTE 03012, "", 130, 241, 35, 19
    BEGIN
        NAME "ine_overhd_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    CHECKBOX 03013, "Use Time Clock In Entry?", 128, 262, 174, 19
    BEGIN
        NAME "cbx_time_clk_flg"
        NOT OPAQUE
    END
    
    STATICTEXT 02014, "Default Overhead Rate:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_ovd_rate"
    END
    
    INPUTE 03014, "", 130, 283, 60, 19
    BEGIN
        NAME "ine_def_ovd_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 02015, "Time Sheet Entry Sequence:", 0, 307, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_time_entry_s"
    END
    
    INPUTE 03015, "", 130, 304, 35, 19
    BEGIN
        NAME "ine_time_entry_s"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02016, "Max Nbr of Op Codes/Work Order:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_op_codes"
    END
    
    INPUTE 03016, "", 130, 325, 35, 19
    BEGIN
        NAME "ine_max_op_codes"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03017, "Print Costs On Traveler?", 128, 346, 173, 19
    BEGIN
        NAME "cbx_print_costs"
        NOT OPAQUE
    END
    
    STATICTEXT 02018, "Current Period:", 37, 370, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03018, "", 130, 367, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02019, "Current Year:", 48, 391, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03019, "", 130, 388, 40, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02020, "Employee Number Mask:", 0, 412, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_output"
    END
    
    INPUTE 03020, "", 130, 409, 120, 19
    BEGIN
        NAME "ine_empl_output"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02021, "Amount Mask:", 44, 433, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amount_mask"
    END
    
    INPUTE 03021, "", 130, 430, 150, 19
    BEGIN
        NAME "ine_amount_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02022, "Unit Mask:", 67, 454, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_mask"
    END
    
    INPUTE 03022, "", 130, 451, 120, 19
    BEGIN
        NAME "ine_unit_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02023, "Rate Mask:", 66, 475, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rate_mask"
    END
    
    INPUTE 03023, "", 130, 472, 120, 19
    BEGIN
        NAME "ine_rate_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
END

