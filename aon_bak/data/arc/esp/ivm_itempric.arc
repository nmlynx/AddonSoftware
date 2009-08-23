//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_ITEMPRIC - Contract Pricing Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0466 0374
BEGIN
    NAME "win_ivm_itempric"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del cliente:", 75, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 260, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 234, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Inventory Item ID:", 50, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03002, "", 156, 31, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 442, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 416, 31, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02003, "Comments:", 86, 55, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03003, "", 156, 52, 200, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02004, "Start Date:", 93, 76, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_date"
    END
    
    INPUTD 03004, "", 156, 73, 85, 19
    BEGIN
        NAME "ind_from_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 241, 73, 20, 19
    BEGIN
        NAME "tbnc_from_date"
    END
    
    STATICTEXT 02005, "Stop Date:", 94, 97, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_thru_date"
    END
    
    INPUTD 03005, "", 156, 94, 85, 19
    BEGIN
        NAME "ind_thru_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 241, 94, 20, 19
    BEGIN
        NAME "tbnc_thru_date"
    END
    INPUTN 03006, "", 144, 136, 64, 19
    BEGIN
        NAME "inn_break_qty_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03007, "", 348, 136, 64, 19
    BEGIN
        NAME "inn_unit_price_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03008, "", 144, 157, 64, 19
    BEGIN
        NAME "inn_break_qty_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03009, "", 348, 157, 64, 19
    BEGIN
        NAME "inn_unit_price_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03010, "", 144, 178, 64, 19
    BEGIN
        NAME "inn_break_qty_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03011, "", 348, 178, 64, 19
    BEGIN
        NAME "inn_unit_price_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03012, "", 144, 199, 64, 19
    BEGIN
        NAME "inn_break_qty_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03013, "", 348, 199, 64, 19
    BEGIN
        NAME "inn_unit_price_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03014, "", 144, 220, 64, 19
    BEGIN
        NAME "inn_break_qty_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03015, "", 348, 220, 64, 19
    BEGIN
        NAME "inn_unit_price_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03016, "", 144, 241, 64, 19
    BEGIN
        NAME "inn_break_qty_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03017, "", 348, 241, 64, 19
    BEGIN
        NAME "inn_unit_price_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03018, "", 144, 262, 64, 19
    BEGIN
        NAME "inn_break_qty_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03019, "", 348, 262, 64, 19
    BEGIN
        NAME "inn_unit_price_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03020, "", 144, 283, 64, 19
    BEGIN
        NAME "inn_break_qty_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03021, "", 348, 283, 64, 19
    BEGIN
        NAME "inn_unit_price_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03022, "", 144, 304, 64, 19
    BEGIN
        NAME "inn_break_qty_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03023, "", 348, 304, 64, 19
    BEGIN
        NAME "inn_unit_price_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03024, "", 144, 325, 64, 19
    BEGIN
        NAME "inn_break_qty_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03025, "", 348, 325, 64, 19
    BEGIN
        NAME "inn_unit_price_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Quantity", 144, 118, 46, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_cqty"
    END
    
    STATICTEXT 02027, "Price", 348, 118, 26, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_cprc"
    END
    
    STATICTEXT 02028, "1", 108, 139, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l1"
    END
    
    STATICTEXT 02029, "2", 108, 160, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l2"
    END
    
    STATICTEXT 02030, "3", 108, 181, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l3"
    END
    
    STATICTEXT 02031, "4", 108, 202, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l4"
    END
    
    STATICTEXT 02032, "5", 108, 223, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l5"
    END
    
    STATICTEXT 02033, "6", 108, 244, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l6"
    END
    
    STATICTEXT 02034, "7", 108, 265, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l7"
    END
    
    STATICTEXT 02035, "8", 108, 286, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l8"
    END
    
    STATICTEXT 02036, "9", 108, 307, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l9"
    END
    
    STATICTEXT 02037, "10", 108, 328, 14, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l10"
    END
END

