//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRT_UNNHIST - Union History Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0270
BEGIN
    NAME "win_prt_unnhist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Union Code:", 55, 13, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_union_code"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_union_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_union_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_union_code"
    END
    
    STATICTEXT 02002, "Employee Surname:", 13, 34, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_surname"
    END
    
    INPUTE 03002, "", 130, 31, 208, 19
    BEGIN
        NAME "ine_empl_surname"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 02003, "Employee Given Name:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_givname"
    END
    
    INPUTE 03003, "", 130, 52, 182, 19
    BEGIN
        NAME "ine_empl_givname"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 14
    END
    
    STATICTEXT 02004, "Employee Number:", 17, 76, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_employee_no"
    END
    
    INPUTE 03004, "", 130, 73, 117, 19
    BEGIN
        NAME "ine_employee_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 273, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_employee_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 247, 73, 20, 19
    BEGIN
        NAME "tbnf_employee_no"
    END
    
    STATICTEXT 02005, "Payroll Period End Date:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_end_date"
    END
    
    INPUTD 03005, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_pay_end_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_pay_end_date"
    END
    
    STATICTEXT 02006, "Social Security Number:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_soc_sec_no"
    END
    
    INPUTE 03006, "", 130, 115, 90, 19
    BEGIN
        NAME "ine_soc_sec_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02007, "Total Units:", 60, 139, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_units"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_total_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Total Earnings Amount:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_earn_amt"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_tot_earn_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Total Deduction Amount:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_ded_amt"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_tot_ded_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Total Tax Amount:", 19, 202, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_tax_amt"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_tot_tax_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Total Contribution Amount:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_cont_amt"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_tot_cont_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

