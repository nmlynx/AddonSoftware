//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APW_INVOICENAME - Invoice Sort By Vendor Name
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0144
BEGIN
    NAME "win_apw_invoicename"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Tipo de AP:", 87, 13, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_type"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_ap_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 217, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 191, 10, 20, 19
    BEGIN
        NAME "tbnf_ap_type"
    END
    
    STATICTEXT 02002, "Secuencia alternativa:", 27, 34, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03002, "", 156, 31, 130, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02003, "ID del proveedor:", 52, 55, 101, 16
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
    
    STATICTEXT 02004, "Número de factura de AP:", 4, 76, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_inv_no"
    END
    
    INPUTE 03004, "", 156, 73, 130, 19
    BEGIN
        NAME "ine_ap_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02005, "0:", 142, 97, 11, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_00"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_sequence_00"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
END

