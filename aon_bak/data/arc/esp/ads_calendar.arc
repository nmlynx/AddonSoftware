//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADS_CALENDAR - Fiscal Calendar
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0651 0399
BEGIN
    NAME "win_ads_calendar"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Período actual:", 73, 13, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Año actual:", 94, 34, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02003, "Períodos totales:", 353, 13, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_pers"
    END
    
    INPUTE 03003, "", 444, 10, 35, 19
    BEGIN
        NAME "ine_total_pers"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03004, "¿Se cerró el año fiscal anterior?", 442, 31, 193, 19
    BEGIN
        NAME "cbx_gl_yr_closed"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02005, "Period", 108, 76, 30, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_period"
    END
    
    STATICTEXT 02006, "Ends", 156, 76, 24, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_ends"
    END
    
    STATICTEXT 02007, "Name", 228, 76, 28, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_name"
    END
    
    STATICTEXT 02008, "Abbr", 396, 76, 22, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_abbrev"
    END
    
    STATICTEXT 02009, "Locked", 444, 76, 36, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_locked"
    END
    
    STATICTEXT 02010, "Date", 516, 76, 23, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_date"
    END
    
    INPUTE 03011, "", 156, 94, 40, 19
    BEGIN
        NAME "ine_per_ending_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03012, "", 228, 94, 128, 19
    BEGIN
        NAME "ine_period_name_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03013, "", 396, 94, 35, 19
    BEGIN
        NAME "ine_abbr_name_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03014, "", 454, 94, 30, 19
    BEGIN
        NAME "cbx_locked_flag_01"
        NOT OPAQUE
    END
    
    INPUTD 03015, "", 516, 94, 85, 19
    BEGIN
        NAME "ind_locked_date_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 601, 94, 20, 19
    BEGIN
        NAME "tbnc_locked_date_01"
    END
    
    INPUTE 03016, "", 156, 115, 40, 19
    BEGIN
        NAME "ine_per_ending_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03017, "", 228, 115, 128, 19
    BEGIN
        NAME "ine_period_name_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03018, "", 396, 115, 35, 19
    BEGIN
        NAME "ine_abbr_name_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03019, "", 454, 115, 30, 19
    BEGIN
        NAME "cbx_locked_flag_02"
        NOT OPAQUE
    END
    
    INPUTD 03020, "", 516, 115, 85, 19
    BEGIN
        NAME "ind_locked_date_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03021, "", 156, 136, 40, 19
    BEGIN
        NAME "ine_per_ending_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03022, "", 228, 136, 128, 19
    BEGIN
        NAME "ine_period_name_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03023, "", 396, 136, 35, 19
    BEGIN
        NAME "ine_abbr_name_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03024, "", 454, 136, 30, 19
    BEGIN
        NAME "cbx_locked_flag_03"
        NOT OPAQUE
    END
    
    INPUTD 03025, "", 516, 136, 85, 19
    BEGIN
        NAME "ind_locked_date_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03026, "", 156, 157, 40, 19
    BEGIN
        NAME "ine_per_ending_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03027, "", 228, 157, 128, 19
    BEGIN
        NAME "ine_period_name_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03028, "", 396, 157, 35, 19
    BEGIN
        NAME "ine_abbr_name_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03029, "", 454, 157, 30, 19
    BEGIN
        NAME "cbx_locked_flag_04"
        NOT OPAQUE
    END
    
    INPUTD 03030, "", 516, 157, 85, 19
    BEGIN
        NAME "ind_locked_date_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03031, "", 156, 178, 40, 19
    BEGIN
        NAME "ine_per_ending_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03032, "", 228, 178, 128, 19
    BEGIN
        NAME "ine_period_name_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03033, "", 396, 178, 35, 19
    BEGIN
        NAME "ine_abbr_name_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03034, "", 454, 178, 30, 19
    BEGIN
        NAME "cbx_locked_flag_05"
        NOT OPAQUE
    END
    
    INPUTD 03035, "", 516, 178, 85, 19
    BEGIN
        NAME "ind_locked_date_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03036, "", 156, 199, 40, 19
    BEGIN
        NAME "ine_per_ending_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03037, "", 228, 199, 128, 19
    BEGIN
        NAME "ine_period_name_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03038, "", 396, 199, 35, 19
    BEGIN
        NAME "ine_abbr_name_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03039, "", 454, 199, 30, 19
    BEGIN
        NAME "cbx_locked_flag_06"
        NOT OPAQUE
    END
    
    INPUTD 03040, "", 516, 199, 85, 19
    BEGIN
        NAME "ind_locked_date_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03041, "", 156, 220, 40, 19
    BEGIN
        NAME "ine_per_ending_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03042, "", 228, 220, 128, 19
    BEGIN
        NAME "ine_period_name_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03043, "", 396, 220, 35, 19
    BEGIN
        NAME "ine_abbr_name_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03044, "", 454, 220, 30, 19
    BEGIN
        NAME "cbx_locked_flag_07"
        NOT OPAQUE
    END
    
    INPUTD 03045, "", 516, 220, 85, 19
    BEGIN
        NAME "ind_locked_date_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03046, "", 156, 241, 40, 19
    BEGIN
        NAME "ine_per_ending_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03047, "", 228, 241, 128, 19
    BEGIN
        NAME "ine_period_name_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03048, "", 396, 241, 35, 19
    BEGIN
        NAME "ine_abbr_name_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03049, "", 454, 241, 30, 19
    BEGIN
        NAME "cbx_locked_flag_08"
        NOT OPAQUE
    END
    
    INPUTD 03050, "", 516, 241, 85, 19
    BEGIN
        NAME "ind_locked_date_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03051, "", 156, 262, 40, 19
    BEGIN
        NAME "ine_per_ending_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03052, "", 228, 262, 128, 19
    BEGIN
        NAME "ine_period_name_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03053, "", 396, 262, 35, 19
    BEGIN
        NAME "ine_abbr_name_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03054, "", 454, 262, 30, 19
    BEGIN
        NAME "cbx_locked_flag_09"
        NOT OPAQUE
    END
    
    INPUTD 03055, "", 516, 262, 85, 19
    BEGIN
        NAME "ind_locked_date_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03056, "", 156, 283, 40, 19
    BEGIN
        NAME "ine_per_ending_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03057, "", 228, 283, 128, 19
    BEGIN
        NAME "ine_period_name_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03058, "", 396, 283, 35, 19
    BEGIN
        NAME "ine_abbr_name_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03059, "", 454, 283, 30, 19
    BEGIN
        NAME "cbx_locked_flag_10"
        NOT OPAQUE
    END
    
    INPUTD 03060, "", 516, 283, 85, 19
    BEGIN
        NAME "ind_locked_date_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03061, "", 156, 304, 40, 19
    BEGIN
        NAME "ine_per_ending_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03062, "", 228, 304, 128, 19
    BEGIN
        NAME "ine_period_name_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03063, "", 396, 304, 35, 19
    BEGIN
        NAME "ine_abbr_name_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03064, "", 454, 304, 30, 19
    BEGIN
        NAME "cbx_locked_flag_11"
        NOT OPAQUE
    END
    
    INPUTD 03065, "", 516, 304, 85, 19
    BEGIN
        NAME "ind_locked_date_11"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03066, "", 156, 325, 40, 19
    BEGIN
        NAME "ine_per_ending_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03067, "", 228, 325, 128, 19
    BEGIN
        NAME "ine_period_name_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03068, "", 396, 325, 35, 19
    BEGIN
        NAME "ine_abbr_name_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03069, "", 454, 325, 30, 19
    BEGIN
        NAME "cbx_locked_flag_12"
        NOT OPAQUE
    END
    
    INPUTD 03070, "", 516, 325, 85, 19
    BEGIN
        NAME "ind_locked_date_12"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03071, "", 156, 346, 40, 19
    BEGIN
        NAME "ine_per_ending_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00/00"
    END
    
    INPUTE 03072, "", 228, 346, 128, 19
    BEGIN
        NAME "ine_period_name_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03073, "", 396, 346, 35, 19
    BEGIN
        NAME "ine_abbr_name_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    CHECKBOX 03074, "", 454, 346, 30, 19
    BEGIN
        NAME "cbx_locked_flag_13"
        NOT OPAQUE
    END
    
    INPUTD 03075, "", 516, 346, 85, 19
    BEGIN
        NAME "ind_locked_date_13"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02076, "1.", 132, 97, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_1"
    END
    
    STATICTEXT 02077, "2.", 132, 118, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_2"
    END
    
    STATICTEXT 02078, "3.", 132, 139, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_3"
    END
    
    STATICTEXT 02079, "4.", 132, 160, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_4"
    END
    
    STATICTEXT 02080, "5.", 132, 181, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_5"
    END
    
    STATICTEXT 02081, "6.", 132, 202, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_6"
    END
    
    STATICTEXT 02082, "7.", 132, 223, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_7"
    END
    
    STATICTEXT 02083, "8.", 132, 244, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_8"
    END
    
    STATICTEXT 02084, "9.", 132, 265, 9, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_9"
    END
    
    STATICTEXT 02085, "10.", 132, 286, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_10"
    END
    
    STATICTEXT 02086, "11.", 132, 307, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_11"
    END
    
    STATICTEXT 02087, "12.", 132, 328, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_12"
    END
    
    STATICTEXT 02088, "13.", 132, 349, 15, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_13"
    END
END

