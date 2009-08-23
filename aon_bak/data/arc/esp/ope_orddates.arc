//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPE_ORDDATES - Order Entry Default Dates
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0536 0102
BEGIN
    NAME "win_ope_orddates"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Default Scheduled Ship Date:", 70, 13, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_ship"
    END
    
    INPUTD 03001, "", 240, 10, 85, 19
    BEGIN
        NAME "ind_def_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 325, 10, 20, 19
    BEGIN
        NAME "tbnc_def_ship"
    END
    
    STATICTEXT 02002, "Commit If Shipped Before Date:", 56, 34, 181, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_commit"
    END
    
    INPUTD 03002, "", 240, 31, 85, 19
    BEGIN
        NAME "ind_def_commit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 325, 31, 20, 19
    BEGIN
        NAME "tbnc_def_commit"
    END
    
    STATICTEXT 02003, "Point of Sale Station:", 119, 55, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_station"
    END
    
    INPUTE 03003, "", 240, 52, 208, 19
    BEGIN
        NAME "ine_def_station"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 474, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_def_station"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 448, 52, 20, 19
    BEGIN
        NAME "tbnf_def_station"
    END
END

