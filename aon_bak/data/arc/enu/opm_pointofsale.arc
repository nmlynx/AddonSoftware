//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPM_POINTOFSALE - Order Processing Point of Sale
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0446 0354
BEGIN
    NAME "win_opm_pointofsale"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Point of Sale Station:", 29, 13, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pos_station"
    END
    
    INPUTE 03001, "", 150, 10, 208, 19
    BEGIN
        NAME "ine_pos_station"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 02002, "Description:", 76, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03002, "", 150, 31, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02003, "Transparency On:", 42, 55, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_transpar_on"
    END
    
    INPUTE 03003, "", 150, 52, 80, 19
    BEGIN
        NAME "ine_transpar_on"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02004, "Transparency Off:", 41, 76, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_transpar_off"
    END
    
    INPUTE 03004, "", 150, 73, 80, 19
    BEGIN
        NAME "ine_transpar_off"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02005, "Cash Box Port Number:", 11, 97, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_bx_port"
    END
    
    INPUTE 03005, "", 150, 94, 35, 19
    BEGIN
        NAME "ine_cash_bx_port"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02006, "Hex Code To Open Cashbox:", 0, 118, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_bx_hex"
    END
    
    INPUTE 03006, "", 150, 115, 80, 19
    BEGIN
        NAME "ine_cash_bx_hex"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02007, "Number of Repetitions:", 12, 139, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_repetitions"
    END
    
    INPUTE 03007, "", 150, 136, 40, 19
    BEGIN
        NAME "ine_repetitions"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02008, "Valid Counter Printers:", 14, 160, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_val_ctr_prt"
    END
    
    INPUTE 03008, "", 150, 157, 80, 19
    BEGIN
        NAME "ine_val_ctr_prt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02009, "Selected Counter Printer:", 1, 181, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cntr_printer"
    END
    
    INPUTE 03009, "", 150, 178, 35, 19
    BEGIN
        NAME "ine_cntr_printer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02010, "Valid Receipt Printers:", 20, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_val_rec_prt"
    END
    
    INPUTE 03010, "", 150, 199, 80, 19
    BEGIN
        NAME "ine_val_rec_prt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02011, "Selected Receipt Printer:", 7, 223, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rec_printer"
    END
    
    INPUTE 03011, "", 150, 220, 35, 19
    BEGIN
        NAME "ine_rec_printer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02012, "Receipt Printer Port:", 31, 244, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rec_prt_port"
    END
    
    INPUTE 03012, "", 150, 241, 35, 19
    BEGIN
        NAME "ine_rec_prt_port"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02013, "Skip Warehouse Entry?:", 12, 265, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_skip_whse"
    END
    
    INPUTE 03013, "", 150, 262, 35, 19
    BEGIN
        NAME "ine_skip_whse"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "U"
    END
    
    STATICTEXT 02014, "Warehouse ID:", 64, 286, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03014, "", 150, 283, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04014, "", 211, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20014, "", 185, 283, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02015, "Last Multidrop Hex Code:", 0, 307, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_mdp_hex"
    END
    
    INPUTE 03015, "", 150, 304, 80, 19
    BEGIN
        NAME "ine_last_mdp_hex"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
END

