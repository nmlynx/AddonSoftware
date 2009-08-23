//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRC_DEPTCODE - Department Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0821 0518
BEGIN
    NAME "win_prc_deptcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_prc_deptcode", 4, 0160, 0814, 0358
    BEGIN
        NAME "tab_prc_deptcode"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Pay Code Distribution" 0 1100
        TAB "Tax Code Distribution" 1 1101
        TAB "Contribution Distribution" 2 1102
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_prc_deptcode_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_prc_deptcode_1101"
    END
    
    CHILD-WINDOW 1102, 1102, 10, 88
    BEGIN
        NAME "chp_prc_deptcode_1102"
    END
    
    
    STATICTEXT 02001, "Department Code:", 21, 13, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dept_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_dept_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 130, 31, 200, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    GROUPBOX 19003, "Additional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_gl_cash_acct"
    END
    
    STATICTEXT 02003, "Cash Account:", 42, 76, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cash_acct"
    END
    
    INPUTE 03003, "", 130, 73, 130, 19
    BEGIN
        NAME "ine_gl_cash_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 286, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cash_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 260, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_cash_acct"
    END
    
    STATICTEXT 02004, "Accrual Account:", 26, 97, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_accr_acct"
    END
    
    INPUTE 03004, "", 130, 94, 130, 19
    BEGIN
        NAME "ine_gl_accr_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 286, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_accr_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 260, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_accr_acct"
    END
    
    STATICTEXT 02005, "Budgeted Daily Hours:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_budget_hrs"
    END
    INPUTN 03005, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_budget_hrs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Budgeted Average Hourly Rate:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bud_hr_cost"
    END
    INPUTN 03006, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_bud_hr_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END
CHILD-WINDOW 1100 0 0 0811 0336
BEGIN
    NAME "chw_prc_deptcode_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Pay Code:", 15, 13, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03101, "", 75, 10, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04101, "", 136, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20101, "", 110, 10, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02102, "Pay Code:", 15, 34, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03102, "", 75, 31, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04102, "", 136, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20102, "", 110, 31, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02103, "Pay Code:", 15, 55, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03103, "", 75, 52, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04103, "", 136, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20103, "", 110, 52, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02104, "Pay Code:", 15, 76, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03104, "", 75, 73, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04104, "", 136, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20104, "", 110, 73, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02105, "Pay Code:", 15, 97, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03105, "", 75, 94, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04105, "", 136, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20105, "", 110, 94, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02106, "Pay Code:", 15, 118, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03106, "", 75, 115, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04106, "", 136, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20106, "", 110, 115, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02107, "Pay Code:", 15, 139, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03107, "", 75, 136, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04107, "", 136, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20107, "", 110, 136, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02108, "Pay Code:", 15, 160, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03108, "", 75, 157, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04108, "", 136, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20108, "", 110, 157, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02109, "Pay Code:", 15, 181, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03109, "", 75, 178, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04109, "", 136, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20109, "", 110, 178, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02110, "Pay Code:", 15, 202, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03110, "", 75, 199, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04110, "", 136, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20110, "", 110, 199, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02111, "Pay Code:", 15, 223, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03111, "", 75, 220, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04111, "", 136, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20111, "", 110, 220, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02112, "Pay Code:", 15, 244, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03112, "", 75, 241, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04112, "", 136, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20112, "", 110, 241, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02113, "Pay Code:", 15, 265, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03113, "", 75, 262, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04113, "", 136, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20113, "", 110, 262, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02114, "Pay Code:", 15, 286, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03114, "", 75, 283, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04114, "", 136, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20114, "", 110, 283, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02115, "GL Expense:", 226, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03115, "", 300, 10, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04115, "", 456, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20115, "", 430, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02116, "GL Expense:", 226, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03116, "", 300, 31, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04116, "", 456, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20116, "", 430, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02117, "GL Expense:", 226, 55, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03117, "", 300, 52, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04117, "", 456, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20117, "", 430, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02118, "GL Expense:", 226, 76, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03118, "", 300, 73, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04118, "", 456, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20118, "", 430, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02119, "GL Expense:", 226, 97, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03119, "", 300, 94, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04119, "", 456, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20119, "", 430, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02120, "GL Expense:", 226, 118, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03120, "", 300, 115, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04120, "", 456, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20120, "", 430, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02121, "GL Expense:", 226, 139, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03121, "", 300, 136, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04121, "", 456, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20121, "", 430, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02122, "GL Expense:", 226, 160, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03122, "", 300, 157, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04122, "", 456, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20122, "", 430, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02123, "GL Expense:", 226, 181, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03123, "", 300, 178, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04123, "", 456, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20123, "", 430, 178, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02124, "GL Expense:", 226, 202, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03124, "", 300, 199, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04124, "", 456, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20124, "", 430, 199, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02125, "GL Expense:", 226, 223, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03125, "", 300, 220, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04125, "", 456, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20125, "", 430, 220, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02126, "GL Expense:", 226, 244, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03126, "", 300, 241, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04126, "", 456, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20126, "", 430, 241, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02127, "GL Expense:", 226, 265, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03127, "", 300, 262, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04127, "", 456, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20127, "", 430, 262, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END
    
    STATICTEXT 02128, "GL Expense:", 226, 286, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pay_acct"
    END
    
    INPUTE 03128, "", 300, 283, 130, 19
    BEGIN
        NAME "ine_gl_pay_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04128, "", 456, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pay_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20128, "", 430, 283, 20, 19
    BEGIN
        NAME "tbnf_gl_pay_acct"
    END

END
CHILD-WINDOW 1101 0 0 0811 0336
BEGIN
    NAME "chw_prc_deptcode_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Tax Code:", 13, 13, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03201, "", 75, 10, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04201, "", 136, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20201, "", 110, 10, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02202, "Tax Code:", 13, 34, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03202, "", 75, 31, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04202, "", 136, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 110, 31, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02203, "Tax Code:", 13, 55, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03203, "", 75, 52, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04203, "", 136, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20203, "", 110, 52, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02204, "Tax Code:", 13, 76, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03204, "", 75, 73, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04204, "", 136, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20204, "", 110, 73, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02205, "Tax Code:", 13, 97, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03205, "", 75, 94, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04205, "", 136, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20205, "", 110, 94, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02206, "Tax Code:", 13, 118, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03206, "", 75, 115, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04206, "", 136, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20206, "", 110, 115, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02207, "Tax Code:", 13, 139, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03207, "", 75, 136, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04207, "", 136, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20207, "", 110, 136, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02208, "Tax Code:", 13, 160, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03208, "", 75, 157, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04208, "", 136, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20208, "", 110, 157, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02209, "Tax Code:", 13, 181, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03209, "", 75, 178, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04209, "", 136, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20209, "", 110, 178, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02210, "Tax Code:", 13, 202, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03210, "", 75, 199, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04210, "", 136, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20210, "", 110, 199, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02211, "GL Accrual:", 230, 13, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03211, "", 300, 10, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04211, "", 456, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20211, "", 430, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02212, "GL Accrual:", 230, 34, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03212, "", 300, 31, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04212, "", 456, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20212, "", 430, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02213, "GL Accrual:", 230, 55, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03213, "", 300, 52, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04213, "", 456, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20213, "", 430, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02214, "GL Accrual:", 230, 76, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03214, "", 300, 73, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04214, "", 456, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20214, "", 430, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02215, "GL Accrual:", 230, 97, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03215, "", 300, 94, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04215, "", 456, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20215, "", 430, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02216, "GL Accrual:", 230, 118, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03216, "", 300, 115, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04216, "", 456, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20216, "", 430, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02217, "GL Accrual:", 230, 139, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03217, "", 300, 136, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04217, "", 456, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20217, "", 430, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02218, "GL Accrual:", 230, 160, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03218, "", 300, 157, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04218, "", 456, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20218, "", 430, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02219, "GL Accrual:", 230, 181, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03219, "", 300, 178, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04219, "", 456, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20219, "", 430, 178, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END
    
    STATICTEXT 02220, "GL Accrual:", 230, 202, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_tax_acct"
    END
    
    INPUTE 03220, "", 300, 199, 130, 19
    BEGIN
        NAME "ine_gl_tax_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04220, "", 456, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_tax_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20220, "", 430, 199, 20, 19
    BEGIN
        NAME "tbnf_gl_tax_acct"
    END

END
CHILD-WINDOW 1102 0 0 0811 0336
BEGIN
    NAME "chw_prc_deptcode_1102"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02301, "Contribution:", 0, 13, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03301, "", 75, 10, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04301, "", 136, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20301, "", 110, 10, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02302, "Contribution:", 0, 34, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03302, "", 75, 31, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04302, "", 136, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20302, "", 110, 31, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02303, "Contribution:", 0, 55, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03303, "", 75, 52, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04303, "", 136, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20303, "", 110, 52, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02304, "Contribution:", 0, 76, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03304, "", 75, 73, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04304, "", 136, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20304, "", 110, 73, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02305, "Contribution:", 0, 97, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03305, "", 75, 94, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04305, "", 136, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20305, "", 110, 94, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02306, "Contribution:", 0, 118, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03306, "", 75, 115, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04306, "", 136, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20306, "", 110, 115, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02307, "Contribution:", 0, 139, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03307, "", 75, 136, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04307, "", 136, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20307, "", 110, 136, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02308, "Contribution:", 0, 160, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03308, "", 75, 157, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04308, "", 136, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20308, "", 110, 157, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02309, "Contribution:", 0, 181, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03309, "", 75, 178, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04309, "", 136, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20309, "", 110, 178, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02310, "Contribution:", 0, 202, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03310, "", 75, 199, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04310, "", 136, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20310, "", 110, 199, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02311, "Contribution:", 0, 223, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03311, "", 75, 220, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04311, "", 136, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20311, "", 110, 220, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02312, "Contribution:", 0, 244, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03312, "", 75, 241, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04312, "", 136, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20312, "", 110, 241, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02313, "Contribution:", 0, 265, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03313, "", 75, 262, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04313, "", 136, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20313, "", 110, 262, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02314, "Contribution:", 0, 286, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03314, "", 75, 283, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04314, "", 136, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20314, "", 110, 283, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02315, "GL Exp:", 203, 13, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03315, "", 250, 10, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04315, "", 406, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20315, "", 380, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02316, "GL Exp:", 203, 34, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03316, "", 250, 31, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04316, "", 406, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20316, "", 380, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02317, "GL Exp:", 203, 55, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03317, "", 250, 52, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04317, "", 406, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20317, "", 380, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02318, "GL Exp:", 203, 76, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03318, "", 250, 73, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04318, "", 406, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20318, "", 380, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02319, "GL Exp:", 203, 97, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03319, "", 250, 94, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04319, "", 406, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20319, "", 380, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02320, "GL Exp:", 203, 118, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03320, "", 250, 115, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04320, "", 406, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20320, "", 380, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02321, "GL Exp:", 203, 139, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03321, "", 250, 136, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04321, "", 406, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20321, "", 380, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02322, "GL Exp:", 203, 160, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03322, "", 250, 157, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04322, "", 406, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20322, "", 380, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02323, "GL Exp:", 203, 181, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03323, "", 250, 178, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04323, "", 406, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20323, "", 380, 178, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02324, "GL Exp:", 203, 202, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03324, "", 250, 199, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04324, "", 406, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20324, "", 380, 199, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02325, "GL Exp:", 203, 223, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03325, "", 250, 220, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04325, "", 406, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20325, "", 380, 220, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02326, "GL Exp:", 203, 244, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03326, "", 250, 241, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04326, "", 406, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20326, "", 380, 241, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02327, "GL Exp:", 203, 265, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03327, "", 250, 262, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04327, "", 406, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20327, "", 380, 262, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02328, "GL Exp:", 203, 286, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_exp"
    END
    
    INPUTE 03328, "", 250, 283, 130, 19
    BEGIN
        NAME "ine_gl_cont_exp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04328, "", 406, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_exp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20328, "", 380, 283, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_exp"
    END
    
    STATICTEXT 02329, "Accrual:", 474, 13, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03329, "", 525, 10, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04329, "", 681, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20329, "", 655, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02330, "Accrual:", 474, 34, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03330, "", 525, 31, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04330, "", 681, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20330, "", 655, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02331, "Accrual:", 474, 55, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03331, "", 525, 52, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04331, "", 681, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20331, "", 655, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02332, "Accrual:", 474, 76, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03332, "", 525, 73, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04332, "", 681, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20332, "", 655, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02333, "Accrual:", 474, 97, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03333, "", 525, 94, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04333, "", 681, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20333, "", 655, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02334, "Accrual:", 474, 118, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03334, "", 525, 115, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04334, "", 681, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20334, "", 655, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02335, "Accrual:", 474, 139, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03335, "", 525, 136, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04335, "", 681, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20335, "", 655, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02336, "Accrual:", 474, 160, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03336, "", 525, 157, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04336, "", 681, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20336, "", 655, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02337, "Accrual:", 474, 181, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03337, "", 525, 178, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04337, "", 681, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20337, "", 655, 178, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02338, "Accrual:", 474, 202, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03338, "", 525, 199, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04338, "", 681, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20338, "", 655, 199, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02339, "Accrual:", 474, 223, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03339, "", 525, 220, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04339, "", 681, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20339, "", 655, 220, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02340, "Accrual:", 474, 244, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03340, "", 525, 241, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04340, "", 681, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20340, "", 655, 241, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02341, "Accrual:", 474, 265, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03341, "", 525, 262, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04341, "", 681, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20341, "", 655, 262, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END
    
    STATICTEXT 02342, "Accrual:", 474, 286, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cont_acc"
    END
    
    INPUTE 03342, "", 525, 283, 130, 19
    BEGIN
        NAME "ine_gl_cont_acc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04342, "", 681, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cont_acc"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20342, "", 655, 283, 20, 19
    BEGIN
        NAME "tbnf_gl_cont_acc"
    END

END

