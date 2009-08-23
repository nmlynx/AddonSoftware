//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_WORDJOBSTAT - Work Order Job Status Summary
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0378
BEGIN
    NAME "win_sfr_wordjobstat"
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
    
    LISTBUTTON 03001, "", 130, 10, 97, 300
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
    
    STATICTEXT 02003, "Beginning Work Order Tp:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02004, "Ending Work Order Tp:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02005, "Beginning Work Order No:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03005, "", 130, 94, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02006, "Ending Work Order No:", 0, 118, 127, 16
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
    
    STATICTEXT 02007, "Beginning Customer ID:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03007, "", 130, 136, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04007, "", 216, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 190, 136, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02008, "Ending Customer ID:", 6, 160, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03008, "", 130, 157, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04008, "", 216, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 190, 157, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02009, "Beginning Bill of Mats No:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_no"
    END
    
    INPUTE 03009, "", 130, 178, 200, 19
    BEGIN
        NAME "ine_bill_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04009, "", 356, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_bill_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 330, 178, 20, 19
    BEGIN
        NAME "tbnf_bill_no"
    END
    
    STATICTEXT 02010, "Ending Bill of Mats No:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_no"
    END
    
    INPUTE 03010, "", 130, 199, 200, 19
    BEGIN
        NAME "ine_bill_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04010, "", 356, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_bill_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 330, 199, 20, 19
    BEGIN
        NAME "tbnf_bill_no"
    END
    
    STATICTEXT 02011, "Units or Dollars:", 32, 223, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rept_seq"
    END
    
    LISTBUTTON 03011, "", 130, 220, 73, 300
    BEGIN
        NAME "lbx_rept_seq"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02012, "As Of Date:", 61, 244, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date_type"
    END
    
    INPUTD 03012, "", 130, 241, 85, 19
    BEGIN
        NAME "ind_date_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21012, "", 215, 241, 20, 19
    BEGIN
        NAME "tbnc_date_type"
    END
    
    CHECKBOX 03013, "Open?", 128, 262, 67, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Closed?", 128, 283, 76, 19
    BEGIN
        NAME "cbx_closed"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Planned?", 128, 304, 81, 19
    BEGIN
        NAME "cbx_planned"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "Quoted?", 128, 325, 79, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
END

