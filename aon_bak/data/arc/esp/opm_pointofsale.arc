//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPM_POINTOFSALE - Order Processing Point of Sale
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0476 0354
BEGIN
    NAME "win_opm_pointofsale"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Point of Sale Station:", 59, 13, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pos_station"
    END
    
    INPUTE 03001, "", 180, 10, 208, 19
    BEGIN
        NAME "ine_pos_station"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 02002, "Descripción:", 104, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03002, "", 180, 31, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02003, "Transparency On:", 72, 55, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_transpar_on"
    END
    
    INPUTE 03003, "", 180, 52, 80, 19
    BEGIN
        NAME "ine_transpar_on"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02004, "Transparency Off:", 71, 76, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_transpar_off"
    END
    
    INPUTE 03004, "", 180, 73, 80, 19
    BEGIN
        NAME "ine_transpar_off"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02005, "Cash Box Port Number:", 41, 97, 136, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_bx_port"
    END
    
    INPUTE 03005, "", 180, 94, 35, 19
    BEGIN
        NAME "ine_cash_bx_port"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02006, "Hex Code To Open Cashbox:", 7, 118, 170, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cash_bx_hex"
    END
    
    INPUTE 03006, "", 180, 115, 80, 19
    BEGIN
        NAME "ine_cash_bx_hex"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02007, "Number of Repetitions:", 42, 139, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_repetitions"
    END
    
    INPUTE 03007, "", 180, 136, 40, 19
    BEGIN
        NAME "ine_repetitions"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02008, "Valid Counter Printers:", 44, 160, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_val_ctr_prt"
    END
    
    INPUTE 03008, "", 180, 157, 80, 19
    BEGIN
        NAME "ine_val_ctr_prt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02009, "Selected Counter Printer:", 31, 181, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cntr_printer"
    END
    
    INPUTE 03009, "", 180, 178, 35, 19
    BEGIN
        NAME "ine_cntr_printer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02010, "Valid Receipt Printers:", 50, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_val_rec_prt"
    END
    
    INPUTE 03010, "", 180, 199, 80, 19
    BEGIN
        NAME "ine_val_rec_prt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    STATICTEXT 02011, "Selected Receipt Printer:", 37, 223, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rec_printer"
    END
    
    INPUTE 03011, "", 180, 220, 35, 19
    BEGIN
        NAME "ine_rec_printer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02012, "Receipt Printer Port:", 61, 244, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rec_prt_port"
    END
    
    INPUTE 03012, "", 180, 241, 35, 19
    BEGIN
        NAME "ine_rec_prt_port"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02013, "Skip Warehouse Entry?:", 42, 265, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_skip_whse"
    END
    
    INPUTE 03013, "", 180, 262, 35, 19
    BEGIN
        NAME "ine_skip_whse"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "U"
    END
    
    STATICTEXT 02014, "Warehouse ID:", 94, 286, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03014, "", 180, 283, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04014, "", 241, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20014, "", 215, 283, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02015, "Last Multidrop Hex Code:", 29, 307, 148, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_last_mdp_hex"
    END
    
    INPUTE 03015, "", 180, 304, 80, 19
    BEGIN
        NAME "ine_last_mdp_hex"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
END

