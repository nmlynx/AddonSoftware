//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPC_LINECODE - Order Processing Line Codes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0312
BEGIN
    NAME "win_opc_linecode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de línea:", 59, 13, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 156, 31, 200, 19
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
    
    LISTBUTTON 03003, "", 156, 52, 139, 300
    BEGIN
        NAME "lbx_line_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Message Type:", 68, 76, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_message_type"
    END
    
    LISTBUTTON 03004, "", 156, 73, 74, 300
    BEGIN
        NAME "lbx_message_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "GL Sales Account:", 49, 97, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rev_acct"
    END
    
    INPUTE 03005, "", 156, 94, 130, 19
    BEGIN
        NAME "ine_gl_rev_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04005, "", 312, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_rev_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 286, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_rev_acct"
    END
    
    CHECKBOX 03006, "Taxable?", 154, 115, 81, 19
    BEGIN
        NAME "cbx_taxable_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "Dropship?", 154, 136, 90, 19
    BEGIN
        NAME "cbx_dropship"
        NOT OPAQUE
    END
    
    STATICTEXT 02008, "Product Type Processing:", 4, 160, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prod_type_pr"
    END
    
    LISTBUTTON 03008, "", 156, 157, 125, 300
    BEGIN
        NAME "lbx_prod_type_pr"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02009, "Default Product Type:", 27, 181, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03009, "", 156, 178, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04009, "", 221, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 195, 178, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02010, "Código de distribución:", 15, 202, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03010, "", 156, 199, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04010, "", 217, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 191, 199, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02011, "Sales Account:", 68, 223, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_sls_acct"
    END
    
    INPUTE 03011, "", 156, 220, 130, 19
    BEGIN
        NAME "ine_gl_sls_acct"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04011, "", 312, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_sls_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 286, 220, 20, 19
    BEGIN
        NAME "tbnf_gl_sls_acct"
    END
    
    STATICTEXT 02012, "Inventory Account:", 41, 244, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_inv_acct"
    END
    
    INPUTE 03012, "", 156, 241, 130, 19
    BEGIN
        NAME "ine_gl_inv_acct"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04012, "", 312, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_inv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 286, 241, 20, 19
    BEGIN
        NAME "tbnf_gl_inv_acct"
    END
    
    STATICTEXT 02013, "COGS Account:", 63, 265, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cogs_acct"
    END
    
    INPUTE 03013, "", 156, 262, 130, 19
    BEGIN
        NAME "ine_gl_cogs_acct"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04013, "", 312, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cogs_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20013, "", 286, 262, 20, 19
    BEGIN
        NAME "tbnf_gl_cogs_acct"
    END
END

