//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_PERIOD - Pay Period Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0186
BEGIN
    NAME "win_prs_period"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Deduction Period:", 23, 13, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_per"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_deduct_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    CHECKBOX 03002, "Automatic Update?", 128, 31, 141, 19
    BEGIN
        NAME "cbx_auto_update"
        NOT OPAQUE
    END
    
    STATICTEXT 02003, "Pay Periods:", 57, 55, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_periods"
    END
    
    INPUTE 03003, "", 130, 52, 100, 19
    BEGIN
        NAME "ine_pay_periods"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02004, "Accrual Days:", 47, 76, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_accrual_days"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_accrual_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03005, "Negative Checks?", 128, 94, 132, 19
    BEGIN
        NAME "cbx_negative_chk"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Payroll Period End Date:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_end_date"
    END
    
    INPUTD 03006, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_pay_end_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_pay_end_date"
    END
    
    STATICTEXT 02007, "Check Date:", 58, 139, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_date"
    END
    
    INPUTD 03007, "", 130, 136, 85, 19
    BEGIN
        NAME "ind_check_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 215, 136, 20, 19
    BEGIN
        NAME "tbnc_check_date"
    END
END

