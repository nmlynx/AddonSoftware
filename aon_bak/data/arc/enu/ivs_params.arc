//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVS_PARAMS - IV Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0716 0333
BEGIN
    NAME "win_ivs_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Item Number Size:", 22, 13, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id_len"
    END
    INPUTN 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "inn_item_id_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
    
    STATICTEXT 02002, "Vendor Product Size:", 5, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_prd_len"
    END
    INPUTN 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "inn_vendor_prd_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
    
    STATICTEXT 02003, "Use Auto Numbering?:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_auto_no_iv"
    END
    
    LISTBUTTON 03003, "", 130, 52, 143, 300
    BEGIN
        NAME "lbx_auto_no_iv"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Precision:", 70, 76, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_precision"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_precision"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0"
    END
    
    STATICTEXT 02005, "Lotted/Serialized:", 24, 97, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lotser_flag"
    END
    
    LISTBUTTON 03005, "", 130, 94, 86, 300
    BEGIN
        NAME "lbx_lotser_flag"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Lot/Serial Number Length:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ls_no_len"
    END
    INPUTN 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "inn_ls_no_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
    
    STATICTEXT 02007, "LIFO/FIFO Code:", 31, 139, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lifofifo"
    END
    
    LISTBUTTON 03007, "", 130, 136, 74, 300
    BEGIN
        NAME "lbx_lifofifo"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02008, "Inventory Costing Method:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_method"
    END
    
    LISTBUTTON 03008, "", 130, 157, 103, 300
    BEGIN
        NAME "lbx_cost_method"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02009, "Current Period:", 37, 181, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03009, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02010, "Current Year:", 48, 202, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03010, "", 130, 199, 35, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02011, "Number of Labels Across:", 266, 76, 151, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03011, "", 420, 73, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02012, "Vertical Lines Per Label:", 280, 97, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03012, "", 420, 94, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02013, "Horizontal Chars Per Label:", 258, 118, 159, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03013, "", 420, 115, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03014, "Multiple Warehouses?", 418, 157, 156, 19
    BEGIN
        NAME "cbx_multi_whse"
        NOT OPAQUE
    END
    
    STATICTEXT 02015, "Default Whse ID:", 323, 181, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03015, "", 420, 178, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04015, "", 481, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20015, "", 455, 178, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    GROUPBOX 19016, "Item Description ", -4, 223, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_desc_len"
    END
    
    STATICTEXT 02016, "Description Length:", 32, 244, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_desc_len"
    END
    
    INPUTE 03016, "", 150, 241, 35, 19
    BEGIN
        NAME "ine_desc_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02017, "Description Length:", 32, 265, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_desc_len"
    END
    
    INPUTE 03017, "", 150, 262, 35, 19
    BEGIN
        NAME "ine_desc_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02018, "Description Length:", 32, 286, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_desc_len"
    END
    
    INPUTE 03018, "", 150, 283, 35, 19
    BEGIN
        NAME "ine_desc_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02019, "Description:", 206, 244, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_desc_lb"
    END
    
    INPUTE 03019, "", 280, 241, 96, 19
    BEGIN
        NAME "ine_user_desc_lb"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02020, "Description:", 206, 265, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_desc_lb"
    END
    
    INPUTE 03020, "", 280, 262, 96, 19
    BEGIN
        NAME "ine_user_desc_lb"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02021, "Description:", 206, 286, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_desc_lb"
    END
    
    INPUTE 03021, "", 280, 283, 96, 19
    BEGIN
        NAME "ine_user_desc_lb"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
END

