//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFE_WOMATISD - Material Issues Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0476 0312
BEGIN
    NAME "win_sfe_womatisd"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Work Order Location:", 52, 13, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_location"
    END
    
    INPUTE 03001, "", 180, 10, 35, 19
    BEGIN
        NAME "ine_wo_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02002, "Work Order Number:", 55, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03002, "", 180, 31, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "Materials Sequence Number:", 11, 55, 166, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_material_seq"
    END
    
    INPUTE 03003, "", 180, 52, 35, 19
    BEGIN
        NAME "ine_material_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02004, "Unit of Measure:", 82, 76, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_measure"
    END
    
    INPUTE 03004, "", 180, 73, 35, 19
    BEGIN
        NAME "ine_unit_measure"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02005, "Step Number:", 98, 97, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_step_no"
    END
    
    INPUTE 03005, "", 180, 94, 35, 19
    BEGIN
        NAME "ine_step_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02006, "Warehouse ID:", 94, 118, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03006, "", 180, 115, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04006, "", 241, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02007, "Inventory Item ID:", 74, 139, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03007, "", 180, 136, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 366, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 340, 136, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02008, "Date Required:", 92, 160, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_require_date"
    END
    
    INPUTD 03008, "", 180, 157, 85, 19
    BEGIN
        NAME "ind_require_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21008, "", 265, 157, 20, 19
    BEGIN
        NAME "tbnc_require_date"
    END
    
    STATICTEXT 02009, "Quantity Ordered:", 71, 181, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_ordered"
    END
    INPUTN 03009, "", 180, 178, 56, 19
    BEGIN
        NAME "inn_qty_ordered"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Total Quantity Issued To Date:", 0, 202, 177, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_qty_iss"
    END
    INPUTN 03010, "", 180, 199, 56, 19
    BEGIN
        NAME "inn_tot_qty_iss"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Unit Cost:", 119, 223, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03011, "", 180, 220, 56, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Quantity Issued:", 82, 244, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_issued"
    END
    INPUTN 03012, "", 180, 241, 56, 19
    BEGIN
        NAME "inn_qty_issued"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Unit Cost When Issued:", 42, 265, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_issue_cost"
    END
    INPUTN 03013, "", 180, 262, 56, 19
    BEGIN
        NAME "inn_issue_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

