//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// +GLCONTROL - GL Posting Control Global
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 2000
BEGIN
    NAME "win_+glcontrol"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Application:", 57, 13, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_system_id"
    END
    
    INPUTE 03001, "", 130, 10, 156, 19
    BEGIN
        NAME "ine_system_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00-000000AAA"
    END
    
    STATICTEXT 04001, "", 312, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_system_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 286, 10, 20, 19
    BEGIN
        NAME "tbnf_system_id"
    END
    
    CHECKBOX 03002, "Post to GL?", 128, 31, 94, 19
    BEGIN
        NAME "cbx_post_gl"
        NOT OPAQUE
    END
    
    STATICTEXT 02003, "Current Period:", 37, 55, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02004, "Current Year:", 48, 76, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03004, "", 130, 73, 40, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02005, "Journal ID Code:", 33, 97, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_journal_id"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_journal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_journal_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_journal_id"
    END
    
    STATICTEXT 02006, "Audit Number:", 42, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_adt_no"
    END
    
    INPUTE 03006, "", 130, 115, 70, 19
    BEGIN
        NAME "ine_gl_adt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    CHECKBOX 03007, "Update Flag", 128, 136, 99, 19
    BEGIN
        NAME "cbx_update_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02008, "Total Accounting Periods:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_pers"
    END
    
    INPUTE 03008, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_total_pers"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02009, "Current Fiscal Period:", 1, 181, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_period"
    END
    
    INPUTE 03009, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_gl_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02010, "Current Fiscal Year:", 12, 202, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_year"
    END
    
    INPUTD 03010, "", 130, 199, 85, 19
    BEGIN
        NAME "ind_gl_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21010, "", 215, 199, 20, 19
    BEGIN
        NAME "tbnc_gl_year"
    END
    
    STATICTEXT 02011, "GL Account Number Length:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_acct_length"
    END
    
    INPUTE 03011, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_acct_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02012, "Maximum GL Acct Number Length:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_acct_len"
    END
    
    INPUTE 03012, "", 130, 241, 35, 19
    BEGIN
        NAME "ine_max_acct_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03013, "Post Detail?", 128, 262, 97, 19
    BEGIN
        NAME "cbx_detail_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Use Budgets?", 128, 283, 108, 19
    BEGIN
        NAME "cbx_budget_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Units", 128, 304, 60, 19
    BEGIN
        NAME "cbx_units_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "Retain Detail Information?", 128, 325, 180, 19
    BEGIN
        NAME "cbx_retain_det"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "Fiscal Year Closed?", 128, 346, 142, 19
    BEGIN
        NAME "cbx_gl_yr_closed"
        NOT OPAQUE
    END
    
    STATICTEXT 02018, "Posting Method:", 33, 370, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_post_code"
    END
    
    LISTBUTTON 03018, "", 130, 367, 144, 300
    BEGIN
        NAME "lbx_gl_post_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03019, "Journal Entry?", 128, 388, 111, 19
    BEGIN
        NAME "cbx_permit_je"
        NOT OPAQUE
    END
    
    CHECKBOX 03020, "Allow Year End Postings?", 128, 409, 176, 19
    BEGIN
        NAME "cbx_post_yr_end"
        NOT OPAQUE
    END
    
    CHECKBOX 03021, "Post to Locked Periods?", 128, 430, 168, 19
    BEGIN
        NAME "cbx_post_locked"
        NOT OPAQUE
    END
    
    CHECKBOX 03022, "Use GL Audit Control?", 128, 451, 159, 19
    BEGIN
        NAME "cbx_gl_audit"
        NOT OPAQUE
    END
    
    CHECKBOX 03023, "Use GL Work File?", 128, 472, 132, 19
    BEGIN
        NAME "cbx_gl_work_file"
        NOT OPAQUE
    END
    
    CHECKBOX 03024, "Print GL Summary?", 128, 493, 140, 19
    BEGIN
        NAME "cbx_prt_gl_sum"
        NOT OPAQUE
    END
    
    STATICTEXT 02025, "Description:", 56, 517, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03025, "", 130, 514, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02026, "Transaction Date:", 24, 538, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trns_date"
    END
    
    INPUTD 03026, "", 130, 535, 85, 19
    BEGIN
        NAME "ind_trns_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21026, "", 215, 535, 20, 19
    BEGIN
        NAME "tbnc_trns_date"
    END
    
    STATICTEXT 02027, "Period:", 87, 559, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03027, "", 130, 556, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02028, "Year:", 98, 580, 29, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_year"
    END
    
    INPUTE 03028, "", 130, 577, 40, 19
    BEGIN
        NAME "ine_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02029, "Period Beginning Date:", 0, 601, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03029, "", 130, 598, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21029, "", 215, 598, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02030, "Period Beginning Date:", 0, 622, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03030, "", 130, 619, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21030, "", 215, 619, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02031, "Period Beginning Date:", 0, 643, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03031, "", 130, 640, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21031, "", 215, 640, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02032, "Period Beginning Date:", 0, 664, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03032, "", 130, 661, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21032, "", 215, 661, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02033, "Period Beginning Date:", 0, 685, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03033, "", 130, 682, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21033, "", 215, 682, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02034, "Period Beginning Date:", 0, 706, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03034, "", 130, 703, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21034, "", 215, 703, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02035, "Period Beginning Date:", 0, 727, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03035, "", 130, 724, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21035, "", 215, 724, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02036, "Period Beginning Date:", 0, 748, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03036, "", 130, 745, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21036, "", 215, 745, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02037, "Period Beginning Date:", 0, 769, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03037, "", 130, 766, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21037, "", 215, 766, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02038, "Period Beginning Date:", 0, 790, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03038, "", 130, 787, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21038, "", 215, 787, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02039, "Period Beginning Date:", 0, 811, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03039, "", 130, 808, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21039, "", 215, 808, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02040, "Period Beginning Date:", 0, 832, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03040, "", 130, 829, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21040, "", 215, 829, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02041, "Period Beginning Date:", 0, 853, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03041, "", 130, 850, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21041, "", 215, 850, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02042, "Period Beginning Date:", 0, 874, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03042, "", 130, 871, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21042, "", 215, 871, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02043, "Period Beginning Date:", 0, 895, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03043, "", 130, 892, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21043, "", 215, 892, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02044, "Period Beginning Date:", 0, 916, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03044, "", 130, 913, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21044, "", 215, 913, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02045, "Period Beginning Date:", 0, 937, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03045, "", 130, 934, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21045, "", 215, 934, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02046, "Period Beginning Date:", 0, 958, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03046, "", 130, 955, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21046, "", 215, 955, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02047, "Period Beginning Date:", 0, 979, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03047, "", 130, 976, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21047, "", 215, 976, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02048, "Period Beginning Date:", 0, 1000, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03048, "", 130, 997, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21048, "", 215, 997, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02049, "Period Beginning Date:", 0, 1021, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03049, "", 130, 1018, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21049, "", 215, 1018, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02050, "Period Beginning Date:", 0, 1042, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03050, "", 130, 1039, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21050, "", 215, 1039, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02051, "Period Beginning Date:", 0, 1063, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03051, "", 130, 1060, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21051, "", 215, 1060, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02052, "Period Beginning Date:", 0, 1084, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03052, "", 130, 1081, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21052, "", 215, 1081, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02053, "Period Beginning Date:", 0, 1105, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03053, "", 130, 1102, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21053, "", 215, 1102, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02054, "Period Beginning Date:", 0, 1126, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03054, "", 130, 1123, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21054, "", 215, 1123, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02055, "Period Beginning Date:", 0, 1147, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03055, "", 130, 1144, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21055, "", 215, 1144, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02056, "Period Beginning Date:", 0, 1168, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03056, "", 130, 1165, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21056, "", 215, 1165, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02057, "Period Beginning Date:", 0, 1189, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03057, "", 130, 1186, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21057, "", 215, 1186, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02058, "Period Beginning Date:", 0, 1210, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03058, "", 130, 1207, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21058, "", 215, 1207, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02059, "Period Beginning Date:", 0, 1231, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03059, "", 130, 1228, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21059, "", 215, 1228, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02060, "Period Beginning Date:", 0, 1252, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03060, "", 130, 1249, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21060, "", 215, 1249, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02061, "Period Beginning Date:", 0, 1273, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03061, "", 130, 1270, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21061, "", 215, 1270, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02062, "Period Beginning Date:", 0, 1294, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03062, "", 130, 1291, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21062, "", 215, 1291, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02063, "Period Beginning Date:", 0, 1315, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03063, "", 130, 1312, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21063, "", 215, 1312, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02064, "Period Beginning Date:", 0, 1336, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03064, "", 130, 1333, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21064, "", 215, 1333, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02065, "Period Beginning Date:", 0, 1357, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03065, "", 130, 1354, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21065, "", 215, 1354, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02066, "Period Beginning Date:", 0, 1378, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03066, "", 130, 1375, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21066, "", 215, 1375, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02067, "Period Beginning Date:", 0, 1399, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03067, "", 130, 1396, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21067, "", 215, 1396, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02068, "Period Beginning Date:", 0, 1420, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03068, "", 130, 1417, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21068, "", 215, 1417, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02069, "Period Beginning Date:", 0, 1441, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03069, "", 130, 1438, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21069, "", 215, 1438, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02070, "Period Beginning Date:", 0, 1462, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03070, "", 130, 1459, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21070, "", 215, 1459, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02071, "Period Beginning Date:", 0, 1483, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03071, "", 130, 1480, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21071, "", 215, 1480, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02072, "Period Beginning Date:", 0, 1504, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03072, "", 130, 1501, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21072, "", 215, 1501, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02073, "Period Beginning Date:", 0, 1525, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03073, "", 130, 1522, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21073, "", 215, 1522, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02074, "Period Beginning Date:", 0, 1546, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03074, "", 130, 1543, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21074, "", 215, 1543, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02075, "Period Beginning Date:", 0, 1567, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03075, "", 130, 1564, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21075, "", 215, 1564, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02076, "Period Beginning Date:", 0, 1588, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03076, "", 130, 1585, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21076, "", 215, 1585, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02077, "Period Beginning Date:", 0, 1609, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03077, "", 130, 1606, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21077, "", 215, 1606, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02078, "Period Beginning Date:", 0, 1630, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03078, "", 130, 1627, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21078, "", 215, 1627, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02079, "Period Beginning Date:", 0, 1651, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03079, "", 130, 1648, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21079, "", 215, 1648, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02080, "Period Beginning Date:", 0, 1672, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03080, "", 130, 1669, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21080, "", 215, 1669, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02081, "Period Beginning Date:", 0, 1693, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03081, "", 130, 1690, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21081, "", 215, 1690, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02082, "Period Beginning Date:", 0, 1714, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03082, "", 130, 1711, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21082, "", 215, 1711, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02083, "Period Beginning Date:", 0, 1735, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03083, "", 130, 1732, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21083, "", 215, 1732, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02084, "Period Beginning Date:", 0, 1756, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03084, "", 130, 1753, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21084, "", 215, 1753, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02085, "Period Beginning Date:", 0, 1777, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03085, "", 130, 1774, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21085, "", 215, 1774, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02086, "Period Beginning Date:", 0, 1798, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03086, "", 130, 1795, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21086, "", 215, 1795, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02087, "Period Beginning Date:", 0, 1819, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03087, "", 130, 1816, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21087, "", 215, 1816, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02088, "Period Beginning Date:", 0, 1840, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03088, "", 130, 1837, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21088, "", 215, 1837, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02089, "Period Beginning Date:", 0, 1861, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03089, "", 130, 1858, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21089, "", 215, 1858, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02090, "Period Beginning Date:", 0, 1882, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03090, "", 130, 1879, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21090, "", 215, 1879, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02091, "Period Beginning Date:", 0, 1903, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03091, "", 130, 1900, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21091, "", 215, 1900, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02092, "Period Beginning Date:", 0, 1924, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03092, "", 130, 1921, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21092, "", 215, 1921, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02093, "Period Beginning Date:", 0, 1945, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03093, "", 130, 1942, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21093, "", 215, 1942, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02094, "Period Beginning Date:", 0, 1966, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03094, "", 130, 1963, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21094, "", 215, 1963, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02095, "Period Beginning Date:", 0, 1987, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03095, "", 130, 1984, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21095, "", 215, 1984, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02096, "Period Beginning Date:", 0, 2008, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03096, "", 130, 2005, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21096, "", 215, 2005, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02097, "Period Beginning Date:", 0, 2029, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03097, "", 130, 2026, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21097, "", 215, 2026, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02098, "Period Beginning Date:", 0, 2050, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03098, "", 130, 2047, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21098, "", 215, 2047, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02099, "Period Beginning Date:", 0, 2071, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03099, "", 130, 2068, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21099, "", 215, 2068, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02100, "Period Beginning Date:", 0, 2092, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03100, "", 130, 2089, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21100, "", 215, 2089, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02101, "Period Beginning Date:", 0, 2113, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03101, "", 130, 2110, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21101, "", 215, 2110, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02102, "Period Beginning Date:", 0, 2134, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03102, "", 130, 2131, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21102, "", 215, 2131, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02103, "Period Beginning Date:", 0, 2155, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03103, "", 130, 2152, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21103, "", 215, 2152, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02104, "Period Beginning Date:", 0, 2176, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03104, "", 130, 2173, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21104, "", 215, 2173, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02105, "Period Beginning Date:", 0, 2197, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03105, "", 130, 2194, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21105, "", 215, 2194, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02106, "Period Beginning Date:", 0, 2218, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03106, "", 130, 2215, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21106, "", 215, 2215, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    CHECKBOX 03107, "Locked?", 128, 2236, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03108, "Locked?", 128, 2257, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03109, "Locked?", 128, 2278, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03110, "Locked?", 128, 2299, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03111, "Locked?", 128, 2320, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03112, "Locked?", 128, 2341, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03113, "Locked?", 128, 2362, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03114, "Locked?", 128, 2383, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03115, "Locked?", 128, 2404, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03116, "Locked?", 128, 2425, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03117, "Locked?", 128, 2446, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03118, "Locked?", 128, 2467, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03119, "Locked?", 128, 2488, 77, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02120, "Period Beginning Date:", 0, 2512, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_app_per_beg"
    END
    
    INPUTD 03120, "", 130, 2509, 85, 19
    BEGIN
        NAME "ind_app_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21120, "", 215, 2509, 20, 19
    BEGIN
        NAME "tbnc_app_per_beg"
    END
    
    STATICTEXT 02121, "Period Beginning Date:", 0, 2533, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_app_per_end"
    END
    
    INPUTD 03121, "", 130, 2530, 85, 19
    BEGIN
        NAME "ind_app_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21121, "", 215, 2530, 20, 19
    BEGIN
        NAME "tbnc_app_per_end"
    END
    
    STATICTEXT 02122, "Period Beginning Date:", 0, 2554, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_per_beg"
    END
    
    INPUTD 03122, "", 130, 2551, 85, 19
    BEGIN
        NAME "ind_gl_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21122, "", 215, 2551, 20, 19
    BEGIN
        NAME "tbnc_gl_per_beg"
    END
    
    STATICTEXT 02123, "Period Beginning Date:", 0, 2575, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_per_end"
    END
    
    INPUTD 03123, "", 130, 2572, 85, 19
    BEGIN
        NAME "ind_gl_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21123, "", 215, 2572, 20, 19
    BEGIN
        NAME "tbnc_gl_per_end"
    END
    
    STATICTEXT 02124, "Process Identification:", 0, 2596, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03124, "", 130, 2593, 160, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04124, "", 316, 2597, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20124, "", 290, 2593, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
    
    STATICTEXT 02125, "Program Name:", 37, 2617, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_program_name"
    END
    
    INPUTE 03125, "", 130, 2614, 192, 19
    BEGIN
        NAME "ine_program_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    CHECKBOX 03126, "Use Suspense Account?", 128, 2635, 169, 19
    BEGIN
        NAME "cbx_use_suspense"
        NOT OPAQUE
    END
    
    STATICTEXT 02127, "GL Account:", 56, 2659, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03127, "", 130, 2656, 130, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04127, "", 286, 2660, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20127, "", 260, 2656, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02128, "Maximum Limit  [String]:", 0, 2680, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_lim_str"
    END
    
    INPUTE 03128, "", 130, 2677, 150, 19
    BEGIN
        NAME "ine_max_lim_str"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02129, "Maximum Balance [String]:", 0, 2701, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_bal_str"
    END
    
    INPUTE 03129, "", 130, 2698, 150, 19
    BEGIN
        NAME "ine_max_bal_str"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02130, "GL Account Mask:", 23, 2722, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_acct_output"
    END
    
    INPUTE 03130, "", 130, 2719, 150, 19
    BEGIN
        NAME "ine_acct_output"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02131, "Amount Mask:", 44, 2743, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amount_mask"
    END
    
    INPUTE 03131, "", 130, 2740, 150, 19
    BEGIN
        NAME "ine_amount_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02132, "Unit Mask:", 67, 2764, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_mask"
    END
    
    INPUTE 03132, "", 130, 2761, 120, 19
    BEGIN
        NAME "ine_unit_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02133, "Percent Mask:", 47, 2785, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_percent_mask"
    END
    
    INPUTE 03133, "", 130, 2782, 100, 19
    BEGIN
        NAME "ine_percent_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
END

