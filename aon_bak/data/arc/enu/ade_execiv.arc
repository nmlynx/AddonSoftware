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
    
    STATICTEXT 02001, "Four Digit Year [YYYY]:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_full_year"
    END
    
    INPUTE 03001, "", 130, 10, 52, 19
    BEGIN
        NAME "ine_full_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Month:", 87, 34, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_month"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_month"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Value Committed:", 24, 55, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_commit_value"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_commit_value"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "On Hand Value by Date:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "On Hand Value by Date:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "On Hand Value by Date:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "On Hand Value by Date:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "On Hand Value by Date:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "On Hand Value by Date:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "On Hand Value by Date:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "On Hand Value by Date:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "On Hand Value by Date:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "On Hand Value by Date:", 0, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "On Hand Value by Date:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "On Hand Value by Date:", 0, 307, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03015, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "On Hand Value by Date:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "On Hand Value by Date:", 0, 349, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "On Hand Value by Date:", 0, 370, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "On Hand Value by Date:", 0, 391, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "On Hand Value by Date:", 0, 412, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03020, "", 130, 409, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "On Hand Value by Date:", 0, 433, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03021, "", 130, 430, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "On Hand Value by Date:", 0, 454, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03022, "", 130, 451, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "On Hand Value by Date:", 0, 475, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03023, "", 130, 472, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "On Hand Value by Date:", 0, 496, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03024, "", 130, 493, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "On Hand Value by Date:", 0, 517, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03025, "", 130, 514, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "On Hand Value by Date:", 0, 538, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03026, "", 130, 535, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "On Hand Value by Date:", 0, 559, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03027, "", 130, 556, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "On Hand Value by Date:", 0, 580, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03028, "", 130, 577, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "On Hand Value by Date:", 0, 601, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03029, "", 130, 598, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "On Hand Value by Date:", 0, 622, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03030, "", 130, 619, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "On Hand Value by Date:", 0, 643, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03031, "", 130, 640, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "On Hand Value by Date:", 0, 664, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03032, "", 130, 661, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "On Hand Value by Date:", 0, 685, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03033, "", 130, 682, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "On Hand Value by Date:", 0, 706, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_oh_bydt"
    END
    INPUTN 03034, "", 130, 703, 64, 19
    BEGIN
        NAME "inn_inv_oh_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

