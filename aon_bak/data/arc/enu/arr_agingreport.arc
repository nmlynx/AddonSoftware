//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_AGINGREPORT - Aging Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0775 0332
BEGIN
    NAME "win_arr_agingreport"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Aging Date:", 39, 13, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_date"
    END
    
    INPUTD 03001, "", 110, 10, 85, 19
    BEGIN
        NAME "ind_report_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 195, 10, 20, 19
    BEGIN
        NAME "tbnc_report_date"
    END
    
    STATICTEXT 02002, "Age by:", 63, 34, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_type"
    END
    
    LISTBUTTON 03002, "", 110, 31, 91, 300
    BEGIN
        NAME "lbx_report_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Summary or Detail:", 0, 76, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_summ_det"
    END
    
    LISTBUTTON 03003, "", 110, 73, 74, 300
    BEGIN
        NAME "lbx_report_summ_det"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Report Sequence:", 5, 97, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_option"
    END
    
    LISTBUTTON 03004, "", 110, 94, 88, 300
    BEGIN
        NAME "lbx_report_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Sort Sequence:", 301, 13, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03005, "", 390, 10, 140, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Beginning Customer ID:", 249, 34, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03006, "", 390, 31, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04006, "", 464, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 438, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02007, "Ending Customer ID:", 266, 55, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03007, "", 390, 52, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04007, "", 464, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 438, 52, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02008, "Beginning Alt Sequence:", 247, 76, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03008, "", 390, 73, 100, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02009, "Ending Alt Sequence:", 264, 97, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03009, "", 390, 94, 100, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02010, "Beginning Salesperson:", 251, 118, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03010, "", 390, 115, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04010, "", 451, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 425, 115, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02011, "Ending Salesperson:", 269, 139, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03011, "", 390, 136, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04011, "", 451, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 425, 136, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    CHECKBOX 03012, "Future Aging", 608, 52, 107, 19
    BEGIN
        NAME "cbx_future_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Age Credits", 608, 73, 99, 19
    BEGIN
        NAME "cbx_age_credits"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Update Customer Aging Summary", 608, 115, 230, 19
    BEGIN
        NAME "cbx_update_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Include Customer Comments", 608, 136, 201, 19
    BEGIN
        NAME "cbx_cust_comments"
        NOT OPAQUE
    END
    
    GROUPBOX 19016, "Aging Periods ", -4, 160, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_fixed_periods"
    END
    
    CHECKBOX 03016, "Fixed Size Aging Periods", 158, 178, 174, 19
    BEGIN
        NAME "cbx_fixed_periods"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "Export Format", 408, 178, 114, 19
    BEGIN
        NAME "cbx_col_format"
        NOT OPAQUE
    END
    
    STATICTEXT 02018, "Aging Period Size:", 52, 202, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_per"
    END
    INPUTN 03018, "", 160, 199, 56, 19
    BEGIN
        NAME "inn_days_in_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    INPUTD 03019, "", 160, 262, 85, 19
    BEGIN
        NAME "ind_agedate_fut_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03020, "", 260, 262, 85, 19
    BEGIN
        NAME "ind_agedate_cur_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21020, "", 345, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_cur_from"
    END
    
    INPUTD 03021, "", 260, 283, 85, 19
    BEGIN
        NAME "ind_agedate_cur_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03022, "", 360, 262, 85, 19
    BEGIN
        NAME "ind_agedate_30_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21022, "", 445, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_30_from"
    END
    
    INPUTD 03023, "", 360, 283, 85, 19
    BEGIN
        NAME "ind_agedate_30_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03024, "", 460, 262, 85, 19
    BEGIN
        NAME "ind_agedate_60_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21024, "", 545, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_60_from"
    END
    
    INPUTD 03025, "", 460, 283, 85, 19
    BEGIN
        NAME "ind_agedate_60_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03026, "", 560, 262, 85, 19
    BEGIN
        NAME "ind_agedate_90_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21026, "", 645, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_90_from"
    END
    
    INPUTD 03027, "", 560, 283, 85, 19
    BEGIN
        NAME "ind_agedate_90_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03028, "", 660, 283, 85, 19
    BEGIN
        NAME "ind_agedate_120_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02029, "Future", 170, 244, 35, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_future"
    END
    
    STATICTEXT 02030, "Current", 270, 244, 42, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_current"
    END
    
    STATICTEXT 02031, "30 Days", 370, 244, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_30"
    END
    
    STATICTEXT 02032, "60 Days", 470, 244, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_60"
    END
    
    STATICTEXT 02033, "90 Days", 570, 244, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_90"
    END
    
    STATICTEXT 02034, "120+ Days", 670, 244, 59, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_120"
    END
    
    STATICTEXT 02035, "From:", 120, 265, 31, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_from"
    END
    
    STATICTEXT 02036, "Thru:", 120, 286, 29, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_thru"
    END
END

