//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPT_INVLSDET - Lot/Serial Invoice History
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0207
BEGIN
    NAME "win_opt_invlsdet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "ID del cliente:", 75, 13, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 260, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 234, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Número de factura de AR:", 3, 34, 150, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no"
    END
    
    INPUTE 03002, "", 156, 31, 91, 19
    BEGIN
        NAME "ine_ar_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 02003, "Sequence Ref Number:", 21, 55, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_orddet_seq_ref"
    END
    
    INPUTE 03003, "", 156, 52, 156, 19
    BEGIN
        NAME "ine_orddet_seq_ref"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02004, "Número de secuencia:", 24, 76, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_no"
    END
    
    INPUTE 03004, "", 156, 73, 39, 19
    BEGIN
        NAME "ine_sequence_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02005, "Lot/Serial Number:", 42, 97, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lotser_no"
    END
    
    INPUTE 03005, "", 156, 94, 200, 19
    BEGIN
        NAME "ine_lotser_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02006, "Quantity Ordered:", 47, 118, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_ordered"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_qty_ordered"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Quantity Shipped:", 49, 139, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_shipped"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_qty_shipped"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Unit Cost:", 95, 160, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

