//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APE_SELECTIONDET - Payment Selection Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0560 0100
BEGIN
    NAME "win_ape_selectiondet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Payment Selection Sequence:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_sel_seq"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_pay_sel_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02002, "AP Check Selection Description:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_chk_sel_desc"
    END
    
    INPUTE 03002, "", 130, 31, 400, 19
    BEGIN
        NAME "ine_chk_sel_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
END

