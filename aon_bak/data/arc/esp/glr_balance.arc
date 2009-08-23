//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLR_BALANCE - Balance Sheet
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0105
BEGIN
    NAME "win_glr_balance"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Para período:", 75, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_gl_per"
    END
    INPUTN 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "inn_pick_gl_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "00"
    END
    
    STATICTEXT 02002, "Para año:", 100, 34, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_year"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_pick_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    CHECKBOX 03003, "Incluir número de cuenta", 154, 52, 177, 19
    BEGIN
        NAME "cbx_yn_prompt"
        NOT OPAQUE
    END
END

