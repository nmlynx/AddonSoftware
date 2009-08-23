//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVM_ITEMMAST - Inventory Item Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0745 0350
BEGIN
    NAME "win_ivm_itemmast"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_ivm_itemmast", 4, 0055, 0738, 0295
    BEGIN
        NAME "tab_ivm_itemmast"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Master" 0 1100
        TAB "GL Accounts" 1 1101
        TAB "Image" 2 1102
        TAB "Description" 3 1103
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_ivm_itemmast_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_ivm_itemmast_1101"
    END
    
    CHILD-WINDOW 1102, 1102, 10, 88
    BEGIN
        NAME "chp_ivm_itemmast_1102"
    END
    
    CHILD-WINDOW 1103, 1103, 10, 88
    BEGIN
        NAME "chp_ivm_itemmast_1103"
    END
    
    
    STATICTEXT 02001, "Inventory Item ID:", 24, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03001, "", 130, 10, 200, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 02002, "Display Description:", 10, 34, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_display_desc"
    END
    
    INPUTE 03002, "", 130, 31, 400, 19
    BEGIN
        NAME "ine_display_desc"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
END
CHILD-WINDOW 1100 0 0 0735 0273
BEGIN
    NAME "chw_ivm_itemmast_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Product Type:", 46, 13, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03101, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04101, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20101, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02102, "Item Class:", 64, 34, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_class"
    END
    
    INPUTE 03102, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_item_class"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04102, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_class"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20102, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_item_class"
    END
    
    STATICTEXT 02103, "Item Type:", 67, 55, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_type"
    END
    
    INPUTE 03103, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_item_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04103, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20103, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_item_type"
    END
    
    STATICTEXT 02104, "MSRP:", 93, 76, 34, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_msrp"
    END
    INPUTN 03104, "", 130, 73, 56, 19
    BEGIN
        NAME "inn_msrp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02105, "UPC Code:", 66, 97, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_upc_code"
    END
    
    INPUTE 03105, "", 130, 94, 160, 19
    BEGIN
        NAME "ine_upc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02106, "Sale UM:", 389, 13, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_of_sale"
    END
    
    INPUTE 03106, "", 440, 10, 35, 19
    BEGIN
        NAME "ine_unit_of_sale"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02107, "Purch UM:", 378, 34, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_purchase_um"
    END
    
    INPUTE 03107, "", 440, 31, 35, 19
    BEGIN
        NAME "ine_purchase_um"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02108, "Weight:", 395, 55, 42, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_weight"
    END
    INPUTN 03108, "", 440, 52, 56, 19
    BEGIN
        NAME "inn_weight"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0.00"
    END
    
    STATICTEXT 02109, "Conversion Factor:", 325, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_conv_factor"
    END
    INPUTN 03109, "", 440, 73, 56, 19
    BEGIN
        NAME "inn_conv_factor"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02110, "Bar Code:", 381, 97, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bar_code"
    END
    
    INPUTE 03110, "", 440, 94, 160, 19
    BEGIN
        NAME "ine_bar_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02111, "Sales Analysis Level:", 319, 118, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sa_level"
    END
    
    LISTBUTTON 03111, "", 440, 115, 125, 300
    BEGIN
        NAME "lbx_sa_level"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03112, "Taxable?", 518, 10, 81, 19
    BEGIN
        NAME "cbx_taxable_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03113, "Lotted or Serialized Item?", 518, 31, 177, 19
    BEGIN
        NAME "cbx_lotser_item"
        NOT OPAQUE
    END
    
    CHECKBOX 03114, "Inventoried?", 518, 52, 102, 19
    BEGIN
        NAME "cbx_inventoried"
        NOT OPAQUE
    END
    
    GROUPBOX 19115, "Alternate/Superseded/Not Used ", -4, 139, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_alt_sup_flag"
    END
    
    STATICTEXT 02115, "Code:", 33, 160, 34, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sup_flag"
    END
    
    LISTBUTTON 03115, "", 70, 157, 87, 300
    BEGIN
        NAME "lbx_alt_sup_flag"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02116, "Item:", 239, 160, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sup_item"
    END
    
    INPUTE 03116, "", 270, 157, 160, 19
    BEGIN
        NAME "ine_alt_sup_item"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04116, "", 456, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_alt_sup_item"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20116, "", 430, 157, 20, 19
    BEGIN
        NAME "tbnf_alt_sup_item"
    END
    
    GROUPBOX 19117, "Last Transaction Dates ", -4, 181, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_lstrec_date"
    END
    
    STATICTEXT 02117, "Receipt:", 21, 202, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstrec_date"
    END
    
    INPUTD 03117, "", 70, 199, 85, 19
    BEGIN
        NAME "ind_lstrec_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21117, "", 155, 199, 20, 19
    BEGIN
        NAME "tbnc_lstrec_date"
    END
    
    STATICTEXT 02118, "Built:", 39, 223, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstblt_date"
    END
    
    INPUTD 03118, "", 70, 220, 85, 19
    BEGIN
        NAME "ind_lstblt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21118, "", 155, 220, 20, 19
    BEGIN
        NAME "tbnc_lstblt_date"
    END
    
    STATICTEXT 02119, "Sold:", 199, 202, 28, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstsal_date"
    END
    
    INPUTD 03119, "", 230, 199, 85, 19
    BEGIN
        NAME "ind_lstsal_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21119, "", 315, 199, 20, 19
    BEGIN
        NAME "tbnc_lstsal_date"
    END
    
    STATICTEXT 02120, "Issued:", 186, 223, 41, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstiss_date"
    END
    
    INPUTD 03120, "", 230, 220, 85, 19
    BEGIN
        NAME "ind_lstiss_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21120, "", 315, 220, 20, 19
    BEGIN
        NAME "tbnc_lstiss_date"
    END
    
    STATICTEXT 02121, "Adjustment:", 346, 202, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstadj_date"
    END
    
    INPUTD 03121, "", 420, 199, 85, 19
    BEGIN
        NAME "ind_lstadj_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21121, "", 505, 199, 20, 19
    BEGIN
        NAME "tbnc_lstadj_date"
    END
    
    STATICTEXT 02122, "Last Return:", 347, 223, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstret_date"
    END
    
    INPUTD 03122, "", 420, 220, 85, 19
    BEGIN
        NAME "ind_lstret_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21122, "", 505, 220, 20, 19
    BEGIN
        NAME "tbnc_lstret_date"
    END
    
    STATICTEXT 02123, "Transfer In:", 539, 202, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxin_date"
    END
    
    INPUTD 03123, "", 610, 199, 85, 19
    BEGIN
        NAME "ind_lstxin_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21123, "", 695, 199, 20, 19
    BEGIN
        NAME "tbnc_lstxin_date"
    END
    
    STATICTEXT 02124, "Transfer Out:", 528, 223, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstxot_date"
    END
    
    INPUTD 03124, "", 610, 220, 85, 19
    BEGIN
        NAME "ind_lstxot_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21124, "", 695, 220, 20, 19
    BEGIN
        NAME "tbnc_lstxot_date"
    END

END
CHILD-WINDOW 1101 0 0 0735 0273
BEGIN
    NAME "chw_ivm_itemmast_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Inventory Account:", 55, 34, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_inv_acct"
    END
    
    INPUTE 03201, "", 170, 31, 80, 19
    BEGIN
        NAME "ine_gl_inv_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04201, "", 276, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_inv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20201, "", 250, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_inv_acct"
    END
    
    STATICTEXT 02202, "Cost Of Goods Account:", 24, 55, 143, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cogs_acct"
    END
    
    INPUTE 03202, "", 170, 52, 80, 19
    BEGIN
        NAME "ine_gl_cogs_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04202, "", 276, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cogs_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 250, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_cogs_acct"
    END
    
    STATICTEXT 02203, "Purchase To Account:", 39, 76, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pur_acct"
    END
    
    INPUTE 03203, "", 170, 73, 80, 19
    BEGIN
        NAME "ine_gl_pur_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04203, "", 276, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pur_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20203, "", 250, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_pur_acct"
    END
    
    STATICTEXT 02204, "Purchase Price Variance Acct:", 0, 97, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ppv_acct"
    END
    
    INPUTE 03204, "", 170, 94, 80, 19
    BEGIN
        NAME "ine_gl_ppv_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04204, "", 276, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ppv_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20204, "", 250, 94, 20, 19
    BEGIN
        NAME "tbnf_gl_ppv_acct"
    END
    
    STATICTEXT 02205, "Inventory Adjustment Acct:", 7, 118, 160, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_inv_adj"
    END
    
    INPUTE 03205, "", 170, 115, 80, 19
    BEGIN
        NAME "ine_gl_inv_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04205, "", 276, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_inv_adj"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20205, "", 250, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_inv_adj"
    END
    
    STATICTEXT 02206, "COGS Adjustment Account:", 6, 139, 161, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_cogs_adj"
    END
    
    INPUTE 03206, "", 170, 136, 80, 19
    BEGIN
        NAME "ine_gl_cogs_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04206, "", 276, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_cogs_adj"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20206, "", 250, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_cogs_adj"
    END

END
CHILD-WINDOW 1102 0 0 0735 0273
BEGIN
    NAME "chw_ivm_itemmast_1102"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02301, "Image Path:", 60, 13, 67, 177
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_image_path"
    END
    
    INPUTE 03301, "", 130, 10, 182, 19
    BEGIN
        NAME "ine_image_path"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    EDIT 07301, "", 130, 31, 182, 182
    BEGIN
        NAME "img_image_path"
        CLIENTEDGE
        DISABLED
    END
    TOOLBUTTON 20301, "", 310, 31, 20, 19
    BEGIN
        NAME "tbnf_image_path"
    END

END
CHILD-WINDOW 1103 0 0 0735 0273
BEGIN
    NAME "chw_ivm_itemmast_1103"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02401, "Segment Description 1:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_desc_seg_1"
    END
    
    INPUTE 03401, "", 130, 10, 400, 19
    BEGIN
        NAME "ine_item_desc_seg_1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02402, "Segment Description 2:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_desc_seg_2"
    END
    
    INPUTE 03402, "", 130, 31, 400, 19
    BEGIN
        NAME "ine_item_desc_seg_2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    STATICTEXT 02403, "Segment Description 3:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_desc_seg_3"
    END
    
    INPUTE 03403, "", 130, 52, 400, 19
    BEGIN
        NAME "ine_item_desc_seg_3"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END

END

