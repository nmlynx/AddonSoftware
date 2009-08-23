//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRT_EMPLEARN - Employee Earnings History
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0438
BEGIN
    NAME "win_prt_emplearn"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Employee Number:", 17, 13, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_employee_no"
    END
    
    INPUTE 03001, "", 130, 10, 117, 19
    BEGIN
        NAME "ine_employee_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 273, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_employee_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 247, 10, 20, 19
    BEGIN
        NAME "tbnf_employee_no"
    END
    
    STATICTEXT 02002, "Pay Code:", 70, 34, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02003, "MTD Amount:", 47, 55, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_amount"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_mtd_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Quarter Amount:", 27, 76, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_amt"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_qtr_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Quarter Amount:", 27, 97, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_amt"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_qtr_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Quarter Amount:", 27, 118, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_amt"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_qtr_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Quarter Amount:", 27, 139, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_amt"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_qtr_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Next MTD Amount:", 16, 160, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_amt"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_nmtd_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "MTD Units:", 64, 181, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_units"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_mtd_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Quarter Units:", 44, 202, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_units"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_qtr_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Quarter Units:", 44, 223, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_units"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_qtr_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Quarter Units:", 44, 244, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_units"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_qtr_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Quarter Units:", 44, 265, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qtr_units"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_qtr_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Next MTD Units:", 33, 286, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nmtd_units"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_nmtd_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Prior Year Accrued Amount:", 0, 307, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pyr_acc_amt"
    END
    INPUTN 03015, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_pyr_acc_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Current Year Accrued Amount:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cyr_accr_amt"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_cyr_accr_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Next Year Accrued Amount:", 0, 349, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nyr_acc_amt"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_nyr_acc_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Accrual Rate:", 50, 370, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_accrual_rate"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_accrual_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Accrual Used Since Anniversary:", 0, 391, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_accrual_used"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_accrual_used"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

