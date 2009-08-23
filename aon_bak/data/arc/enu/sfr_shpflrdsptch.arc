//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_SHPFLRDSPTCH - Shop Floor Dispatch Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0207
BEGIN
    NAME "win_sfr_shpflrdsptch"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Open", 128, 10, 61, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03002, "Planned", 128, 31, 76, 19
    BEGIN
        NAME "cbx_planned"
        NOT OPAQUE
    END
    
    CHECKBOX 03003, "Quoted", 128, 52, 74, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
    
    STATICTEXT 02004, "Beginning Analysis Date:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_analysis_date"
    END
    
    INPUTD 03004, "", 130, 73, 85, 19
    BEGIN
        NAME "ind_analysis_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 215, 73, 20, 19
    BEGIN
        NAME "tbnc_analysis_date"
    END
    
    STATICTEXT 02005, "Ending Analysis Date:", 1, 97, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_analysis_date"
    END
    
    INPUTD 03005, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_analysis_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_analysis_date"
    END
    
    STATICTEXT 02006, "Schedule Date:", 42, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sched_date"
    END
    
    INPUTD 03006, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_sched_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_sched_date"
    END
    
    STATICTEXT 02007, "Priority Code:", 47, 139, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_priority_code"
    END
    
    INPUTE 03007, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_priority_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02008, "Operation Code:", 31, 160, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_oper_code"
    END
    
    INPUTE 03008, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_oper_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04008, "", 191, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_oper_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 165, 157, 20, 19
    BEGIN
        NAME "tbnf_oper_code"
    END
END

