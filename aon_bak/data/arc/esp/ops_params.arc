//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPS_PARAMS - OP Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0932 0249
BEGIN
    NAME "win_ops_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "¿Utilizar números de trabajo del cliente?", 226, 10, 264, 19
    BEGIN
        NAME "cbx_job_nos"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Meses para conservar números de trabajo:", 0, 34, 225, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_retain_jobs"
    END
    
    INPUTE 03002, "", 228, 31, 35, 19
    BEGIN
        NAME "ine_retain_jobs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    CHECKBOX 03003, "¿Venta en efectivo?", 226, 52, 141, 19
    BEGIN
        NAME "cbx_cash_sale"
        NOT OPAQUE
    END
    
    STATICTEXT 02004, "ID del cliente:", 147, 76, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03004, "", 228, 73, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04004, "", 314, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 288, 73, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02005, "# N.º de días/compromiso para el futuro:", 0, 97, 225, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_commit_days"
    END
    
    INPUTE 03005, "", 228, 94, 35, 19
    BEGIN
        NAME "ine_commit_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02006, "Última fecha comprometida:", 60, 118, 165, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstcom_date"
    END
    
    INPUTD 03006, "", 228, 115, 85, 19
    BEGIN
        NAME "ind_lstcom_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02007, "Monto mínimo de pedido:", 76, 139, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_ord_amt"
    END
    INPUTN 03007, "", 228, 136, 40, 19
    BEGIN
        NAME "inn_min_ord_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0.00"
    END
    
    STATICTEXT 02008, "Plazo promedio de entrega:", 65, 160, 160, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_shp_days"
    END
    
    INPUTE 03008, "", 228, 157, 35, 19
    BEGIN
        NAME "ine_def_shp_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02009, "Monto mínimo de línea:", 89, 181, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_line_amt"
    END
    INPUTN 03009, "", 228, 178, 40, 19
    BEGIN
        NAME "inn_min_line_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0.00"
    END
    
    STATICTEXT 02010, "Venta mínima en efectivo:", 76, 202, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_csh_sale"
    END
    INPUTN 03010, "", 228, 199, 48, 19
    BEGIN
        NAME "inn_min_csh_sale"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0.00"
    END
    
    CHECKBOX 03011, "¿Saltear entrada de código de línea?", 634, 31, 239, 19
    BEGIN
        NAME "cbx_skip_ln_code"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Código de línea:", 539, 55, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_code"
    END
    
    INPUTE 03012, "", 636, 52, 35, 19
    BEGIN
        NAME "ine_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 04012, "", 697, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 671, 52, 20, 19
    BEGIN
        NAME "tbnf_line_code"
    END
    
    CHECKBOX 03013, "¿Permitir pedidos pendientes?", 634, 73, 206, 19
    BEGIN
        NAME "cbx_backorders"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "¿Escribir el costo para envío a través de terceros?", 634, 94, 320, 19
    BEGIN
        NAME "cbx_dropshp_cost"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "¿Escribir depósito para envío a través de terceros?", 634, 115, 325, 19
    BEGIN
        NAME "cbx_dropshp_whse"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "¿Conservar detalle de historial de facturas?", 634, 136, 283, 19
    BEGIN
        NAME "cbx_inv_hist_flg"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    CHECKBOX 03017, "¿Impresora de recibos en el sistema?", 634, 157, 245, 19
    BEGIN
        NAME "cbx_rec_prt_sys"
        NOT OPAQUE
    END
    
    CHECKBOX 03018, "¿Imprimir detalle de ventas del GL?", 634, 178, 232, 19
    BEGIN
        NAME "cbx_prt_gl_det"
        NOT OPAQUE
    END
    
    STATICTEXT 02019, "Default POS Station:", 518, 202, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_default_station"
    END
    
    INPUTE 03019, "", 636, 199, 208, 19
    BEGIN
        NAME "ine_default_station"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04019, "", 870, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_default_station"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20019, "", 844, 199, 20, 19
    BEGIN
        NAME "tbnf_default_station"
    END
END

