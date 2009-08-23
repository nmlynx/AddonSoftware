//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_JOURNAL - OP Monthly Sales Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_opr_journal"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Date:", 62, 13, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_date"
    END
    
    INPUTD 03001, "", 156, 10, 85, 19
    BEGIN
        NAME "ind_report_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 241, 10, 20, 19
    BEGIN
        NAME "tbnc_report_date"
    END
    
    STATICTEXT 02002, "Ending Date:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_date"
    END
    
    INPUTD 03002, "", 156, 31, 85, 19
    BEGIN
        NAME "ind_report_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 241, 31, 20, 19
    BEGIN
        NAME "tbnc_report_date"
    END
END

