//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADR_PROCESSES - Process Listing
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0100
BEGIN
    NAME "win_adr_processes"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Identificación del proceso:", 0, 13, 153, 16
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
    
    STATICTEXT 02002, "Ending Identificación del proceso:", 0, 34, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03002, "", 156, 31, 128, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04002, "", 310, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 284, 31, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
END

