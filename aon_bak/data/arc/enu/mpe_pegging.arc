//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// MPE_PEGGING - Pegging Transaction Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0480
BEGIN
    NAME "win_mpe_pegging"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "MRP Forecast Type:", 14, 13, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_forecast"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_forecast"
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
    
    STATICTEXT 02003, "Inventory Item ID:", 24, 55, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03003, "", 130, 52, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 416, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 390, 52, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02004, "Transaction Date:", 24, 76, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trns_date"
    END
    
    INPUTD 03004, "", 130, 73, 85, 19
    BEGIN
        NAME "ind_trns_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 215, 73, 20, 19
    BEGIN
        NAME "tbnc_trns_date"
    END
    
    STATICTEXT 02005, "Source:", 83, 97, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_source_code"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_source_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02006, "Finished Good Item Number:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_finish_item"
    END
    
    INPUTE 03006, "", 130, 115, 200, 19
    BEGIN
        NAME "ine_finish_item"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02007, "Sales Order Number:", 5, 139, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03007, "", 130, 136, 70, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02008, "Customer ID:", 50, 160, 77, 16
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
    
    STATICTEXT 02009, "Vendor ID:", 66, 181, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03009, "", 130, 178, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04009, "", 234, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 208, 178, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02010, "Purchase Order Number:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_no"
    END
    
    INPUTE 03010, "", 130, 199, 70, 19
    BEGIN
        NAME "ine_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02011, "Work Order Number:", 5, 223, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03011, "", 130, 220, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02012, "Work Order Type:", 24, 244, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03012, "", 130, 241, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02013, "Work Order Status:", 16, 265, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_status"
    END
    
    INPUTE 03013, "", 130, 262, 35, 19
    BEGIN
        NAME "ine_wo_status"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02014, "A=Purchase Item/B=Production:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mrp_type"
    END
    
    INPUTE 03014, "", 130, 283, 35, 19
    BEGIN
        NAME "ine_mrp_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02015, "Date Required:", 42, 307, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reqd_date"
    END
    
    INPUTD 03015, "", 130, 304, 85, 19
    BEGIN
        NAME "ind_reqd_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 215, 304, 20, 19
    BEGIN
        NAME "tbnc_reqd_date"
    END
    
    STATICTEXT 02016, "Gross Required:", 33, 328, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Quantity On-Order:", 11, 349, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Quantity On-Hand:", 15, 370, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Net Required:", 48, 391, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Planned Release Qty on PO/WO:", 0, 412, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03020, "", 130, 409, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Planned Receipt Qty on PO/WO:", 0, 433, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03021, "", 130, 430, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

