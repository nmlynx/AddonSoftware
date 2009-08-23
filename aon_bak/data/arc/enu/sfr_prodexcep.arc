//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_PRODEXCEP - Production Exception Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0107
BEGIN
    NAME "win_sfr_prodexcep"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Run Date:", 71, 13, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_run_date"
    END
    
    INPUTD 03001, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_run_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 215, 10, 20, 19
    BEGIN
        NAME "tbnc_run_date"
    END
    
    CHECKBOX 03002, "Include All Incomplete Steps", 128, 31, 195, 19
    BEGIN
        NAME "cbx_inc_all_incomp"
        NOT OPAQUE
    END
    
    STATICTEXT 02003, "Type:", 96, 55, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_type"
    END
    
    LISTBUTTON 03003, "", 130, 52, 115, 300
    BEGIN
        NAME "lbx_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

