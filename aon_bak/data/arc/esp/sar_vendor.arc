//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SAR_VENDOR - Sales Analysis by Vendor
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0357
BEGIN
    NAME "win_sar_vendor"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Período actual:", 67, 13, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Año actual:", 87, 34, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02003, "Sales Analysis Level:", 35, 55, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sa_level"
    END
    
    LISTBUTTON 03003, "", 156, 52, 94, 300
    BEGIN
        NAME "lbx_sa_level"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Sales Analysis Sequence:", 8, 76, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_seq_sa"
    END
    
    LISTBUTTON 03004, "", 156, 73, 85, 300
    BEGIN
        NAME "lbx_seq_sa"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Beginning ID del proveedor:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03005, "", 156, 94, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04005, "", 230, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 204, 94, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02006, "Ending ID del proveedor:", 8, 118, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03006, "", 156, 115, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04006, "", 230, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 204, 115, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02007, "Beginning Product Type:", 10, 139, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03007, "", 156, 136, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04007, "", 217, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 191, 136, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02008, "Ending Product Type:", 28, 160, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03008, "", 156, 157, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04008, "", 217, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 191, 157, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02009, "Beginning Item ID:", 48, 181, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03009, "", 156, 178, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04009, "", 342, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 316, 178, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02010, "Ending Item ID:", 65, 202, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03010, "", 156, 199, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04010, "", 342, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 316, 199, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    CHECKBOX 03011, "12 Period Report", 154, 220, 129, 19
    BEGIN
        NAME "cbx_twlve_per_report"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Sales or Units:", 70, 244, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sales_units"
    END
    
    LISTBUTTON 03012, "", 156, 241, 60, 300
    BEGIN
        NAME "lbx_sales_units"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03013, "MTD", 154, 262, 56, 19
    BEGIN
        NAME "cbx_mtd"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "YTD", 226, 262, 54, 19
    BEGIN
        NAME "cbx_ytd"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Prior", 298, 262, 58, 19
    BEGIN
        NAME "cbx_prior"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "¿Salto de página?", 154, 283, 130, 19
    BEGIN
        NAME "cbx_page_break"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "Include 0 Sales Lines?", 154, 304, 156, 19
    BEGIN
        NAME "cbx_inc_zero_sls"
        NOT OPAQUE
    END
END

