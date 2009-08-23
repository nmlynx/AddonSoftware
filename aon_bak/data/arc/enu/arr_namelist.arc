//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_NAMELIST - Customer Name Listing
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0436 0357
BEGIN
    NAME "win_arr_namelist"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Report Sequence:", 35, 13, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_seq_msty"
    END
    
    LISTBUTTON 03001, "", 140, 10, 88, 300
    BEGIN
        NAME "lbx_report_seq_msty"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Beginning Terms Code:", 1, 55, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03002, "", 140, 52, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 201, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 175, 52, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02003, "Ending Terms Code:", 19, 76, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03003, "", 140, 73, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04003, "", 201, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 175, 73, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02004, "Beginning Salesperson:", 1, 118, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03004, "", 140, 115, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04004, "", 201, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 175, 115, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02005, "Ending Salesperson:", 19, 139, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03005, "", 140, 136, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04005, "", 201, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 175, 136, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02006, "Beginning Territory Code:", 0, 181, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03006, "", 140, 178, 35, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04006, "", 201, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 175, 178, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02007, "Ending Territory Code:", 3, 202, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03007, "", 140, 199, 35, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04007, "", 201, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 175, 199, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02008, "Beginning Customer Type:", 0, 244, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_type"
    END
    
    INPUTE 03008, "", 140, 241, 35, 19
    BEGIN
        NAME "ine_customer_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04008, "", 201, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 175, 241, 20, 19
    BEGIN
        NAME "tbnf_customer_type"
    END
    
    STATICTEXT 02009, "Ending Customer Type:", 0, 265, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_type"
    END
    
    INPUTE 03009, "", 140, 262, 35, 19
    BEGIN
        NAME "ine_customer_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04009, "", 201, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 175, 262, 20, 19
    BEGIN
        NAME "tbnf_customer_type"
    END
    
    CHECKBOX 03010, "Page Break?", 138, 283, 98, 19
    BEGIN
        NAME "cbx_page_break"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Export format?", 138, 304, 118, 19
    BEGIN
        NAME "cbx_export_format"
        NOT OPAQUE
    END
END

