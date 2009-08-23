//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_LABEFFANAREP - Labor Efficiency Analysis Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0191
BEGIN
    NAME "win_sfr_labeffanarep"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning From Date:", 2, 13, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dates"
    END
    
    INPUTD 03001, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_dates"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 215, 10, 20, 19
    BEGIN
        NAME "tbnc_dates"
    END
    
    STATICTEXT 02002, "Ending From Date:", 20, 34, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dates"
    END
    
    INPUTD 03002, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_dates"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_dates"
    END
    
    CHECKBOX 03003, "Sort By Work Order Type", 128, 52, 174, 19
    BEGIN
        NAME "cbx_sort_wo_type"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "Inventoired", 128, 73, 97, 19
    BEGIN
        NAME "cbx_inventoried"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Recurring?", 128, 94, 93, 19
    BEGIN
        NAME "cbx_recurring"
        NOT OPAQUE
    END
    
    CHECKBOX 03006, "NonStock?", 128, 115, 91, 19
    BEGIN
        NAME "cbx_nonstock"
        NOT OPAQUE
    END
    
    STATICTEXT 02007, "Open/Closed/Both:", 12, 139, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_open_closed_both"
    END
    
    LISTBUTTON 03007, "", 130, 136, 72, 300
    BEGIN
        NAME "lbx_open_closed_both"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

