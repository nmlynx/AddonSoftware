//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARC_DISTCODE - Distribution Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0512 0333
BEGIN
    NAME "win_arc_distcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de distribución:", 15, 13, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
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
    
    GROUPBOX 19003, "Cuentas del GL ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_gl_ar_acct"
    END
    
    STATICTEXT 02003, "Cuenta de cuentas por cobrar:", 34, 76, 179, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ar_acct"
    END
    
    INPUTE 03003, "", 216, 73, 80, 19
    BEGIN
        NAME "ine_gl_ar_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 322, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ar_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 296, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_ar_acct"
    END
    
    STATICTEXT 02004, "Cuenta de efectivo:", 101, 97, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cash_acct"
    END
    
    INPUTE 03004, "", 216, 94, 80, 19
    BEGIN
        NAME "ine_gl_cash_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 322, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cash_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 296, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_cash_acct"
    END
    
    STATICTEXT 02005, "Cuenta de ventas:", 109, 118, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_sls_acct"
    END
    
    INPUTE 03005, "", 216, 115, 80, 19
    BEGIN
        NAME "ine_gl_sls_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04005, "", 322, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_sls_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 296, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_sls_acct"
    END
    
    STATICTEXT 02006, "Cuenta de descuento:", 86, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_disc_acct"
    END
    
    INPUTE 03006, "", 216, 136, 80, 19
    BEGIN
        NAME "ine_gl_disc_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 322, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_disc_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 296, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_disc_acct"
    END
    
    STATICTEXT 02007, "Cuenta de flete:", 122, 160, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_frgt_acct"
    END
    
    INPUTE 03007, "", 216, 157, 80, 19
    BEGIN
        NAME "ine_gl_frgt_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 322, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_frgt_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 296, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_frgt_acct"
    END
    
    STATICTEXT 02008, "Cuenta de inventario:", 88, 181, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_inv_acct"
    END
    
    INPUTE 03008, "", 216, 178, 80, 19
    BEGIN
        NAME "ine_gl_inv_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 322, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_inv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 296, 178, 20, 19
    BEGIN
        NAME "tbnf_gl_inv_acct"
    END
    
    STATICTEXT 02009, "Cuenta costo de los bienes:", 52, 202, 161, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cogs_acct"
    END
    
    INPUTE 03009, "", 216, 199, 80, 19
    BEGIN
        NAME "ine_gl_cogs_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04009, "", 322, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cogs_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 296, 199, 20, 19
    BEGIN
        NAME "tbnf_gl_cogs_acct"
    END
    
    STATICTEXT 02010, "Cuenta de ajuste de inventarios:", 25, 223, 188, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_inv_adj"
    END
    
    INPUTE 03010, "", 216, 220, 80, 19
    BEGIN
        NAME "ine_gl_inv_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04010, "", 322, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_inv_adj"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 296, 220, 20, 19
    BEGIN
        NAME "tbnf_gl_inv_adj"
    END
    
    STATICTEXT 02011, "Cuenta de ajuste de COGS:", 57, 244, 156, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cogs_adj"
    END
    
    INPUTE 03011, "", 216, 241, 80, 19
    BEGIN
        NAME "ine_gl_cogs_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04011, "", 322, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cogs_adj"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 296, 241, 20, 19
    BEGIN
        NAME "tbnf_gl_cogs_adj"
    END
    
    STATICTEXT 02012, "Cuenta de compras:", 96, 265, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_purc_acct"
    END
    
    INPUTE 03012, "", 216, 262, 80, 19
    BEGIN
        NAME "ine_gl_purc_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04012, "", 322, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_purc_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 296, 262, 20, 19
    BEGIN
        NAME "tbnf_gl_purc_acct"
    END
    
    STATICTEXT 02013, "Cta. de variación del precio de compra:", 0, 286, 213, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ppv_acct"
    END
    
    INPUTE 03013, "", 216, 283, 80, 19
    BEGIN
        NAME "ine_gl_ppv_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04013, "", 322, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ppv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20013, "", 296, 283, 20, 19
    BEGIN
        NAME "tbnf_gl_ppv_acct"
    END
END

