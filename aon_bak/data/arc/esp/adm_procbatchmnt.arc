//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_PROCBATCHMNT - Process Batch Control Record Maint
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0231
BEGIN
    NAME "win_adm_procbatchmnt"
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
    
    INPUTE 03001, "", 156, 10, 128, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04001, "", 310, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 284, 10, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
    
    STATICTEXT 02002, "Batch No:", 98, 34, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_batch_no"
    END
    
    INPUTE 03002, "", 156, 31, 91, 19
    BEGIN
        NAME "ine_batch_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "Descripción:", 80, 55, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03003, "", 156, 52, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02004, "ID del usuario:", 69, 76, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03004, "", 156, 73, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 311, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    
    STATICTEXT 02005, "Fecha de apertura:", 45, 97, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_date_opened"
    END
    
    INPUTD 03005, "", 156, 94, 85, 19
    BEGIN
        NAME "ind_date_opened"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02006, "Tiempo de apertura:", 35, 118, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_time_opened"
    END
    
    INPUTE 03006, "", 156, 115, 40, 19
    BEGIN
        NAME "ine_time_opened"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00"
    END
    
    STATICTEXT 02007, "Fecha de última utilización:", 0, 139, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstuse_date"
    END
    
    INPUTD 03007, "", 156, 136, 85, 19
    BEGIN
        NAME "ind_lstuse_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02008, "Hora de última utilización:", 1, 160, 152, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstuse_time"
    END
    
    INPUTE 03008, "", 156, 157, 40, 19
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
    
    CHECKBOX 03009, "Batch contain data?", 154, 178, 143, 19
    BEGIN
        NAME "cbx_dsp_data"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
END

