//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRR_LABRDISTRIB - Payroll Labor Distribution Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_prr_labrdistrib"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Work Days in Payroll Period:", 15, 13, 162, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_per"
    END
    INPUTN 03001, "", 180, 10, 64, 19
    BEGIN
        NAME "inn_days_in_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

