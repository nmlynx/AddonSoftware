//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APE_PAYSELECT - Payment Selection Entry
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0687 0170
BEGIN
    NAME "win_ape_payselect"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    GROUPBOX 19001, "Filtros ", -4, 13, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_payment_grp"
    END
    
    STATICTEXT 02001, "Grupo de pago:", 62, 34, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_payment_grp"
    END
    
    INPUTE 03001, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_payment_grp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_payment_grp"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_payment_grp"
    END
    
    STATICTEXT 02002, "Tipo de AP:", 87, 55, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_type"
    END
    
    INPUTE 03002, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_ap_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 217, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 191, 52, 20, 19
    BEGIN
        NAME "tbnf_ap_type"
    END
    
    STATICTEXT 02003, "ID del proveedor:", 52, 76, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03003, "", 156, 73, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04003, "", 260, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 234, 73, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02004, "Operador de fecha de vencimiento:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_due_date_op"
    END
    
    LISTBUTTON 03004, "", 156, 94, 133, 300
    BEGIN
        NAME "lbx_due_date_op"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Fecha de vencimiento de la factura:", 344, 97, 205, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_due_date_dt"
    END
    
    INPUTD 03005, "", 552, 94, 85, 19
    BEGIN
        NAME "ind_due_date_dt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 637, 94, 20, 19
    BEGIN
        NAME "tbnc_due_date_dt"
    END
    
    STATICTEXT 02006, "Operador de fecha de dscto.:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_date_op"
    END
    
    LISTBUTTON 03006, "", 156, 115, 133, 300
    BEGIN
        NAME "lbx_disc_date_op"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02007, "Fecha de descuento:", 430, 118, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_date_dt"
    END
    
    INPUTD 03007, "", 552, 115, 85, 19
    BEGIN
        NAME "ind_disc_date_dt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 637, 115, 20, 19
    BEGIN
        NAME "tbnc_disc_date_dt"
    END
    
    CHECKBOX 03008, "Take Overdue Discounts?", 550, 31, 179, 19
    BEGIN
        NAME "cbx_include_disc"
        NOT OPAQUE
    END
END

