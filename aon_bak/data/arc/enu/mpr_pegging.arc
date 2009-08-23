//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// MPR_PEGGING - MRP Pegging Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0459
BEGIN
    NAME "win_mpr_pegging"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Forecast Type:", 42, 13, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04001, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_forecast"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_forecast"
    END
    
    STATICTEXT 02002, "Warehouse Code:", 25, 34, 102, 16
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
    
    STATICTEXT 02003, "Item Types:", 60, 55, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_type"
    END
    
    INPUTE 03003, "", 130, 52, 39, 19
    BEGIN
        NAME "ine_item_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04003, "", 195, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 169, 52, 20, 19
    BEGIN
        NAME "tbnf_item_type"
    END
    
    STATICTEXT 02004, "Beginning Item:", 37, 76, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03004, "", 130, 73, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 416, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 390, 73, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02005, "Ending Item:", 55, 97, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03005, "", 130, 94, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04005, "", 416, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 390, 94, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    CHECKBOX 03006, "On Hand", 128, 115, 81, 19
    BEGIN
        NAME "cbx_rep_trans_type1"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "PO On Order", 128, 136, 105, 19
    BEGIN
        NAME "cbx_rep_trans_type2"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "WO On Order", 128, 157, 109, 19
    BEGIN
        NAME "cbx_rep_trans_type3"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Forecast", 128, 178, 80, 19
    BEGIN
        NAME "cbx_rep_trans_type4"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "Dependent", 128, 199, 93, 19
    BEGIN
        NAME "cbx_rep_trans_type5"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Sales Demand", 128, 220, 111, 19
    BEGIN
        NAME "cbx_rep_trans_type6"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "WO Demand", 128, 241, 101, 19
    BEGIN
        NAME "cbx_rep_trans_type7"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "WO Release", 128, 262, 97, 19
    BEGIN
        NAME "cbx_rep_trans_type8"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "PO Release", 128, 283, 93, 19
    BEGIN
        NAME "cbx_rep_trans_type9"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "WO Receipt", 128, 304, 96, 19
    BEGIN
        NAME "cbx_rep_trans_type10"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "PO Receipt", 128, 325, 92, 19
    BEGIN
        NAME "cbx_rep_trans_type11"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "PO Req On Order", 128, 346, 131, 19
    BEGIN
        NAME "cbx_rep_trans_type12"
        NOT OPAQUE
    END
    
    CHECKBOX 03018, "Include Alt. Vendors", 128, 367, 148, 19
    BEGIN
        NAME "cbx_incl_alt_vend"
        NOT OPAQUE
    END
    
    STATICTEXT 02019, "Beginning Period:", 25, 391, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03019, "", 130, 388, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02020, "Ending Period:", 43, 412, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03020, "", 130, 409, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
END

