//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVS_ABCWHSE - A B C Analysis Totals by Whse
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0207
BEGIN
    NAME "win_ivs_abcwhse"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Warehouse ID:", 70, 13, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 217, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 191, 10, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02002, "Período:", 105, 34, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Año:", 126, 55, 27, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_year"
    END
    
    INPUTE 03003, "", 156, 52, 40, 19
    BEGIN
        NAME "ine_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02004, "Last Run Date:", 70, 76, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_run_date"
    END
    
    INPUTD 03004, "", 156, 73, 85, 19
    BEGIN
        NAME "ind_run_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 241, 73, 20, 19
    BEGIN
        NAME "tbnc_run_date"
    END
    
    STATICTEXT 02005, "ABC Total Value:", 58, 97, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03005, "", 156, 94, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02006, "ABC Total Value:", 58, 118, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03006, "", 156, 115, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02007, "ABC Total Value:", 58, 139, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03007, "", 156, 136, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02008, "Total Number Of Items:", 17, 160, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_items"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_total_items"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

