//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_COPYFIN - Copy Financial Statements
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0123
BEGIN
    NAME "win_glm_copyfin"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "From Firm ID:", 48, 13, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_firm_id"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_from_firm_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04001, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_from_firm_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_from_firm_id"
    END
    
    STATICTEXT 02002, "From Report Number:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_gl_rpt_no"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_from_gl_rpt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_from_gl_rpt_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_from_gl_rpt_no"
    END
    
    STATICTEXT 02003, "To Firm ID:", 64, 55, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_to_firm_id"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_to_firm_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04003, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_to_firm_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_to_firm_id"
    END
    
    STATICTEXT 02004, "To Report Number:", 15, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_to_gl_rpt_no"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_to_gl_rpt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
END

