//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARE_CASHDIST - Cash Receipts GL Distribution
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0100
BEGIN
    NAME "win_are_cashdist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "GL Account:", 56, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 130, 10, 80, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 236, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 210, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02002, "Posting Amount:", 30, 34, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_post_amt"
    END
    INPUTN 03002, "", 130, 31, 105, 19
    BEGIN
        NAME "inn_gl_post_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###,###,###.00-"
    END
END

