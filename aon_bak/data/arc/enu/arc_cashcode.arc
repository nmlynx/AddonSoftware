//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARC_CASHCODE - Cash Receipts Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0233
BEGIN
    NAME "win_arc_cashcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Cash Receipt Code:", 14, 13, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_rec_cd"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_cash_rec_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 130, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    GROUPBOX 19003, "Additional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_cash_flag"
    END
    
    CHECKBOX 03003, "Deposit Amt and Adjustments?", 128, 73, 211, 19
    BEGIN
        NAME "cbx_cash_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "Discount?", 128, 94, 88, 19
    BEGIN
        NAME "cbx_disc_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02005, "Post To:", 80, 118, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_arglboth"
    END
    
    LISTBUTTON 03005, "", 130, 115, 111, 300
    BEGIN
        NAME "lbx_arglboth"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Cash Account:", 42, 139, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cash_acct"
    END
    
    INPUTE 03006, "", 130, 136, 80, 19
    BEGIN
        NAME "ine_gl_cash_acct"
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
        NAME "dis_gl_cash_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 210, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_cash_acct"
    END
    
    STATICTEXT 02007, "Discount Account:", 19, 160, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_disc_acct"
    END
    
    INPUTE 03007, "", 130, 157, 80, 19
    BEGIN
        NAME "ine_gl_disc_acct"
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
        NAME "dis_gl_disc_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 210, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_disc_acct"
    END
    
    STATICTEXT 02008, "POS Cash Type:", 36, 181, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_type"
    END
    
    LISTBUTTON 03008, "", 130, 178, 85, 300
    BEGIN
        NAME "lbx_trans_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

