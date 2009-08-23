//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_PROCDETAIL - Process Detail Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0168
BEGIN
    NAME "win_adm_procdetail"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Identificación del proceso:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03001, "", 156, 10, 160, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04001, "", 342, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 316, 10, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
    
    STATICTEXT 02002, "Número de secuencia:", 24, 34, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_no"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_sequence_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02003, "Alias de tabla:", 72, 55, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dd_table_alias"
    END
    
    INPUTE 03003, "", 156, 52, 160, 19
    BEGIN
        NAME "ine_dd_table_alias"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 342, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_dd_table_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 316, 52, 20, 19
    BEGIN
        NAME "tbnf_dd_table_alias"
    END
    
    STATICTEXT 02004, "Nombre del programa:", 20, 76, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_program_name"
    END
    
    INPUTE 03004, "", 156, 73, 192, 19
    BEGIN
        NAME "ine_program_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02005, "Descripción:", 80, 97, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03005, "", 156, 94, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    CHECKBOX 03006, "¿Lote nuevo permitido?", 154, 115, 166, 19
    BEGIN
        NAME "cbx_new_batch"
        NOT OPAQUE
    END
END

