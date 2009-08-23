//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_COMMENTS - AR Customer Comments Listing
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0144
BEGIN
    NAME "win_arr_comments"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Secuencia de informe:", 25, 13, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dsp_report_seq"
    END
    
    LISTBUTTON 03001, "", 156, 10, 90, 300
    BEGIN
        NAME "lbx_dsp_report_seq"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Beginning Vendedor:", 31, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04002, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02003, "Ending Vendedor:", 49, 55, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04003, "", 217, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 191, 52, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02004, "Beginning Territorio:", 31, 76, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04004, "", 217, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 191, 73, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02005, "Ending Territorio:", 49, 97, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
END

