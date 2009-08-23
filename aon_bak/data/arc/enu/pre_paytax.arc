//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRE_PAYTAX - Payroll Entry - Taxes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0249
BEGIN
    NAME "win_pre_paytax"
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
    
    STATICTEXT 02002, "Check or Transaction Type:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_type"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_check_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02003, "Sequence Number:", 17, 55, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_num"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_sequence_num"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02004, "Check Number:", 37, 76, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_no"
    END
    
    INPUTE 03004, "", 130, 73, 91, 19
    BEGIN
        NAME "ine_check_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02005, "Seq:", 103, 97, 24, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_entry_seq"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_pr_entry_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02006, "Tax Code:", 68, 118, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04006, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02007, "Table:", 92, 139, 35, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_tbl_code"
    END
    
    INPUTE 03007, "", 130, 136, 39, 19
    BEGIN
        NAME "ine_tax_tbl_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04007, "", 195, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_tbl_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 169, 136, 20, 19
    BEGIN
        NAME "tbnf_tax_tbl_code"
    END
    
    STATICTEXT 02008, "Rate:", 99, 160, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_rate"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_tax_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Taxable Amount:", 27, 181, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_taxable_amt"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_taxable_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Amount:", 77, 202, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_amount"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_tax_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

