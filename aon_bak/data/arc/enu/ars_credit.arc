//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_CREDIT - Credit Management Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0252
BEGIN
    NAME "win_ars_credit"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Credit Management Installed?", 178, 10, 202, 19
    BEGIN
        NAME "cbx_sys_install"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Credit Password:", 78, 34, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cred_passwd"
    END
    
    EDIT 03002, "", 180, 31, 48, 19
    BEGIN
        NAME "edp_cred_passwd"
        CLIENTEDGE
        PASSWORDENTRY
    END
    
    STATICTEXT 02003, "Aging Bucket to Hold:", 51, 55, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_bucket"
    END
    
    LISTBUTTON 03003, "", 180, 52, 74, 300
    BEGIN
        NAME "lbx_aging_bucket"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Minimum Balance To Hold:", 23, 76, 154, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_past_due_lim"
    END
    INPUTN 03004, "", 180, 73, 56, 19
    BEGIN
        NAME "inn_past_due_lim"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Hold All Orders Over This Amt:", 0, 97, 177, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hold_amount"
    END
    INPUTN 03005, "", 180, 94, 72, 19
    BEGIN
        NAME "inn_hold_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "########0-"
    END
    
    STATICTEXT 02006, "Display Credit in Order Entry?:", 0, 118, 177, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_display_bal"
    END
    
    LISTBUTTON 03006, "", 180, 115, 94, 300
    BEGIN
        NAME "lbx_display_bal"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03007, "Auto Hold Over Credit Limit?", 178, 136, 198, 19
    BEGIN
        NAME "cbx_auto_hold"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "Allow Manual Holds?", 178, 157, 149, 19
    BEGIN
        NAME "cbx_man_hold"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Pick List For Held Orders?", 178, 178, 180, 19
    BEGIN
        NAME "cbx_pick_hold"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "Hold All New Customers?", 178, 199, 177, 19
    BEGIN
        NAME "cbx_hold_new"
        NOT OPAQUE
    END
END

