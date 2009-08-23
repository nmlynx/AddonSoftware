//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_BUDGETMASTER - Budget Revisions
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0354
BEGIN
    NAME "win_glm_budgetmaster"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Revision Code:", 41, 13, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_budget_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_budget_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Amounts or Units:", 20, 34, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amt_or_units"
    END
    
    LISTBUTTON 03002, "", 130, 31, 79, 300
    BEGIN
        NAME "lbx_amt_or_units"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Description:", 56, 55, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03003, "", 130, 52, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02004, "Column Title:", 49, 76, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rev_title"
    END
    
    INPUTE 03004, "", 130, 73, 120, 19
    BEGIN
        NAME "ine_rev_title"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    GROUPBOX 19005, "Additional Information ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_revision_src"
    END
    
    STATICTEXT 02005, "Revision Source:", 31, 118, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_revision_src"
    END
    
    LISTBUTTON 03005, "", 130, 115, 251, 300
    BEGIN
        NAME "lbx_revision_src"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Beginning GL Account:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03006, "", 130, 136, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 236, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 210, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02007, "Ending GL Account:", 12, 160, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03007, "", 130, 157, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 236, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 210, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02008, "Wildcard Mask:", 41, 181, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_wildcard"
    END
    
    INPUTE 03008, "", 130, 178, 80, 19
    BEGIN
        NAME "ine_gl_wildcard"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02009, "Amount/ Percentage:", 2, 202, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amt_or_pct"
    END
    
    LISTBUTTON 03009, "", 130, 199, 94, 300
    BEGIN
        NAME "lbx_amt_or_pct"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02010, "Value:", 92, 223, 35, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amtpct_val"
    END
    INPUTN 03010, "", 130, 220, 56, 19
    BEGIN
        NAME "inn_amtpct_val"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03011, "Overwrite", 128, 241, 87, 19
    BEGIN
        NAME "cbx_overwrite"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Rounding Factor:", 26, 265, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rounding"
    END
    
    LISTBUTTON 03012, "", 130, 262, 95, 300
    BEGIN
        NAME "lbx_rounding"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02013, "Date Created:", 48, 286, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_created_date"
    END
    
    INPUTD 03013, "", 130, 283, 85, 19
    BEGIN
        NAME "ind_created_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02014, "Last Revision:", 47, 307, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstrev_date"
    END
    
    INPUTD 03014, "", 130, 304, 85, 19
    BEGIN
        NAME "ind_lstrev_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
END

