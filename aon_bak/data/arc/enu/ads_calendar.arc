//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADS_CALENDAR - Fiscal Calendar
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0565 0399
BEGIN
    NAME "win_ads_calendar"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Current Period:", 50, 13, 77, 16
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
    
    STATICTEXT 02002, "Current Year:", 59, 34, 68, 16
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
    
    STATICTEXT 02003, "Total Periods:", 296, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_pers"
    END
    
    INPUTE 03003, "", 370, 10, 35, 19
    BEGIN
        NAME "ine_total_pers"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03004, "Prior Fiscal Year Closed?", 368, 31, 158, 19
    BEGIN
        NAME "cbx_gl_yr_closed"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02005, "Period", 90, 76, 30, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_period"
    END
    
    STATICTEXT 02006, "Ends", 130, 76, 24, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_ends"
    END
    
    STATICTEXT 02007, "Name", 190, 76, 28, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_name"
    END
    
    STATICTEXT 02008, "Abbr", 330, 76, 22, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_abbrev"
    END
    
    STATICTEXT 02009, "Locked", 370, 76, 36, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_locked"
    END
    
    STATICTEXT 02010, "Date", 430, 76, 23, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_date"
    END
    
    INPUTE 03011, "", 130, 94, 40, 19
    BEGIN
        NAME "ine_per_ending_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03012, "", 190, 94, 128, 19
    BEGIN
        NAME "ine_period_name_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03013, "", 330, 94, 35, 19
    BEGIN
        NAME "ine_abbr_name_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03014, "", 378, 94, 30, 19
    BEGIN
        NAME "cbx_locked_flag_01"
        NOT OPAQUE
    END
    
    INPUTD 03015, "", 430, 94, 85, 19
    BEGIN
        NAME "ind_locked_date_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 515, 94, 20, 19
    BEGIN
        NAME "tbnc_locked_date_01"
    END
    
    INPUTE 03016, "", 130, 115, 40, 19
    BEGIN
        NAME "ine_per_ending_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03017, "", 190, 115, 128, 19
    BEGIN
        NAME "ine_period_name_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03018, "", 330, 115, 35, 19
    BEGIN
        NAME "ine_abbr_name_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03019, "", 378, 115, 30, 19
    BEGIN
        NAME "cbx_locked_flag_02"
        NOT OPAQUE
    END
    
    INPUTD 03020, "", 430, 115, 85, 19
    BEGIN
        NAME "ind_locked_date_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03021, "", 130, 136, 40, 19
    BEGIN
        NAME "ine_per_ending_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03022, "", 190, 136, 128, 19
    BEGIN
        NAME "ine_period_name_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03023, "", 330, 136, 35, 19
    BEGIN
        NAME "ine_abbr_name_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03024, "", 378, 136, 30, 19
    BEGIN
        NAME "cbx_locked_flag_03"
        NOT OPAQUE
    END
    
    INPUTD 03025, "", 430, 136, 85, 19
    BEGIN
        NAME "ind_locked_date_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03026, "", 130, 157, 40, 19
    BEGIN
        NAME "ine_per_ending_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03027, "", 190, 157, 128, 19
    BEGIN
        NAME "ine_period_name_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03028, "", 330, 157, 35, 19
    BEGIN
        NAME "ine_abbr_name_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03029, "", 378, 157, 30, 19
    BEGIN
        NAME "cbx_locked_flag_04"
        NOT OPAQUE
    END
    
    INPUTD 03030, "", 430, 157, 85, 19
    BEGIN
        NAME "ind_locked_date_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03031, "", 130, 178, 40, 19
    BEGIN
        NAME "ine_per_ending_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03032, "", 190, 178, 128, 19
    BEGIN
        NAME "ine_period_name_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03033, "", 330, 178, 35, 19
    BEGIN
        NAME "ine_abbr_name_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03034, "", 378, 178, 30, 19
    BEGIN
        NAME "cbx_locked_flag_05"
        NOT OPAQUE
    END
    
    INPUTD 03035, "", 430, 178, 85, 19
    BEGIN
        NAME "ind_locked_date_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03036, "", 130, 199, 40, 19
    BEGIN
        NAME "ine_per_ending_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03037, "", 190, 199, 128, 19
    BEGIN
        NAME "ine_period_name_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03038, "", 330, 199, 35, 19
    BEGIN
        NAME "ine_abbr_name_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03039, "", 378, 199, 30, 19
    BEGIN
        NAME "cbx_locked_flag_06"
        NOT OPAQUE
    END
    
    INPUTD 03040, "", 430, 199, 85, 19
    BEGIN
        NAME "ind_locked_date_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03041, "", 130, 220, 40, 19
    BEGIN
        NAME "ine_per_ending_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03042, "", 190, 220, 128, 19
    BEGIN
        NAME "ine_period_name_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03043, "", 330, 220, 35, 19
    BEGIN
        NAME "ine_abbr_name_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03044, "", 378, 220, 30, 19
    BEGIN
        NAME "cbx_locked_flag_07"
        NOT OPAQUE
    END
    
    INPUTD 03045, "", 430, 220, 85, 19
    BEGIN
        NAME "ind_locked_date_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03046, "", 130, 241, 40, 19
    BEGIN
        NAME "ine_per_ending_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03047, "", 190, 241, 128, 19
    BEGIN
        NAME "ine_period_name_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03048, "", 330, 241, 35, 19
    BEGIN
        NAME "ine_abbr_name_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03049, "", 378, 241, 30, 19
    BEGIN
        NAME "cbx_locked_flag_08"
        NOT OPAQUE
    END
    
    INPUTD 03050, "", 430, 241, 85, 19
    BEGIN
        NAME "ind_locked_date_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03051, "", 130, 262, 40, 19
    BEGIN
        NAME "ine_per_ending_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03052, "", 190, 262, 128, 19
    BEGIN
        NAME "ine_period_name_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03053, "", 330, 262, 35, 19
    BEGIN
        NAME "ine_abbr_name_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03054, "", 378, 262, 30, 19
    BEGIN
        NAME "cbx_locked_flag_09"
        NOT OPAQUE
    END
    
    INPUTD 03055, "", 430, 262, 85, 19
    BEGIN
        NAME "ind_locked_date_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03056, "", 130, 283, 40, 19
    BEGIN
        NAME "ine_per_ending_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03057, "", 190, 283, 128, 19
    BEGIN
        NAME "ine_period_name_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03058, "", 330, 283, 35, 19
    BEGIN
        NAME "ine_abbr_name_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03059, "", 378, 283, 30, 19
    BEGIN
        NAME "cbx_locked_flag_10"
        NOT OPAQUE
    END
    
    INPUTD 03060, "", 430, 283, 85, 19
    BEGIN
        NAME "ind_locked_date_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03061, "", 130, 304, 40, 19
    BEGIN
        NAME "ine_per_ending_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03062, "", 190, 304, 128, 19
    BEGIN
        NAME "ine_period_name_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03063, "", 330, 304, 35, 19
    BEGIN
        NAME "ine_abbr_name_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03064, "", 378, 304, 30, 19
    BEGIN
        NAME "cbx_locked_flag_11"
        NOT OPAQUE
    END
    
    INPUTD 03065, "", 430, 304, 85, 19
    BEGIN
        NAME "ind_locked_date_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03066, "", 130, 325, 40, 19
    BEGIN
        NAME "ine_per_ending_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03067, "", 190, 325, 128, 19
    BEGIN
        NAME "ine_period_name_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03068, "", 330, 325, 35, 19
    BEGIN
        NAME "ine_abbr_name_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03069, "", 378, 325, 30, 19
    BEGIN
        NAME "cbx_locked_flag_12"
        NOT OPAQUE
    END
    
    INPUTD 03070, "", 430, 325, 85, 19
    BEGIN
        NAME "ind_locked_date_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03071, "", 130, 346, 40, 19
    BEGIN
        NAME "ine_per_ending_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03072, "", 190, 346, 128, 19
    BEGIN
        NAME "ine_period_name_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03073, "", 330, 346, 35, 19
    BEGIN
        NAME "ine_abbr_name_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03074, "", 378, 346, 30, 19
    BEGIN
        NAME "cbx_locked_flag_13"
        NOT OPAQUE
    END
    
    INPUTD 03075, "", 430, 346, 85, 19
    BEGIN
        NAME "ind_locked_date_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02076, "1.", 110, 97, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_1"
    END
    
    STATICTEXT 02077, "2.", 110, 118, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_2"
    END
    
    STATICTEXT 02078, "3.", 110, 139, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_3"
    END
    
    STATICTEXT 02079, "4.", 110, 160, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_4"
    END
    
    STATICTEXT 02080, "5.", 110, 181, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_5"
    END
    
    STATICTEXT 02081, "6.", 110, 202, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_6"
    END
    
    STATICTEXT 02082, "7.", 110, 223, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_7"
    END
    
    STATICTEXT 02083, "8.", 110, 244, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_8"
    END
    
    STATICTEXT 02084, "9.", 110, 265, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_9"
    END
    
    STATICTEXT 02085, "10.", 110, 286, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_10"
    END
    
    STATICTEXT 02086, "11.", 110, 307, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_11"
    END
    
    STATICTEXT 02087, "12.", 110, 328, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_12"
    END
    
    STATICTEXT 02088, "13.", 110, 349, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_13"
    END
END

