//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFE_TIMEDATE - Time Sheet Entry By Date
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0396
BEGIN
    NAME "win_sfe_timedate"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Transaction Date:", 24, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_date"
    END
    
    INPUTD 03001, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_trans_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 215, 10, 20, 19
    BEGIN
        NAME "tbnc_trans_date"
    END
    
    STATICTEXT 02002, "Employee Number:", 17, 34, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_employee_no"
    END
    
    INPUTE 03002, "", 130, 31, 117, 19
    BEGIN
        NAME "ine_employee_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 273, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_employee_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 247, 31, 20, 19
    BEGIN
        NAME "tbnf_employee_no"
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
    
    STATICTEXT 02004, "Operation Sequence Number:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_seq"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_op_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02005, "Operation Code:", 31, 97, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_code"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_op_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04005, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_op_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_op_code"
    END
    
    STATICTEXT 02006, "Work Order Number:", 5, 118, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03006, "", 130, 115, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02007, "Start Time [HHMM]:", 15, 139, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_start_time"
    END
    
    INPUTE 03007, "", 130, 136, 50, 19
    BEGIN
        NAME "ine_start_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00"
    END
    
    STATICTEXT 02008, "Stop Time [HHMM]:", 16, 160, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_stop_time"
    END
    
    INPUTE 03008, "", 130, 157, 50, 19
    BEGIN
        NAME "ine_stop_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00"
    END
    
    STATICTEXT 02009, "Pay Code:", 70, 181, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03009, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04009, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02010, "Title Code:", 65, 202, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_title_code"
    END
    
    INPUTE 03010, "", 130, 199, 35, 19
    BEGIN
        NAME "ine_title_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04010, "", 191, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_title_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 165, 199, 20, 19
    BEGIN
        NAME "tbnf_title_code"
    END
    
    STATICTEXT 02011, "Department Code:", 21, 223, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dept_code"
    END
    
    INPUTE 03011, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_dept_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02012, "Hours:", 88, 244, 39, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_hrs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Direct Rate:", 60, 265, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_direct_rate"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_direct_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Overhead Rate:", 38, 286, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ovhd_rate"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_ovhd_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Extended Amount:", 19, 307, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_extended_amt"
    END
    INPUTN 03015, "", 130, 304, 128, 19
    BEGIN
        NAME "inn_extended_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##############0-"
    END
    
    STATICTEXT 02016, "Setup Time:", 59, 328, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_setup_time"
    END
    INPUTN 03016, "", 130, 325, 48, 19
    BEGIN
        NAME "inn_setup_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
    
    STATICTEXT 02017, "Quantity Completed:", 6, 349, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_complete_qty"
    END
    INPUTN 03017, "", 130, 346, 48, 19
    BEGIN
        NAME "inn_complete_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
END

