//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPM_FRTTERMS - Freight Terms Codes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0100
BEGIN
    NAME "win_opm_frtterms"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de condiciones de flete:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_frt_terms"
    END
    
    INPUTE 03001, "", 156, 10, 39, 19
    BEGIN
        NAME "ine_frt_terms"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03002, "", 156, 31, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
END

