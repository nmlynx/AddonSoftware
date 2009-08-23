//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLR_DAILYDETAIL - Daily Detail Register
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0446 0252
BEGIN
    NAME "win_glr_dailydetail"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning GL Account:", 14, 13, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 150, 10, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 256, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 230, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02002, "Ending GL Account:", 32, 34, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03002, "", 150, 31, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 256, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 230, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02003, "Account Wildcard Mask:", 8, 55, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_wildcard"
    END
    
    INPUTE 03003, "", 150, 52, 80, 19
    BEGIN
        NAME "ine_gl_wildcard"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02004, "Journal ID Code:", 53, 76, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_journal_id_entry"
    END
    
    INPUTE 03004, "", 150, 73, 35, 19
    BEGIN
        NAME "ine_journal_id_entry"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 211, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_journal_id_entry"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 185, 73, 20, 19
    BEGIN
        NAME "tbnf_journal_id_entry"
    END
    
    STATICTEXT 02005, "By Date or Audit Number?:", 0, 97, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_seq_da"
    END
    
    LISTBUTTON 03005, "", 150, 94, 135, 300
    BEGIN
        NAME "lbx_report_seq_da"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Beginning Audit Number:", 0, 118, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_adt_no"
    END
    
    INPUTE 03006, "", 150, 115, 56, 19
    BEGIN
        NAME "ine_gl_adt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02007, "Ending Audit Number:", 18, 139, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_adt_no"
    END
    
    INPUTE 03007, "", 150, 136, 56, 19
    BEGIN
        NAME "ine_gl_adt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02008, "Beginning Transaction Date:", 0, 160, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trns_date"
    END
    
    INPUTD 03008, "", 150, 157, 85, 19
    BEGIN
        NAME "ind_trns_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21008, "", 235, 157, 20, 19
    BEGIN
        NAME "tbnc_trns_date"
    END
    
    STATICTEXT 02009, "Ending Transaction Date:", 0, 181, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trns_date"
    END
    
    INPUTD 03009, "", 150, 178, 85, 19
    BEGIN
        NAME "ind_trns_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21009, "", 235, 178, 20, 19
    BEGIN
        NAME "tbnc_trns_date"
    END
    
    CHECKBOX 03010, "Page Break?", 148, 199, 98, 19
    BEGIN
        NAME "cbx_page_break"
        NOT OPAQUE
    END
END

