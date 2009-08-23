//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVT_LSTRANS - Lot/Serial Transaction History
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0564
BEGIN
    NAME "win_ivt_lstrans"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Inventory Item ID:", 50, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03001, "", 156, 10, 200, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 382, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 356, 10, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02002, "Warehouse ID:", 70, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02003, "Lot/Serial Number:", 42, 55, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lotser_no"
    END
    
    INPUTE 03003, "", 156, 52, 200, 19
    BEGIN
        NAME "ine_lotser_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02004, "Fecha de la transacción:", 13, 76, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_date"
    END
    
    INPUTD 03004, "", 156, 73, 85, 19
    BEGIN
        NAME "ind_trans_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 241, 73, 20, 19
    BEGIN
        NAME "tbnc_trans_date"
    END
    
    STATICTEXT 02005, "Inventory Trans History Seq:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_iv_hist_seq"
    END
    
    INPUTE 03005, "", 156, 94, 50, 19
    BEGIN
        NAME "ine_iv_hist_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000"
    END
    
    STATICTEXT 02006, "Transaction Source:", 36, 118, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_source"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_trans_source"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02007, "Transaction Reference 1:", 7, 139, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_ref_1"
    END
    
    INPUTE 03007, "", 156, 136, 48, 19
    BEGIN
        NAME "ine_trans_ref_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 02008, "Transaction Reference 2:", 7, 160, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_ref_2"
    END
    
    INPUTE 03008, "", 156, 157, 56, 19
    BEGIN
        NAME "ine_trans_ref_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02009, "Transaction Reference 3:", 7, 181, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_ref_3"
    END
    
    INPUTE 03009, "", 156, 178, 56, 19
    BEGIN
        NAME "ine_trans_ref_3"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02010, "Transaction Reference 4:", 7, 202, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_ref_4"
    END
    
    INPUTE 03010, "", 156, 199, 35, 19
    BEGIN
        NAME "ine_trans_ref_4"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02011, "Transaction Sequence Number:", 0, 223, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_seq"
    END
    
    INPUTE 03011, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_trans_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
    
    STATICTEXT 02012, "Line Code:", 92, 244, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_code"
    END
    
    INPUTE 03012, "", 156, 241, 35, 19
    BEGIN
        NAME "ine_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02013, "Unit of Measure:", 58, 265, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_measure"
    END
    
    INPUTE 03013, "", 156, 262, 35, 19
    BEGIN
        NAME "ine_unit_measure"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02014, "Transaction Comment:", 19, 286, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_cmt"
    END
    
    INPUTE 03014, "", 156, 283, 160, 19
    BEGIN
        NAME "ine_trans_cmt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02015, "Finished Good Item Number:", 0, 307, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_finish_item"
    END
    
    INPUTE 03015, "", 156, 304, 160, 19
    BEGIN
        NAME "ine_finish_item"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02016, "Cuenta del GL:", 69, 328, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03016, "", 156, 325, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04016, "", 262, 329, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20016, "", 236, 325, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02017, "Warehouse Location:", 31, 349, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_location"
    END
    
    INPUTE 03017, "", 156, 346, 80, 19
    BEGIN
        NAME "ine_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02018, "Purchase Order Line Code:", 0, 370, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_code"
    END
    
    INPUTE 03018, "", 156, 367, 35, 19
    BEGIN
        NAME "ine_po_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04018, "", 217, 371, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20018, "", 191, 367, 20, 19
    BEGIN
        NAME "tbnf_po_line_code"
    END
    
    STATICTEXT 02019, "ID del usuario:", 69, 391, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03019, "", 156, 388, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04019, "", 332, 392, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20019, "", 306, 388, 20, 19
    BEGIN
        NAME "tbnf_user_id"
    END
    
    STATICTEXT 02020, "System Time:", 76, 412, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_system_time"
    END
    
    INPUTE 03020, "", 156, 409, 35, 19
    BEGIN
        NAME "ine_system_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02021, "ID de la terminal:", 56, 433, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terminal_id"
    END
    
    INPUTE 03021, "", 156, 430, 35, 19
    BEGIN
        NAME "ine_terminal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02022, "Fecha del sistema actual:", 8, 454, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_system_date"
    END
    
    INPUTD 03022, "", 156, 451, 85, 19
    BEGIN
        NAME "ind_system_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21022, "", 241, 451, 20, 19
    BEGIN
        NAME "tbnc_system_date"
    END
    
    STATICTEXT 02023, "Transaction Quantity:", 26, 475, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_qty"
    END
    INPUTN 03023, "", 156, 472, 56, 19
    BEGIN
        NAME "inn_trans_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Unit Cost:", 95, 496, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03024, "", 156, 493, 70, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Unit Price:", 94, 517, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_price"
    END
    INPUTN 03025, "", 156, 514, 56, 19
    BEGIN
        NAME "inn_unit_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

