//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// MPE_RESOURCE - Resource Forecast Entry
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0648
BEGIN
    NAME "win_mpe_resource"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "MRP Forecast Type:", 14, 13, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_forecast"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_forecast"
    END
    
    STATICTEXT 02002, "Warehouse ID:", 44, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02003, "Operation Code:", 31, 55, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_code"
    END
    
    INPUTE 03003, "", 130, 52, 39, 19
    BEGIN
        NAME "ine_op_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04003, "", 195, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_op_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 169, 52, 20, 19
    BEGIN
        NAME "tbnf_op_code"
    END
    
    STATICTEXT 02004, "Resource Capacity:", 15, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Resource Capacity:", 15, 97, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Resource Capacity:", 15, 118, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Resource Capacity:", 15, 139, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Resource Capacity:", 15, 160, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Resource Capacity:", 15, 181, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Resource Capacity:", 15, 202, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Resource Capacity:", 15, 223, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Resource Capacity:", 15, 244, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Resource Capacity:", 15, 265, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Resource Capacity:", 15, 286, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Resource Capacity:", 15, 307, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03015, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Resource Capacity:", 15, 328, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Resource Capacity:", 15, 349, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Resource Capacity:", 15, 370, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Resource Capacity:", 15, 391, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Resource Capacity:", 15, 412, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03020, "", 130, 409, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Resource Capacity:", 15, 433, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03021, "", 130, 430, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Resource Capacity:", 15, 454, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03022, "", 130, 451, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Resource Capacity:", 15, 475, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03023, "", 130, 472, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Resource Capacity:", 15, 496, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03024, "", 130, 493, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Resource Capacity:", 15, 517, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03025, "", 130, 514, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Resource Capacity:", 15, 538, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03026, "", 130, 535, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Resource Capacity:", 15, 559, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03027, "", 130, 556, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Resource Capacity:", 15, 580, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03028, "", 130, 577, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Resource Capacity:", 15, 601, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resource_cap"
    END
    INPUTN 03029, "", 130, 598, 64, 19
    BEGIN
        NAME "inn_resource_cap"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

