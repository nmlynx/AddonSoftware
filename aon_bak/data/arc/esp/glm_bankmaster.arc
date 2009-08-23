//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_BANKMASTER - Bank Account Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0554 0308
BEGIN
    NAME "win_glm_bankmaster"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_glm_bankmaster", 4, 0034, 0547, 0274
    BEGIN
        NAME "tab_glm_bankmaster"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Información de cuentas bancarias" 0 1100
        TAB "Información del estado" 1 1101
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_glm_bankmaster_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_glm_bankmaster_1101"
    END
    
    
    STATICTEXT 02001, "Cuenta del GL:", 69, 13, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 156, 10, 100, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 282, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 256, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
END
CHILD-WINDOW 1100 0 0 0544 0252
BEGIN
    NAME "chw_glm_bankmaster_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Nombre del banco:", 42, 13, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_name"
    END
    
    INPUTE 03101, "", 156, 10, 240, 19
    BEGIN
        NAME "ine_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02102, "Domicilio del banco:", 35, 34, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_address_line_1"
    END
    
    INPUTE 03102, "", 156, 31, 240, 19
    BEGIN
        NAME "ine_address_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03103, "", 156, 52, 240, 19
    BEGIN
        NAME "ine_address_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03104, "", 156, 73, 240, 19
    BEGIN
        NAME "ine_address_line_3"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02105, "Nombre de cuenta:", 42, 118, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03105, "", 156, 115, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02106, "Número de cuenta bancaria:", 0, 139, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bnk_acct_no"
    END
    
    INPUTE 03106, "", 156, 136, 120, 19
    BEGIN
        NAME "ine_bnk_acct_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END

END
CHILD-WINDOW 1101 0 0 0544 0252
BEGIN
    NAME "chw_glm_bankmaster_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Fecha de finalización del estado anterior:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_end_date"
    END
    
    INPUTD 03201, "", 156, 10, 85, 19
    BEGIN
        NAME "ind_pri_end_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02202, "Fecha del estado actual:", 14, 34, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_curstm_date"
    END
    
    INPUTD 03202, "", 156, 31, 85, 19
    BEGIN
        NAME "ind_curstm_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21202, "", 241, 31, 20, 19
    BEGIN
        NAME "tbnc_curstm_date"
    END
    
    STATICTEXT 02203, "Monto al cierre del estado anterior:", 236, 13, 205, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_end_amt"
    END
    INPUTN 03203, "", 444, 10, 80, 19
    BEGIN
        NAME "inn_pri_end_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02204, "Monto del est. actual:", 317, 34, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_stmt_amt"
    END
    INPUTN 03204, "", 444, 31, 80, 19
    BEGIN
        NAME "inn_cur_stmt_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02205, "Saldo contable:", 352, 55, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_book_balance"
    END
    INPUTN 03205, "", 444, 52, 80, 19
    BEGIN
        NAME "inn_book_balance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    GROUPBOX 19206, "Información de resumen ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_stmt_amt"
    END
    
    STATICTEXT 02206, "Saldo final del estado:", 110, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_stmt_amt"
    END
    INPUTN 03206, "", 240, 115, 80, 19
    BEGIN
        NAME "inn_stmt_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02207, "Cheques pendientes:", 114, 139, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_checks_out"
    END
    INPUTN 03207, "", 240, 136, 80, 19
    BEGIN
        NAME "inn_checks_out"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02208, "Transacciones pendientes:", 80, 160, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_out"
    END
    INPUTN 03208, "", 240, 157, 80, 19
    BEGIN
        NAME "inn_trans_out"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02209, "Saldo final:", 174, 202, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_bal"
    END
    INPUTN 03209, "", 240, 199, 80, 19
    BEGIN
        NAME "inn_end_bal"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02210, "N.º de cheques:", 338, 139, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_checks"
    END
    INPUTN 03210, "", 432, 136, 40, 19
    BEGIN
        NAME "inn_no_checks"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0-"
    END
    
    STATICTEXT 02211, "N.º de trans.:", 354, 160, 75, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_trans"
    END
    INPUTN 03211, "", 432, 157, 40, 19
    BEGIN
        NAME "inn_no_trans"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0-"
    END

END

