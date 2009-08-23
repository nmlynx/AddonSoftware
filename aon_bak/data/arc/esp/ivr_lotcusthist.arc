//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVR_LOTCUSTHIST - Lot/Serial Number History By Customer
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0296
BEGIN
    NAME "win_ivr_lotcusthist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning ID del cliente:", 14, 13, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 242, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 216, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Ending ID del cliente:", 31, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03002, "", 156, 31, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04002, "", 242, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 216, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02003, "Beginning Fecha:", 54, 55, 99, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_date"
    END
    
    INPUTD 03003, "", 156, 52, 85, 19
    BEGIN
        NAME "ind_pick_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 241, 52, 20, 19
    BEGIN
        NAME "tbnc_pick_date"
    END
    
    STATICTEXT 02004, "Ending Fecha:", 72, 76, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_date"
    END
    
    INPUTD 03004, "", 156, 73, 85, 19
    BEGIN
        NAME "ind_pick_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 241, 73, 20, 19
    BEGIN
        NAME "tbnc_pick_date"
    END
    
    STATICTEXT 02005, "Beginning Warehouse ID:", 8, 97, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02006, "Ending Warehouse ID:", 26, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04006, "", 217, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 191, 115, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02007, "Beginning Product Type:", 10, 139, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03007, "", 156, 136, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04007, "", 221, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 195, 136, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02008, "Ending Product Type:", 28, 160, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03008, "", 156, 157, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04008, "", 221, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 195, 157, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02009, "Beginning Item ID:", 48, 181, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03009, "", 156, 178, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04009, "", 442, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 416, 178, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02010, "Ending Item ID:", 65, 202, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03010, "", 156, 199, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04010, "", 442, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 416, 199, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02011, "Item Type:", 93, 223, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_type"
    END
    
    INPUTE 03011, "", 156, 220, 39, 19
    BEGIN
        NAME "ine_item_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04011, "", 221, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 195, 220, 20, 19
    BEGIN
        NAME "tbnf_item_type"
    END
    
    STATICTEXT 02012, "Open/Closed/Both:", 38, 244, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_cl_both"
    END
    
    LISTBUTTON 03012, "", 156, 241, 72, 300
    BEGIN
        NAME "lbx_op_cl_both"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

