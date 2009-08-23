//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_ITEMVEND - Item Vendor Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0474 0333
BEGIN
    NAME "win_ivm_itemvend"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Inventory Item ID:", 24, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03001, "", 130, 10, 200, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 356, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 330, 10, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    GROUPBOX 19002, "Vendor Information ", -4, 34, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_vendor_id"
    END
    
    STATICTEXT 02002, "Vendor ID:", 66, 55, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03002, "", 130, 52, 60, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04002, "", 237, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 190, 52, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    TOOLBUTTON 22002, "", 210, 52, 20, 19
    BEGIN
        NAME "tbnd_vendor_id"
    END
    
    STATICTEXT 02003, "Primary/Secondary Flag:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_prisec_flag"
    END
    
    LISTBUTTON 03003, "", 130, 73, 91, 300
    BEGIN
        NAME "lbx_prisec_flag"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Vendor Item Number:", 2, 97, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_item"
    END
    
    INPUTE 03004, "", 130, 94, 160, 19
    BEGIN
        NAME "ine_vendor_item"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02005, "Lead Time:", 65, 118, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lead_time"
    END
    INPUTN 03005, "", 130, 115, 56, 19
    BEGIN
        NAME "inn_lead_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    GROUPBOX 19006, "Quantity Discounts ", -4, 139, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_break_qty_01"
    END
    
    STATICTEXT 02006, "Break Quantity Level:", 5, 160, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_break_qty_01"
    END
    INPUTN 03006, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_break_qty_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Unit Cost:", 319, 160, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost_01"
    END
    INPUTN 03007, "", 380, 157, 64, 19
    BEGIN
        NAME "inn_unit_cost_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Break Quantity Level:", 5, 181, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_break_qty_02"
    END
    INPUTN 03008, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_break_qty_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Unit Cost:", 319, 181, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost_02"
    END
    INPUTN 03009, "", 380, 178, 64, 19
    BEGIN
        NAME "inn_unit_cost_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Break Quantity Level:", 5, 202, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_break_qty_03"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_break_qty_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Unit Cost:", 319, 202, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost_03"
    END
    INPUTN 03011, "", 380, 199, 64, 19
    BEGIN
        NAME "inn_unit_cost_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    GROUPBOX 19012, "Last Purchase ", -4, 223, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_last_po_date"
    END
    
    STATICTEXT 02012, "Last Purchase Date:", 13, 244, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_po_date"
    END
    
    INPUTD 03012, "", 130, 241, 85, 19
    BEGIN
        NAME "ind_last_po_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21012, "", 215, 241, 20, 19
    BEGIN
        NAME "tbnc_last_po_date"
    END
    
    STATICTEXT 02013, "Last Purchase Cost:", 12, 265, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_po_cost"
    END
    INPUTN 03013, "", 130, 262, 56, 19
    BEGIN
        NAME "inn_last_po_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Lead Time for Last P.O.:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_po_lead"
    END
    INPUTN 03014, "", 130, 283, 30, 19
    BEGIN
        NAME "inn_last_po_lead"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0-"
    END
END

