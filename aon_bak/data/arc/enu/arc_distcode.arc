//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARC_DISTCODE - Distribution Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0476 0333
BEGIN
    NAME "win_arc_distcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Distribution Code:", 20, 13, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
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
    
    GROUPBOX 19003, "GL Accounts ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_gl_ar_acct"
    END
    
    STATICTEXT 02003, "Accounts Receivable Account:", 0, 76, 177, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ar_acct"
    END
    
    INPUTE 03003, "", 180, 73, 80, 19
    BEGIN
        NAME "ine_gl_ar_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 286, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ar_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 260, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_ar_acct"
    END
    
    STATICTEXT 02004, "Cash Account:", 92, 97, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cash_acct"
    END
    
    INPUTE 03004, "", 180, 94, 80, 19
    BEGIN
        NAME "ine_gl_cash_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 286, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cash_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 260, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_cash_acct"
    END
    
    STATICTEXT 02005, "Sales Account:", 92, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_sls_acct"
    END
    
    INPUTE 03005, "", 180, 115, 80, 19
    BEGIN
        NAME "ine_gl_sls_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04005, "", 286, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_sls_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 260, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_sls_acct"
    END
    
    STATICTEXT 02006, "Discount Account:", 69, 139, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_disc_acct"
    END
    
    INPUTE 03006, "", 180, 136, 80, 19
    BEGIN
        NAME "ine_gl_disc_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 286, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_disc_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 260, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_disc_acct"
    END
    
    STATICTEXT 02007, "Freight Account:", 80, 160, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_frgt_acct"
    END
    
    INPUTE 03007, "", 180, 157, 80, 19
    BEGIN
        NAME "ine_gl_frgt_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 286, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_frgt_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 260, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_frgt_acct"
    END
    
    STATICTEXT 02008, "Inventory Account:", 65, 181, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_inv_acct"
    END
    
    INPUTE 03008, "", 180, 178, 80, 19
    BEGIN
        NAME "ine_gl_inv_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 286, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_inv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 260, 178, 20, 19
    BEGIN
        NAME "tbnf_gl_inv_acct"
    END
    
    STATICTEXT 02009, "Cost Of Goods Account:", 34, 202, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cogs_acct"
    END
    
    INPUTE 03009, "", 180, 199, 80, 19
    BEGIN
        NAME "ine_gl_cogs_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04009, "", 286, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cogs_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 260, 199, 20, 19
    BEGIN
        NAME "tbnf_gl_cogs_acct"
    END
    
    STATICTEXT 02010, "Inventory Adjustment Account:", 0, 223, 177, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_inv_adj"
    END
    
    INPUTE 03010, "", 180, 220, 80, 19
    BEGIN
        NAME "ine_gl_inv_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04010, "", 286, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_inv_adj"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 260, 220, 20, 19
    BEGIN
        NAME "tbnf_gl_inv_adj"
    END
    
    STATICTEXT 02011, "COGS Adjustment Account:", 16, 244, 161, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cogs_adj"
    END
    
    INPUTE 03011, "", 180, 241, 80, 19
    BEGIN
        NAME "ine_gl_cogs_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04011, "", 286, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cogs_adj"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 260, 241, 20, 19
    BEGIN
        NAME "tbnf_gl_cogs_adj"
    END
    
    STATICTEXT 02012, "Purchases Account:", 61, 265, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_purc_acct"
    END
    
    INPUTE 03012, "", 180, 262, 80, 19
    BEGIN
        NAME "ine_gl_purc_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04012, "", 286, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_purc_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 260, 262, 20, 19
    BEGIN
        NAME "tbnf_gl_purc_acct"
    END
    
    STATICTEXT 02013, "Purchase Price Variance Acct:", 5, 286, 172, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ppv_acct"
    END
    
    INPUTE 03013, "", 180, 283, 80, 19
    BEGIN
        NAME "ine_gl_ppv_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04013, "", 286, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ppv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20013, "", 260, 283, 20, 19
    BEGIN
        NAME "tbnf_gl_ppv_acct"
    END
END

