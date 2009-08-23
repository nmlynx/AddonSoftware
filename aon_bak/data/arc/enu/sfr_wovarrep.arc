//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_WOVARREP - Work Order Variance Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0357
BEGIN
    NAME "win_sfr_wovarrep"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Report Sequence:", 25, 13, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_seq"
    END
    
    LISTBUTTON 03001, "", 130, 10, 126, 300
    BEGIN
        NAME "lbx_report_seq"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Warehouse ID:", 44, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
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
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02003, "Beginning Work Order Number:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03003, "", 130, 52, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02004, "Ending Work Order Number:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03004, "", 130, 73, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02005, "Beginning Work Order Type:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02006, "Ending Work Order Type:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02007, "Beginning Bill of Materials Number:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_no"
    END
    
    INPUTE 03007, "", 130, 136, 200, 19
    BEGIN
        NAME "ine_bill_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04007, "", 356, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_bill_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 330, 136, 20, 19
    BEGIN
        NAME "tbnf_bill_no"
    END
    
    STATICTEXT 02008, "Ending Bill of Materials Number:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_no"
    END
    
    INPUTE 03008, "", 130, 157, 200, 19
    BEGIN
        NAME "ine_bill_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04008, "", 356, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_bill_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 330, 157, 20, 19
    BEGIN
        NAME "tbnf_bill_no"
    END
    
    STATICTEXT 02009, "Beginning Customer ID:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03009, "", 130, 178, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04009, "", 216, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 190, 178, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02010, "Ending Customer ID:", 6, 202, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03010, "", 130, 199, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04010, "", 216, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 190, 199, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02011, "As of Date:", 64, 223, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_as_of_date"
    END
    
    INPUTD 03011, "", 130, 220, 85, 19
    BEGIN
        NAME "ind_as_of_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21011, "", 215, 220, 20, 19
    BEGIN
        NAME "tbnc_as_of_date"
    END
    
    CHECKBOX 03012, "Open?", 128, 241, 67, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Closed?", 128, 262, 76, 19
    BEGIN
        NAME "cbx_closed"
        NOT OPAQUE
    END
    
    STATICTEXT 02014, "Minimum Variance %:", 5, 286, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_variance"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_min_variance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03015, "Include Cost Overrun Only", 128, 304, 187, 19
    BEGIN
        NAME "cbx_inc_cost_ovrun"
        NOT OPAQUE
    END
END

