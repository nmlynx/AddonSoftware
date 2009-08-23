//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_ITEMWHSE - Warehouse Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 1011 0455
BEGIN
    NAME "win_ivm_itemwhse"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_ivm_itemwhse", 4, 0055, 1004, 0400
    BEGIN
        NAME "tab_ivm_itemwhse"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Warehouse" 0 1100
        TAB "Stocking" 1 1101
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_ivm_itemwhse_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_ivm_itemwhse_1101"
    END
    
    
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
END
CHILD-WINDOW 1100 0 0 1001 0378
BEGIN
    NAME "chw_ivm_itemwhse_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    GROUPBOX 19101, "Warehouse Information ", -4, 13, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_location"
    END
    
    STATICTEXT 02101, "Warehouse Location:", 31, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_location"
    END
    
    INPUTE 03101, "", 156, 31, 80, 19
    BEGIN
        NAME "ine_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02102, "Código de distribución:", 15, 55, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03102, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04102, "", 217, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20102, "", 191, 52, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02103, "Physical Inventory Cycle:", 8, 76, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pi_cyclecode"
    END
    
    INPUTE 03103, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_pi_cyclecode"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04103, "", 217, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pi_cyclecode"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20103, "", 191, 73, 20, 19
    BEGIN
        NAME "tbnf_pi_cyclecode"
    END
    
    CHECKBOX 03104, "Special Order Item", 634, 31, 137, 19
    BEGIN
        NAME "cbx_special_ord"
        NOT OPAQUE
    END
    
    CHECKBOX 03105, "Selected for Phys Inventory?", 634, 52, 195, 19
    BEGIN
        NAME "cbx_select_phys"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02106, "Last Phys Date:", 545, 76, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstphy_date"
    END
    
    INPUTD 03106, "", 636, 73, 85, 19
    BEGIN
        NAME "ind_lstphy_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21106, "", 721, 73, 20, 19
    BEGIN
        NAME "tbnc_lstphy_date"
    END
    
    GROUPBOX 19107, "Pricing ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_cur_price"
    END
    
    STATICTEXT 02107, "Current Price:", 72, 118, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_price"
    END
    INPUTN 03107, "", 156, 115, 56, 19
    BEGIN
        NAME "inn_cur_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02108, "Current Price Code:", 38, 139, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_price_cd"
    END
    
    INPUTE 03108, "", 156, 136, 35, 19
    BEGIN
        NAME "ine_cur_price_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02109, "Prior Price:", 330, 118, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_price"
    END
    INPUTN 03109, "", 396, 115, 56, 19
    BEGIN
        NAME "inn_pri_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02110, "Prior Price Code:", 296, 139, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_price_cd"
    END
    
    INPUTE 03110, "", 396, 136, 35, 19
    BEGIN
        NAME "ine_pri_price_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02111, "Unit Cost:", 335, 160, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03111, "", 396, 157, 72, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02112, "Landed Cost:", 316, 181, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_landed_cost"
    END
    INPUTN 03112, "", 396, 178, 72, 19
    BEGIN
        NAME "inn_landed_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02113, "Last Purchase Cost:", 278, 202, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_po_cost"
    END
    INPUTN 03113, "", 396, 199, 72, 19
    BEGIN
        NAME "inn_last_po_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02114, "Average Cost:", 551, 160, 82, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_cost"
    END
    INPUTN 03114, "", 636, 157, 72, 19
    BEGIN
        NAME "inn_avg_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02115, "Standard Cost:", 547, 181, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_std_cost"
    END
    INPUTN 03115, "", 636, 178, 72, 19
    BEGIN
        NAME "inn_std_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02116, "Replacement Cost:", 525, 202, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rep_cost"
    END
    INPUTN 03116, "", 636, 199, 72, 19
    BEGIN
        NAME "inn_rep_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    GROUPBOX 19117, "Quantities ", -4, 223, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_qty_on_hand"
    END
    
    STATICTEXT 02117, "On-Hand:", 95, 244, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03117, "", 156, 241, 72, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02118, "On-Order:", 91, 265, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03118, "", 156, 262, 72, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02119, "Committed:", 325, 244, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_commit"
    END
    INPUTN 03119, "", 396, 241, 72, 19
    BEGIN
        NAME "inn_qty_commit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02120, "Available:", 337, 265, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03120, "", 396, 262, 72, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    GROUPBOX 19121, "Last Transaction Dates ", -4, 286, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_lstrec_date"
    END
    
    STATICTEXT 02121, "Receipt:", 107, 307, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstrec_date"
    END
    
    INPUTD 03121, "", 156, 304, 85, 19
    BEGIN
        NAME "ind_lstrec_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21121, "", 241, 304, 20, 19
    BEGIN
        NAME "tbnc_lstrec_date"
    END
    
    STATICTEXT 02122, "Built:", 125, 328, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstblt_date"
    END
    
    INPUTD 03122, "", 156, 325, 85, 19
    BEGIN
        NAME "ind_lstblt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21122, "", 241, 325, 20, 19
    BEGIN
        NAME "tbnc_lstblt_date"
    END
    
    STATICTEXT 02123, "Sold:", 365, 307, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstsal_date"
    END
    
    INPUTD 03123, "", 396, 304, 85, 19
    BEGIN
        NAME "ind_lstsal_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21123, "", 481, 304, 20, 19
    BEGIN
        NAME "tbnc_lstsal_date"
    END
    
    STATICTEXT 02124, "Issued:", 352, 328, 41, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstiss_date"
    END
    
    INPUTD 03124, "", 396, 325, 85, 19
    BEGIN
        NAME "ind_lstiss_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21124, "", 481, 325, 20, 19
    BEGIN
        NAME "tbnc_lstiss_date"
    END
    
    STATICTEXT 02125, "Adjustment:", 562, 307, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstadj_date"
    END
    
    INPUTD 03125, "", 636, 304, 85, 19
    BEGIN
        NAME "ind_lstadj_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21125, "", 721, 304, 20, 19
    BEGIN
        NAME "tbnc_lstadj_date"
    END
    
    STATICTEXT 02126, "Transfer In:", 565, 328, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxin_date"
    END
    
    INPUTD 03126, "", 636, 325, 85, 19
    BEGIN
        NAME "ind_lstxin_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21126, "", 721, 325, 20, 19
    BEGIN
        NAME "tbnc_lstxin_date"
    END
    
    STATICTEXT 02127, "Transfer Out:", 794, 307, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxot_date"
    END
    
    INPUTD 03127, "", 876, 304, 85, 19
    BEGIN
        NAME "ind_lstxot_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21127, "", 961, 304, 20, 19
    BEGIN
        NAME "tbnc_lstxot_date"
    END
    
    STATICTEXT 02128, "Returned:", 816, 328, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstret_date"
    END
    
    INPUTD 03128, "", 876, 325, 85, 19
    BEGIN
        NAME "ind_lstret_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21128, "", 961, 325, 20, 19
    BEGIN
        NAME "tbnc_lstret_date"
    END

END
CHILD-WINDOW 1101 0 0 1001 0378
BEGIN
    NAME "chw_ivm_itemwhse_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "ABC Analysis Code:", 39, 13, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_code"
    END
    
    INPUTE 03201, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_abc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02202, "Código de comprador:", 20, 34, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_buyer_code"
    END
    
    INPUTE 03202, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_buyer_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04202, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_buyer_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_buyer_code"
    END
    
    STATICTEXT 02203, "ID del proveedor:", 52, 55, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03203, "", 156, 52, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04203, "", 230, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20203, "", 204, 52, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02204, "Lead Time:", 91, 76, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lead_time"
    END
    INPUTN 03204, "", 156, 73, 56, 19
    BEGIN
        NAME "inn_lead_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02205, "Maximum Quantity:", 39, 97, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_maximum_qty"
    END
    INPUTN 03205, "", 156, 94, 56, 19
    BEGIN
        NAME "inn_maximum_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02206, "Order Point:", 82, 118, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_point"
    END
    INPUTN 03206, "", 156, 115, 56, 19
    BEGIN
        NAME "inn_order_point"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02207, "Order Point Code:", 252, 118, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_pnt_code"
    END
    
    LISTBUTTON 03207, "", 360, 115, 109, 300
    BEGIN
        NAME "lbx_ord_pnt_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02208, "Economic Order Quantity:", 1, 139, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq"
    END
    INPUTN 03208, "", 156, 136, 56, 19
    BEGIN
        NAME "inn_eoq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02209, "EOQ Code:", 294, 139, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq_code"
    END
    
    LISTBUTTON 03209, "", 360, 136, 109, 300
    BEGIN
        NAME "lbx_eoq_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02210, "Safety Stock:", 80, 160, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_safety_stock"
    END
    INPUTN 03210, "", 156, 157, 56, 19
    BEGIN
        NAME "inn_safety_stock"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02211, "Safety Stock Code:", 250, 160, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_saf_stk_code"
    END
    
    LISTBUTTON 03211, "", 360, 157, 109, 300
    BEGIN
        NAME "lbx_saf_stk_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END

END

