//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_ITEMWHSE - Warehouse Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0865 0455
BEGIN
    NAME "win_ivm_itemwhse"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_ivm_itemwhse", 4, 0055, 0858, 0400
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
    
    STATICTEXT 02002, "Warehouse ID:", 44, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
END
CHILD-WINDOW 1100 0 0 0855 0378
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
    
    STATICTEXT 02101, "Warehouse Location:", 5, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_location"
    END
    
    INPUTE 03101, "", 130, 31, 80, 19
    BEGIN
        NAME "ine_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02102, "Distribution Code:", 20, 55, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03102, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04102, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20102, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02103, "Physical Inventory Cycle:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pi_cyclecode"
    END
    
    INPUTE 03103, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_pi_cyclecode"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04103, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pi_cyclecode"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20103, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_pi_cyclecode"
    END
    
    CHECKBOX 03104, "Special Order Item", 528, 31, 137, 19
    BEGIN
        NAME "cbx_special_ord"
        NOT OPAQUE
    END
    
    CHECKBOX 03105, "Selected for Phys Inventory?", 528, 52, 195, 19
    BEGIN
        NAME "cbx_select_phys"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    STATICTEXT 02106, "Last Phys Date:", 439, 76, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstphy_date"
    END
    
    INPUTD 03106, "", 530, 73, 85, 19
    BEGIN
        NAME "ind_lstphy_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21106, "", 615, 73, 20, 19
    BEGIN
        NAME "tbnc_lstphy_date"
    END
    
    GROUPBOX 19107, "Pricing ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_cur_price"
    END
    
    STATICTEXT 02107, "Current Price:", 46, 118, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_price"
    END
    INPUTN 03107, "", 130, 115, 56, 19
    BEGIN
        NAME "inn_cur_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02108, "Current Price Code:", 12, 139, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_price_cd"
    END
    
    INPUTE 03108, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_cur_price_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02109, "Prior Price:", 264, 118, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_price"
    END
    INPUTN 03109, "", 330, 115, 56, 19
    BEGIN
        NAME "inn_pri_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02110, "Prior Price Code:", 230, 139, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_price_cd"
    END
    
    INPUTE 03110, "", 330, 136, 35, 19
    BEGIN
        NAME "ine_pri_price_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02111, "Unit Cost:", 269, 160, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03111, "", 330, 157, 72, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02112, "Landed Cost:", 250, 181, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_landed_cost"
    END
    INPUTN 03112, "", 330, 178, 72, 19
    BEGIN
        NAME "inn_landed_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02113, "Last Purchase Cost:", 212, 202, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_po_cost"
    END
    INPUTN 03113, "", 330, 199, 72, 19
    BEGIN
        NAME "inn_last_po_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02114, "Average Cost:", 445, 160, 82, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_cost"
    END
    INPUTN 03114, "", 530, 157, 72, 19
    BEGIN
        NAME "inn_avg_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02115, "Standard Cost:", 441, 181, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_std_cost"
    END
    INPUTN 03115, "", 530, 178, 72, 19
    BEGIN
        NAME "inn_std_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02116, "Replacement Cost:", 419, 202, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rep_cost"
    END
    INPUTN 03116, "", 530, 199, 72, 19
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
    
    STATICTEXT 02117, "On-Hand:", 69, 244, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03117, "", 130, 241, 72, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02118, "On-Order:", 65, 265, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03118, "", 130, 262, 72, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02119, "Committed:", 259, 244, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_commit"
    END
    INPUTN 03119, "", 330, 241, 72, 19
    BEGIN
        NAME "inn_qty_commit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02120, "Available:", 271, 265, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03120, "", 330, 262, 72, 19
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
    
    STATICTEXT 02121, "Receipt:", 81, 307, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstrec_date"
    END
    
    INPUTD 03121, "", 130, 304, 85, 19
    BEGIN
        NAME "ind_lstrec_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21121, "", 215, 304, 20, 19
    BEGIN
        NAME "tbnc_lstrec_date"
    END
    
    STATICTEXT 02122, "Built:", 99, 328, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstblt_date"
    END
    
    INPUTD 03122, "", 130, 325, 85, 19
    BEGIN
        NAME "ind_lstblt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21122, "", 215, 325, 20, 19
    BEGIN
        NAME "tbnc_lstblt_date"
    END
    
    STATICTEXT 02123, "Sold:", 299, 307, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstsal_date"
    END
    
    INPUTD 03123, "", 330, 304, 85, 19
    BEGIN
        NAME "ind_lstsal_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21123, "", 415, 304, 20, 19
    BEGIN
        NAME "tbnc_lstsal_date"
    END
    
    STATICTEXT 02124, "Issued:", 286, 328, 41, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstiss_date"
    END
    
    INPUTD 03124, "", 330, 325, 85, 19
    BEGIN
        NAME "ind_lstiss_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21124, "", 415, 325, 20, 19
    BEGIN
        NAME "tbnc_lstiss_date"
    END
    
    STATICTEXT 02125, "Adjustment:", 456, 307, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstadj_date"
    END
    
    INPUTD 03125, "", 530, 304, 85, 19
    BEGIN
        NAME "ind_lstadj_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21125, "", 615, 304, 20, 19
    BEGIN
        NAME "tbnc_lstadj_date"
    END
    
    STATICTEXT 02126, "Transfer In:", 459, 328, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxin_date"
    END
    
    INPUTD 03126, "", 530, 325, 85, 19
    BEGIN
        NAME "ind_lstxin_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21126, "", 615, 325, 20, 19
    BEGIN
        NAME "tbnc_lstxin_date"
    END
    
    STATICTEXT 02127, "Transfer Out:", 648, 307, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxot_date"
    END
    
    INPUTD 03127, "", 730, 304, 85, 19
    BEGIN
        NAME "ind_lstxot_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21127, "", 815, 304, 20, 19
    BEGIN
        NAME "tbnc_lstxot_date"
    END
    
    STATICTEXT 02128, "Returned:", 670, 328, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstret_date"
    END
    
    INPUTD 03128, "", 730, 325, 85, 19
    BEGIN
        NAME "ind_lstret_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21128, "", 815, 325, 20, 19
    BEGIN
        NAME "tbnc_lstret_date"
    END

END
CHILD-WINDOW 1101 0 0 0855 0378
BEGIN
    NAME "chw_ivm_itemwhse_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "ABC Analysis Code:", 13, 13, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_code"
    END
    
    INPUTE 03201, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_abc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02202, "Buyer Code:", 57, 34, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_buyer_code"
    END
    
    INPUTE 03202, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_buyer_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04202, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_buyer_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_buyer_code"
    END
    
    STATICTEXT 02203, "Vendor ID:", 66, 55, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03203, "", 130, 52, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04203, "", 204, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20203, "", 178, 52, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02204, "Lead Time:", 65, 76, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lead_time"
    END
    INPUTN 03204, "", 130, 73, 56, 19
    BEGIN
        NAME "inn_lead_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02205, "Maximum Quantity:", 13, 97, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_maximum_qty"
    END
    INPUTN 03205, "", 130, 94, 56, 19
    BEGIN
        NAME "inn_maximum_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02206, "Order Point:", 56, 118, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_point"
    END
    INPUTN 03206, "", 130, 115, 56, 19
    BEGIN
        NAME "inn_order_point"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02207, "Order Point Code:", 192, 118, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_pnt_code"
    END
    
    LISTBUTTON 03207, "", 300, 115, 109, 300
    BEGIN
        NAME "lbx_ord_pnt_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02208, "Economic Order Quantity:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq"
    END
    INPUTN 03208, "", 130, 136, 56, 19
    BEGIN
        NAME "inn_eoq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02209, "EOQ Code:", 234, 139, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eoq_code"
    END
    
    LISTBUTTON 03209, "", 300, 136, 109, 300
    BEGIN
        NAME "lbx_eoq_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02210, "Safety Stock:", 54, 160, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_safety_stock"
    END
    INPUTN 03210, "", 130, 157, 56, 19
    BEGIN
        NAME "inn_safety_stock"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02211, "Safety Stock Code:", 190, 160, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_saf_stk_code"
    END
    
    LISTBUTTON 03211, "", 300, 157, 109, 300
    BEGIN
        NAME "lbx_saf_stk_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END

END

