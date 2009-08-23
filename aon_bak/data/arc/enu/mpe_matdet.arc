//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// MPE_MATDET - Material Requirements Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 2000
BEGIN
    NAME "win_mpe_matdet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "MRP Forecast Type:", 14, 13, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_forecast"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_forecast"
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
    
    STATICTEXT 02003, "Inventory Item ID:", 24, 55, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03003, "", 130, 52, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 416, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 390, 52, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02004, "A=Purchase Item/B=Production:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mrp_type"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_mrp_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02005, "Plan Date:", 70, 97, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03005, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02006, "Plan Date:", 70, 118, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03006, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02007, "Plan Date:", 70, 139, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03007, "", 130, 136, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 215, 136, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02008, "Plan Date:", 70, 160, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03008, "", 130, 157, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21008, "", 215, 157, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02009, "Plan Date:", 70, 181, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03009, "", 130, 178, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21009, "", 215, 178, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02010, "Plan Date:", 70, 202, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03010, "", 130, 199, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21010, "", 215, 199, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02011, "Plan Date:", 70, 223, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03011, "", 130, 220, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21011, "", 215, 220, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02012, "Plan Date:", 70, 244, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03012, "", 130, 241, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21012, "", 215, 241, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02013, "Plan Date:", 70, 265, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03013, "", 130, 262, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21013, "", 215, 262, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02014, "Plan Date:", 70, 286, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03014, "", 130, 283, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21014, "", 215, 283, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02015, "Plan Date:", 70, 307, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03015, "", 130, 304, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 215, 304, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02016, "Plan Date:", 70, 328, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03016, "", 130, 325, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21016, "", 215, 325, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02017, "Plan Date:", 70, 349, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03017, "", 130, 346, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21017, "", 215, 346, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02018, "Plan Date:", 70, 370, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03018, "", 130, 367, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21018, "", 215, 367, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02019, "Plan Date:", 70, 391, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03019, "", 130, 388, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21019, "", 215, 388, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02020, "Plan Date:", 70, 412, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03020, "", 130, 409, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21020, "", 215, 409, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02021, "Plan Date:", 70, 433, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03021, "", 130, 430, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21021, "", 215, 430, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02022, "Plan Date:", 70, 454, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03022, "", 130, 451, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21022, "", 215, 451, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02023, "Plan Date:", 70, 475, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03023, "", 130, 472, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21023, "", 215, 472, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02024, "Plan Date:", 70, 496, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03024, "", 130, 493, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21024, "", 215, 493, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02025, "Plan Date:", 70, 517, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03025, "", 130, 514, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21025, "", 215, 514, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02026, "Plan Date:", 70, 538, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03026, "", 130, 535, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21026, "", 215, 535, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02027, "Plan Date:", 70, 559, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03027, "", 130, 556, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21027, "", 215, 556, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02028, "Plan Date:", 70, 580, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03028, "", 130, 577, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21028, "", 215, 577, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02029, "Plan Date:", 70, 601, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03029, "", 130, 598, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21029, "", 215, 598, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02030, "Plan Date:", 70, 622, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03030, "", 130, 619, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21030, "", 215, 619, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02031, "Quantity On-Hand:", 15, 643, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03031, "", 130, 640, 64, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Quantity On-Order:", 11, 664, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03032, "", 130, 661, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Gross Required:", 33, 685, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03033, "", 130, 682, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Net Required:", 48, 706, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03034, "", 130, 703, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02035, "Planned Release Qty on PO/WO:", 0, 727, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03035, "", 130, 724, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02036, "Planned Receipt Qty on PO/WO:", 0, 748, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03036, "", 130, 745, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02037, "Available Quantity:", 17, 769, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03037, "", 130, 766, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02038, "Quantity On-Order:", 11, 790, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03038, "", 130, 787, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02039, "Gross Required:", 33, 811, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03039, "", 130, 808, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02040, "Net Required:", 48, 832, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03040, "", 130, 829, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02041, "Planned Release Qty on PO/WO:", 0, 853, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03041, "", 130, 850, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02042, "Planned Receipt Qty on PO/WO:", 0, 874, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03042, "", 130, 871, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02043, "Available Quantity:", 17, 895, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03043, "", 130, 892, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02044, "Quantity On-Order:", 11, 916, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03044, "", 130, 913, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02045, "Gross Required:", 33, 937, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03045, "", 130, 934, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02046, "Net Required:", 48, 958, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03046, "", 130, 955, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02047, "Planned Release Qty on PO/WO:", 0, 979, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03047, "", 130, 976, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02048, "Planned Receipt Qty on PO/WO:", 0, 1000, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03048, "", 130, 997, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02049, "Available Quantity:", 17, 1021, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03049, "", 130, 1018, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02050, "Quantity On-Order:", 11, 1042, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03050, "", 130, 1039, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02051, "Gross Required:", 33, 1063, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03051, "", 130, 1060, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02052, "Net Required:", 48, 1084, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03052, "", 130, 1081, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02053, "Planned Release Qty on PO/WO:", 0, 1105, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03053, "", 130, 1102, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02054, "Planned Receipt Qty on PO/WO:", 0, 1126, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03054, "", 130, 1123, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02055, "Available Quantity:", 17, 1147, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03055, "", 130, 1144, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02056, "Quantity On-Order:", 11, 1168, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03056, "", 130, 1165, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02057, "Gross Required:", 33, 1189, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03057, "", 130, 1186, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02058, "Net Required:", 48, 1210, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03058, "", 130, 1207, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02059, "Planned Release Qty on PO/WO:", 0, 1231, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03059, "", 130, 1228, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02060, "Planned Receipt Qty on PO/WO:", 0, 1252, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03060, "", 130, 1249, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02061, "Available Quantity:", 17, 1273, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03061, "", 130, 1270, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02062, "Quantity On-Order:", 11, 1294, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03062, "", 130, 1291, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02063, "Gross Required:", 33, 1315, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03063, "", 130, 1312, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02064, "Net Required:", 48, 1336, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03064, "", 130, 1333, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02065, "Planned Release Qty on PO/WO:", 0, 1357, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03065, "", 130, 1354, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02066, "Planned Receipt Qty on PO/WO:", 0, 1378, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03066, "", 130, 1375, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02067, "Available Quantity:", 17, 1399, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03067, "", 130, 1396, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02068, "Quantity On-Order:", 11, 1420, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03068, "", 130, 1417, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02069, "Gross Required:", 33, 1441, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03069, "", 130, 1438, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02070, "Net Required:", 48, 1462, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03070, "", 130, 1459, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02071, "Planned Release Qty on PO/WO:", 0, 1483, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03071, "", 130, 1480, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02072, "Planned Receipt Qty on PO/WO:", 0, 1504, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03072, "", 130, 1501, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02073, "Available Quantity:", 17, 1525, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03073, "", 130, 1522, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02074, "Quantity On-Order:", 11, 1546, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03074, "", 130, 1543, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02075, "Gross Required:", 33, 1567, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03075, "", 130, 1564, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02076, "Net Required:", 48, 1588, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03076, "", 130, 1585, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02077, "Planned Release Qty on PO/WO:", 0, 1609, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03077, "", 130, 1606, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02078, "Planned Receipt Qty on PO/WO:", 0, 1630, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03078, "", 130, 1627, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02079, "Available Quantity:", 17, 1651, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03079, "", 130, 1648, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02080, "Quantity On-Order:", 11, 1672, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03080, "", 130, 1669, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02081, "Gross Required:", 33, 1693, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03081, "", 130, 1690, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02082, "Net Required:", 48, 1714, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03082, "", 130, 1711, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02083, "Planned Release Qty on PO/WO:", 0, 1735, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03083, "", 130, 1732, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02084, "Planned Receipt Qty on PO/WO:", 0, 1756, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03084, "", 130, 1753, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02085, "Available Quantity:", 17, 1777, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03085, "", 130, 1774, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02086, "Quantity On-Order:", 11, 1798, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03086, "", 130, 1795, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02087, "Gross Required:", 33, 1819, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03087, "", 130, 1816, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02088, "Net Required:", 48, 1840, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03088, "", 130, 1837, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02089, "Planned Release Qty on PO/WO:", 0, 1861, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03089, "", 130, 1858, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02090, "Planned Receipt Qty on PO/WO:", 0, 1882, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03090, "", 130, 1879, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02091, "Available Quantity:", 17, 1903, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03091, "", 130, 1900, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02092, "Quantity On-Order:", 11, 1924, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03092, "", 130, 1921, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02093, "Gross Required:", 33, 1945, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03093, "", 130, 1942, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02094, "Net Required:", 48, 1966, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03094, "", 130, 1963, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02095, "Planned Release Qty on PO/WO:", 0, 1987, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03095, "", 130, 1984, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02096, "Planned Receipt Qty on PO/WO:", 0, 2008, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03096, "", 130, 2005, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02097, "Available Quantity:", 17, 2029, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03097, "", 130, 2026, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02098, "Quantity On-Order:", 11, 2050, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03098, "", 130, 2047, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02099, "Gross Required:", 33, 2071, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03099, "", 130, 2068, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02100, "Net Required:", 48, 2092, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03100, "", 130, 2089, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02101, "Planned Release Qty on PO/WO:", 0, 2113, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03101, "", 130, 2110, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02102, "Planned Receipt Qty on PO/WO:", 0, 2134, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03102, "", 130, 2131, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02103, "Available Quantity:", 17, 2155, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03103, "", 130, 2152, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02104, "Quantity On-Order:", 11, 2176, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03104, "", 130, 2173, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02105, "Gross Required:", 33, 2197, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03105, "", 130, 2194, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02106, "Net Required:", 48, 2218, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03106, "", 130, 2215, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02107, "Planned Release Qty on PO/WO:", 0, 2239, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03107, "", 130, 2236, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02108, "Planned Receipt Qty on PO/WO:", 0, 2260, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03108, "", 130, 2257, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02109, "Available Quantity:", 17, 2281, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03109, "", 130, 2278, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02110, "Quantity On-Order:", 11, 2302, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03110, "", 130, 2299, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02111, "Gross Required:", 33, 2323, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03111, "", 130, 2320, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02112, "Net Required:", 48, 2344, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03112, "", 130, 2341, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02113, "Planned Release Qty on PO/WO:", 0, 2365, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03113, "", 130, 2362, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02114, "Planned Receipt Qty on PO/WO:", 0, 2386, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03114, "", 130, 2383, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02115, "Available Quantity:", 17, 2407, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03115, "", 130, 2404, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02116, "Quantity On-Order:", 11, 2428, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03116, "", 130, 2425, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02117, "Gross Required:", 33, 2449, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03117, "", 130, 2446, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02118, "Net Required:", 48, 2470, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03118, "", 130, 2467, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02119, "Planned Release Qty on PO/WO:", 0, 2491, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03119, "", 130, 2488, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02120, "Planned Receipt Qty on PO/WO:", 0, 2512, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03120, "", 130, 2509, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02121, "Available Quantity:", 17, 2533, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03121, "", 130, 2530, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02122, "Quantity On-Order:", 11, 2554, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03122, "", 130, 2551, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02123, "Gross Required:", 33, 2575, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03123, "", 130, 2572, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02124, "Net Required:", 48, 2596, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03124, "", 130, 2593, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02125, "Planned Release Qty on PO/WO:", 0, 2617, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03125, "", 130, 2614, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02126, "Planned Receipt Qty on PO/WO:", 0, 2638, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03126, "", 130, 2635, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02127, "Available Quantity:", 17, 2659, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03127, "", 130, 2656, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02128, "Quantity On-Order:", 11, 2680, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03128, "", 130, 2677, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02129, "Gross Required:", 33, 2701, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03129, "", 130, 2698, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02130, "Net Required:", 48, 2722, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03130, "", 130, 2719, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02131, "Planned Release Qty on PO/WO:", 0, 2743, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03131, "", 130, 2740, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02132, "Planned Receipt Qty on PO/WO:", 0, 2764, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03132, "", 130, 2761, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02133, "Available Quantity:", 17, 2785, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03133, "", 130, 2782, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02134, "Quantity On-Order:", 11, 2806, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03134, "", 130, 2803, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02135, "Gross Required:", 33, 2827, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03135, "", 130, 2824, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02136, "Net Required:", 48, 2848, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03136, "", 130, 2845, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02137, "Planned Release Qty on PO/WO:", 0, 2869, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03137, "", 130, 2866, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02138, "Planned Receipt Qty on PO/WO:", 0, 2890, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03138, "", 130, 2887, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02139, "Available Quantity:", 17, 2911, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03139, "", 130, 2908, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02140, "Quantity On-Order:", 11, 2932, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03140, "", 130, 2929, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02141, "Gross Required:", 33, 2953, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03141, "", 130, 2950, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02142, "Net Required:", 48, 2974, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03142, "", 130, 2971, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02143, "Planned Release Qty on PO/WO:", 0, 2995, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03143, "", 130, 2992, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02144, "Planned Receipt Qty on PO/WO:", 0, 3016, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03144, "", 130, 3013, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02145, "Available Quantity:", 17, 3037, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03145, "", 130, 3034, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02146, "Quantity On-Order:", 11, 3058, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03146, "", 130, 3055, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02147, "Gross Required:", 33, 3079, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03147, "", 130, 3076, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02148, "Net Required:", 48, 3100, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03148, "", 130, 3097, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02149, "Planned Release Qty on PO/WO:", 0, 3121, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03149, "", 130, 3118, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02150, "Planned Receipt Qty on PO/WO:", 0, 3142, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03150, "", 130, 3139, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02151, "Available Quantity:", 17, 3163, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03151, "", 130, 3160, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02152, "Quantity On-Order:", 11, 3184, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03152, "", 130, 3181, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02153, "Gross Required:", 33, 3205, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03153, "", 130, 3202, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02154, "Net Required:", 48, 3226, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03154, "", 130, 3223, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02155, "Planned Release Qty on PO/WO:", 0, 3247, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03155, "", 130, 3244, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02156, "Planned Receipt Qty on PO/WO:", 0, 3268, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03156, "", 130, 3265, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02157, "Available Quantity:", 17, 3289, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03157, "", 130, 3286, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02158, "Quantity On-Order:", 11, 3310, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03158, "", 130, 3307, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02159, "Gross Required:", 33, 3331, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03159, "", 130, 3328, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02160, "Net Required:", 48, 3352, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03160, "", 130, 3349, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02161, "Planned Release Qty on PO/WO:", 0, 3373, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03161, "", 130, 3370, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02162, "Planned Receipt Qty on PO/WO:", 0, 3394, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03162, "", 130, 3391, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02163, "Available Quantity:", 17, 3415, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03163, "", 130, 3412, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02164, "Quantity On-Order:", 11, 3436, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03164, "", 130, 3433, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02165, "Gross Required:", 33, 3457, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03165, "", 130, 3454, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02166, "Net Required:", 48, 3478, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03166, "", 130, 3475, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02167, "Planned Release Qty on PO/WO:", 0, 3499, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03167, "", 130, 3496, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02168, "Planned Receipt Qty on PO/WO:", 0, 3520, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03168, "", 130, 3517, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02169, "Available Quantity:", 17, 3541, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03169, "", 130, 3538, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02170, "Quantity On-Order:", 11, 3562, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03170, "", 130, 3559, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02171, "Gross Required:", 33, 3583, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03171, "", 130, 3580, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02172, "Net Required:", 48, 3604, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03172, "", 130, 3601, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02173, "Planned Release Qty on PO/WO:", 0, 3625, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03173, "", 130, 3622, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02174, "Planned Receipt Qty on PO/WO:", 0, 3646, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03174, "", 130, 3643, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02175, "Available Quantity:", 17, 3667, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03175, "", 130, 3664, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02176, "Quantity On-Order:", 11, 3688, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03176, "", 130, 3685, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02177, "Gross Required:", 33, 3709, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03177, "", 130, 3706, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02178, "Net Required:", 48, 3730, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03178, "", 130, 3727, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02179, "Planned Release Qty on PO/WO:", 0, 3751, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03179, "", 130, 3748, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02180, "Planned Receipt Qty on PO/WO:", 0, 3772, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03180, "", 130, 3769, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02181, "Available Quantity:", 17, 3793, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03181, "", 130, 3790, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02182, "Quantity On-Order:", 11, 3814, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_order"
    END
    INPUTN 03182, "", 130, 3811, 64, 19
    BEGIN
        NAME "inn_qty_on_order"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02183, "Gross Required:", 33, 3835, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gross_req"
    END
    INPUTN 03183, "", 130, 3832, 64, 19
    BEGIN
        NAME "inn_gross_req"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02184, "Net Required:", 48, 3856, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_required"
    END
    INPUTN 03184, "", 130, 3853, 64, 19
    BEGIN
        NAME "inn_net_required"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02185, "Planned Release Qty on PO/WO:", 0, 3877, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rel"
    END
    INPUTN 03185, "", 130, 3874, 64, 19
    BEGIN
        NAME "inn_planned_rel"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02186, "Planned Receipt Qty on PO/WO:", 0, 3898, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_planned_rec"
    END
    INPUTN 03186, "", 130, 3895, 64, 19
    BEGIN
        NAME "inn_planned_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02187, "Available Quantity:", 17, 3919, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03187, "", 130, 3916, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

