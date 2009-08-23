//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_WORDDATE - Work Orders By Date Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0231
BEGIN
    NAME "win_sfr_worddate"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Report Sequence:", 25, 13, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date_seq"
    END
    
    LISTBUTTON 03001, "", 130, 10, 105, 300
    BEGIN
        NAME "lbx_date_seq"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Beginning Date:", 36, 34, 91, 16
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
    
    STATICTEXT 02003, "Ending Date:", 54, 55, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dates"
    END
    
    INPUTD 03003, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_dates"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_dates"
    END
    
    STATICTEXT 02004, "Beginning W.O.#:", 28, 76, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_work_order"
    END
    
    INPUTE 03004, "", 130, 73, 70, 19
    BEGIN
        NAME "ine_work_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02005, "Ending W.O.#:", 46, 97, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_work_order"
    END
    
    INPUTE 03005, "", 130, 94, 70, 19
    BEGIN
        NAME "ine_work_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    CHECKBOX 03006, "Open?", 128, 115, 67, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "Closed?", 128, 136, 76, 19
    BEGIN
        NAME "cbx_closed"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "Planned?", 128, 157, 81, 19
    BEGIN
        NAME "cbx_planned"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Quoted?", 128, 178, 79, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
END

