//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVS_ABCITEM - A B C Analysis Totals by Item
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0186
BEGIN
    NAME "win_ivs_abcitem"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Period:", 87, 13, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Year:", 98, 34, 29, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_year"
    END
    
    INPUTE 03002, "", 130, 31, 40, 19
    BEGIN
        NAME "ine_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02003, "Last Run Date:", 44, 55, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_run_date"
    END
    
    INPUTD 03003, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_run_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_run_date"
    END
    
    STATICTEXT 02004, "ABC Total Value:", 32, 76, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03004, "", 130, 73, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02005, "ABC Total Value:", 32, 97, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03005, "", 130, 94, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02006, "ABC Total Value:", 32, 118, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_abc_total_value"
    END
    INPUTN 03006, "", 130, 115, 136, 19
    BEGIN
        NAME "inn_abc_total_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###########.0000-"
    END
    
    STATICTEXT 02007, "Total Number Of Items:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_items"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_total_items"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

