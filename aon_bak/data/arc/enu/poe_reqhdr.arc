//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POE_REQHDR - Requisition Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 1026 0595
BEGIN
    NAME "win_poe_reqhdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_poe_reqhdr", 4, 0118, 1019, 0282
    BEGIN
        NAME "tab_poe_reqhdr"
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
        NAME "chp_poe_reqhdr_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_poe_reqhdr_1101"
    END
    
    
    STATICTEXT 02001, "Requisition Number:", 8, 13, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_no"
    END
    
    INPUTE 03001, "", 130, 10, 91, 19
    BEGIN
        NAME "ine_req_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Vendor ID:", 66, 34, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03002, "", 130, 31, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04002, "", 234, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 208, 31, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02003, "Address:", 75, 55, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_addr1"
    END
    
    INPUTE 03003, "", 130, 52, 240, 19
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
    
    INPUTE 03004, "", 130, 73, 240, 19
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
    
    INPUTE 03005, "", 130, 94, 176, 19
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
    
    STATICTEXT 02006, "Contact:", 378, 55, 49, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_contact"
    END
    
    INPUTE 03006, "", 430, 52, 200, 19
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
    
    STATICTEXT 02007, "Telephone:", 363, 76, 64, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_phone"
    END
    
    INPUTE 03007, "", 430, 73, 200, 19
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
    
    STATICTEXT 02008, "Fax:", 403, 97, 24, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_v_fax"
    END
    
    INPUTE 03008, "", 430, 94, 200, 19
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
    
    STATICTEXT 02009, "Comments:", 660, 13, 67, 77
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comments"
    END
    
    CUSTOMEDIT 03009, "", 730, 10, 260, 80
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
    
    STATICTEXT 02010, "Total Amount:", 644, 97, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_total"
    END
    INPUTN 03010, "", 730, 94, 64, 19
    BEGIN
        NAME "inn_order_total"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    CHILD-WINDOW 1109 1109 5 0403
END
CHILD-WINDOW 1100 0 0 1016 0260
BEGIN
    NAME "chw_poe_reqhdr_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Order Date:", 59, 13, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_date"
    END
    
    INPUTD 03101, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_ord_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21101, "", 215, 10, 20, 19
    BEGIN
        NAME "tbnc_ord_date"
    END
    
    STATICTEXT 02102, "Date Required:", 42, 34, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reqd_date"
    END
    
    INPUTD 03102, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_reqd_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21102, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_reqd_date"
    END
    
    STATICTEXT 02103, "Delivery Promised By:", 2, 55, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_promise_date"
    END
    
    INPUTD 03103, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_promise_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21103, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_promise_date"
    END
    
    STATICTEXT 02104, "Don't Deliver Before:", 8, 76, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_not_b4_date"
    END
    
    INPUTD 03104, "", 130, 73, 85, 19
    BEGIN
        NAME "ind_not_b4_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21104, "", 215, 73, 20, 19
    BEGIN
        NAME "tbnc_not_b4_date"
    END
    
    STATICTEXT 02105, "Vendor Ship Via:", 32, 97, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_ship_via"
    END
    
    INPUTE 03105, "", 130, 94, 150, 19
    BEGIN
        NAME "ine_ap_ship_via"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02106, "Freight Terms:", 42, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_frt_terms"
    END
    
    INPUTE 03106, "", 130, 115, 150, 19
    BEGIN
        NAME "ine_po_frt_terms"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02107, "Terms Code:", 53, 139, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_terms_code"
    END
    
    INPUTE 03107, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_ap_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04107, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20107, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_ap_terms_code"
    END
    
    STATICTEXT 02108, "Free On Board [FOB]:", 5, 160, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fob"
    END
    
    INPUTE 03108, "", 130, 157, 150, 19
    BEGIN
        NAME "ine_fob"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02109, "Acknowledgement:", 16, 181, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_acknowledge"
    END
    
    INPUTE 03109, "", 130, 178, 200, 19
    BEGIN
        NAME "ine_acknowledge"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    CHECKBOX 03110, "Hold For Manual Release?", 128, 199, 178, 19
    BEGIN
        NAME "cbx_hold_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02111, "PO Standard Message Code:", 264, 13, 163, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_msg_code"
    END
    
    INPUTE 03111, "", 430, 10, 39, 19
    BEGIN
        NAME "ine_po_msg_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04111, "", 495, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20111, "", 469, 10, 20, 19
    BEGIN
        NAME "tbnf_po_msg_code"
    END
    
    STATICTEXT 02112, "Warehouse ID:", 344, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03112, "", 430, 31, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04112, "", 491, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20112, "", 465, 31, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    INPUTE 03113, "", 430, 52, 240, 19
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
    
    INPUTE 03114, "", 430, 73, 240, 19
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
    
    INPUTE 03115, "", 430, 94, 176, 19
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
    
    INPUTE 03116, "", 610, 94, 35, 19
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
    
    INPUTE 03117, "", 430, 115, 117, 19
    BEGIN
        NAME "ine_w_zip_code"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    CHECKBOX 03118, "Dropship?", 428, 157, 90, 19
    BEGIN
        NAME "cbx_dropship"
        NOT OPAQUE
    END
    
    STATICTEXT 02119, "Vendor Purch Addr:", 611, 13, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_purch_addr"
    END
    
    INPUTE 03119, "", 730, 10, 35, 19
    BEGIN
        NAME "ine_purch_addr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04119, "", 791, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_purch_addr"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20119, "", 765, 10, 20, 19
    BEGIN
        NAME "tbnf_purch_addr"
    END
    
    INPUTE 03120, "", 730, 31, 240, 19
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
    
    INPUTE 03121, "", 730, 52, 240, 19
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
    
    INPUTE 03122, "", 730, 73, 176, 19
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
    
    INPUTE 03123, "", 730, 94, 35, 19
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
    
    INPUTE 03124, "", 730, 115, 117, 19
    BEGIN
        NAME "ine_pa_zip_code"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END

END
CHILD-WINDOW 1101 0 0 1016 0260
BEGIN
    NAME "chw_poe_reqhdr_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Customer ID:", 50, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03201, "", 130, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04201, "", 216, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20201, "", 190, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02202, "Sales Order Number:", 5, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03202, "", 130, 31, 70, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 04202, "", 226, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_order_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 200, 31, 20, 19
    BEGIN
        NAME "tbnf_order_no"
    END
    
    STATICTEXT 02203, "Customer Ship-To Number:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_no"
    END
    
    INPUTE 03203, "", 130, 52, 60, 19
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
    
    STATICTEXT 02204, "Ship To:", 380, 13, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ds_name"
    END
    
    INPUTE 03204, "", 430, 10, 240, 19
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
    
    INPUTE 03205, "", 430, 31, 192, 19
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
    
    INPUTE 03206, "", 430, 52, 192, 19
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
    
    INPUTE 03207, "", 430, 73, 192, 19
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
    
    INPUTE 03208, "", 430, 94, 192, 19
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
    
    INPUTE 03209, "", 430, 115, 176, 19
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
    
    INPUTE 03210, "", 430, 136, 35, 19
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
    
    INPUTE 03211, "", 430, 157, 117, 19
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
CHILD-WINDOW 1109 1016 0260
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 1014 100
    BEGIN
        NAME "grd_POE_REQDET"
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
        COLUMNS 20
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
        GRIDCOLTITLE 9, "Req Qty"
        GRIDCOLWIDTH 10, 56
        GRIDCOLTITLE 10, "Unit Cost"
        GRIDCOLWIDTH 11, 120
        GRIDCOLTITLE 11, "Ext Cost"
        GRIDCOLWIDTH 12, 80
        GRIDCOLTITLE 12, "Whse Loc"
        GRIDCOLWIDTH 13, 64
        GRIDCOLTITLE 13, "Date Req"
        GRIDCOLWIDTH 14, 96
        GRIDCOLTITLE 14, "SO Seq No"
        GRIDCOLWIDTH 15, 64
        GRIDCOLTITLE 15, "Del Prom By"
        GRIDCOLWIDTH 16, 64
        GRIDCOLTITLE 16, "Don't Del Bef"
        GRIDCOLWIDTH 17, 35
        GRIDCOLTITLE 17, "Std Msg Cd"
        GRIDCOLWIDTH 18, 56
        GRIDCOLTITLE 18, "WO No"
        GRIDCOLWIDTH 19, 35
        GRIDCOLTITLE 19, "WO Seq No"
    END

END

