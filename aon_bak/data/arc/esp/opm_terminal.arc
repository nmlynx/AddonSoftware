//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPM_TERMINAL - Order Processing Terminal
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0333
BEGIN
    NAME "win_opm_terminal"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID de la terminal:", 56, 13, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_terminal_id"
    END
    
    INPUTE 03001, "", 156, 10, 52, 19
    BEGIN
        NAME "ine_terminal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02002, "Transparency On:", 48, 34, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_transpar_on"
    END
    
    INPUTE 03002, "", 156, 31, 80, 19
    BEGIN
        NAME "ine_transpar_on"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02003, "Transparency Off:", 47, 55, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_transpar_off"
    END
    
    INPUTE 03003, "", 156, 52, 80, 19
    BEGIN
        NAME "ine_transpar_off"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02004, "Cash Box Port Number:", 17, 76, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_bx_port"
    END
    
    INPUTE 03004, "", 156, 73, 35, 19
    BEGIN
        NAME "ine_cash_bx_port"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02005, "Hex Code To Open Cashbox:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_bx_hex"
    END
    
    INPUTE 03005, "", 156, 94, 80, 19
    BEGIN
        NAME "ine_cash_bx_hex"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02006, "Number of Repetitions:", 18, 118, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_repetitions"
    END
    
    INPUTE 03006, "", 156, 115, 40, 19
    BEGIN
        NAME "ine_repetitions"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02007, "Valid Counter Printers:", 20, 139, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_val_ctr_prt"
    END
    
    INPUTE 03007, "", 156, 136, 80, 19
    BEGIN
        NAME "ine_val_ctr_prt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02008, "Selected Counter Printer:", 7, 160, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cntr_printer"
    END
    
    INPUTE 03008, "", 156, 157, 35, 19
    BEGIN
        NAME "ine_cntr_printer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02009, "Valid Receipt Printers:", 26, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_val_rec_prt"
    END
    
    INPUTE 03009, "", 156, 178, 80, 19
    BEGIN
        NAME "ine_val_rec_prt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02010, "Selected Receipt Printer:", 13, 202, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rec_printer"
    END
    
    INPUTE 03010, "", 156, 199, 35, 19
    BEGIN
        NAME "ine_rec_printer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02011, "Receipt Printer Port:", 37, 223, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rec_prt_port"
    END
    
    INPUTE 03011, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_rec_prt_port"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02012, "Skip Warehouse Entry?:", 18, 244, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_skip_whse"
    END
    
    INPUTE 03012, "", 156, 241, 35, 19
    BEGIN
        NAME "ine_skip_whse"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "U"
    END
    
    STATICTEXT 02013, "Warehouse ID:", 70, 265, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03013, "", 156, 262, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04013, "", 217, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20013, "", 191, 262, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02014, "Last Multidrop Hex Code:", 5, 286, 148, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_mdp_hex"
    END
    
    INPUTE 03014, "", 156, 283, 80, 19
    BEGIN
        NAME "ine_last_mdp_hex"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
END

