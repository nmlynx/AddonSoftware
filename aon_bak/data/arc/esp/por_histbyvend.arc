//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POR_HISTBYVEND - PO Rec't History By Vendor
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0212
BEGIN
    NAME "win_por_histbyvend"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Secuencia:", 92, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03001, "", 156, 10, 157, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Beginning ID del proveedor:", 0, 34, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03002, "", 156, 31, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04002, "", 260, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 234, 31, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02003, "Ending ID del proveedor:", 8, 55, 145, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03003, "", 156, 52, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04003, "", 260, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 234, 52, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02004, "Beginning Alt Sequence:", 13, 76, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03004, "", 156, 73, 100, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02005, "Ending Alt Sequence:", 30, 97, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03005, "", 156, 94, 100, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02006, "Beginning Receipt Date:", 16, 118, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_date"
    END
    
    INPUTD 03006, "", 156, 115, 85, 19
    BEGIN
        NAME "ind_pick_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 241, 115, 20, 19
    BEGIN
        NAME "tbnc_pick_date"
    END
    
    STATICTEXT 02007, "Ending Receipt Date:", 34, 139, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_date"
    END
    
    INPUTD 03007, "", 156, 136, 85, 19
    BEGIN
        NAME "ind_pick_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 241, 136, 20, 19
    BEGIN
        NAME "tbnc_pick_date"
    END
    
    STATICTEXT 02008, "Detail:", 117, 160, 36, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_option"
    END
    
    LISTBUTTON 03008, "", 156, 157, 85, 300
    BEGIN
        NAME "lbx_report_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

