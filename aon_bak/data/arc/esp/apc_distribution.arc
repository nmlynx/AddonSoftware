//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APC_DISTRIBUTION - Distribution Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0186
BEGIN
    NAME "win_apc_distribution"
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
        NAME "txt_ap_dist_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_ap_dist_code"
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
        NAME "ghl_gl_ap_acct"
    END
    
    STATICTEXT 02003, "Cuenta de AP:", 72, 76, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ap_acct"
    END
    
    INPUTE 03003, "", 156, 73, 80, 19
    BEGIN
        NAME "ine_gl_ap_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 262, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ap_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 236, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_ap_acct"
    END
    
    STATICTEXT 02004, "Cuenta de efectivo:", 41, 97, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cash_acct"
    END
    
    INPUTE 03004, "", 156, 94, 80, 19
    BEGIN
        NAME "ine_gl_cash_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 262, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cash_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 236, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_cash_acct"
    END
    
    STATICTEXT 02005, "Cuenta de descuento:", 26, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_disc_acct"
    END
    
    INPUTE 03005, "", 156, 115, 80, 19
    BEGIN
        NAME "ine_gl_disc_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04005, "", 262, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_disc_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 236, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_disc_acct"
    END
    
    STATICTEXT 02006, "Cuenta de retención:", 31, 139, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ret_acct"
    END
    
    INPUTE 03006, "", 156, 136, 80, 19
    BEGIN
        NAME "ine_gl_ret_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 262, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ret_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 236, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_ret_acct"
    END
END

