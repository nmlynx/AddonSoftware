//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADE_EXECAR - Open AR Invoices Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0495 0732
BEGIN
    NAME "win_ade_execar"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Four Digit Year [YYYY]:", 33, 13, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_full_year"
    END
    
    INPUTE 03001, "", 170, 10, 40, 19
    BEGIN
        NAME "ine_full_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Month:", 127, 34, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_month"
    END
    
    INPUTE 03002, "", 170, 31, 35, 19
    BEGIN
        NAME "ine_month"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Invoice Amount by Due Date:", 0, 55, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03003, "", 170, 52, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Invoice Amount by Due Date:", 0, 76, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03004, "", 170, 73, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Invoice Amount by Due Date:", 0, 97, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03005, "", 170, 94, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Invoice Amount by Due Date:", 0, 118, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03006, "", 170, 115, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Invoice Amount by Due Date:", 0, 139, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03007, "", 170, 136, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Invoice Amount by Due Date:", 0, 160, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03008, "", 170, 157, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Invoice Amount by Due Date:", 0, 181, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03009, "", 170, 178, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Invoice Amount by Due Date:", 0, 202, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03010, "", 170, 199, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Invoice Amount by Due Date:", 0, 223, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03011, "", 170, 220, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Invoice Amount by Due Date:", 0, 244, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03012, "", 170, 241, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Invoice Amount by Due Date:", 0, 265, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03013, "", 170, 262, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Invoice Amount by Due Date:", 0, 286, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03014, "", 170, 283, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Invoice Amount by Due Date:", 0, 307, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03015, "", 170, 304, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Invoice Amount by Due Date:", 0, 328, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03016, "", 170, 325, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Invoice Amount by Due Date:", 0, 349, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03017, "", 170, 346, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Invoice Amount by Due Date:", 0, 370, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03018, "", 170, 367, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Invoice Amount by Due Date:", 0, 391, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03019, "", 170, 388, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Invoice Amount by Due Date:", 0, 412, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03020, "", 170, 409, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Invoice Amount by Due Date:", 0, 433, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03021, "", 170, 430, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Invoice Amount by Due Date:", 0, 454, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03022, "", 170, 451, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Invoice Amount by Due Date:", 0, 475, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03023, "", 170, 472, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Invoice Amount by Due Date:", 0, 496, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03024, "", 170, 493, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Invoice Amount by Due Date:", 0, 517, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03025, "", 170, 514, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Invoice Amount by Due Date:", 0, 538, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03026, "", 170, 535, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Invoice Amount by Due Date:", 0, 559, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03027, "", 170, 556, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Invoice Amount by Due Date:", 0, 580, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03028, "", 170, 577, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Invoice Amount by Due Date:", 0, 601, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03029, "", 170, 598, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Invoice Amount by Due Date:", 0, 622, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03030, "", 170, 619, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Invoice Amount by Due Date:", 0, 643, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03031, "", 170, 640, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Invoice Amount by Due Date:", 0, 664, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03032, "", 170, 661, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Invoice Amount by Due Date:", 0, 685, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_due_bydt"
    END
    INPUTN 03033, "", 170, 682, 56, 19
    BEGIN
        NAME "inn_inv_due_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Number of Invoices by Due Date:", 236, 55, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03034, "", 430, 52, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02035, "Number of Invoices by Due Date:", 236, 76, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03035, "", 430, 73, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02036, "Number of Invoices by Due Date:", 236, 97, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03036, "", 430, 94, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02037, "Number of Invoices by Due Date:", 236, 118, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03037, "", 430, 115, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02038, "Number of Invoices by Due Date:", 236, 139, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03038, "", 430, 136, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02039, "Number of Invoices by Due Date:", 236, 160, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03039, "", 430, 157, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02040, "Number of Invoices by Due Date:", 236, 181, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03040, "", 430, 178, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02041, "Number of Invoices by Due Date:", 236, 202, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03041, "", 430, 199, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02042, "Number of Invoices by Due Date:", 236, 223, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03042, "", 430, 220, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02043, "Number of Invoices by Due Date:", 236, 244, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03043, "", 430, 241, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02044, "Number of Invoices by Due Date:", 236, 265, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03044, "", 430, 262, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02045, "Number of Invoices by Due Date:", 236, 286, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03045, "", 430, 283, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02046, "Number of Invoices by Due Date:", 236, 307, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03046, "", 430, 304, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02047, "Number of Invoices by Due Date:", 236, 328, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03047, "", 430, 325, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02048, "Number of Invoices by Due Date:", 236, 349, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03048, "", 430, 346, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02049, "Number of Invoices by Due Date:", 236, 370, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03049, "", 430, 367, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02050, "Number of Invoices by Due Date:", 236, 391, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03050, "", 430, 388, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02051, "Number of Invoices by Due Date:", 236, 412, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03051, "", 430, 409, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02052, "Number of Invoices by Due Date:", 236, 433, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03052, "", 430, 430, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02053, "Number of Invoices by Due Date:", 236, 454, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03053, "", 430, 451, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02054, "Number of Invoices by Due Date:", 236, 475, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03054, "", 430, 472, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02055, "Number of Invoices by Due Date:", 236, 496, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03055, "", 430, 493, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02056, "Number of Invoices by Due Date:", 236, 517, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03056, "", 430, 514, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02057, "Number of Invoices by Due Date:", 236, 538, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03057, "", 430, 535, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02058, "Number of Invoices by Due Date:", 236, 559, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03058, "", 430, 556, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02059, "Number of Invoices by Due Date:", 236, 580, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03059, "", 430, 577, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02060, "Number of Invoices by Due Date:", 236, 601, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03060, "", 430, 598, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02061, "Number of Invoices by Due Date:", 236, 622, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03061, "", 430, 619, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02062, "Number of Invoices by Due Date:", 236, 643, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03062, "", 430, 640, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02063, "Number of Invoices by Due Date:", 236, 664, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03063, "", 430, 661, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02064, "Number of Invoices by Due Date:", 236, 685, 191, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_due"
    END
    INPUTN 03064, "", 430, 682, 35, 19
    BEGIN
        NAME "inn_no_inv_due"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
END

