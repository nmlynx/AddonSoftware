//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVC_PRICCODE - Pricing Table
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0353
BEGIN
    NAME "win_ivc_priccode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Item Class:", 90, 13, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_class"
    END
    
    INPUTE 03001, "", 156, 10, 39, 19
    BEGIN
        NAME "ine_item_class"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 221, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_class"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 195, 10, 20, 19
    BEGIN
        NAME "tbnf_item_class"
    END
    
    STATICTEXT 02002, "Código de fijación de precios del cliente:", 0, 34, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pricing_code"
    END
    
    INPUTE 03002, "", 156, 31, 52, 19
    BEGIN
        NAME "ine_pricing_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUU"
    END
    
    STATICTEXT 04002, "", 234, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pricing_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 208, 31, 20, 19
    BEGIN
        NAME "tbnf_pricing_code"
    END
    
    STATICTEXT 02003, "Descripción:", 80, 55, 73, 16
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
    
    STATICTEXT 02004, "Pricing Method:", 62, 76, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_iv_price_mth"
    END
    
    LISTBUTTON 03004, "", 156, 73, 141, 300
    BEGIN
        NAME "lbx_iv_price_mth"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Quantity", 156, 97, 46, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_pqty"
    END
    INPUTN 03006, "", 156, 115, 80, 19
    BEGIN
        NAME "inn_break_qty_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03007, "", 336, 115, 80, 19
    BEGIN
        NAME "inn_break_disc_01"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03008, "", 156, 136, 80, 19
    BEGIN
        NAME "inn_break_qty_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03009, "", 336, 136, 80, 19
    BEGIN
        NAME "inn_break_disc_02"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03010, "", 156, 157, 80, 19
    BEGIN
        NAME "inn_break_qty_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03011, "", 336, 157, 80, 19
    BEGIN
        NAME "inn_break_disc_03"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03012, "", 156, 178, 80, 19
    BEGIN
        NAME "inn_break_qty_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03013, "", 336, 178, 80, 19
    BEGIN
        NAME "inn_break_disc_04"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03014, "", 156, 199, 80, 19
    BEGIN
        NAME "inn_break_qty_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03015, "", 336, 199, 80, 19
    BEGIN
        NAME "inn_break_disc_05"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03016, "", 156, 220, 80, 19
    BEGIN
        NAME "inn_break_qty_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03017, "", 336, 220, 80, 19
    BEGIN
        NAME "inn_break_disc_06"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03018, "", 156, 241, 80, 19
    BEGIN
        NAME "inn_break_qty_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03019, "", 336, 241, 80, 19
    BEGIN
        NAME "inn_break_disc_07"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03020, "", 156, 262, 80, 19
    BEGIN
        NAME "inn_break_qty_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03021, "", 336, 262, 80, 19
    BEGIN
        NAME "inn_break_disc_08"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03022, "", 156, 283, 80, 19
    BEGIN
        NAME "inn_break_qty_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03023, "", 336, 283, 80, 19
    BEGIN
        NAME "inn_break_disc_09"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03024, "", 156, 304, 80, 19
    BEGIN
        NAME "inn_break_qty_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03025, "", 336, 304, 80, 19
    BEGIN
        NAME "inn_break_disc_10"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Percentage", 336, 97, 59, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_ppct"
    END
    
    STATICTEXT 02027, "1", 132, 118, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l1"
    END
    
    STATICTEXT 02028, "2", 132, 139, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l2"
    END
    
    STATICTEXT 02029, "3", 132, 160, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l3"
    END
    
    STATICTEXT 02030, "4", 132, 181, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l4"
    END
    
    STATICTEXT 02031, "5", 132, 202, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l5"
    END
    
    STATICTEXT 02032, "6", 132, 223, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l6"
    END
    
    STATICTEXT 02033, "7", 132, 244, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l7"
    END
    
    STATICTEXT 02034, "8", 132, 265, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l8"
    END
    
    STATICTEXT 02035, "9", 132, 286, 7, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l9"
    END
    
    STATICTEXT 02036, "10", 132, 307, 14, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_l10"
    END
END

