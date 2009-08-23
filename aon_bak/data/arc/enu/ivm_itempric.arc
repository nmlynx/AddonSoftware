//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_ITEMPRIC - Contract Pricing Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0374
BEGIN
    NAME "win_ivm_itempric"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Customer ID:", 50, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 130, 10, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 234, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 208, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Inventory Item ID:", 24, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03002, "", 130, 31, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 416, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 390, 31, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02003, "Comments:", 60, 55, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03003, "", 130, 52, 200, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02004, "Start Date:", 67, 76, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_date"
    END
    
    INPUTD 03004, "", 130, 73, 85, 19
    BEGIN
        NAME "ind_from_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 215, 73, 20, 19
    BEGIN
        NAME "tbnc_from_date"
    END
    
    STATICTEXT 02005, "Stop Date:", 68, 97, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_thru_date"
    END
    
    INPUTD 03005, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_thru_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_thru_date"
    END
    INPUTN 03006, "", 120, 136, 64, 19
    BEGIN
        NAME "inn_break_qty_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03007, "", 290, 136, 64, 19
    BEGIN
        NAME "inn_unit_price_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03008, "", 120, 157, 64, 19
    BEGIN
        NAME "inn_break_qty_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03009, "", 290, 157, 64, 19
    BEGIN
        NAME "inn_unit_price_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03010, "", 120, 178, 64, 19
    BEGIN
        NAME "inn_break_qty_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03011, "", 290, 178, 64, 19
    BEGIN
        NAME "inn_unit_price_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03012, "", 120, 199, 64, 19
    BEGIN
        NAME "inn_break_qty_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03013, "", 290, 199, 64, 19
    BEGIN
        NAME "inn_unit_price_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03014, "", 120, 220, 64, 19
    BEGIN
        NAME "inn_break_qty_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03015, "", 290, 220, 64, 19
    BEGIN
        NAME "inn_unit_price_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03016, "", 120, 241, 64, 19
    BEGIN
        NAME "inn_break_qty_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03017, "", 290, 241, 64, 19
    BEGIN
        NAME "inn_unit_price_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03018, "", 120, 262, 64, 19
    BEGIN
        NAME "inn_break_qty_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03019, "", 290, 262, 64, 19
    BEGIN
        NAME "inn_unit_price_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03020, "", 120, 283, 64, 19
    BEGIN
        NAME "inn_break_qty_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03021, "", 290, 283, 64, 19
    BEGIN
        NAME "inn_unit_price_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03022, "", 120, 304, 64, 19
    BEGIN
        NAME "inn_break_qty_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03023, "", 290, 304, 64, 19
    BEGIN
        NAME "inn_unit_price_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03024, "", 120, 325, 64, 19
    BEGIN
        NAME "inn_break_qty_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03025, "", 290, 325, 64, 19
    BEGIN
        NAME "inn_unit_price_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Quantity", 120, 118, 46, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_cqty"
    END
    
    STATICTEXT 02027, "Price", 290, 118, 26, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_cprc"
    END
    
    STATICTEXT 02028, "1", 90, 139, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l1"
    END
    
    STATICTEXT 02029, "2", 90, 160, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l2"
    END
    
    STATICTEXT 02030, "3", 90, 181, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l3"
    END
    
    STATICTEXT 02031, "4", 90, 202, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l4"
    END
    
    STATICTEXT 02032, "5", 90, 223, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l5"
    END
    
    STATICTEXT 02033, "6", 90, 244, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l6"
    END
    
    STATICTEXT 02034, "7", 90, 265, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l7"
    END
    
    STATICTEXT 02035, "8", 90, 286, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l8"
    END
    
    STATICTEXT 02036, "9", 90, 307, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l9"
    END
    
    STATICTEXT 02037, "10", 90, 328, 14, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l10"
    END
END

