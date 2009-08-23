//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPC_MSG_HDR - Standard Message Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0386 0300
BEGIN
    NAME "win_opc_msg_hdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Standard Message Code:", 9, 13, 144, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_message_code"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_message_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 156, 31, 200, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    CHILD-WINDOW 1109 1109 5 0083
END
CHILD-WINDOW 1109 0376 0003
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0374 100
    BEGIN
        NAME "grd_OPC_MSG_DET"
        CLIENTEDGE
        ROWHEAD 20, 05902
        ROWS 20
        COLUMNHEAD 18, 05901
        USERSIZE
        HORIZLINES
        HSCROLLBAR
        VERTLINES
        VSCROLLBAR
        GRIDROWDEFAULTHEIGHT 18
        COLUMNS 2
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 320
        GRIDCOLTITLE 1, "Msg Text"
    END

END

