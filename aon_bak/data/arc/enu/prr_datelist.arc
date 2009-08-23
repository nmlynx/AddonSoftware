//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRR_DATELIST - Payroll Date Listing
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0128
BEGIN
    NAME "win_prr_datelist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Date Type:", 86, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date_type"
    END
    
    LISTBUTTON 03001, "", 150, 10, 100, 300
    BEGIN
        NAME "lbx_date_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Beginning Date:", 56, 34, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date_opened"
    END
    
    INPUTD 03002, "", 150, 31, 85, 19
    BEGIN
        NAME "ind_date_opened"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 235, 31, 20, 19
    BEGIN
        NAME "tbnc_date_opened"
    END
    
    STATICTEXT 02003, "Ending Date:", 74, 55, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date_opened"
    END
    
    INPUTD 03003, "", 150, 52, 85, 19
    BEGIN
        NAME "ind_date_opened"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 235, 52, 20, 19
    BEGIN
        NAME "tbnc_date_opened"
    END
    
    STATICTEXT 02004, "Option:", 103, 76, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_option"
    END
    
    LISTBUTTON 03004, "", 150, 73, 96, 300
    BEGIN
        NAME "lbx_report_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

