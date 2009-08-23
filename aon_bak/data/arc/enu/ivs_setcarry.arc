//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVS_SETCARRY - Setup & Carrying Costs
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0122
BEGIN
    NAME "win_ivs_setcarry"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Carrying Cost Percentage:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_carry_cost"
    END
    INPUTN 03001, "", 130, 10, 64, 19
    BEGIN
        NAME "inn_carry_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "Set-Up Cost:", 53, 34, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_setup_cost"
    END
    INPUTN 03002, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_setup_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02003, "ABC Analysis Pcts and Factors", 100, 76, 161, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_abcp"
    END
END

