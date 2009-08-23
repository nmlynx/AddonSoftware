//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_BANKMASTER - Bank Account Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0480 0308
BEGIN
    NAME "win_glm_bankmaster"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_glm_bankmaster", 4, 0034, 0473, 0274
    BEGIN
        NAME "tab_glm_bankmaster"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Bank Account Information" 0 1100
        TAB "Statement Information" 1 1101
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_glm_bankmaster_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_glm_bankmaster_1101"
    END
    
    
    STATICTEXT 02001, "GL Account:", 56, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 130, 10, 100, 19
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
END
CHILD-WINDOW 1100 0 0 0470 0252
BEGIN
    NAME "chw_glm_bankmaster_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Bank Name:", 60, 13, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_name"
    END
    
    INPUTE 03101, "", 130, 10, 240, 19
    BEGIN
        NAME "ine_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02102, "Bank Address:", 44, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_address_line_1"
    END
    
    INPUTE 03102, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_address_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03103, "", 130, 52, 240, 19
    BEGIN
        NAME "ine_address_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03104, "", 130, 73, 240, 19
    BEGIN
        NAME "ine_address_line_3"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02105, "Account Name:", 38, 118, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03105, "", 130, 115, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02106, "Bank Account Number:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bnk_acct_no"
    END
    
    INPUTE 03106, "", 130, 136, 120, 19
    BEGIN
        NAME "ine_bnk_acct_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END

END
CHILD-WINDOW 1101 0 0 0470 0252
BEGIN
    NAME "chw_glm_bankmaster_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Prior Statement End Date:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_end_date"
    END
    
    INPUTD 03201, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_pri_end_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02202, "Current Statement Date:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_curstm_date"
    END
    
    INPUTD 03202, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_curstm_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21202, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_curstm_date"
    END
    
    STATICTEXT 02203, "Prior Statement Ending Amount:", 179, 13, 188, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_end_amt"
    END
    INPUTN 03203, "", 370, 10, 80, 19
    BEGIN
        NAME "inn_pri_end_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02204, "Current Stmt Amount:", 238, 34, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_stmt_amt"
    END
    INPUTN 03204, "", 370, 31, 80, 19
    BEGIN
        NAME "inn_cur_stmt_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02205, "Book Balance:", 288, 55, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_book_balance"
    END
    INPUTN 03205, "", 370, 52, 80, 19
    BEGIN
        NAME "inn_book_balance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    GROUPBOX 19206, "Summary Information ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_stmt_amt"
    END
    
    STATICTEXT 02206, "Statement Ending Balance:", 45, 118, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_stmt_amt"
    END
    INPUTN 03206, "", 200, 115, 80, 19
    BEGIN
        NAME "inn_stmt_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02207, "Checks Outstanding:", 74, 139, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_checks_out"
    END
    INPUTN 03207, "", 200, 136, 80, 19
    BEGIN
        NAME "inn_checks_out"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02208, "Transactions Outstanding:", 40, 160, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_out"
    END
    INPUTN 03208, "", 200, 157, 80, 19
    BEGIN
        NAME "inn_trans_out"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02209, "Ending Balance:", 106, 202, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_bal"
    END
    INPUTN 03209, "", 200, 199, 80, 19
    BEGIN
        NAME "inn_end_bal"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02210, "No. of Checks:", 273, 139, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_checks"
    END
    INPUTN 03210, "", 360, 136, 40, 19
    BEGIN
        NAME "inn_no_checks"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0-"
    END
    
    STATICTEXT 02211, "No. of Trans:", 282, 160, 75, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_trans"
    END
    INPUTN 03211, "", 360, 157, 40, 19
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

