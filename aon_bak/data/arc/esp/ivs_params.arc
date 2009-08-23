//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVS_PARAMS - IV Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0800 0333
BEGIN
    NAME "win_ivs_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Item Number Size:", 48, 13, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id_len"
    END
    INPUTN 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "inn_item_id_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
    
    STATICTEXT 02002, "Vendor Product Size:", 31, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_prd_len"
    END
    INPUTN 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "inn_vendor_prd_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
    
    STATICTEXT 02003, "Use Auto Numbering?:", 21, 55, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_auto_no_iv"
    END
    
    LISTBUTTON 03003, "", 156, 52, 143, 300
    BEGIN
        NAME "lbx_auto_no_iv"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Precision:", 96, 76, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_precision"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_precision"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    STATICTEXT 02005, "Lotted/Serialized:", 50, 97, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lotser_flag"
    END
    
    LISTBUTTON 03005, "", 156, 94, 86, 300
    BEGIN
        NAME "lbx_lotser_flag"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Lot/Serial Number Length:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ls_no_len"
    END
    INPUTN 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "inn_ls_no_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
    
    STATICTEXT 02007, "LIFO/FIFO Code:", 57, 139, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lifofifo"
    END
    
    LISTBUTTON 03007, "", 156, 136, 74, 300
    BEGIN
        NAME "lbx_lifofifo"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02008, "Inventory Costing Method:", 0, 160, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_method"
    END
    
    LISTBUTTON 03008, "", 156, 157, 103, 300
    BEGIN
        NAME "lbx_cost_method"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02009, "Período actual:", 67, 181, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03009, "", 156, 178, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02010, "Año actual:", 87, 202, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03010, "", 156, 199, 35, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02011, "Cantidad de etiquetas a lo largo:", 312, 76, 189, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03011, "", 504, 73, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02012, "Líneas verticales por etiqueta:", 327, 97, 174, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03012, "", 504, 94, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02013, "Caracteres horizontales por etiqueta:", 283, 118, 218, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03013, "", 504, 115, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03014, "Multiple Warehouses?", 502, 157, 156, 19
    BEGIN
        NAME "cbx_multi_whse"
        NOT OPAQUE
    END
    
    STATICTEXT 02015, "Default Whse ID:", 407, 181, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03015, "", 504, 178, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04015, "", 565, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20015, "", 539, 178, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    GROUPBOX 19016, "Item Description ", -4, 223, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_desc_len"
    END
    
    STATICTEXT 02016, "Description Length:", 62, 244, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_desc_len"
    END
    
    INPUTE 03016, "", 180, 241, 35, 19
    BEGIN
        NAME "ine_desc_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02017, "Description Length:", 62, 265, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_desc_len"
    END
    
    INPUTE 03017, "", 180, 262, 35, 19
    BEGIN
        NAME "ine_desc_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02018, "Description Length:", 62, 286, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_desc_len"
    END
    
    INPUTE 03018, "", 180, 283, 35, 19
    BEGIN
        NAME "ine_desc_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02019, "Description:", 262, 244, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_desc_lb"
    END
    
    INPUTE 03019, "", 336, 241, 96, 19
    BEGIN
        NAME "ine_user_desc_lb"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02020, "Description:", 262, 265, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_desc_lb"
    END
    
    INPUTE 03020, "", 336, 262, 96, 19
    BEGIN
        NAME "ine_user_desc_lb"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02021, "Description:", 262, 286, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_desc_lb"
    END
    
    INPUTE 03021, "", 336, 283, 96, 19
    BEGIN
        NAME "ine_user_desc_lb"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
END

