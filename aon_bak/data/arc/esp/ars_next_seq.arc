//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_NEXT_SEQ - Next Sequence Number
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0334 0100
BEGIN
    NAME "win_ars_next_seq"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Próximo número de cliente automát.:", 21, 13, 216, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_customer_id"
    END
    INPUTN 03001, "", 240, 10, 64, 19
    BEGIN
        NAME "inn_nxt_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02002, "Próximo número de factura simple:", 31, 34, 206, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_sim_inv"
    END
    INPUTN 03002, "", 240, 31, 64, 19
    BEGIN
        NAME "inn_nxt_sim_inv"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

