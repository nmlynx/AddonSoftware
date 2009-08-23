//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POC_LINECODE - Purchase Order Line Codes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0186
BEGIN
    NAME "win_poc_linecode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Line Code:", 92, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_po_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 156, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02003, "Line Type:", 94, 55, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_type"
    END
    
    LISTBUTTON 03003, "", 156, 52, 144, 300
    BEGIN
        NAME "lbx_line_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03004, "Use Line for Lead Time Calc?", 154, 73, 197, 19
    BEGIN
        NAME "cbx_lead_tim_flg"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Use for Landed Cost?", 154, 94, 155, 19
    BEGIN
        NAME "cbx_land_cst_flg"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Expense Account:", 48, 118, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_exp_acct"
    END
    
    INPUTE 03006, "", 156, 115, 80, 19
    BEGIN
        NAME "ine_gl_exp_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 262, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_exp_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 236, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_exp_acct"
    END
    
    STATICTEXT 02007, "Purchase Price Variance:", 10, 139, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ppv_acct"
    END
    
    INPUTE 03007, "", 156, 136, 80, 19
    BEGIN
        NAME "ine_gl_ppv_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 262, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ppv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 236, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_ppv_acct"
    END
END

