//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POR_POCASHREQMT - PO Cash Requirements Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0149
BEGIN
    NAME "win_por_pocashreqmt"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Fecha de antigüedad:", 29, 13, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_date"
    END
    
    INPUTD 03001, "", 156, 10, 85, 19
    BEGIN
        NAME "ind_aging_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 241, 10, 20, 19
    BEGIN
        NAME "tbnc_aging_date"
    END
    
    STATICTEXT 02002, "Period or Days:", 64, 34, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_option"
    END
    
    LISTBUTTON 03002, "", 156, 31, 70, 300
    BEGIN
        NAME "lbx_report_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Número:", 103, 55, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_integer"
    END
    INPUTN 03003, "", 156, 52, 56, 19
    BEGIN
        NAME "inn_pick_integer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "-#####0"
    END
    
    STATICTEXT 02004, "Warehouse ID:", 70, 76, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 217, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 191, 73, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02005, "Resumen o detalle:", 43, 97, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_summ_det"
    END
    
    LISTBUTTON 03005, "", 156, 94, 85, 300
    BEGIN
        NAME "lbx_report_summ_det"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

