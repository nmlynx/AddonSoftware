//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVC_PRICCODE - Pricing Table
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0353
BEGIN
    NAME "win_ivc_priccode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Item Class:", 64, 13, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_class"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_item_class"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_class"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_item_class"
    END
    
    STATICTEXT 02002, "Customer Pricing Code:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pricing_code"
    END
    
    INPUTE 03002, "", 130, 31, 52, 19
    BEGIN
        NAME "ine_pricing_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUU"
    END
    
    STATICTEXT 04002, "", 208, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pricing_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 182, 31, 20, 19
    BEGIN
        NAME "tbnf_pricing_code"
    END
    
    STATICTEXT 02003, "Description:", 56, 55, 71, 16
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
    
    STATICTEXT 02004, "Pricing Method:", 36, 76, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_iv_price_mth"
    END
    
    LISTBUTTON 03004, "", 130, 73, 141, 300
    BEGIN
        NAME "lbx_iv_price_mth"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Quantity", 130, 97, 46, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_pqty"
    END
    INPUTN 03006, "", 130, 115, 80, 19
    BEGIN
        NAME "inn_break_qty_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03007, "", 280, 115, 80, 19
    BEGIN
        NAME "inn_break_disc_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03008, "", 130, 136, 80, 19
    BEGIN
        NAME "inn_break_qty_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03009, "", 280, 136, 80, 19
    BEGIN
        NAME "inn_break_disc_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03010, "", 130, 157, 80, 19
    BEGIN
        NAME "inn_break_qty_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03011, "", 280, 157, 80, 19
    BEGIN
        NAME "inn_break_disc_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03012, "", 130, 178, 80, 19
    BEGIN
        NAME "inn_break_qty_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03013, "", 280, 178, 80, 19
    BEGIN
        NAME "inn_break_disc_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03014, "", 130, 199, 80, 19
    BEGIN
        NAME "inn_break_qty_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03015, "", 280, 199, 80, 19
    BEGIN
        NAME "inn_break_disc_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03016, "", 130, 220, 80, 19
    BEGIN
        NAME "inn_break_qty_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03017, "", 280, 220, 80, 19
    BEGIN
        NAME "inn_break_disc_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03018, "", 130, 241, 80, 19
    BEGIN
        NAME "inn_break_qty_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03019, "", 280, 241, 80, 19
    BEGIN
        NAME "inn_break_disc_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03020, "", 130, 262, 80, 19
    BEGIN
        NAME "inn_break_qty_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03021, "", 280, 262, 80, 19
    BEGIN
        NAME "inn_break_disc_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03022, "", 130, 283, 80, 19
    BEGIN
        NAME "inn_break_qty_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03023, "", 280, 283, 80, 19
    BEGIN
        NAME "inn_break_disc_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03024, "", 130, 304, 80, 19
    BEGIN
        NAME "inn_break_qty_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03025, "", 280, 304, 80, 19
    BEGIN
        NAME "inn_break_disc_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Percentage", 280, 97, 59, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_ppct"
    END
    
    STATICTEXT 02027, "1", 110, 118, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l1"
    END
    
    STATICTEXT 02028, "2", 110, 139, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l2"
    END
    
    STATICTEXT 02029, "3", 110, 160, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l3"
    END
    
    STATICTEXT 02030, "4", 110, 181, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l4"
    END
    
    STATICTEXT 02031, "5", 110, 202, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l5"
    END
    
    STATICTEXT 02032, "6", 110, 223, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l6"
    END
    
    STATICTEXT 02033, "7", 110, 244, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l7"
    END
    
    STATICTEXT 02034, "8", 110, 265, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l8"
    END
    
    STATICTEXT 02035, "9", 110, 286, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l9"
    END
    
    STATICTEXT 02036, "10", 110, 307, 14, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l10"
    END
END

