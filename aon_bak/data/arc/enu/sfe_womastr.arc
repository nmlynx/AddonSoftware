//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFE_WOMASTR - Work Order Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0635 0308
BEGIN
    NAME "win_sfe_womastr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_sfe_womastr", 4, 0034, 0628, 0274
    BEGIN
        NAME "tab_sfe_womastr"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Item Info" 0 1100
        TAB "Customer Info" 1 1101
        TAB "Misc Info" 2 1102
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_sfe_womastr_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_sfe_womastr_1101"
    END
    
    CHILD-WINDOW 1102, 1102, 10, 88
    BEGIN
        NAME "chp_sfe_womastr_1102"
    END
    
    
    STATICTEXT 02001, "Work Order Number:", 5, 13, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03001, "", 130, 10, 91, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Work Order Type:", 234, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03002, "", 340, 10, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
END
CHILD-WINDOW 1100 0 0 0625 0252
BEGIN
    NAME "chw_sfe_womastr_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Inventory Item ID:", 24, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03101, "", 130, 10, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04101, "", 416, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20101, "", 390, 10, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02102, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03102, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02103, "Description:", 56, 55, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03103, "", 130, 52, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02104, "Drawing Number:", 25, 76, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_drawing_no"
    END
    
    INPUTE 03104, "", 130, 73, 200, 19
    BEGIN
        NAME "ine_drawing_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 25
    END
    
    STATICTEXT 02105, "Drawing Revision Number:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_drawing_rev"
    END
    
    INPUTE 03105, "", 130, 94, 50, 19
    BEGIN
        NAME "ine_drawing_rev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02106, "Sched Prod Qty:", 34, 118, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sch_prod_qty"
    END
    INPUTN 03106, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_sch_prod_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02107, "Estimated Yield Percent:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_est_yield"
    END
    INPUTN 03107, "", 130, 136, 48, 19
    BEGIN
        NAME "inn_est_yield"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
    
    STATICTEXT 02108, "Work Order Status:", 16, 160, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_status"
    END
    
    INPUTE 03108, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_wo_status"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02109, "Work Order Category:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_category"
    END
    
    LISTBUTTON 03109, "", 130, 178, 151, 300
    BEGIN
        NAME "lbx_wo_category"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02110, "Date Opened:", 48, 202, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_opened_date"
    END
    
    INPUTD 03110, "", 130, 199, 85, 19
    BEGIN
        NAME "ind_opened_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21110, "", 215, 199, 20, 19
    BEGIN
        NAME "tbnc_opened_date"
    END
    
    STATICTEXT 02111, "BOM Revision Code:", 381, 118, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_rev"
    END
    
    INPUTE 03111, "", 500, 115, 35, 19
    BEGIN
        NAME "ine_bill_rev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02112, "Unit of Measure:", 402, 139, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_measure"
    END
    
    INPUTE 03112, "", 500, 136, 35, 19
    BEGIN
        NAME "ine_unit_measure"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02113, "Date Closed:", 424, 160, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_closed_date"
    END
    
    INPUTD 03113, "", 500, 157, 85, 19
    BEGIN
        NAME "ind_closed_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21113, "", 585, 157, 20, 19
    BEGIN
        NAME "tbnc_closed_date"
    END
    
    STATICTEXT 02114, "Closed Cost to Date:", 378, 181, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cls_cst_todt"
    END
    INPUTN 03114, "", 500, 178, 64, 19
    BEGIN
        NAME "inn_cls_cst_todt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02115, "Quantity Closed to Date:", 354, 202, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_cls_todt"
    END
    INPUTN 03115, "", 500, 199, 64, 19
    BEGIN
        NAME "inn_qty_cls_todt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END

END
CHILD-WINDOW 1101 0 0 0625 0252
BEGIN
    NAME "chw_sfe_womastr_1101"
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
    
    STATICTEXT 02203, "Detail Line Item Number:", 214, 34, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_no"
    END
    
    INPUTE 03203, "", 360, 31, 35, 19
    BEGIN
        NAME "ine_line_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02204, "Warehouse ID:", 44, 55, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03204, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04204, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20204, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02205, "Scheduling Method:", 12, 76, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sched_flag"
    END
    
    INPUTE 03205, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_sched_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02206, "Est. Start Date:", 43, 97, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_eststt_date"
    END
    
    INPUTD 03206, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_eststt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21206, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_eststt_date"
    END
    
    STATICTEXT 02207, "Est. Completion Date:", 2, 118, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_estcmp_date"
    END
    
    INPUTD 03207, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_estcmp_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21207, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_estcmp_date"
    END
    
    STATICTEXT 02208, "Actual Start Date:", 26, 139, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_act_st_date"
    END
    
    INPUTD 03208, "", 130, 136, 85, 19
    BEGIN
        NAME "ind_act_st_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21208, "", 215, 136, 20, 19
    BEGIN
        NAME "tbnc_act_st_date"
    END
    
    STATICTEXT 02209, "Last Activity Date:", 23, 160, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstact_date"
    END
    
    INPUTD 03209, "", 130, 157, 85, 19
    BEGIN
        NAME "ind_lstact_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21209, "", 215, 157, 20, 19
    BEGIN
        NAME "tbnc_lstact_date"
    END
    
    STATICTEXT 02210, "MRP Forecast Type:", 14, 181, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03210, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04210, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_forecast"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20210, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_forecast"
    END

END
CHILD-WINDOW 1102 0 0 0625 0252
BEGIN
    NAME "chw_sfe_womastr_1102"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    CHECKBOX 03301, "Completion Flag", 128, 10, 125, 19
    BEGIN
        NAME "cbx_complete_flg"
        NOT OPAQUE
    END
    
    CHECKBOX 03302, "Recalculate Standards?", 128, 31, 164, 19
    BEGIN
        NAME "cbx_recalc_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03303, "Lotted or Serialized Item?", 128, 52, 177, 19
    BEGIN
        NAME "cbx_lotser_item"
        NOT OPAQUE
    END
    
    STATICTEXT 02304, "Priority Code:", 47, 76, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_priority"
    END
    
    INPUTE 03304, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_priority"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02305, "Close Input Date:", 27, 97, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cls_inp_date"
    END
    
    INPUTD 03305, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_cls_inp_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21305, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_cls_inp_date"
    END
    
    STATICTEXT 02306, "Qty Closed This Entry:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cls_inp_qty"
    END
    INPUTN 03306, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_cls_inp_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02307, "Closed Cost:", 53, 139, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_closed_cost"
    END
    INPUTN 03307, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_closed_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END

END

