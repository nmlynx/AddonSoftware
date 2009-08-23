//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLC_JOURNALCODE - Journal ID Codes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0346 0147
BEGIN
    NAME "win_glc_journalcode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de ID del libro diario:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_journal_id"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_journal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 156, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    CHECKBOX 03003, "¿Asiento diario?", 154, 52, 123, 19
    BEGIN
        NAME "cbx_permit_je"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "¿Permitir registro al cierre del ejercicio?", 154, 73, 262, 19
    BEGIN
        NAME "cbx_post_yr_end"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "¿Registrar en períodos bloqueados?", 154, 94, 241, 19
    BEGIN
        NAME "cbx_post_locked"
        NOT OPAQUE
    END
END

