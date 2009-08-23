//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_PARAMS - AR Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0512 0249
BEGIN
    NAME "win_ars_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Período actual:", 127, 13, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03001, "", 216, 10, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Año actual:", 147, 34, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03002, "", 216, 31, 35, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    GROUPBOX 19003, "Configuraciones ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_dist_by_item"
    END
    
    CHECKBOX 03003, "¿Distribuir ventas por artículo?", 214, 73, 211, 19
    BEGIN
        NAME "cbx_dist_by_item"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "¿Conciliación bancaria?", 214, 94, 167, 19
    BEGIN
        NAME "cbx_br_interface"
        NOT OPAQUE
    END
    
    GROUPBOX 19005, "Etiquetas ", -4, 118, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_label_across"
    END
    
    STATICTEXT 02005, "Cantidad de etiquetas a lo largo:", 24, 139, 189, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03005, "", 216, 136, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02006, "Caracteres horizontales por etiqueta:", 0, 160, 213, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03006, "", 216, 157, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02007, "Líneas verticales por etiqueta:", 39, 181, 174, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03007, "", 216, 178, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02008, "Point of Sale Station:", 95, 202, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_default_station"
    END
    
    INPUTE 03008, "", 216, 199, 208, 19
    BEGIN
        NAME "ine_default_station"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 450, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_default_station"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 424, 199, 20, 19
    BEGIN
        NAME "tbnf_default_station"
    END
END

