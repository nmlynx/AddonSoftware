//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADE_EXECIV - Inventory Balances Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0753
BEGIN
    NAME "win_ade_execiv"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Año de cuatro dígitos [YYYY]:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_full_year"
    END
    
    INPUTE 03001, "", 156, 10, 52, 19
    BEGIN
        NAME "ine_full_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Mes:", 127, 34, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_month"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_month"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Valor comprometido:", 29, 55, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_commit_value"
    END
    INPUTN 03003, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_commit_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Valor disponible por fecha:", 0, 76, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03004, "", 156, 73, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Valor disponible por fecha:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Valor disponible por fecha:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Valor disponible por fecha:", 0, 139, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Valor disponible por fecha:", 0, 160, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Valor disponible por fecha:", 0, 181, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03009, "", 156, 178, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Valor disponible por fecha:", 0, 202, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03010, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Valor disponible por fecha:", 0, 223, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03011, "", 156, 220, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Valor disponible por fecha:", 0, 244, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03012, "", 156, 241, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Valor disponible por fecha:", 0, 265, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03013, "", 156, 262, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Valor disponible por fecha:", 0, 286, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03014, "", 156, 283, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Valor disponible por fecha:", 0, 307, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03015, "", 156, 304, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Valor disponible por fecha:", 0, 328, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03016, "", 156, 325, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Valor disponible por fecha:", 0, 349, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03017, "", 156, 346, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Valor disponible por fecha:", 0, 370, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03018, "", 156, 367, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Valor disponible por fecha:", 0, 391, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03019, "", 156, 388, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Valor disponible por fecha:", 0, 412, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03020, "", 156, 409, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Valor disponible por fecha:", 0, 433, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03021, "", 156, 430, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Valor disponible por fecha:", 0, 454, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03022, "", 156, 451, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Valor disponible por fecha:", 0, 475, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03023, "", 156, 472, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Valor disponible por fecha:", 0, 496, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03024, "", 156, 493, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Valor disponible por fecha:", 0, 517, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03025, "", 156, 514, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Valor disponible por fecha:", 0, 538, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03026, "", 156, 535, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Valor disponible por fecha:", 0, 559, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03027, "", 156, 556, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Valor disponible por fecha:", 0, 580, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03028, "", 156, 577, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Valor disponible por fecha:", 0, 601, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03029, "", 156, 598, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Valor disponible por fecha:", 0, 622, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03030, "", 156, 619, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Valor disponible por fecha:", 0, 643, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03031, "", 156, 640, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Valor disponible por fecha:", 0, 664, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03032, "", 156, 661, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Valor disponible por fecha:", 0, 685, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03033, "", 156, 682, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Valor disponible por fecha:", 0, 706, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03034, "", 156, 703, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

