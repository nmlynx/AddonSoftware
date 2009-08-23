//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_AUDITCONTROL - GL Posting Control
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0436 0333
BEGIN
    NAME "win_adm_auditcontrol"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Process Identification:", 8, 13, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03001, "", 140, 10, 160, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04001, "", 326, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 300, 10, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
    
    STATICTEXT 02002, "Sequence Number:", 27, 34, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_no"
    END
    
    INPUTE 03002, "", 140, 31, 35, 19
    BEGIN
        NAME "ine_sequence_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 04002, "", 201, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_sequence_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 175, 31, 20, 19
    BEGIN
        NAME "tbnf_sequence_no"
    END
    
    STATICTEXT 02003, "Process Alias/Table Name:", 0, 55, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_alias"
    END
    
    INPUTE 03003, "", 140, 52, 160, 19
    BEGIN
        NAME "ine_process_alias"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04003, "", 305, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    STATICTEXT 02004, "Program Name:", 47, 76, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_program"
    END
    
    INPUTE 03004, "", 140, 73, 192, 19
    BEGIN
        NAME "ine_process_program"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 04004, "", 337, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_program"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    GROUPBOX 19005, "Details ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_journal_id"
    END
    
    STATICTEXT 02005, "Journal ID:", 77, 118, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_journal_id"
    END
    
    INPUTE 03005, "", 140, 115, 35, 19
    BEGIN
        NAME "ine_journal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 201, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_journal_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 175, 115, 20, 19
    BEGIN
        NAME "tbnf_journal_id"
    END
    
    CHECKBOX 03006, "Use Audit Numbers?", 138, 136, 149, 19
    BEGIN
        NAME "cbx_gl_audit"
        NOT OPAQUE
    END
    
    STATICTEXT 02007, "Last Audit Number:", 24, 160, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_audit_number"
    END
    INPUTN 03007, "", 140, 157, 55, 19
    BEGIN
        NAME "inn_audit_number"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "0000000"
    END
    
    CHECKBOX 03008, "Use GL Work File?", 138, 178, 132, 19
    BEGIN
        NAME "cbx_gl_work_file"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Print GL Summary?", 138, 199, 140, 19
    BEGIN
        NAME "cbx_prt_gl_sum"
        NOT OPAQUE
    END
    
    STATICTEXT 02010, "Summarized Posting Memo:", 0, 223, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_post_memo"
    END
    
    INPUTE 03010, "", 140, 220, 240, 19
    BEGIN
        NAME "ine_gl_post_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02011, "Detail Level:", 68, 244, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_detail_level"
    END
    
    LISTBUTTON 03011, "", 140, 241, 159, 300
    BEGIN
        NAME "lbx_detail_level"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02012, "Last Used:", 77, 265, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstuse_date"
    END
    
    INPUTD 03012, "", 140, 262, 85, 19
    BEGIN
        NAME "ind_lstuse_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03013, "", 220, 262, 40, 19
    BEGIN
        NAME "ine_lstuse_time"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00"
    END
    
    STATICTEXT 02014, "Last Updated:", 57, 286, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstupd_date"
    END
    
    INPUTD 03014, "", 140, 283, 85, 19
    BEGIN
        NAME "ind_lstupd_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03015, "", 220, 283, 40, 19
    BEGIN
        NAME "ine_lstupd_time"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00"
    END
END

