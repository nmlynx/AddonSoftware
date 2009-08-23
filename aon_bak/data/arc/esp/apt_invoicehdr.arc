//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APT_INVOICEHDR - Invoice Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0483
BEGIN
    NAME "win_apt_invoicehdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Tipo de AP:", 87, 13, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_type"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_ap_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 217, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 191, 10, 20, 19
    BEGIN
        NAME "tbnf_ap_type"
    END
    
    STATICTEXT 02002, "ID del proveedor:", 52, 34, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03002, "", 156, 31, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04002, "", 260, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 234, 31, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02003, "Número de factura de AP:", 4, 55, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_inv_no"
    END
    
    INPUTE 03003, "", 156, 52, 130, 19
    BEGIN
        NAME "ine_ap_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02004, "0:", 142, 76, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_00"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_sequence_00"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02005, "Código de distribución:", 15, 97, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_dist_code"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_ap_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_ap_dist_code"
    END
    
    STATICTEXT 02006, "Grupo de pago:", 62, 118, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_payment_grp"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_payment_grp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04006, "", 217, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_payment_grp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 191, 115, 20, 19
    BEGIN
        NAME "tbnf_payment_grp"
    END
    
    STATICTEXT 02007, "Código de condiciones:", 15, 139, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_terms_code"
    END
    
    INPUTE 03007, "", 156, 136, 35, 19
    BEGIN
        NAME "ine_ap_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04007, "", 217, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 191, 136, 20, 19
    BEGIN
        NAME "tbnf_ap_terms_code"
    END
    
    STATICTEXT 02008, "Referencia:", 89, 160, 64, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reference"
    END
    
    INPUTE 03008, "", 156, 157, 100, 19
    BEGIN
        NAME "ine_reference"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02009, "Memorando de la factura de AP:", 0, 181, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_inv_memo"
    END
    
    INPUTE 03009, "", 156, 178, 160, 19
    BEGIN
        NAME "ine_ap_inv_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    CHECKBOX 03010, "¿Retener para emisión manual?", 154, 199, 211, 19
    BEGIN
        NAME "cbx_hold_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02011, "Indicador de factura MC:", 9, 223, 144, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mc_inv_flag"
    END
    
    INPUTE 03011, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_mc_inv_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02012, "Indicador de ajuste de factura MC:", 0, 244, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mc_inv_adj"
    END
    
    INPUTE 03012, "", 156, 241, 35, 19
    BEGIN
        NAME "ine_mc_inv_adj"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02013, "Indicador de anulación de factura MC:", 0, 265, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mc_inv_rev"
    END
    
    INPUTE 03013, "", 156, 262, 35, 19
    BEGIN
        NAME "ine_mc_inv_rev"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02014, "Fecha de la factura:", 40, 286, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_date"
    END
    
    INPUTD 03014, "", 156, 283, 85, 19
    BEGIN
        NAME "ind_invoice_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21014, "", 241, 283, 20, 19
    BEGIN
        NAME "tbnc_invoice_date"
    END
    
    STATICTEXT 02015, "Fecha contable:", 62, 307, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_accting_date"
    END
    
    INPUTD 03015, "", 156, 304, 85, 19
    BEGIN
        NAME "ind_accting_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 241, 304, 20, 19
    BEGIN
        NAME "tbnc_accting_date"
    END
    
    STATICTEXT 02016, "Fecha de vencimiento de la factura:", 0, 328, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_date"
    END
    
    INPUTD 03016, "", 156, 325, 85, 19
    BEGIN
        NAME "ind_inv_due_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21016, "", 241, 325, 20, 19
    BEGIN
        NAME "tbnc_inv_due_date"
    END
    
    STATICTEXT 02017, "Fecha de descuento:", 34, 349, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_date"
    END
    
    INPUTD 03017, "", 156, 346, 85, 19
    BEGIN
        NAME "ind_disc_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21017, "", 241, 346, 20, 19
    BEGIN
        NAME "tbnc_disc_date"
    END
    
    STATICTEXT 02018, "Monto de la factura:", 37, 370, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_amt"
    END
    INPUTN 03018, "", 156, 367, 64, 19
    BEGIN
        NAME "inn_invoice_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Monto de descuento:", 30, 391, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03019, "", 156, 388, 64, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Monto de retención:", 36, 412, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_retention"
    END
    INPUTN 03020, "", 156, 409, 64, 19
    BEGIN
        NAME "inn_retention"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    CHECKBOX 03021, "seleccionado", 154, 430, 107, 19
    BEGIN
        NAME "cbx_selected_for_pay"
        NOT OPAQUE
    END
END

