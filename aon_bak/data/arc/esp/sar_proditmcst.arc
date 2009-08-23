//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SAR_PRODITMCST - S/A By Product/Item/Customer
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0357
BEGIN
    NAME "win_sar_proditmcst"
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
    
    STATICTEXT 02005, "Beginning Product Type:", 10, 97, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02006, "Ending Product Type:", 28, 118, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04006, "", 217, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 191, 115, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02007, "Beginning Item ID:", 48, 139, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03007, "", 156, 136, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 342, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 316, 136, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02008, "Ending Item ID:", 65, 160, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03008, "", 156, 157, 160, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 342, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 316, 157, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02009, "Beginning ID del cliente:", 14, 181, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03009, "", 156, 178, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04009, "", 230, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 204, 178, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02010, "Ending ID del cliente:", 31, 202, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03010, "", 156, 199, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04010, "", 230, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 204, 199, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
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

