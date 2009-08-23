//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_FINCOLUMNS - Financial Report Column Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0369 0165
BEGIN
    NAME "win_glm_fincolumns"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Número de secuencia:", 24, 13, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_no"
    END
    
    INPUTE 03001, "", 156, 10, 39, 19
    BEGIN
        NAME "ine_sequence_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02002, "Tipo de período:", 57, 34, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_per_type_cde"
    END
    
    LISTBUTTON 03002, "", 156, 31, 183, 300
    BEGIN
        NAME "lbx_per_type_cde"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "real/presupuesto/desvío:", 2, 55, 151, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_actbud"
    END
    
    LISTBUTTON 03003, "", 156, 52, 102, 300
    BEGIN
        NAME "lbx_actbud"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Montos o unidades:", 38, 76, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amt_or_units"
    END
    
    LISTBUTTON 03004, "", 156, 73, 85, 300
    BEGIN
        NAME "lbx_amt_or_units"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Índice/porcentaje:", 46, 97, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ratiopct"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_ratiopct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02006, "Posición de impresión predeterminada:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_default_pos"
    END
    
    INPUTE 03006, "", 156, 115, 35, 19
    BEGIN
        NAME "ine_default_pos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
END

