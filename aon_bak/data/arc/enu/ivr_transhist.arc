//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVR_TRANSHIST - Item Transaction History
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0357
BEGIN
    NAME "win_ivr_transhist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Date:", 36, 13, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_date"
    END
    
    INPUTD 03001, "", 130, 10, 85, 19
    BEGIN
        NAME "ind_pick_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 215, 10, 20, 19
    BEGIN
        NAME "tbnc_pick_date"
    END
    
    STATICTEXT 02002, "Ending Date:", 54, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_date"
    END
    
    INPUTD 03002, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_pick_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_pick_date"
    END
    
    STATICTEXT 02003, "Beginning Warehouse:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04003, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02004, "Ending Warehouse:", 15, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02005, "Beginning Product Type:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04005, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02006, "Ending Product Type:", 2, 118, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04006, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02007, "Beginning Item ID:", 22, 139, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03007, "", 130, 136, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 316, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 290, 136, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02008, "Ending Item ID:", 39, 160, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03008, "", 130, 157, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 316, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 290, 157, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02009, "Item Type:", 67, 181, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_type"
    END
    
    INPUTE 03009, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_item_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04009, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_item_type"
    END
    
    GROUPBOX 19010, "Transaction Types ", -4, 202, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_tran_hst_all"
    END
    
    CHECKBOX 03010, "ALL transactions", 28, 220, 129, 19
    BEGIN
        NAME "cbx_tran_hst_all"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Purchase Orders", 28, 262, 129, 19
    BEGIN
        NAME "cbx_tran_hst_po"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "Sales", 28, 283, 59, 19
    BEGIN
        NAME "cbx_tran_hst_op"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Inventory Trans", 28, 304, 123, 19
    BEGIN
        NAME "cbx_tran_hst_it"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Physical Inventory", 188, 262, 136, 19
    BEGIN
        NAME "cbx_tran_hst_ph"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Transfers In", 188, 283, 101, 19
    BEGIN
        NAME "cbx_tran_hst_ti"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "Transfers Out", 188, 304, 112, 19
    BEGIN
        NAME "cbx_tran_hst_to"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "WO Issue", 348, 262, 83, 19
    BEGIN
        NAME "cbx_tran_hst_wi"
        NOT OPAQUE
    END
    
    CHECKBOX 03018, "WO Receipt", 348, 283, 96, 19
    BEGIN
        NAME "cbx_tran_hst_wo"
        NOT OPAQUE
    END
    
    CHECKBOX 03019, "Bill of Materials Prod", 348, 304, 148, 19
    BEGIN
        NAME "cbx_tran_hst_bm"
        NOT OPAQUE
    END
END

