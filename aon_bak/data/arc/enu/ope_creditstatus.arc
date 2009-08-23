//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPE_CREDITSTATUS - Customer Credit Status
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0233
BEGIN
    NAME "win_ope_creditstatus"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    
    STATICTEXT 02001, "Credit Limit:", 56, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_limit"
    END
    INPUTN 03001, "", 130, 10, 64, 19
    BEGIN
        NAME "inn_credit_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02002, "Open Invoices:", 41, 34, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_open_ar_invs"
    END
    INPUTN 03002, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_open_ar_invs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02003, "Open Orders:", 47, 55, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_open_orders"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_open_orders"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Open B/O's:", 56, 76, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_open_bos"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_open_bos"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Held Orders:", 53, 97, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_orders_held"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_orders_held"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Credit Left:", 63, 139, 64, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_left"
    END
    INPUTN 03006, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_credit_left"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Over Max Days:", 36, 160, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_over_max_days"
    END
    INPUTN 03007, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_over_max_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Customer Hold:", 35, 181, 92, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cred_hold"
    END
    
    LISTBUTTON 03008, "", 130, 178, 75, 300
    BEGIN
        NAME "lbx_cred_hold"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
END

