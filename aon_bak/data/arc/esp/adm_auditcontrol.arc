//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_AUDITCONTROL - GL Posting Control
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0464 0333
BEGIN
    NAME "win_adm_auditcontrol"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Identificación del proceso:", 10, 13, 155, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03001, "", 168, 10, 160, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04001, "", 354, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 328, 10, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
    
    STATICTEXT 02002, "Número de secuencia:", 36, 34, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_no"
    END
    
    INPUTE 03002, "", 168, 31, 35, 19
    BEGIN
        NAME "ine_sequence_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 04002, "", 229, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_sequence_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 203, 31, 20, 19
    BEGIN
        NAME "tbnf_sequence_no"
    END
    
    STATICTEXT 02003, "Alias de proceso/Nombre de tabla:", 0, 55, 165, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_alias"
    END
    
    INPUTE 03003, "", 168, 52, 160, 19
    BEGIN
        NAME "ine_process_alias"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04003, "", 333, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_alias"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    STATICTEXT 02004, "Nombre del programa:", 32, 76, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_program"
    END
    
    INPUTE 03004, "", 168, 73, 192, 19
    BEGIN
        NAME "ine_process_program"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 04004, "", 365, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_program"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    GROUPBOX 19005, "Detalles ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_journal_id"
    END
    
    STATICTEXT 02005, "ID de libro diario:", 64, 118, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_journal_id"
    END
    
    INPUTE 03005, "", 168, 115, 35, 19
    BEGIN
        NAME "ine_journal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 229, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_journal_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 203, 115, 20, 19
    BEGIN
        NAME "tbnf_journal_id"
    END
    
    CHECKBOX 03006, "¿Utiliza números de auditoría?", 166, 136, 207, 19
    BEGIN
        NAME "cbx_gl_audit"
        NOT OPAQUE
    END
    
    STATICTEXT 02007, "Número de última auditoría:", 2, 160, 163, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_audit_number"
    END
    INPUTN 03007, "", 168, 157, 55, 19
    BEGIN
        NAME "inn_audit_number"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "0000000"
    END
    
    CHECKBOX 03008, "¿Usar archivo de trabajo del GL?", 166, 178, 218, 19
    BEGIN
        NAME "cbx_gl_work_file"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "¿Imprimir resumen del GL?", 166, 199, 186, 19
    BEGIN
        NAME "cbx_prt_gl_sum"
        NOT OPAQUE
    END
    
    STATICTEXT 02010, "Memorando de registro resumido:", 0, 223, 165, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_post_memo"
    END
    
    INPUTE 03010, "", 168, 220, 240, 19
    BEGIN
        NAME "ine_gl_post_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02011, "Nivel de detalle:", 74, 244, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_detail_level"
    END
    
    LISTBUTTON 03011, "", 168, 241, 159, 300
    BEGIN
        NAME "lbx_detail_level"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02012, "Usado por última vez:", 38, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstuse_date"
    END
    
    INPUTD 03012, "", 168, 262, 85, 19
    BEGIN
        NAME "ind_lstuse_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03013, "", 264, 262, 40, 19
    BEGIN
        NAME "ine_lstuse_time"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00"
    END
    
    STATICTEXT 02014, "Última actualización:", 44, 286, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstupd_date"
    END
    
    INPUTD 03014, "", 168, 283, 85, 19
    BEGIN
        NAME "ind_lstupd_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTE 03015, "", 264, 283, 40, 19
    BEGIN
        NAME "ine_lstupd_time"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00"
    END
END

