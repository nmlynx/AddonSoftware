//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_AGINGREPORTX - Aging Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0725 0290
BEGIN
    NAME "win_arr_agingreportx"
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
    
    STATICTEXT 02005, "Sort Sequence:", 251, 13, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03005, "", 340, 10, 140, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Beginning Customer ID:", 199, 34, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03006, "", 340, 31, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04006, "", 414, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 388, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02007, "Ending Customer ID:", 216, 55, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03007, "", 340, 52, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04007, "", 414, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 388, 52, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02008, "Beginning Salesperson:", 201, 76, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03008, "", 340, 73, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04008, "", 401, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 375, 73, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02009, "Ending Salesperson:", 219, 97, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03009, "", 340, 94, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04009, "", 401, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 375, 94, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    CHECKBOX 03010, "Future Aging", 558, 10, 107, 19
    BEGIN
        NAME "cbx_future_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Age Credits", 558, 31, 99, 19
    BEGIN
        NAME "cbx_age_credits"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "Update Customer Aging Summary", 558, 73, 230, 19
    BEGIN
        NAME "cbx_update_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Include Customer Comments", 558, 94, 201, 19
    BEGIN
        NAME "cbx_cust_comments"
        NOT OPAQUE
    END
    
    GROUPBOX 19014, "Aging Periods ", -4, 118, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_fixed_periods"
    END
    
    CHECKBOX 03014, "Fixed Size Aging Periods", 108, 136, 174, 19
    BEGIN
        NAME "cbx_fixed_periods"
        NOT OPAQUE
    END
    
    STATICTEXT 02015, "Aging Period Size:", 2, 160, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_per"
    END
    INPUTN 03015, "", 110, 157, 56, 19
    BEGIN
        NAME "inn_days_in_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    INPUTD 03016, "", 110, 220, 85, 19
    BEGIN
        NAME "ind_agedate_fut_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03017, "", 210, 220, 85, 19
    BEGIN
        NAME "ind_agedate_cur_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21017, "", 295, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_cur_from"
    END
    
    INPUTD 03018, "", 210, 241, 85, 19
    BEGIN
        NAME "ind_agedate_cur_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03019, "", 310, 220, 85, 19
    BEGIN
        NAME "ind_agedate_30_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21019, "", 395, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_30_from"
    END
    
    INPUTD 03020, "", 310, 241, 85, 19
    BEGIN
        NAME "ind_agedate_30_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03021, "", 410, 220, 85, 19
    BEGIN
        NAME "ind_agedate_60_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21021, "", 495, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_60_from"
    END
    
    INPUTD 03022, "", 410, 241, 85, 19
    BEGIN
        NAME "ind_agedate_60_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03023, "", 510, 220, 85, 19
    BEGIN
        NAME "ind_agedate_90_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21023, "", 595, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_90_from"
    END
    
    INPUTD 03024, "", 510, 241, 85, 19
    BEGIN
        NAME "ind_agedate_90_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03025, "", 610, 241, 85, 19
    BEGIN
        NAME "ind_agedate_120_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02026, "Future", 120, 202, 35, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_future"
    END
    
    STATICTEXT 02027, "Current", 220, 202, 42, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_current"
    END
    
    STATICTEXT 02028, "30 Days", 320, 202, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_30"
    END
    
    STATICTEXT 02029, "60 Days", 420, 202, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_60"
    END
    
    STATICTEXT 02030, "90 Days", 520, 202, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_90"
    END
    
    STATICTEXT 02031, "120+ Days", 620, 202, 59, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_120"
    END
    
    STATICTEXT 02032, "From:", 80, 223, 31, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_from"
    END
    
    STATICTEXT 02033, "Thru:", 80, 244, 29, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_thru"
    END
END

