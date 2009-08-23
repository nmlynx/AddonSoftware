//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POT_RECDET - PO Receipt History Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0542 0711
BEGIN
    NAME "win_pot_recdet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Número de pedido de compra:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_no"
    END
    
    INPUTE 03001, "", 156, 10, 91, 19
    BEGIN
        NAME "ine_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Receiver Number:", 50, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receiver_no"
    END
    
    INPUTE 03002, "", 156, 31, 91, 19
    BEGIN
        NAME "ine_receiver_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "Purchase Order Line Number:", 4, 55, 173, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_no"
    END
    
    INPUTE 03003, "", 180, 52, 35, 19
    BEGIN
        NAME "ine_po_line_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02004, "Purchase Order Line Code:", 20, 76, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_code"
    END
    
    INPUTE 03004, "", 180, 73, 35, 19
    BEGIN
        NAME "ine_po_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 241, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 215, 73, 20, 19
    BEGIN
        NAME "tbnf_po_line_code"
    END
    
    CHECKBOX 03005, "Use Line for Lead Time Calc?", 178, 94, 197, 19
    BEGIN
        NAME "cbx_lead_tim_flg"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Unit of Measure:", 82, 118, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_measure"
    END
    
    INPUTE 03006, "", 180, 115, 35, 19
    BEGIN
        NAME "ine_unit_measure"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02007, "Warehouse Location:", 55, 139, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_location"
    END
    
    INPUTE 03007, "", 180, 136, 100, 19
    BEGIN
        NAME "ine_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02008, "Source:", 133, 160, 44, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_source_code"
    END
    
    INPUTE 03008, "", 180, 157, 35, 19
    BEGIN
        NAME "ine_source_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02009, "MRP Forecast Type:", 64, 181, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03009, "", 180, 178, 35, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04009, "", 241, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_forecast"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 215, 178, 20, 19
    BEGIN
        NAME "tbnf_forecast"
    END
    
    STATICTEXT 02010, "PO Standard Message Code:", 14, 202, 163, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_msg_code"
    END
    
    INPUTE 03010, "", 180, 199, 39, 19
    BEGIN
        NAME "ine_po_msg_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04010, "", 245, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 219, 199, 20, 19
    BEGIN
        NAME "tbnf_po_msg_code"
    END
    
    CHECKBOX 03011, "Actualizar indicador", 178, 220, 148, 19
    BEGIN
        NAME "cbx_update_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Date Required:", 92, 244, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reqd_date"
    END
    
    INPUTD 03012, "", 180, 241, 85, 19
    BEGIN
        NAME "ind_reqd_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21012, "", 265, 241, 20, 19
    BEGIN
        NAME "tbnc_reqd_date"
    END
    
    STATICTEXT 02013, "Delivery Promised By Date:", 22, 265, 155, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_promise_date"
    END
    
    INPUTD 03013, "", 180, 262, 85, 19
    BEGIN
        NAME "ind_promise_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21013, "", 265, 262, 20, 19
    BEGIN
        NAME "tbnc_promise_date"
    END
    
    STATICTEXT 02014, "Don't Deliver Before Date:", 28, 286, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_not_b4_date"
    END
    
    INPUTD 03014, "", 180, 283, 85, 19
    BEGIN
        NAME "ind_not_b4_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21014, "", 265, 283, 20, 19
    BEGIN
        NAME "tbnc_not_b4_date"
    END
    
    STATICTEXT 02015, "Work Order Number:", 55, 307, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03015, "", 180, 304, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02016, "Sequence number reference:", 9, 328, 168, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_seq_ref"
    END
    
    INPUTE 03016, "", 180, 325, 35, 19
    BEGIN
        NAME "ine_wo_seq_ref"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02017, "ID del cliente:", 99, 349, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03017, "", 180, 346, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04017, "", 266, 350, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20017, "", 240, 346, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02018, "Sales Order Number:", 55, 370, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03018, "", 180, 367, 70, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02019, "Sequence Ref Number:", 45, 391, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_so_int_seq_ref"
    END
    
    INPUTE 03019, "", 180, 388, 120, 19
    BEGIN
        NAME "ine_so_int_seq_ref"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02020, "Customer Ship-To Number:", 15, 412, 162, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_no"
    END
    
    INPUTE 03020, "", 180, 409, 60, 19
    BEGIN
        NAME "ine_shipto_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000"
    END
    
    STATICTEXT 02021, "Warehouse ID:", 94, 433, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03021, "", 180, 430, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04021, "", 241, 434, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20021, "", 215, 430, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02022, "Inventory Item ID:", 74, 454, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03022, "", 180, 451, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04022, "", 466, 455, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20022, "", 440, 451, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02023, "Memo / Non-Stock Description:", 4, 475, 185, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_memo"
    END
    
    INPUTE 03023, "", 192, 472, 320, 19
    BEGIN
        NAME "ine_order_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02024, "Conversion Factor:", 77, 496, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_conv_factor"
    END
    INPUTN 03024, "", 192, 493, 64, 19
    BEGIN
        NAME "inn_conv_factor"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Unit Cost:", 131, 517, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03025, "", 192, 514, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Requisition Quantity:", 66, 538, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_qty"
    END
    INPUTN 03026, "", 192, 535, 64, 19
    BEGIN
        NAME "inn_req_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Quantity Ordered:", 83, 559, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_ordered"
    END
    INPUTN 03027, "", 192, 556, 64, 19
    BEGIN
        NAME "inn_qty_ordered"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Quantity Previously Received:", 17, 580, 172, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_prev_rec"
    END
    INPUTN 03028, "", 192, 577, 64, 19
    BEGIN
        NAME "inn_qty_prev_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Quantity Received:", 81, 601, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_received"
    END
    INPUTN 03029, "", 192, 598, 64, 19
    BEGIN
        NAME "inn_qty_received"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Quantity Invoiced:", 83, 622, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_invoiced"
    END
    INPUTN 03030, "", 192, 619, 64, 19
    BEGIN
        NAME "inn_qty_invoiced"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Sequence Ref Number:", 57, 643, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_int_seq_ref"
    END
    
    INPUTE 03031, "", 192, 640, 156, 19
    BEGIN
        NAME "ine_po_int_seq_ref"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02032, "Non-Stock Item ID:", 79, 664, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ns_item_id"
    END
    
    INPUTE 03032, "", 192, 661, 260, 19
    BEGIN
        NAME "ine_ns_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
END

