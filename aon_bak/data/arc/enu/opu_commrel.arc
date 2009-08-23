//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPU_COMMREL - Commit and Release Future Orders
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0345 0100
BEGIN
    NAME "win_opu_commrel"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Last Committed Date:", 82, 13, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_commit"
    END
    
    INPUTD 03001, "", 210, 10, 85, 19
    BEGIN
        NAME "ind_last_commit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02002, "Commit Inventory Sched Through:", 5, 34, 202, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_commit_thru"
    END
    
    INPUTD 03002, "", 210, 31, 85, 19
    BEGIN
        NAME "ind_commit_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 295, 31, 20, 19
    BEGIN
        NAME "tbnc_commit_thru"
    END
END

