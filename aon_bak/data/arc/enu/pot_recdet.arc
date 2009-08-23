//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POT_RECDET - PO Receipt History Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0510 0711
BEGIN
    NAME "win_pot_recdet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Purchase Order Number:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_no"
    END
    
    INPUTE 03001, "", 130, 10, 91, 19
    BEGIN
        NAME "ine_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Receiver Number:", 24, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receiver_no"
    END
    
    INPUTE 03002, "", 130, 31, 91, 19
    BEGIN
        NAME "ine_receiver_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "Purchase Order Line Number:", 0, 55, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_no"
    END
    
    INPUTE 03003, "", 150, 52, 35, 19
    BEGIN
        NAME "ine_po_line_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02004, "Purchase Order Line Code:", 0, 76, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_code"
    END
    
    INPUTE 03004, "", 150, 73, 35, 19
    BEGIN
        NAME "ine_po_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 211, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 185, 73, 20, 19
    BEGIN
        NAME "tbnf_po_line_code"
    END
    
    CHECKBOX 03005, "Use Line for Lead Time Calc?", 148, 94, 197, 19
    BEGIN
        NAME "cbx_lead_tim_flg"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Unit of Measure:", 52, 118, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_measure"
    END
    
    INPUTE 03006, "", 150, 115, 35, 19
    BEGIN
        NAME "ine_unit_measure"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02007, "Warehouse Location:", 25, 139, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_location"
    END
    
    INPUTE 03007, "", 150, 136, 100, 19
    BEGIN
        NAME "ine_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02008, "Source:", 103, 160, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_source_code"
    END
    
    INPUTE 03008, "", 150, 157, 35, 19
    BEGIN
        NAME "ine_source_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02009, "MRP Forecast Type:", 34, 181, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03009, "", 150, 178, 35, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04009, "", 211, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_forecast"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 185, 178, 20, 19
    BEGIN
        NAME "tbnf_forecast"
    END
    
    STATICTEXT 02010, "PO Standard Message Code:", 0, 202, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_msg_code"
    END
    
    INPUTE 03010, "", 150, 199, 39, 19
    BEGIN
        NAME "ine_po_msg_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04010, "", 215, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 189, 199, 20, 19
    BEGIN
        NAME "tbnf_po_msg_code"
    END
    
    CHECKBOX 03011, "Update Flag", 148, 220, 99, 19
    BEGIN
        NAME "cbx_update_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Date Required:", 62, 244, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reqd_date"
    END
    
    INPUTD 03012, "", 150, 241, 85, 19
    BEGIN
        NAME "ind_reqd_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21012, "", 235, 241, 20, 19
    BEGIN
        NAME "tbnc_reqd_date"
    END
    
    STATICTEXT 02013, "Delivery Promised By Date:", 0, 265, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_promise_date"
    END
    
    INPUTD 03013, "", 150, 262, 85, 19
    BEGIN
        NAME "ind_promise_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21013, "", 235, 262, 20, 19
    BEGIN
        NAME "tbnc_promise_date"
    END
    
    STATICTEXT 02014, "Don't Deliver Before Date:", 0, 286, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_not_b4_date"
    END
    
    INPUTD 03014, "", 150, 283, 85, 19
    BEGIN
        NAME "ind_not_b4_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21014, "", 235, 283, 20, 19
    BEGIN
        NAME "tbnc_not_b4_date"
    END
    
    STATICTEXT 02015, "Work Order Number:", 25, 307, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03015, "", 150, 304, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02016, "Sequence number reference:", 0, 328, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_seq_ref"
    END
    
    INPUTE 03016, "", 150, 325, 35, 19
    BEGIN
        NAME "ine_wo_seq_ref"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02017, "Customer ID:", 70, 349, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03017, "", 150, 346, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04017, "", 236, 350, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20017, "", 210, 346, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02018, "Sales Order Number:", 25, 370, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03018, "", 150, 367, 70, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02019, "Sequence Ref Number:", 15, 391, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_so_int_seq_ref"
    END
    
    INPUTE 03019, "", 150, 388, 120, 19
    BEGIN
        NAME "ine_so_int_seq_ref"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02020, "Customer Ship-To Number:", 0, 412, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_no"
    END
    
    INPUTE 03020, "", 150, 409, 60, 19
    BEGIN
        NAME "ine_shipto_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000"
    END
    
    STATICTEXT 02021, "Warehouse ID:", 64, 433, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03021, "", 150, 430, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04021, "", 211, 434, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20021, "", 185, 430, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02022, "Inventory Item ID:", 44, 454, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03022, "", 150, 451, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04022, "", 436, 455, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20022, "", 410, 451, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02023, "Memo / Non-Stock Description:", 0, 475, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_memo"
    END
    
    INPUTE 03023, "", 160, 472, 320, 19
    BEGIN
        NAME "ine_order_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02024, "Conversion Factor:", 45, 496, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_conv_factor"
    END
    INPUTN 03024, "", 160, 493, 64, 19
    BEGIN
        NAME "inn_conv_factor"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Unit Cost:", 99, 517, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03025, "", 160, 514, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Requisition Quantity:", 34, 538, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_qty"
    END
    INPUTN 03026, "", 160, 535, 64, 19
    BEGIN
        NAME "inn_req_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Quantity Ordered:", 51, 559, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_ordered"
    END
    INPUTN 03027, "", 160, 556, 64, 19
    BEGIN
        NAME "inn_qty_ordered"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Quantity Previously Received:", 0, 580, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_prev_rec"
    END
    INPUTN 03028, "", 160, 577, 64, 19
    BEGIN
        NAME "inn_qty_prev_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Quantity Received:", 49, 601, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_received"
    END
    INPUTN 03029, "", 160, 598, 64, 19
    BEGIN
        NAME "inn_qty_received"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Quantity Invoiced:", 51, 622, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_invoiced"
    END
    INPUTN 03030, "", 160, 619, 64, 19
    BEGIN
        NAME "inn_qty_invoiced"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Sequence Ref Number:", 25, 643, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_int_seq_ref"
    END
    
    INPUTE 03031, "", 160, 640, 156, 19
    BEGIN
        NAME "ine_po_int_seq_ref"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02032, "Non-Stock Item ID:", 47, 664, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ns_item_id"
    END
    
    INPUTE 03032, "", 160, 661, 260, 19
    BEGIN
        NAME "ine_ns_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
END

