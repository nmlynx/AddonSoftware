//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLC_CYCLECODE - Journal Entry Cycle Codes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0144
BEGIN
    NAME "win_glc_cyclecode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Code:", 93, 13, 34, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cycle_code"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_cycle_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 130, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02003, "Process Through Date:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_date"
    END
    
    INPUTD 03003, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_process_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_process_date"
    END
    
    STATICTEXT 02004, "Date Last Used:", 37, 76, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstuse_date"
    END
    
    INPUTD 03004, "", 130, 73, 85, 19
    BEGIN
        NAME "ind_lstuse_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02005, "Time Last Used:", 35, 97, 92, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstuse_time"
    END
    
    INPUTE 03005, "", 130, 94, 40, 19
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
END

