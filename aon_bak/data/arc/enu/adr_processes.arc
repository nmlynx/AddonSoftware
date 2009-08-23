//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADR_PROCESSES - Process Listing
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0100
BEGIN
    NAME "win_adr_processes"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Process Identification:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03001, "", 130, 10, 128, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04001, "", 284, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 258, 10, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
    
    STATICTEXT 02002, "Ending Process Identification:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03002, "", 130, 31, 128, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04002, "", 284, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 258, 31, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
END

