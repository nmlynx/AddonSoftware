//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APS_PARAMS - AP Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0312
BEGIN
    NAME "win_aps_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Current Period:", 37, 13, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Current Year:", 48, 34, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    GROUPBOX 19003, "Settings ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_cur_1099_yr"
    END
    
    STATICTEXT 02003, "Form 1099 Year:", 30, 76, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_1099_yr"
    END
    
    INPUTE 03003, "", 130, 73, 70, 19
    BEGIN
        NAME "ine_cur_1099_yr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02004, "Beginning Comment Line:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_beg_cmt_line"
    END
    
    INPUTE 03004, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_beg_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02005, "Ending Comment Line:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_cmt_line"
    END
    
    INPUTE 03005, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_end_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03006, "Multiple A/P Types", 248, 73, 140, 19
    BEGIN
        NAME "cbx_multi_types"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "Multiple Distributions", 248, 94, 156, 19
    BEGIN
        NAME "cbx_multi_dist"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "Retention Account", 248, 115, 138, 19
    BEGIN
        NAME "cbx_ret_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Cash Basis", 248, 136, 92, 19
    BEGIN
        NAME "cbx_cash_basis"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "Retain Zero Invoices", 248, 157, 148, 19
    BEGIN
        NAME "cbx_hold_zero"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Print Checks In AP Type Seq", 248, 178, 192, 19
    BEGIN
        NAME "cbx_ap_check_seq"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "Print Memo On Check Stub", 438, 73, 186, 19
    BEGIN
        NAME "cbx_ap_chk_memo"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Print Dist On Check Stub", 438, 94, 174, 19
    BEGIN
        NAME "cbx_ap_chk_dist"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Miscellaneous Entry", 438, 115, 146, 19
    BEGIN
        NAME "cbx_misc_entry"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Bank Reconciliation", 438, 136, 143, 19
    BEGIN
        NAME "cbx_br_interface"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "Post to Closed Periods", 438, 157, 162, 19
    BEGIN
        NAME "cbx_post_closed"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "Replenishment Processing", 438, 178, 185, 19
    BEGIN
        NAME "cbx_use_replen"
        NOT OPAQUE
    END
    
    GROUPBOX 19018, "Labels ", -4, 202, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_label_across"
    END
    
    STATICTEXT 02018, "Labels Up:", 67, 223, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03018, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02019, "Label Width:", 57, 244, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03019, "", 130, 241, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02020, "Label Length:", 49, 265, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03020, "", 130, 262, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
END

