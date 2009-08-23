//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_MONTHSALES - Monthly Sales Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_opr_monthsales"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Report Date:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date"
    END
    
    INPUTD 03001, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 215, 10, 20, 19
    BEGIN
        NAME "tbnc_date"
    END
    
    STATICTEXT 02002, "Ending Report Date:", 11, 34, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date"
    END
    
    INPUTD 03002, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_date"
    END
END

