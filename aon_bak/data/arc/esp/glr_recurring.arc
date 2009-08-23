//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLR_RECURRING - Recurring JE Register
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0170
BEGIN
    NAME "win_glr_recurring"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "All Cycles", 154, 10, 87, 19
    BEGIN
        NAME "cbx_all_cycles"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Journal Entry Cycle Code:", 5, 34, 148, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cycle_code"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_cycle_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04002, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_cycle_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_cycle_code"
    END
    
    GROUPBOX 19003, "Update Options ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_posting_per"
    END
    
    STATICTEXT 02003, "Posting Period:", 65, 76, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_posting_per"
    END
    INPUTN 03003, "", 156, 73, 30, 19
    BEGIN
        NAME "inn_posting_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "00"
    END
    
    STATICTEXT 02004, "Posting Year:", 76, 97, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_posting_year"
    END
    
    INPUTE 03004, "", 156, 94, 40, 19
    BEGIN
        NAME "ine_posting_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02005, "Reversal by:", 83, 118, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reversal_tp"
    END
    
    LISTBUTTON 03005, "", 156, 115, 95, 300
    BEGIN
        NAME "lbx_reversal_tp"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

