//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_LSMASTER - Lot/Serial Number Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0891 0396
BEGIN
    NAME "win_ivm_lsmaster"
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
    
    GROUPBOX 19003, "Lot Information ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_lotser_no"
    END
    
    STATICTEXT 02003, "Lot/Serial No:", 73, 76, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lotser_no"
    END
    
    INPUTE 03003, "", 156, 73, 200, 19
    BEGIN
        NAME "ine_lotser_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02004, "Closed Flag:", 514, 76, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_closed_flag"
    END
    
    INPUTE 03004, "", 588, 73, 35, 19
    BEGIN
        NAME "ine_closed_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02005, "Lot/Serial Location:", 39, 97, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ls_location"
    END
    
    INPUTE 03005, "", 156, 94, 56, 19
    BEGIN
        NAME "ine_ls_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02006, "Last Phys Date:", 497, 97, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstphy_date"
    END
    
    INPUTD 03006, "", 588, 94, 85, 19
    BEGIN
        NAME "ind_lstphy_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 673, 94, 20, 19
    BEGIN
        NAME "tbnc_lstphy_date"
    END
    
    STATICTEXT 02007, "ID del proveedor:", 52, 118, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03007, "", 156, 115, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04007, "", 230, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 204, 115, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02008, "Last Phys Count:", 488, 118, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_physical_cnt"
    END
    INPUTN 03008, "", 588, 115, 56, 19
    BEGIN
        NAME "inn_physical_cnt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Lot/Serial Comment:", 32, 139, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ls_comments"
    END
    
    INPUTE 03009, "", 156, 136, 320, 19
    BEGIN
        NAME "ine_ls_comments"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    GROUPBOX 19010, "Costing ", -4, 160, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_unit_cost"
    END
    
    STATICTEXT 02010, "Unit Cost:", 95, 181, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03010, "", 156, 178, 70, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Landed Cost:", 76, 202, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_landed_cost"
    END
    INPUTN 03011, "", 156, 199, 70, 19
    BEGIN
        NAME "inn_landed_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Last Purchase Cost:", 38, 223, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_po_cost"
    END
    INPUTN 03012, "", 156, 220, 70, 19
    BEGIN
        NAME "inn_last_po_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Average Cost:", 479, 181, 82, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_cost"
    END
    INPUTN 03013, "", 564, 178, 70, 19
    BEGIN
        NAME "inn_avg_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Standard Cost:", 475, 202, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_std_cost"
    END
    INPUTN 03014, "", 564, 199, 70, 19
    BEGIN
        NAME "inn_std_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Replacement Cost:", 453, 223, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rep_cost"
    END
    INPUTN 03015, "", 564, 220, 70, 19
    BEGIN
        NAME "inn_rep_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    GROUPBOX 19016, "Quantities ", -4, 244, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_qty_on_hand"
    END
    
    STATICTEXT 02016, "Quantity On-Hand:", 41, 265, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03016, "", 156, 262, 56, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Quantity Committed:", 31, 286, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_commit"
    END
    INPUTN 03017, "", 156, 283, 56, 19
    BEGIN
        NAME "inn_qty_commit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    GROUPBOX 19018, "Last Transaction Dates ", -4, 307, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_lstrec_date"
    END
    
    STATICTEXT 02018, "Receipt:", 107, 328, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstrec_date"
    END
    
    INPUTD 03018, "", 156, 325, 85, 19
    BEGIN
        NAME "ind_lstrec_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21018, "", 241, 325, 20, 19
    BEGIN
        NAME "tbnc_lstrec_date"
    END
    
    STATICTEXT 02019, "Built:", 125, 349, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstblt_date"
    END
    
    INPUTD 03019, "", 156, 346, 85, 19
    BEGIN
        NAME "ind_lstblt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21019, "", 241, 346, 20, 19
    BEGIN
        NAME "tbnc_lstblt_date"
    END
    
    STATICTEXT 02020, "Sold:", 305, 328, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstsal_date"
    END
    
    INPUTD 03020, "", 336, 325, 85, 19
    BEGIN
        NAME "ind_lstsal_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21020, "", 421, 325, 20, 19
    BEGIN
        NAME "tbnc_lstsal_date"
    END
    
    STATICTEXT 02021, "Issued:", 292, 349, 41, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstiss_date"
    END
    
    INPUTD 03021, "", 336, 346, 85, 19
    BEGIN
        NAME "ind_lstiss_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21021, "", 421, 346, 20, 19
    BEGIN
        NAME "tbnc_lstiss_date"
    END
    
    STATICTEXT 02022, "Adjustment:", 466, 328, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstadj_date"
    END
    
    INPUTD 03022, "", 540, 325, 85, 19
    BEGIN
        NAME "ind_lstadj_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21022, "", 625, 325, 20, 19
    BEGIN
        NAME "tbnc_lstadj_date"
    END
    
    STATICTEXT 02023, "Transfer In:", 469, 349, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxin_date"
    END
    
    INPUTD 03023, "", 540, 346, 85, 19
    BEGIN
        NAME "ind_lstxin_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21023, "", 625, 346, 20, 19
    BEGIN
        NAME "tbnc_lstxin_date"
    END
    
    STATICTEXT 02024, "Transfer Out:", 674, 328, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxot_date"
    END
    
    INPUTD 03024, "", 756, 325, 85, 19
    BEGIN
        NAME "ind_lstxot_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21024, "", 841, 325, 20, 19
    BEGIN
        NAME "tbnc_lstxot_date"
    END
    
    STATICTEXT 02025, "Returned:", 696, 349, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstret_date"
    END
    
    INPUTD 03025, "", 756, 346, 85, 19
    BEGIN
        NAME "ind_lstret_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21025, "", 841, 346, 20, 19
    BEGIN
        NAME "tbnc_lstret_date"
    END
END

