//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPE_INVHDR - Invoice Entry Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 1000 0487
BEGIN
    NAME "win_ope_invhdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_ope_invhdr", 4, 0055, 0993, 0237
    BEGIN
        NAME "tab_ope_invhdr"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Addresses" 0 1100
        TAB "Miscellaneous" 1 1101
        TAB "Totals" 2 1102
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_ope_invhdr_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_ope_invhdr_1101"
    END
    
    CHILD-WINDOW 1102, 1102, 10, 88
    BEGIN
        NAME "chp_ope_invhdr_1102"
    END
    
    
    STATICTEXT 02001, "Customer ID:", 30, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 110, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 196, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 170, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Order No:", 49, 34, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03002, "", 110, 31, 70, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "Invoice Number:", 222, 34, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no"
    END
    
    INPUTE 03003, "", 320, 31, 56, 19
    BEGIN
        NAME "ine_ar_inv_no"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 02004, "Order Total:", 396, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_tot"
    END
    INPUTN 03004, "", 470, 10, 80, 19
    BEGIN
        NAME "inn_order_tot"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Taken By:", 412, 34, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_taken_by"
    END
    
    INPUTE 03005, "", 470, 31, 160, 19
    BEGIN
        NAME "ine_ord_taken_by"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    INPUTE 03006, "", 670, 10, 240, 19
    BEGIN
        NAME "ine_backordered"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    INPUTE 03007, "", 670, 31, 240, 19
    BEGIN
        NAME "ine_credit_hold"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    CHILD-WINDOW 1109 1109 5 0295
END
CHILD-WINDOW 1100 0 0 0990 0215
BEGIN
    NAME "chw_ope_invhdr_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Ship To:", 60, 13, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_type"
    END
    
    LISTBUTTON 03101, "", 110, 10, 116, 300
    BEGIN
        NAME "lbx_shipto_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    INPUTE 03102, "", 110, 31, 48, 19
    BEGIN
        NAME "ine_shipto_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000"
    END
    
    STATICTEXT 04102, "", 184, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_shipto_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20102, "", 158, 31, 20, 19
    BEGIN
        NAME "tbnf_shipto_no"
    END
    
    INPUTE 03103, "", 180, 31, 240, 19
    BEGIN
        NAME "ine_sname"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02104, "Bill To:", 69, 76, 38, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_badd1"
    END
    
    INPUTE 03104, "", 110, 73, 192, 19
    BEGIN
        NAME "ine_badd1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03105, "", 110, 94, 192, 19
    BEGIN
        NAME "ine_badd2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03106, "", 110, 115, 192, 19
    BEGIN
        NAME "ine_badd3"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03107, "", 110, 136, 192, 19
    BEGIN
        NAME "ine_badd4"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03108, "", 110, 157, 176, 19
    BEGIN
        NAME "ine_bcity"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    INPUTE 03109, "", 290, 157, 35, 19
    BEGIN
        NAME "ine_bstate"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    INPUTE 03110, "", 330, 157, 117, 19
    BEGIN
        NAME "ine_bzip"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02111, "Ship To:", 420, 76, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sadd1"
    END
    
    INPUTE 03111, "", 470, 73, 192, 19
    BEGIN
        NAME "ine_sadd1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03112, "", 470, 94, 192, 19
    BEGIN
        NAME "ine_sadd2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03113, "", 470, 115, 192, 19
    BEGIN
        NAME "ine_sadd3"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03114, "", 470, 136, 192, 19
    BEGIN
        NAME "ine_sadd4"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03115, "", 470, 157, 176, 19
    BEGIN
        NAME "ine_scity"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    INPUTE 03116, "", 650, 157, 35, 19
    BEGIN
        NAME "ine_sstate"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    INPUTE 03117, "", 690, 157, 117, 19
    BEGIN
        NAME "ine_szip"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    CUSTOMEDIT 03118, "", 670, 73, 300, 80
    BEGIN
        NAME "ced_comments"
        CLIENTEDGE
        IGNORETABS
        WORDWRAP
        VSCROLLBAR
        HSCROLLBAR
        READONLY
        NOT TABTRAVERSABLE
    END

END
CHILD-WINDOW 1101 0 0 0990 0215
BEGIN
    NAME "chw_ope_invhdr_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Order Type:", 37, 13, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_type"
    END
    
    LISTBUTTON 03201, "", 110, 10, 75, 300
    BEGIN
        NAME "lbx_invoice_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02202, "Order Date:", 39, 34, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_date"
    END
    
    INPUTD 03202, "", 110, 31, 85, 19
    BEGIN
        NAME "ind_order_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21202, "", 195, 31, 20, 19
    BEGIN
        NAME "tbnc_order_date"
    END
    
    STATICTEXT 02203, "Ship Date:", 49, 55, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipmnt_date"
    END
    
    INPUTD 03203, "", 110, 52, 85, 19
    BEGIN
        NAME "ind_shipmnt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21203, "", 195, 52, 20, 19
    BEGIN
        NAME "tbnc_shipmnt_date"
    END
    
    STATICTEXT 02204, "Expiration Date:", 14, 76, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_expire_date"
    END
    
    INPUTD 03204, "", 110, 73, 85, 19
    BEGIN
        NAME "ind_expire_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21204, "", 195, 73, 20, 19
    BEGIN
        NAME "tbnc_expire_date"
    END
    
    STATICTEXT 02205, "Invoice Date:", 33, 97, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_date"
    END
    
    INPUTD 03205, "", 110, 94, 85, 19
    BEGIN
        NAME "ind_invoice_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21205, "", 195, 94, 20, 19
    BEGIN
        NAME "tbnc_invoice_date"
    END
    
    STATICTEXT 02206, "PO Number:", 37, 118, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_po_no"
    END
    
    INPUTE 03206, "", 110, 115, 160, 19
    BEGIN
        NAME "ine_customer_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02207, "PO Release No:", 271, 13, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_rel_no"
    END
    
    INPUTE 03207, "", 360, 10, 160, 19
    BEGIN
        NAME "ine_customer_rel_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02208, "Misc Number:", 277, 34, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_misc_no"
    END
    
    INPUTE 03208, "", 360, 31, 80, 19
    BEGIN
        NAME "ine_misc_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02209, "Customer Ship Via:", 246, 55, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_ship_via"
    END
    
    INPUTE 03209, "", 360, 52, 80, 19
    BEGIN
        NAME "ine_ar_ship_via"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02210, "Sales Disc Code:", 262, 76, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_code"
    END
    
    INPUTE 03210, "", 360, 73, 35, 19
    BEGIN
        NAME "ine_disc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04210, "", 421, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_disc_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20210, "", 395, 73, 20, 19
    BEGIN
        NAME "tbnf_disc_code"
    END
    
    STATICTEXT 02211, "Terms Code:", 283, 97, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terms_code"
    END
    
    INPUTE 03211, "", 360, 94, 35, 19
    BEGIN
        NAME "ine_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04211, "", 421, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20211, "", 395, 94, 20, 19
    BEGIN
        NAME "tbnf_terms_code"
    END
    
    STATICTEXT 02212, "Distribution Code:", 250, 118, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03212, "", 360, 115, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04212, "", 421, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20212, "", 395, 115, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02213, "Salesperson Code:", 569, 13, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03213, "", 680, 10, 35, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04213, "", 741, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_slspsn_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20213, "", 715, 10, 20, 19
    BEGIN
        NAME "tbnf_slspsn_code"
    END
    
    STATICTEXT 02214, "Standard Message Code:", 533, 34, 144, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_message_code"
    END
    
    INPUTE 03214, "", 680, 31, 35, 19
    BEGIN
        NAME "ine_message_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04214, "", 741, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_message_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20214, "", 715, 31, 20, 19
    BEGIN
        NAME "tbnf_message_code"
    END
    
    STATICTEXT 02215, "Territory Code:", 587, 55, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03215, "", 680, 52, 35, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04215, "", 741, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20215, "", 715, 52, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02216, "Tax Code:", 618, 76, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03216, "", 680, 73, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04216, "", 741, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20216, "", 715, 73, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02217, "List Price Code:", 587, 97, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_price_code"
    END
    
    INPUTE 03217, "", 680, 94, 35, 19
    BEGIN
        NAME "ine_price_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02218, "Job Number:", 605, 118, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_job_no"
    END
    
    INPUTE 03218, "", 680, 115, 80, 19
    BEGIN
        NAME "ine_job_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 04218, "", 786, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_job_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20218, "", 760, 115, 20, 19
    BEGIN
        NAME "tbnf_job_no"
    END

END
CHILD-WINDOW 1102 0 0 0990 0215
BEGIN
    NAME "chw_ope_invhdr_1102"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02301, "Total Sales Amount:", 21, 34, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_sales"
    END
    INPUTN 03301, "", 140, 31, 64, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02302, "Discount Amount:", 31, 55, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03302, "", 140, 52, 64, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02303, "Subtotal:", 86, 76, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_subtotal"
    END
    INPUTN 03303, "", 140, 73, 64, 19
    BEGIN
        NAME "inn_subtotal"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02304, "Taxable Amount:", 37, 97, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_taxable_amt"
    END
    INPUTN 03304, "", 140, 94, 64, 19
    BEGIN
        NAME "inn_taxable_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02305, "Tax Amount:", 62, 118, 75, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_amount"
    END
    INPUTN 03305, "", 140, 115, 64, 19
    BEGIN
        NAME "inn_tax_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02306, "Freight Amount:", 42, 139, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_freight_amt"
    END
    INPUTN 03306, "", 140, 136, 64, 19
    BEGIN
        NAME "inn_freight_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02307, "Net Sales:", 81, 160, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_net_sales"
    END
    INPUTN 03307, "", 140, 157, 64, 19
    BEGIN
        NAME "inn_net_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02308, "Commission Percent:", 263, 97, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_percent"
    END
    INPUTN 03308, "", 390, 94, 56, 19
    BEGIN
        NAME "inn_comm_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02309, "Commission Amount:", 260, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_amt"
    END
    INPUTN 03309, "", 390, 115, 56, 19
    BEGIN
        NAME "inn_comm_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02310, "Total Cost Amount:", 273, 139, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_cost"
    END
    INPUTN 03310, "", 390, 136, 56, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02311, "Aging Amounts", 590, 13, 84, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_aamt"
    END
    
    STATICTEXT 02312, "Future:", 566, 34, 41, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_future"
    END
    INPUTN 03312, "", 610, 31, 64, 19
    BEGIN
        NAME "inn_aging_future"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02313, "Current:", 558, 55, 49, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_cur"
    END
    INPUTN 03313, "", 610, 52, 64, 19
    BEGIN
        NAME "inn_aging_cur"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02314, "30 Days:", 557, 76, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_30"
    END
    INPUTN 03314, "", 610, 73, 64, 19
    BEGIN
        NAME "inn_aging_30"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02315, "60 Days:", 557, 97, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_60"
    END
    INPUTN 03315, "", 610, 94, 64, 19
    BEGIN
        NAME "inn_aging_60"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02316, "90 Days:", 557, 118, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_90"
    END
    INPUTN 03316, "", 610, 115, 64, 19
    BEGIN
        NAME "inn_aging_90"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02317, "120 days:", 550, 139, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_120"
    END
    INPUTN 03317, "", 610, 136, 64, 19
    BEGIN
        NAME "inn_aging_120"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02318, "Total Aging:", 536, 160, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_aging"
    END
    INPUTN 03318, "", 610, 157, 64, 19
    BEGIN
        NAME "inn_tot_aging"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END

END
CHILD-WINDOW 1109 0990 0215
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0988 100
    BEGIN
        NAME "grd_OPE_INVDET"
        CLIENTEDGE
        ROWHEAD 20, 05902
        ROWS 20
        COLUMNHEAD 18, 05901
        USERSIZE
        HORIZLINES
        HSCROLLBAR
        VERTLINES
        VSCROLLBAR
        GRIDROWDEFAULTHEIGHT 18
        COLUMNS 13
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 35
        GRIDCOLTITLE 1, "AR Type [N"
        GRIDCOLWIDTH 2, 35
        GRIDCOLTITLE 2, "Line Cd"
        GRIDCOLWIDTH 3, 35
        GRIDCOLTITLE 3, "Whse ID"
        GRIDCOLWIDTH 4, 160
        GRIDCOLTITLE 4, "Item No."
        GRIDCOLWIDTH 5, 250
        GRIDCOLTITLE 5, "Description"
        GRIDCOLWIDTH 6, 320
        GRIDCOLTITLE 6, "Memo/Non-Stock Desc"
        GRIDCOLWIDTH 7, 56
        GRIDCOLTITLE 7, "Unit Cost"
        GRIDCOLWIDTH 8, 56
        GRIDCOLTITLE 8, "Qty Ord"
        GRIDCOLWIDTH 9, 56
        GRIDCOLTITLE 9, "Unit Price"
        GRIDCOLWIDTH 10, 56
        GRIDCOLTITLE 10, "Back-Ord Qty"
        GRIDCOLWIDTH 11, 56
        GRIDCOLTITLE 11, "Qty Shipped"
        GRIDCOLWIDTH 12, 56
        GRIDCOLTITLE 12, "Ext Price"
    END

END

