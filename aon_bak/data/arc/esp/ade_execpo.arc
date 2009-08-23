//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADE_EXECPO - Purchase Order Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 1383
BEGIN
    NAME "win_ade_execpo"
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
    
    STATICTEXT 02003, "Compras por fecha de recibo:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03003, "", 156, 52, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Compras por fecha de recibo:", 0, 76, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03004, "", 156, 73, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Compras por fecha de recibo:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03005, "", 156, 94, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Compras por fecha de recibo:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03006, "", 156, 115, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Compras por fecha de recibo:", 0, 139, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Compras por fecha de recibo:", 0, 160, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Compras por fecha de recibo:", 0, 181, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03009, "", 156, 178, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Compras por fecha de recibo:", 0, 202, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03010, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Compras por fecha de recibo:", 0, 223, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03011, "", 156, 220, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Compras por fecha de recibo:", 0, 244, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03012, "", 156, 241, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Compras por fecha de recibo:", 0, 265, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03013, "", 156, 262, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Compras por fecha de recibo:", 0, 286, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03014, "", 156, 283, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Compras por fecha de recibo:", 0, 307, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03015, "", 156, 304, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Compras por fecha de recibo:", 0, 328, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03016, "", 156, 325, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Compras por fecha de recibo:", 0, 349, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03017, "", 156, 346, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Compras por fecha de recibo:", 0, 370, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03018, "", 156, 367, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Compras por fecha de recibo:", 0, 391, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03019, "", 156, 388, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Compras por fecha de recibo:", 0, 412, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03020, "", 156, 409, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Compras por fecha de recibo:", 0, 433, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03021, "", 156, 430, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Compras por fecha de recibo:", 0, 454, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03022, "", 156, 451, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Compras por fecha de recibo:", 0, 475, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03023, "", 156, 472, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Compras por fecha de recibo:", 0, 496, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03024, "", 156, 493, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Compras por fecha de recibo:", 0, 517, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03025, "", 156, 514, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Compras por fecha de recibo:", 0, 538, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03026, "", 156, 535, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Compras por fecha de recibo:", 0, 559, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03027, "", 156, 556, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Compras por fecha de recibo:", 0, 580, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03028, "", 156, 577, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Compras por fecha de recibo:", 0, 601, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03029, "", 156, 598, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Compras por fecha de recibo:", 0, 622, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03030, "", 156, 619, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Compras por fecha de recibo:", 0, 643, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03031, "", 156, 640, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Compras por fecha de recibo:", 0, 664, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03032, "", 156, 661, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Compras por fecha de recibo:", 0, 685, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_amt_rec"
    END
    INPUTN 03033, "", 156, 682, 64, 19
    BEGIN
        NAME "inn_po_amt_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Cantidad de líneas de PO por fecha de recibo:", 0, 706, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03034, "", 156, 703, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02035, "Cantidad de líneas de PO por fecha de recibo:", 0, 727, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03035, "", 156, 724, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02036, "Cantidad de líneas de PO por fecha de recibo:", 0, 748, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03036, "", 156, 745, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02037, "Cantidad de líneas de PO por fecha de recibo:", 0, 769, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03037, "", 156, 766, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02038, "Cantidad de líneas de PO por fecha de recibo:", 0, 790, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03038, "", 156, 787, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02039, "Cantidad de líneas de PO por fecha de recibo:", 0, 811, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03039, "", 156, 808, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02040, "Cantidad de líneas de PO por fecha de recibo:", 0, 832, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03040, "", 156, 829, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02041, "Cantidad de líneas de PO por fecha de recibo:", 0, 853, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03041, "", 156, 850, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02042, "Cantidad de líneas de PO por fecha de recibo:", 0, 874, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03042, "", 156, 871, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02043, "Cantidad de líneas de PO por fecha de recibo:", 0, 895, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03043, "", 156, 892, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02044, "Cantidad de líneas de PO por fecha de recibo:", 0, 916, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03044, "", 156, 913, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02045, "Cantidad de líneas de PO por fecha de recibo:", 0, 937, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03045, "", 156, 934, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02046, "Cantidad de líneas de PO por fecha de recibo:", 0, 958, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03046, "", 156, 955, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02047, "Cantidad de líneas de PO por fecha de recibo:", 0, 979, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03047, "", 156, 976, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02048, "Cantidad de líneas de PO por fecha de recibo:", 0, 1000, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03048, "", 156, 997, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02049, "Cantidad de líneas de PO por fecha de recibo:", 0, 1021, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03049, "", 156, 1018, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02050, "Cantidad de líneas de PO por fecha de recibo:", 0, 1042, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03050, "", 156, 1039, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02051, "Cantidad de líneas de PO por fecha de recibo:", 0, 1063, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03051, "", 156, 1060, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02052, "Cantidad de líneas de PO por fecha de recibo:", 0, 1084, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03052, "", 156, 1081, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02053, "Cantidad de líneas de PO por fecha de recibo:", 0, 1105, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03053, "", 156, 1102, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02054, "Cantidad de líneas de PO por fecha de recibo:", 0, 1126, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03054, "", 156, 1123, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02055, "Cantidad de líneas de PO por fecha de recibo:", 0, 1147, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03055, "", 156, 1144, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02056, "Cantidad de líneas de PO por fecha de recibo:", 0, 1168, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03056, "", 156, 1165, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02057, "Cantidad de líneas de PO por fecha de recibo:", 0, 1189, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03057, "", 156, 1186, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02058, "Cantidad de líneas de PO por fecha de recibo:", 0, 1210, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03058, "", 156, 1207, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02059, "Cantidad de líneas de PO por fecha de recibo:", 0, 1231, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03059, "", 156, 1228, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02060, "Cantidad de líneas de PO por fecha de recibo:", 0, 1252, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03060, "", 156, 1249, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02061, "Cantidad de líneas de PO por fecha de recibo:", 0, 1273, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03061, "", 156, 1270, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02062, "Cantidad de líneas de PO por fecha de recibo:", 0, 1294, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03062, "", 156, 1291, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02063, "Cantidad de líneas de PO por fecha de recibo:", 0, 1315, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03063, "", 156, 1312, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02064, "Cantidad de líneas de PO por fecha de recibo:", 0, 1336, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_rec"
    END
    INPUTN 03064, "", 156, 1333, 40, 19
    BEGIN
        NAME "inn_no_lns_rec"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
END

