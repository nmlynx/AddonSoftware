//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADE_EXECAR - Open AR Invoices Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0581 0732
BEGIN
    NAME "win_ade_execar"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Año de cuatro dígitos [YYYY]:", 28, 13, 173, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_full_year"
    END
    
    INPUTE 03001, "", 204, 10, 40, 19
    BEGIN
        NAME "ine_full_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Mes:", 175, 34, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_month"
    END
    
    INPUTE 03002, "", 204, 31, 35, 19
    BEGIN
        NAME "ine_month"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Monto de las facturas por fecha de vencimiento:", 0, 55, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03003, "", 204, 52, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Monto de las facturas por fecha de vencimiento:", 0, 76, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03004, "", 204, 73, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Monto de las facturas por fecha de vencimiento:", 0, 97, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03005, "", 204, 94, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Monto de las facturas por fecha de vencimiento:", 0, 118, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03006, "", 204, 115, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Monto de las facturas por fecha de vencimiento:", 0, 139, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03007, "", 204, 136, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Monto de las facturas por fecha de vencimiento:", 0, 160, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03008, "", 204, 157, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Monto de las facturas por fecha de vencimiento:", 0, 181, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03009, "", 204, 178, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Monto de las facturas por fecha de vencimiento:", 0, 202, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03010, "", 204, 199, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Monto de las facturas por fecha de vencimiento:", 0, 223, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03011, "", 204, 220, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Monto de las facturas por fecha de vencimiento:", 0, 244, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03012, "", 204, 241, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Monto de las facturas por fecha de vencimiento:", 0, 265, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03013, "", 204, 262, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Monto de las facturas por fecha de vencimiento:", 0, 286, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03014, "", 204, 283, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Monto de las facturas por fecha de vencimiento:", 0, 307, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03015, "", 204, 304, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Monto de las facturas por fecha de vencimiento:", 0, 328, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03016, "", 204, 325, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Monto de las facturas por fecha de vencimiento:", 0, 349, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03017, "", 204, 346, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Monto de las facturas por fecha de vencimiento:", 0, 370, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03018, "", 204, 367, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Monto de las facturas por fecha de vencimiento:", 0, 391, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03019, "", 204, 388, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Monto de las facturas por fecha de vencimiento:", 0, 412, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03020, "", 204, 409, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Monto de las facturas por fecha de vencimiento:", 0, 433, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03021, "", 204, 430, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Monto de las facturas por fecha de vencimiento:", 0, 454, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03022, "", 204, 451, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Monto de las facturas por fecha de vencimiento:", 0, 475, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03023, "", 204, 472, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Monto de las facturas por fecha de vencimiento:", 0, 496, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03024, "", 204, 493, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Monto de las facturas por fecha de vencimiento:", 0, 517, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03025, "", 204, 514, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Monto de las facturas por fecha de vencimiento:", 0, 538, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03026, "", 204, 535, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Monto de las facturas por fecha de vencimiento:", 0, 559, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03027, "", 204, 556, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Monto de las facturas por fecha de vencimiento:", 0, 580, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03028, "", 204, 577, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Monto de las facturas por fecha de vencimiento:", 0, 601, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03029, "", 204, 598, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Monto de las facturas por fecha de vencimiento:", 0, 622, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03030, "", 204, 619, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Monto de las facturas por fecha de vencimiento:", 0, 643, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03031, "", 204, 640, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Monto de las facturas por fecha de vencimiento:", 0, 664, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03032, "", 204, 661, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Monto de las facturas por fecha de vencimiento:", 0, 685, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03033, "", 204, 682, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Cantidad de facturas por fecha de vencimiento:", 236, 55, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03034, "", 516, 52, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02035, "Cantidad de facturas por fecha de vencimiento:", 236, 76, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03035, "", 516, 73, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02036, "Cantidad de facturas por fecha de vencimiento:", 236, 97, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03036, "", 516, 94, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02037, "Cantidad de facturas por fecha de vencimiento:", 236, 118, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03037, "", 516, 115, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02038, "Cantidad de facturas por fecha de vencimiento:", 236, 139, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03038, "", 516, 136, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02039, "Cantidad de facturas por fecha de vencimiento:", 236, 160, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03039, "", 516, 157, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02040, "Cantidad de facturas por fecha de vencimiento:", 236, 181, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03040, "", 516, 178, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02041, "Cantidad de facturas por fecha de vencimiento:", 236, 202, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03041, "", 516, 199, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02042, "Cantidad de facturas por fecha de vencimiento:", 236, 223, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03042, "", 516, 220, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02043, "Cantidad de facturas por fecha de vencimiento:", 236, 244, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03043, "", 516, 241, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02044, "Cantidad de facturas por fecha de vencimiento:", 236, 265, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03044, "", 516, 262, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02045, "Cantidad de facturas por fecha de vencimiento:", 236, 286, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03045, "", 516, 283, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02046, "Cantidad de facturas por fecha de vencimiento:", 236, 307, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03046, "", 516, 304, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02047, "Cantidad de facturas por fecha de vencimiento:", 236, 328, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03047, "", 516, 325, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02048, "Cantidad de facturas por fecha de vencimiento:", 236, 349, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03048, "", 516, 346, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02049, "Cantidad de facturas por fecha de vencimiento:", 236, 370, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03049, "", 516, 367, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02050, "Cantidad de facturas por fecha de vencimiento:", 236, 391, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03050, "", 516, 388, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02051, "Cantidad de facturas por fecha de vencimiento:", 236, 412, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03051, "", 516, 409, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02052, "Cantidad de facturas por fecha de vencimiento:", 236, 433, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03052, "", 516, 430, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02053, "Cantidad de facturas por fecha de vencimiento:", 236, 454, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03053, "", 516, 451, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02054, "Cantidad de facturas por fecha de vencimiento:", 236, 475, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03054, "", 516, 472, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02055, "Cantidad de facturas por fecha de vencimiento:", 236, 496, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03055, "", 516, 493, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02056, "Cantidad de facturas por fecha de vencimiento:", 236, 517, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03056, "", 516, 514, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02057, "Cantidad de facturas por fecha de vencimiento:", 236, 538, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03057, "", 516, 535, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02058, "Cantidad de facturas por fecha de vencimiento:", 236, 559, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03058, "", 516, 556, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02059, "Cantidad de facturas por fecha de vencimiento:", 236, 580, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03059, "", 516, 577, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02060, "Cantidad de facturas por fecha de vencimiento:", 236, 601, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03060, "", 516, 598, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02061, "Cantidad de facturas por fecha de vencimiento:", 236, 622, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03061, "", 516, 619, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02062, "Cantidad de facturas por fecha de vencimiento:", 236, 643, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03062, "", 516, 640, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02063, "Cantidad de facturas por fecha de vencimiento:", 236, 664, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03063, "", 516, 661, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02064, "Cantidad de facturas por fecha de vencimiento:", 236, 685, 277, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03064, "", 516, 682, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
END

