//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POM_MAKECAL - Make Purchase Order Calendar
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0294
BEGIN
    NAME "win_pom_makecal"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Last Scheduled Date:", 6, 13, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_sched_dt"
    END
    
    INPUTD 03001, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_last_sched_dt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02002, "First Scheduled Date:", 4, 34, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_first_sched_dt"
    END
    
    INPUTD 03002, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_first_sched_dt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_first_sched_dt"
    END
    
    STATICTEXT 02003, "Number of weeks:", 23, 55, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_num_weeks"
    END
    INPUTN 03003, "", 130, 52, 30, 19
    BEGIN
        NAME "inn_num_weeks"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "000"
    END
    
    GROUPBOX 19004, "Day(s) to Omit ", -4, 76, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_omit_02"
    END
    
    CHECKBOX 03004, "Omit Mondays", 128, 94, 114, 19
    BEGIN
        NAME "cbx_omit_02"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Omit Tuesdays", 128, 115, 118, 19
    BEGIN
        NAME "cbx_omit_03"
        NOT OPAQUE
    END
    
    CHECKBOX 03006, "Omit Wednesdays", 128, 136, 134, 19
    BEGIN
        NAME "cbx_omit_04"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "Omit Thursdays", 128, 157, 124, 19
    BEGIN
        NAME "cbx_omit_05"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "Omit Fridays", 128, 178, 104, 19
    BEGIN
        NAME "cbx_omit_06"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Omit Sundays", 128, 241, 111, 19
    BEGIN
        NAME "cbx_omit_01"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "Omit Saturdays", 128, 220, 120, 19
    BEGIN
        NAME "cbx_omit_07"
        NOT OPAQUE
    END
END

