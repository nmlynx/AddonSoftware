//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APS_PARAMS - AP Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0312
BEGIN
    NAME "win_aps_params"
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
    
    GROUPBOX 19003, "Settings ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_cur_1099_yr"
    END
    
    STATICTEXT 02003, "Año del formulario 1099:", 5, 76, 148, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_1099_yr"
    END
    
    INPUTE 03003, "", 156, 73, 70, 19
    BEGIN
        NAME "ine_cur_1099_yr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02004, "Inicio de línea de comentarios:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_beg_cmt_line"
    END
    
    INPUTE 03004, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_beg_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02005, "Finalización de línea de comentarios:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_cmt_line"
    END
    
    INPUTE 03005, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_end_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03006, "Tipos de A/P múltiples", 298, 73, 163, 19
    BEGIN
        NAME "cbx_multi_types"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "Distribuciones múltiples", 298, 94, 173, 19
    BEGIN
        NAME "cbx_multi_dist"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "Cuenta de retención", 298, 115, 148, 19
    BEGIN
        NAME "cbx_ret_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Base de efectivo", 298, 136, 123, 19
    BEGIN
        NAME "cbx_cash_basis"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "Conservar facturas cero", 298, 157, 173, 19
    BEGIN
        NAME "cbx_hold_zero"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Imprimir cheques en sec. de tipo de AP", 298, 178, 257, 19
    BEGIN
        NAME "cbx_ap_check_seq"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "Imprimir memorando en talón del cheque", 526, 73, 273, 19
    BEGIN
        NAME "cbx_ap_chk_memo"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Imprimir distr. en talón del cheque", 526, 94, 232, 19
    BEGIN
        NAME "cbx_ap_chk_dist"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Entrada para varios", 526, 115, 144, 19
    BEGIN
        NAME "cbx_misc_entry"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Conciliación bancaria", 526, 136, 156, 19
    BEGIN
        NAME "cbx_br_interface"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "Registrar en períodos cerrados", 526, 157, 213, 19
    BEGIN
        NAME "cbx_post_closed"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "Procesamiento de reposición", 526, 178, 200, 19
    BEGIN
        NAME "cbx_use_replen"
        NOT OPAQUE
    END
    
    GROUPBOX 19018, "Etiquetas ", -4, 202, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_label_across"
    END
    
    STATICTEXT 02018, "Etiquetas arriba:", 58, 223, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03018, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02019, "Ancho de etiqueta:", 43, 244, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03019, "", 156, 241, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02020, "Longitud de etiqueta:", 29, 265, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03020, "", 156, 262, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
END

