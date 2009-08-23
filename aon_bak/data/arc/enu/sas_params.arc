//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SAS_PARAMS - Sales Analysis Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0454 0296
BEGIN
    NAME "win_sas_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Sales Analysis Options", 130, 13, 121, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_saop"
    END
    
    CHECKBOX 03002, "By Customer", 128, 31, 104, 19
    BEGIN
        NAME "cbx_by_customer"
        NOT OPAQUE
    END
    
    LISTBUTTON 03003, "", 290, 31, 88, 300
    BEGIN
        NAME "lbx_customer_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03004, "By Territory", 128, 52, 99, 19
    BEGIN
        NAME "cbx_by_territory"
        NOT OPAQUE
    END
    
    LISTBUTTON 03005, "", 290, 52, 83, 300
    BEGIN
        NAME "lbx_terrcode_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03006, "By Salesperson", 128, 73, 118, 19
    BEGIN
        NAME "cbx_by_salespsn"
        NOT OPAQUE
    END
    
    LISTBUTTON 03007, "", 290, 73, 100, 300
    BEGIN
        NAME "lbx_salespsn_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03008, "By Cust Type", 128, 94, 105, 19
    BEGIN
        NAME "cbx_by_customer_type"
        NOT OPAQUE
    END
    
    LISTBUTTON 03009, "", 290, 94, 117, 300
    BEGIN
        NAME "lbx_custtype_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03010, "By Ship-To", 128, 115, 93, 19
    BEGIN
        NAME "cbx_by_shipto"
        NOT OPAQUE
    END
    
    LISTBUTTON 03011, "", 290, 115, 134, 300
    BEGIN
        NAME "lbx_shipto_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03012, "By SIC", 128, 136, 65, 19
    BEGIN
        NAME "cbx_by_sic_code"
        NOT OPAQUE
    END
    
    LISTBUTTON 03013, "", 290, 136, 108, 300
    BEGIN
        NAME "lbx_sic_code_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03014, "By Product", 128, 157, 92, 19
    BEGIN
        NAME "cbx_by_product"
        NOT OPAQUE
    END
    
    LISTBUTTON 03015, "", 290, 157, 77, 300
    BEGIN
        NAME "lbx_product_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03016, "By Warehouse", 128, 178, 111, 19
    BEGIN
        NAME "cbx_by_whse"
        NOT OPAQUE
    END
    
    LISTBUTTON 03017, "", 290, 178, 94, 300
    BEGIN
        NAME "lbx_whse_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03018, "By Vendor", 128, 199, 89, 19
    BEGIN
        NAME "cbx_by_vendor"
        NOT OPAQUE
    END
    
    LISTBUTTON 03019, "", 290, 199, 77, 300
    BEGIN
        NAME "lbx_vendor_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03020, "By Dist Code", 128, 220, 103, 19
    BEGIN
        NAME "cbx_by_dist_code"
        NOT OPAQUE
    END
    
    LISTBUTTON 03021, "", 290, 220, 130, 300
    BEGIN
        NAME "lbx_distcode_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03022, "By Non-Stock", 128, 241, 109, 19
    BEGIN
        NAME "cbx_by_nonstock"
        NOT OPAQUE
    END
    
    LISTBUTTON 03023, "", 290, 241, 118, 300
    BEGIN
        NAME "lbx_nonstock_lev"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02024, "Detail Level", 290, 13, 60, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_sadt"
    END
END

