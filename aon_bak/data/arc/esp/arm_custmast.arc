//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARM_CUSTMAST - Customer Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0824 0434
BEGIN
    NAME "win_arm_custmast"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_arm_custmast", 4, 0055, 0817, 0379
    BEGIN
        NAME "tab_arm_custmast"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Nombre y domicilio" 0 1100
        TAB "Perfil" 1 1101
        TAB "Resumen de antigüedad y ventas" 2 1102
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_arm_custmast_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_arm_custmast_1101"
    END
    
    CHILD-WINDOW 1102, 1102, 10, 88
    BEGIN
        NAME "chp_arm_custmast_1102"
    END
    
    
    STATICTEXT 02001, "ID del cliente:", 75, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 02002, "Nombre del cliente:", 40, 34, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_name"
    END
    
    INPUTE 03002, "", 156, 31, 240, 19
    BEGIN
        NAME "ine_customer_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
END
CHILD-WINDOW 1100 0 0 0814 0357
BEGIN
    NAME "chw_arm_custmast_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Domicilio:", 95, 13, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_1"
    END
    
    INPUTE 03101, "", 156, 10, 192, 19
    BEGIN
        NAME "ine_addr_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03102, "", 156, 31, 192, 19
    BEGIN
        NAME "ine_addr_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03103, "", 156, 52, 192, 19
    BEGIN
        NAME "ine_addr_line_3"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03104, "", 156, 73, 192, 19
    BEGIN
        NAME "ine_addr_line_4"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02105, "Ciudad:", 108, 97, 45, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_city"
    END
    
    INPUTE 03105, "", 156, 94, 176, 19
    BEGIN
        NAME "ine_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02106, "Calle:", 122, 118, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_state_code"
    END
    
    INPUTE 03106, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_state_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02107, "Código postal:", 188, 118, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_zip_code"
    END
    
    INPUTE 03107, "", 276, 115, 80, 19
    BEGIN
        NAME "ine_zip_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02108, "País:", 127, 139, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_country"
    END
    
    INPUTE 03108, "", 156, 136, 192, 19
    BEGIN
        NAME "ine_country"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02109, "Número de teléfono:", 34, 181, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_no"
    END
    
    INPUTE 03109, "", 156, 178, 112, 19
    BEGIN
        NAME "ine_phone_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02110, "Int.:", 311, 181, 22, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_exten"
    END
    
    INPUTE 03110, "", 336, 178, 35, 19
    BEGIN
        NAME "ine_phone_exten"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02111, "Número de fax:", 63, 202, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_no"
    END
    
    INPUTE 03111, "", 156, 199, 112, 19
    BEGIN
        NAME "ine_fax_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02112, "Nombre de contacto:", 30, 223, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contact_name"
    END
    
    INPUTE 03112, "", 156, 220, 160, 19
    BEGIN
        NAME "ine_contact_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02113, "Secuencia alternativa:", 435, 13, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03113, "", 564, 10, 80, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02114, "Fecha de apertura:", 453, 55, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_opened_date"
    END
    
    INPUTD 03114, "", 564, 52, 85, 19
    BEGIN
        NAME "ind_opened_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21114, "", 649, 52, 20, 19
    BEGIN
        NAME "tbnc_opened_date"
    END
    
    STATICTEXT 02115, "Medio de envío al cliente:", 415, 76, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_ship_via"
    END
    
    INPUTE 03115, "", 564, 73, 80, 19
    BEGIN
        NAME "ine_ar_ship_via"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02116, "Libre a bordo [FOB]:", 444, 97, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fob"
    END
    
    INPUTE 03116, "", 564, 94, 120, 19
    BEGIN
        NAME "ine_fob"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02117, "Número de reventa:", 446, 118, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resale_no"
    END
    
    INPUTE 03117, "", 564, 115, 160, 19
    BEGIN
        NAME "ine_resale_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02118, "Número de DB:", 475, 139, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_db_no"
    END
    
    INPUTE 03118, "", 564, 136, 72, 19
    BEGIN
        NAME "ine_db_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02119, "Código de SIC:", 476, 160, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sic_code"
    END
    
    INPUTE 03119, "", 564, 157, 64, 19
    BEGIN
        NAME "ine_sic_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    CHECKBOX 03120, "¿Retener?", 562, 178, 86, 19
    BEGIN
        NAME "cbx_retain_cust"
        NOT OPAQUE
    END

END
CHILD-WINDOW 1101 0 0 0814 0357
BEGIN
    NAME "chw_arm_custmast_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Tipo de cliente:", 64, 13, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_type"
    END
    
    INPUTE 03201, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_customer_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04201, "", 217, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20201, "", 191, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_type"
    END
    
    STATICTEXT 02202, "Código de vendedor:", 30, 34, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03202, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04202, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_slspsn_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_slspsn_code"
    END
    
    STATICTEXT 02203, "Código de condiciones:", 15, 55, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03203, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04203, "", 217, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20203, "", 191, 52, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02204, "Código de condiciones de flete:", 0, 76, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_frt_terms"
    END
    
    INPUTE 03204, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_frt_terms"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04204, "", 217, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_frt_terms"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20204, "", 191, 73, 20, 19
    BEGIN
        NAME "tbnf_frt_terms"
    END
    
    STATICTEXT 02205, "Código de territorio:", 32, 97, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03205, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04205, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20205, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02206, "Código de distribución:", 15, 118, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03206, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04206, "", 217, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20206, "", 191, 115, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02207, "Message Code:", 65, 139, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_message_code"
    END
    
    INPUTE 03207, "", 156, 136, 35, 19
    BEGIN
        NAME "ine_message_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04207, "", 217, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_message_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20207, "", 191, 136, 20, 19
    BEGIN
        NAME "tbnf_message_code"
    END
    
    STATICTEXT 02208, "Código de fijación de precios del cliente:", 0, 160, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pricing_code"
    END
    
    INPUTE 03208, "", 156, 157, 35, 19
    BEGIN
        NAME "ine_pricing_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUU"
    END
    
    STATICTEXT 04208, "", 217, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pricing_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20208, "", 191, 157, 20, 19
    BEGIN
        NAME "tbnf_pricing_code"
    END
    
    STATICTEXT 02209, "Código de descuento de ventas:", 0, 181, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_code"
    END
    
    INPUTE 03209, "", 156, 178, 35, 19
    BEGIN
        NAME "ine_disc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04209, "", 217, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_disc_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20209, "", 191, 178, 20, 19
    BEGIN
        NAME "tbnf_disc_code"
    END
    
    STATICTEXT 02210, "Código de etiqueta:", 39, 202, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_code"
    END
    
    INPUTE 03210, "", 156, 199, 35, 19
    BEGIN
        NAME "ine_label_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02211, "Código impositivo:", 414, 13, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03211, "", 528, 10, 70, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04211, "", 624, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20211, "", 598, 10, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02212, "Código del ciclo:", 428, 34, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_cyclecode"
    END
    
    INPUTE 03212, "", 528, 31, 35, 19
    BEGIN
        NAME "ine_ar_cyclecode"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04212, "", 589, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_cyclecode"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20212, "", 563, 31, 20, 19
    BEGIN
        NAME "tbnf_ar_cyclecode"
    END
    
    STATICTEXT 02213, "Análisis de ventas:", 417, 55, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sa_flag"
    END
    
    LISTBUTTON 03213, "", 528, 52, 113, 300
    BEGIN
        NAME "lbx_sa_flag"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02214, "Límite de crédito:", 424, 76, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_limit"
    END
    INPUTN 03214, "", 528, 73, 64, 19
    BEGIN
        NAME "inn_credit_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02215, "Suspensión del crédito:", 388, 97, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cred_hold"
    END
    
    LISTBUTTON 03215, "", 528, 94, 100, 300
    BEGIN
        NAME "lbx_cred_hold"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    CHECKBOX 03216, "¿Cargo financiero?", 526, 136, 140, 19
    BEGIN
        NAME "cbx_finance_chg"
        NOT OPAQUE
    END
    
    CHECKBOX 03217, "¿Estados?", 526, 157, 87, 19
    BEGIN
        NAME "cbx_statements"
        NOT OPAQUE
    END
    
    CHECKBOX 03218, "¿Conservar detalle de historial de facturas?", 526, 178, 283, 19
    BEGIN
        NAME "cbx_inv_hist_flg"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END

END
CHILD-WINDOW 1102 0 0 0814 0357
BEGIN
    NAME "chw_arm_custmast_1102"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02301, "Future:", 112, 13, 41, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_future"
    END
    INPUTN 03301, "", 156, 10, 64, 19
    BEGIN
        NAME "inn_aging_future"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02302, "Current:", 104, 34, 49, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_cur"
    END
    INPUTN 03302, "", 156, 31, 64, 19
    BEGIN
        NAME "inn_aging_cur"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02303, "30 Days:", 103, 55, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_30"
    END
    INPUTN 03303, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_aging_30"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02304, "60 Days:", 103, 76, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_60"
    END
    INPUTN 03304, "", 156, 73, 64, 19
    BEGIN
        NAME "inn_aging_60"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02305, "90 Days:", 103, 97, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_90"
    END
    INPUTN 03305, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_aging_90"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02306, "120 Days:", 95, 118, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_120"
    END
    INPUTN 03306, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_aging_120"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02307, "Saldo:", 118, 139, 35, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dsp_balance"
    END
    INPUTN 03307, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_dsp_balance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02308, "Plazo promedio de pago en días:", 251, 13, 190, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days"
    END
    INPUTN 03308, "", 444, 10, 56, 19
    BEGIN
        NAME "inn_avg_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02309, "Fecha de última factura:", 302, 55, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstinv_date"
    END
    
    INPUTD 03309, "", 444, 52, 85, 19
    BEGIN
        NAME "ind_lstinv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21309, "", 529, 52, 20, 19
    BEGIN
        NAME "tbnc_lstinv_date"
    END
    
    STATICTEXT 02310, "Fecha de último pago:", 313, 76, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstpay_date"
    END
    
    INPUTD 03310, "", 444, 73, 85, 19
    BEGIN
        NAME "ind_lstpay_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21310, "", 529, 73, 20, 19
    BEGIN
        NAME "tbnc_lstpay_date"
    END
    
    STATICTEXT 02311, "MTD", 156, 181, 24, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_mtd"
    END
    
    STATICTEXT 02312, "Sales MTD:", 91, 202, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_sales"
    END
    INPUTN 03312, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_mtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02313, "Cost MTD:", 93, 223, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cost"
    END
    INPUTN 03313, "", 156, 220, 64, 19
    BEGIN
        NAME "inn_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02314, "Ganancia bruta:", 61, 244, 92, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dsp_mtd_profit"
    END
    INPUTN 03314, "", 156, 241, 64, 19
    BEGIN
        NAME "inn_dsp_mtd_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02315, "% de ganancia bruta:", 34, 265, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dsp_mtd_prof_pct"
    END
    INPUTN 03315, "", 156, 262, 64, 19
    BEGIN
        NAME "inn_dsp_mtd_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    
    STATICTEXT 02316, "Av Days to Pay MTD:", 35, 286, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days_mtd"
    END
    INPUTN 03316, "", 156, 283, 64, 19
    BEGIN
        NAME "inn_avg_days_mtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02317, "High Credit MTD:", 53, 307, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_high_crd"
    END
    INPUTN 03317, "", 156, 304, 64, 19
    BEGIN
        NAME "inn_mtd_high_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02318, "YTD", 276, 181, 22, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_ytd"
    END
    INPUTN 03319, "", 276, 199, 64, 19
    BEGIN
        NAME "inn_ytd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03320, "", 276, 220, 64, 19
    BEGIN
        NAME "inn_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03321, "", 276, 241, 64, 19
    BEGIN
        NAME "inn_dsp_ytd_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03322, "", 276, 262, 64, 19
    BEGIN
        NAME "inn_dsp_ytd_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    INPUTN 03323, "", 276, 283, 64, 19
    BEGIN
        NAME "inn_avg_days_ytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03324, "", 276, 304, 64, 19
    BEGIN
        NAME "inn_ytd_hi_cred"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02325, "Prior Year", 396, 181, 53, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_pri"
    END
    INPUTN 03326, "", 396, 199, 64, 19
    BEGIN
        NAME "inn_pyr_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03327, "", 396, 220, 64, 19
    BEGIN
        NAME "inn_pri_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03328, "", 396, 241, 64, 19
    BEGIN
        NAME "inn_dsp_pri_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03329, "", 396, 262, 64, 19
    BEGIN
        NAME "inn_dsp_pri_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    INPUTN 03330, "", 396, 283, 64, 19
    BEGIN
        NAME "inn_avg_dtp_pytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03331, "", 396, 304, 64, 19
    BEGIN
        NAME "inn_pyr_hi_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02332, "Next Month", 516, 181, 62, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_nxt"
    END
    INPUTN 03333, "", 516, 199, 64, 19
    BEGIN
        NAME "inn_nmtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03334, "", 516, 220, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03335, "", 516, 241, 64, 19
    BEGIN
        NAME "inn_dsp_nxt_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03336, "", 516, 262, 64, 19
    BEGIN
        NAME "inn_dsp_nxt_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    INPUTN 03337, "", 516, 283, 64, 19
    BEGIN
        NAME "inn_avg_dtp_nmtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03338, "", 516, 304, 64, 19
    BEGIN
        NAME "inn_nmtd_high_cr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END

END

