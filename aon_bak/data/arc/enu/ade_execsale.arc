//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADE_EXECSALE - Open Orders/Sale Amounts
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 2000
BEGIN
    NAME "win_ade_execsale"
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
    
    STATICTEXT 02003, "Order Amount by Ship Date:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Order Amount by Ship Date:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Order Amount by Ship Date:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Order Amount by Ship Date:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Order Amount by Ship Date:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Order Amount by Ship Date:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Order Amount by Ship Date:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Order Amount by Ship Date:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Order Amount by Ship Date:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Order Amount by Ship Date:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Order Amount by Ship Date:", 0, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Order Amount by Ship Date:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Order Amount by Ship Date:", 0, 307, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03015, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Order Amount by Ship Date:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Order Amount by Ship Date:", 0, 349, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Order Amount by Ship Date:", 0, 370, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Order Amount by Ship Date:", 0, 391, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Order Amount by Ship Date:", 0, 412, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03020, "", 130, 409, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Order Amount by Ship Date:", 0, 433, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03021, "", 130, 430, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Order Amount by Ship Date:", 0, 454, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03022, "", 130, 451, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Order Amount by Ship Date:", 0, 475, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03023, "", 130, 472, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Order Amount by Ship Date:", 0, 496, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03024, "", 130, 493, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Order Amount by Ship Date:", 0, 517, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03025, "", 130, 514, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Order Amount by Ship Date:", 0, 538, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03026, "", 130, 535, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Order Amount by Ship Date:", 0, 559, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03027, "", 130, 556, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Order Amount by Ship Date:", 0, 580, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03028, "", 130, 577, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Order Amount by Ship Date:", 0, 601, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03029, "", 130, 598, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Order Amount by Ship Date:", 0, 622, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03030, "", 130, 619, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Order Amount by Ship Date:", 0, 643, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03031, "", 130, 640, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Order Amount by Ship Date:", 0, 664, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03032, "", 130, 661, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Order Amount by Ship Date:", 0, 685, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_amt_ship"
    END
    INPUTN 03033, "", 130, 682, 64, 19
    BEGIN
        NAME "inn_ord_amt_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Number of Orders by Ship Date:", 0, 706, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03034, "", 130, 703, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02035, "Number of Orders by Ship Date:", 0, 727, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03035, "", 130, 724, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02036, "Number of Orders by Ship Date:", 0, 748, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03036, "", 130, 745, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02037, "Number of Orders by Ship Date:", 0, 769, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03037, "", 130, 766, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02038, "Number of Orders by Ship Date:", 0, 790, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03038, "", 130, 787, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02039, "Number of Orders by Ship Date:", 0, 811, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03039, "", 130, 808, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02040, "Number of Orders by Ship Date:", 0, 832, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03040, "", 130, 829, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02041, "Number of Orders by Ship Date:", 0, 853, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03041, "", 130, 850, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02042, "Number of Orders by Ship Date:", 0, 874, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03042, "", 130, 871, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02043, "Number of Orders by Ship Date:", 0, 895, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03043, "", 130, 892, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02044, "Number of Orders by Ship Date:", 0, 916, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03044, "", 130, 913, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02045, "Number of Orders by Ship Date:", 0, 937, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03045, "", 130, 934, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02046, "Number of Orders by Ship Date:", 0, 958, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03046, "", 130, 955, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02047, "Number of Orders by Ship Date:", 0, 979, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03047, "", 130, 976, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02048, "Number of Orders by Ship Date:", 0, 1000, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03048, "", 130, 997, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02049, "Number of Orders by Ship Date:", 0, 1021, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03049, "", 130, 1018, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02050, "Number of Orders by Ship Date:", 0, 1042, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03050, "", 130, 1039, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02051, "Number of Orders by Ship Date:", 0, 1063, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03051, "", 130, 1060, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02052, "Number of Orders by Ship Date:", 0, 1084, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03052, "", 130, 1081, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02053, "Number of Orders by Ship Date:", 0, 1105, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03053, "", 130, 1102, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02054, "Number of Orders by Ship Date:", 0, 1126, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03054, "", 130, 1123, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02055, "Number of Orders by Ship Date:", 0, 1147, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03055, "", 130, 1144, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02056, "Number of Orders by Ship Date:", 0, 1168, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03056, "", 130, 1165, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02057, "Number of Orders by Ship Date:", 0, 1189, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03057, "", 130, 1186, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02058, "Number of Orders by Ship Date:", 0, 1210, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03058, "", 130, 1207, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02059, "Number of Orders by Ship Date:", 0, 1231, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03059, "", 130, 1228, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02060, "Number of Orders by Ship Date:", 0, 1252, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03060, "", 130, 1249, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02061, "Number of Orders by Ship Date:", 0, 1273, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03061, "", 130, 1270, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02062, "Number of Orders by Ship Date:", 0, 1294, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03062, "", 130, 1291, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02063, "Number of Orders by Ship Date:", 0, 1315, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03063, "", 130, 1312, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02064, "Number of Orders by Ship Date:", 0, 1336, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_ord_ship"
    END
    INPUTN 03064, "", 130, 1333, 40, 19
    BEGIN
        NAME "inn_no_ord_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02065, "Number of Lines by Ship Date:", 0, 1357, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03065, "", 130, 1354, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02066, "Number of Lines by Ship Date:", 0, 1378, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03066, "", 130, 1375, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02067, "Number of Lines by Ship Date:", 0, 1399, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03067, "", 130, 1396, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02068, "Number of Lines by Ship Date:", 0, 1420, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03068, "", 130, 1417, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02069, "Number of Lines by Ship Date:", 0, 1441, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03069, "", 130, 1438, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02070, "Number of Lines by Ship Date:", 0, 1462, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03070, "", 130, 1459, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02071, "Number of Lines by Ship Date:", 0, 1483, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03071, "", 130, 1480, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02072, "Number of Lines by Ship Date:", 0, 1504, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03072, "", 130, 1501, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02073, "Number of Lines by Ship Date:", 0, 1525, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03073, "", 130, 1522, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02074, "Number of Lines by Ship Date:", 0, 1546, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03074, "", 130, 1543, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02075, "Number of Lines by Ship Date:", 0, 1567, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03075, "", 130, 1564, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02076, "Number of Lines by Ship Date:", 0, 1588, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03076, "", 130, 1585, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02077, "Number of Lines by Ship Date:", 0, 1609, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03077, "", 130, 1606, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02078, "Number of Lines by Ship Date:", 0, 1630, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03078, "", 130, 1627, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02079, "Number of Lines by Ship Date:", 0, 1651, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03079, "", 130, 1648, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02080, "Number of Lines by Ship Date:", 0, 1672, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03080, "", 130, 1669, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02081, "Number of Lines by Ship Date:", 0, 1693, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03081, "", 130, 1690, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02082, "Number of Lines by Ship Date:", 0, 1714, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03082, "", 130, 1711, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02083, "Number of Lines by Ship Date:", 0, 1735, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03083, "", 130, 1732, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02084, "Number of Lines by Ship Date:", 0, 1756, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03084, "", 130, 1753, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02085, "Number of Lines by Ship Date:", 0, 1777, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03085, "", 130, 1774, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02086, "Number of Lines by Ship Date:", 0, 1798, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03086, "", 130, 1795, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02087, "Number of Lines by Ship Date:", 0, 1819, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03087, "", 130, 1816, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02088, "Number of Lines by Ship Date:", 0, 1840, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03088, "", 130, 1837, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02089, "Number of Lines by Ship Date:", 0, 1861, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03089, "", 130, 1858, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02090, "Number of Lines by Ship Date:", 0, 1882, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03090, "", 130, 1879, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02091, "Number of Lines by Ship Date:", 0, 1903, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03091, "", 130, 1900, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02092, "Number of Lines by Ship Date:", 0, 1924, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03092, "", 130, 1921, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02093, "Number of Lines by Ship Date:", 0, 1945, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03093, "", 130, 1942, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02094, "Number of Lines by Ship Date:", 0, 1966, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03094, "", 130, 1963, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02095, "Number of Lines by Ship Date:", 0, 1987, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_lns_ship"
    END
    INPUTN 03095, "", 130, 1984, 40, 19
    BEGIN
        NAME "inn_no_lns_ship"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
END

