//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_ACCTCOMMENTS - Account Comments
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0544 0100
BEGIN
    NAME "win_glm_acctcomments"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Comments:", 60, 13, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_std_comments"
    END
    
    INPUTE 03001, "", 130, 10, 384, 19
    BEGIN
        NAME "ine_std_comments"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 48
    END
END

