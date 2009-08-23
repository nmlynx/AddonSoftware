//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFW_CLSWOXTY - Closed WO Balances By Type
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0228
BEGIN
    NAME "win_sfw_clswoxty"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Work Order Type:", 24, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02002, "Total Actual Cost:", 23, 34, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_act_cost"
    END
    INPUTN 03002, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_tot_act_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "Prior Closed Amount If Any:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_cls_amt"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_pri_cls_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Total Work In Process Amt:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_wip_amt"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_tot_wip_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Total Closed Amount:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_clsd_amt"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_tot_clsd_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Total Direct Labor Vnce Amount:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_dir_var"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_tot_dir_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Total Material Variance Amount:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_mat_var"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_tot_mat_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Total Subcontract Variance Amt:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_sub_var"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_tot_sub_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Total Overhead Variance Amount:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_ovhd_var"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_tot_ovhd_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

