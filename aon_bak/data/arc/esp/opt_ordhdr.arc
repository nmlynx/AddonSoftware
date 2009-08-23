//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPT_ORDHDR - Invoice History Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0884
BEGIN
    NAME "win_opt_ordhdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del cliente:", 75, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 260, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 234, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Número de factura de AR:", 3, 34, 150, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no"
    END
    
    INPUTE 03002, "", 156, 31, 91, 19
    BEGIN
        NAME "ine_ar_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 02003, "Tipo de factura:", 61, 55, 92, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_type"
    END
    
    LISTBUTTON 03003, "", 156, 52, 116, 300
    BEGIN
        NAME "lbx_invoice_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Order Or Invoice:", 51, 76, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ordinv_flag"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_ordinv_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02005, "Backorder Flag:", 63, 97, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_backord_flag"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_backord_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02006, "Medio de envío al cliente:", 7, 118, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_ship_via"
    END
    
    INPUTE 03006, "", 156, 115, 100, 19
    BEGIN
        NAME "ine_ar_ship_via"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02007, "Sales Order Number:", 31, 139, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_no"
    END
    
    INPUTE 03007, "", 156, 136, 70, 19
    BEGIN
        NAME "ine_order_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02008, "Miscellaneous Number:", 17, 160, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_misc_no"
    END
    
    INPUTE 03008, "", 156, 157, 100, 19
    BEGIN
        NAME "ine_misc_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02009, "Código de vendedor:", 30, 181, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03009, "", 156, 178, 39, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04009, "", 221, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_slspsn_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 195, 178, 20, 19
    BEGIN
        NAME "tbnf_slspsn_code"
    END
    
    STATICTEXT 02010, "Terms Code:", 79, 202, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terms_code"
    END
    
    INPUTE 03010, "", 156, 199, 35, 19
    BEGIN
        NAME "ine_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04010, "", 217, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 191, 199, 20, 19
    BEGIN
        NAME "tbnf_terms_code"
    END
    
    STATICTEXT 02011, "Código de descuento de ventas:", 0, 223, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_code"
    END
    
    INPUTE 03011, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_disc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04011, "", 217, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_disc_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 191, 220, 20, 19
    BEGIN
        NAME "tbnf_disc_code"
    END
    
    STATICTEXT 02012, "Código de distribución:", 15, 244, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03012, "", 156, 241, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04012, "", 217, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 191, 241, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02013, "Print Status:", 83, 265, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_print_status"
    END
    
    INPUTE 03013, "", 156, 262, 35, 19
    BEGIN
        NAME "ine_print_status"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02014, "Lock Status:", 83, 286, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lock_status"
    END
    
    INPUTE 03014, "", 156, 283, 35, 19
    BEGIN
        NAME "ine_lock_status"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02015, "Standard Message Code:", 9, 307, 144, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_message_code"
    END
    
    INPUTE 03015, "", 156, 304, 35, 19
    BEGIN
        NAME "ine_message_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04015, "", 217, 308, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_message_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20015, "", 191, 304, 20, 19
    BEGIN
        NAME "tbnf_message_code"
    END
    
    STATICTEXT 02016, "Código de territorio:", 32, 328, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03016, "", 156, 325, 39, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04016, "", 221, 329, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20016, "", 195, 325, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02017, "List Price Code:", 63, 349, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_price_code"
    END
    
    INPUTE 03017, "", 156, 346, 35, 19
    BEGIN
        NAME "ine_price_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02018, "Código impositivo:", 42, 370, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03018, "", 156, 367, 130, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04018, "", 312, 371, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20018, "", 286, 367, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02019, "Código de fijación de precios del cliente:", 0, 391, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pricing_code"
    END
    
    INPUTE 03019, "", 156, 388, 52, 19
    BEGIN
        NAME "ine_pricing_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUU"
    END
    
    STATICTEXT 04019, "", 234, 392, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pricing_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20019, "", 208, 388, 20, 19
    BEGIN
        NAME "tbnf_pricing_code"
    END
    
    STATICTEXT 02020, "Número de trabajo:", 40, 412, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_job_no"
    END
    
    INPUTE 03020, "", 156, 409, 100, 19
    BEGIN
        NAME "ine_job_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 04020, "", 282, 413, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_job_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20020, "", 256, 409, 20, 19
    BEGIN
        NAME "tbnf_job_no"
    END
    
    STATICTEXT 02021, "Order Taken By:", 60, 433, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_taken_by"
    END
    
    INPUTE 03021, "", 156, 430, 160, 19
    BEGIN
        NAME "ine_ord_taken_by"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    CHECKBOX 03022, "¿Venta en efectivo?", 154, 451, 141, 19
    BEGIN
        NAME "cbx_cash_sale"
        NOT OPAQUE
    END
    
    STATICTEXT 02023, "Reprint Flag:", 80, 475, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reprint_flag"
    END
    
    INPUTE 03023, "", 156, 472, 35, 19
    BEGIN
        NAME "ine_reprint_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02024, "Credit Hold Status:", 43, 496, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_flag"
    END
    
    INPUTE 03024, "", 156, 493, 35, 19
    BEGIN
        NAME "ine_credit_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02025, "Número de destinatario de envío del cliente:", 0, 517, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_no"
    END
    
    INPUTE 03025, "", 156, 514, 60, 19
    BEGIN
        NAME "ine_shipto_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000"
    END
    
    STATICTEXT 04025, "", 242, 518, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_shipto_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20025, "", 216, 514, 20, 19
    BEGIN
        NAME "tbnf_shipto_no"
    END
    
    STATICTEXT 02026, "Customer Purchase Order Number:", 0, 538, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_po_no"
    END
    
    INPUTE 03026, "", 156, 535, 200, 19
    BEGIN
        NAME "ine_customer_po_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02027, "Customer Release Number:", 0, 559, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_rel_no"
    END
    
    INPUTE 03027, "", 156, 556, 200, 19
    BEGIN
        NAME "ine_customer_rel_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02028, "Fecha de la factura:", 40, 580, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_date"
    END
    
    INPUTD 03028, "", 156, 577, 84, 19
    BEGIN
        NAME "ind_invoice_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21028, "", 240, 577, 20, 19
    BEGIN
        NAME "tbnc_invoice_date"
    END
    
    STATICTEXT 02029, "Ship Date:", 95, 601, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipmnt_date"
    END
    
    INPUTD 03029, "", 156, 598, 84, 19
    BEGIN
        NAME "ind_shipmnt_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21029, "", 240, 598, 20, 19
    BEGIN
        NAME "tbnc_shipmnt_date"
    END
    
    STATICTEXT 02030, "Order Date:", 85, 622, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_date"
    END
    
    INPUTD 03030, "", 156, 619, 84, 19
    BEGIN
        NAME "ind_order_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21030, "", 240, 619, 20, 19
    BEGIN
        NAME "tbnc_order_date"
    END
    
    STATICTEXT 02031, "Expiration Date:", 60, 643, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_expire_date"
    END
    
    INPUTD 03031, "", 156, 640, 84, 19
    BEGIN
        NAME "ind_expire_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21031, "", 240, 640, 20, 19
    BEGIN
        NAME "tbnc_expire_date"
    END
    
    STATICTEXT 02032, "Monto impositivo:", 48, 664, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_amount"
    END
    INPUTN 03032, "", 156, 661, 64, 19
    BEGIN
        NAME "inn_tax_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Freight Amount:", 58, 685, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_freight_amt"
    END
    INPUTN 03033, "", 156, 682, 64, 19
    BEGIN
        NAME "inn_freight_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Monto de descuento:", 30, 706, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03034, "", 156, 703, 64, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02035, "Commission Percent:", 29, 727, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_percent"
    END
    INPUTN 03035, "", 156, 724, 64, 19
    BEGIN
        NAME "inn_comm_percent"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02036, "Monto imponible:", 51, 748, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_taxable_amt"
    END
    INPUTN 03036, "", 156, 745, 64, 19
    BEGIN
        NAME "inn_taxable_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02037, "Commission Amount:", 26, 769, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comm_amt"
    END
    INPUTN 03037, "", 156, 766, 64, 19
    BEGIN
        NAME "inn_comm_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02038, "Total Sales Amount:", 37, 790, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_sales"
    END
    INPUTN 03038, "", 156, 787, 64, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02039, "Total Cost Amount:", 39, 811, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_cost"
    END
    INPUTN 03039, "", 156, 808, 64, 19
    BEGIN
        NAME "inn_total_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02040, "Ship To:", 106, 832, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_shipto_type"
    END
    
    LISTBUTTON 03040, "", 156, 829, 116, 300
    BEGIN
        NAME "lbx_shipto_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

