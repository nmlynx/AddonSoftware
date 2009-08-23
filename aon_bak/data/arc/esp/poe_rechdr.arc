//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POE_RECHDR - PO Receipt Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 1166 0616
BEGIN
    NAME "win_poe_rechdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_poe_rechdr", 4, 0139, 1159, 0282
    BEGIN
        NAME "tab_poe_rechdr"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Miscellaneous" 0 1100
        TAB "Dropship" 1 1101
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_poe_rechdr_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_poe_rechdr_1101"
    END
    
    
    STATICTEXT 02001, "Receiver Number:", 50, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receiver_no"
    END
    
    INPUTE 03001, "", 156, 10, 91, 19
    BEGIN
        NAME "ine_receiver_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Purchase Order Number:", 7, 34, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_no"
    END
    
    INPUTE 03002, "", 156, 31, 70, 19
    BEGIN
        NAME "ine_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 04002, "", 252, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 226, 31, 20, 19
    BEGIN
        NAME "tbnf_po_no"
    END
    
    STATICTEXT 02003, "ID del proveedor:", 52, 55, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03003, "", 156, 52, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04003, "", 260, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 234, 52, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02004, "Address:", 101, 76, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_addr1"
    END
    
    INPUTE 03004, "", 156, 73, 240, 19
    BEGIN
        NAME "ine_v_addr1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03005, "", 156, 94, 240, 19
    BEGIN
        NAME "ine_v_addr2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03006, "", 156, 115, 176, 19
    BEGIN
        NAME "ine_v_city"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02007, "Contact:", 464, 76, 49, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_contact"
    END
    
    INPUTE 03007, "", 516, 73, 200, 19
    BEGIN
        NAME "ine_v_contact"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02008, "Telephone:", 449, 97, 64, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_phone"
    END
    
    INPUTE 03008, "", 516, 94, 200, 19
    BEGIN
        NAME "ine_v_phone"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02009, "Fax:", 489, 118, 24, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_fax"
    END
    
    INPUTE 03009, "", 516, 115, 200, 19
    BEGIN
        NAME "ine_v_fax"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02010, "Comments:", 806, 34, 67, 77
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comments"
    END
    
    CUSTOMEDIT 03010, "", 876, 31, 260, 80
    BEGIN
        NAME "ced_comments"
        CLIENTEDGE
        IGNORETABS
        WORDWRAP
        VSCROLLBAR
        HSCROLLBAR
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02011, "Total:", 840, 118, 33, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_total"
    END
    INPUTN 03011, "", 876, 115, 64, 19
    BEGIN
        NAME "inn_order_total"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    CHILD-WINDOW 1109 1109 5 0424
END
CHILD-WINDOW 1100 0 0 1156 0260
BEGIN
    NAME "chw_poe_rechdr_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Order Date:", 85, 13, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_date"
    END
    
    INPUTD 03101, "", 156, 10, 85, 19
    BEGIN
        NAME "ind_ord_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02102, "Date Required:", 68, 34, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reqd_date"
    END
    
    INPUTD 03102, "", 156, 31, 85, 19
    BEGIN
        NAME "ind_reqd_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02103, "Delivery Promised By:", 28, 55, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_promise_date"
    END
    
    INPUTD 03103, "", 156, 52, 85, 19
    BEGIN
        NAME "ind_promise_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02104, "Don't Deliver Before:", 34, 76, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_not_b4_date"
    END
    
    INPUTD 03104, "", 156, 73, 85, 19
    BEGIN
        NAME "ind_not_b4_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02105, "Receipt Date:", 78, 97, 75, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_recpt_date"
    END
    
    INPUTD 03105, "", 156, 94, 85, 19
    BEGIN
        NAME "ind_recpt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21105, "", 241, 94, 20, 19
    BEGIN
        NAME "tbnc_recpt_date"
    END
    
    STATICTEXT 02106, "Medio de envío del proveedor:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_ship_via"
    END
    
    INPUTE 03106, "", 156, 115, 150, 19
    BEGIN
        NAME "ine_ap_ship_via"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02107, "Freight Terms:", 68, 139, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_frt_terms"
    END
    
    INPUTE 03107, "", 156, 136, 150, 19
    BEGIN
        NAME "ine_po_frt_terms"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02108, "Código de condiciones:", 15, 160, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_terms_code"
    END
    
    INPUTE 03108, "", 156, 157, 35, 19
    BEGIN
        NAME "ine_ap_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04108, "", 217, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20108, "", 191, 157, 20, 19
    BEGIN
        NAME "tbnf_ap_terms_code"
    END
    
    STATICTEXT 02109, "Libre a bordo [FOB]:", 36, 181, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fob"
    END
    
    INPUTE 03109, "", 156, 178, 150, 19
    BEGIN
        NAME "ine_fob"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02110, "Acknowledgement:", 42, 202, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_acknowledge"
    END
    
    INPUTE 03110, "", 156, 199, 200, 19
    BEGIN
        NAME "ine_acknowledge"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02111, "Packing List Number:", 390, 13, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_packing_list"
    END
    
    INPUTE 03111, "", 516, 10, 150, 19
    BEGIN
        NAME "ine_packing_list"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02112, "Std Msg Code:", 430, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_msg_code"
    END
    
    INPUTE 03112, "", 516, 31, 39, 19
    BEGIN
        NAME "ine_po_msg_code"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04112, "", 560, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    STATICTEXT 02113, "Warehouse ID:", 430, 55, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03113, "", 516, 52, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04113, "", 577, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20113, "", 551, 52, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    INPUTE 03114, "", 516, 73, 240, 19
    BEGIN
        NAME "ine_w_addr1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03115, "", 516, 94, 240, 19
    BEGIN
        NAME "ine_w_addr2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03116, "", 516, 115, 176, 19
    BEGIN
        NAME "ine_w_city"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    INPUTE 03117, "", 732, 115, 35, 19
    BEGIN
        NAME "ine_w_state"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    INPUTE 03118, "", 516, 136, 117, 19
    BEGIN
        NAME "ine_w_zip"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    CHECKBOX 03119, "Received Complete?", 514, 178, 146, 19
    BEGIN
        NAME "cbx_rec_complete"
        NOT OPAQUE
    END
    
    CHECKBOX 03120, "Dropship?", 514, 199, 90, 19
    BEGIN
        NAME "cbx_dropship"
        NOT OPAQUE
    END
    
    STATICTEXT 02121, "Vendor Purch Addr:", 757, 13, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_purch_addr"
    END
    
    INPUTE 03121, "", 876, 10, 35, 19
    BEGIN
        NAME "ine_purch_addr"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04121, "", 916, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_purch_addr"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    INPUTE 03122, "", 876, 31, 240, 19
    BEGIN
        NAME "ine_pa_addr1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03123, "", 876, 52, 240, 19
    BEGIN
        NAME "ine_pa_addr2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03124, "", 876, 73, 176, 19
    BEGIN
        NAME "ine_pa_city"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    INPUTE 03125, "", 876, 94, 35, 19
    BEGIN
        NAME "ine_pa_state"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    INPUTE 03126, "", 876, 115, 117, 19
    BEGIN
        NAME "ine_pa_zip"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END

END
CHILD-WINDOW 1101 0 0 1156 0260
BEGIN
    NAME "chw_poe_rechdr_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "ID del cliente:", 75, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03201, "", 156, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04201, "", 242, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20201, "", 216, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02202, "Sales Order Number:", 31, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03202, "", 156, 31, 70, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 04202, "", 252, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_order_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 226, 31, 20, 19
    BEGIN
        NAME "tbnf_order_no"
    END
    
    STATICTEXT 02203, "Customer Ship-To Number:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_no"
    END
    
    INPUTE 03203, "", 156, 52, 60, 19
    BEGIN
        NAME "ine_shipto_no"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000"
    END
    
    STATICTEXT 02204, "Ship To:", 466, 13, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ds_name"
    END
    
    INPUTE 03204, "", 516, 10, 240, 19
    BEGIN
        NAME "ine_ds_name"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03205, "", 516, 31, 192, 19
    BEGIN
        NAME "ine_ds_addr_line_1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03206, "", 516, 52, 192, 19
    BEGIN
        NAME "ine_ds_addr_line_2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03207, "", 516, 73, 192, 19
    BEGIN
        NAME "ine_ds_addr_line_3"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03208, "", 516, 94, 192, 19
    BEGIN
        NAME "ine_ds_addr_line_4"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03209, "", 516, 115, 176, 19
    BEGIN
        NAME "ine_ds_city"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    INPUTE 03210, "", 516, 136, 35, 19
    BEGIN
        NAME "ine_ds_state_cd"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    INPUTE 03211, "", 516, 157, 117, 19
    BEGIN
        NAME "ine_ds_zip_code"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END

END
CHILD-WINDOW 1109 1156 0260
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 1154 100
    BEGIN
        NAME "grd_POE_RECDET"
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
        COLUMNS 22
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 35
        GRIDCOLTITLE 1, "Line Cd"
        GRIDCOLWIDTH 2, 35
        GRIDCOLTITLE 2, "Whse"
        GRIDCOLWIDTH 3, 160
        GRIDCOLTITLE 3, "NS Item ID"
        GRIDCOLWIDTH 4, 160
        GRIDCOLTITLE 4, "Inventory"
        GRIDCOLWIDTH 5, 250
        GRIDCOLTITLE 5, "Description"
        GRIDCOLWIDTH 6, 320
        GRIDCOLTITLE 6, "Memo/Non-Stock Desc"
        GRIDCOLWIDTH 7, 35
        GRIDCOLTITLE 7, "UM"
        GRIDCOLWIDTH 8, 56
        GRIDCOLTITLE 8, "Conv Factor"
        GRIDCOLWIDTH 9, 56
        GRIDCOLTITLE 9, "Qty Ordered"
        GRIDCOLWIDTH 10, 56
        GRIDCOLTITLE 10, "Qty Prev Rec"
        GRIDCOLWIDTH 11, 56
        GRIDCOLTITLE 11, "Qty Received"
        GRIDCOLWIDTH 12, 56
        GRIDCOLTITLE 12, "Unit Cost"
        GRIDCOLWIDTH 13, 120
        GRIDCOLTITLE 13, "Ext Cost"
        GRIDCOLWIDTH 14, 80
        GRIDCOLTITLE 14, "Whse Loc"
        GRIDCOLWIDTH 15, 64
        GRIDCOLTITLE 15, "Date Req"
        GRIDCOLWIDTH 16, 96
        GRIDCOLTITLE 16, "SO Seq No"
        GRIDCOLWIDTH 17, 64
        GRIDCOLTITLE 17, "Del Prom By"
        GRIDCOLWIDTH 18, 64
        GRIDCOLTITLE 18, "Don't Del Bef"
        GRIDCOLWIDTH 19, 35
        GRIDCOLTITLE 19, "Std Msg Cd"
        GRIDCOLWIDTH 20, 56
        GRIDCOLTITLE 20, "WO No"
        GRIDCOLWIDTH 21, 35
        GRIDCOLTITLE 21, "WO Seq No"
    END

END

