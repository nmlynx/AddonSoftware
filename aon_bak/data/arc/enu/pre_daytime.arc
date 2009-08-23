//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRE_DAYTIME - Daily Time Entry
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0528
BEGIN
    NAME "win_pre_daytime"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_pre_daytime", 4, 0076, 0419, 0257
    BEGIN
        NAME "tab_pre_daytime"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Detail" 0 1100
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_pre_daytime_1100"
    END
    
    
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
    
    STATICTEXT 02002, "Hours:", 88, 55, 39, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disp_hours"
    END
    INPUTN 03002, "", 130, 52, 80, 19
    BEGIN
        NAME "inn_disp_hours"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "-######.00"
    END
    
    STATICTEXT 02003, "Earnings:", 192, 55, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disp_earnings"
    END
    INPUTN 03003, "", 250, 52, 80, 19
    BEGIN
        NAME "inn_disp_earnings"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "-######.00"
    END
    CHILD-WINDOW 1109 1109 5 0336
END
CHILD-WINDOW 1100 0 0 0416 0235
BEGIN
    NAME "chw_pre_daytime_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Seq:", 103, 13, 24, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_time_seq"
    END
    
    INPUTE 03101, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_pr_time_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02102, "Transaction Date:", 24, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_date"
    END
    
    INPUTD 03102, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_trans_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21102, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_trans_date"
    END
    
    STATICTEXT 02103, "Pay Code:", 70, 55, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03103, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04103, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20103, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02104, "Title Code:", 65, 76, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_title_code"
    END
    
    INPUTE 03104, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_title_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04104, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_title_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20104, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_title_code"
    END
    
    STATICTEXT 02105, "Rate:", 99, 97, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rate"
    END
    INPUTN 03105, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02106, "Department Code:", 21, 118, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dept_code"
    END
    
    INPUTE 03106, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_dept_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02107, "Units:", 93, 139, 34, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_units"
    END
    INPUTN 03107, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02108, "Extended Amount:", 19, 160, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_extended_amt"
    END
    INPUTN 03108, "", 130, 157, 128, 19
    BEGIN
        NAME "inn_extended_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##############0-"
    END
    
    INPUTE 03109, "", 130, 178, 120, 19
    BEGIN
        NAME "ine_pr_job_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END

END
CHILD-WINDOW 1109 0416 0235
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0414 100
    BEGIN
        NAME "grd_PRE_DAYTIME"
        CLIENTEDGE
        ROWHEAD 20, 05902
        ROWS 20
        COLUMNHEAD 18, 05901
        USERSIZE
        HORIZLINES
        HSCROLLBAR
        VERTLINES
        VSCROLLBAR
        GRIDROWDEFAULTHEIGHT 18
        COLUMNS 10
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 64
        GRIDCOLTITLE 1, "Hours"
        GRIDCOLWIDTH 2, 64
        GRIDCOLTITLE 2, "Earnings"
        GRIDCOLWIDTH 3, 64
        GRIDCOLTITLE 3, "Trans Date"
        GRIDCOLWIDTH 4, 35
        GRIDCOLTITLE 4, "Pay Cd"
        GRIDCOLWIDTH 5, 35
        GRIDCOLTITLE 5, "Title Cd"
        GRIDCOLWIDTH 6, 56
        GRIDCOLTITLE 6, "Rate"
        GRIDCOLWIDTH 7, 35
        GRIDCOLTITLE 7, "Dept Cd"
        GRIDCOLWIDTH 8, 56
        GRIDCOLTITLE 8, "Units"
        GRIDCOLWIDTH 9, 120
        GRIDCOLTITLE 9, "Ext Amt"
    END

END

