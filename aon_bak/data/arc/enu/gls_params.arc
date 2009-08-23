//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLS_PARAMS - GL Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0147
BEGIN
    NAME "win_gls_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Posting Method:", 33, 13, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_post_code"
    END
    
    LISTBUTTON 03001, "", 130, 10, 128, 300
    BEGIN
        NAME "lbx_gl_post_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03002, "Post Detail Transactions?", 118, 31, 177, 19
    BEGIN
        NAME "cbx_detail_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03003, "Retain Transaction History?", 118, 52, 191, 19
    BEGIN
        NAME "cbx_retain_det"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "Use Budgets?", 118, 73, 108, 19
    BEGIN
        NAME "cbx_budget_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "Use Units?", 118, 94, 91, 19
    BEGIN
        NAME "cbx_units_flag"
        NOT OPAQUE
    END
END

