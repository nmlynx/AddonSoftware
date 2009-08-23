//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// BMS_PARAMS - BM Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0207
BEGIN
    NAME "win_bms_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Work In Process Account:", 4, 13, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_wip_acct"
    END
    
    INPUTE 03001, "", 156, 10, 130, 19
    BEGIN
        NAME "ine_gl_wip_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 312, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_wip_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 286, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_wip_acct"
    END
    
    STATICTEXT 02002, "Purchase To Account:", 25, 34, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pur_acct"
    END
    
    INPUTE 03002, "", 156, 31, 130, 19
    BEGIN
        NAME "ine_gl_pur_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 312, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pur_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 286, 31, 20, 19
    BEGIN
        NAME "tbnf_gl_pur_acct"
    END
    
    STATICTEXT 02003, "Production Variance Acct:", 2, 55, 151, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_prd_var"
    END
    
    INPUTE 03003, "", 156, 52, 130, 19
    BEGIN
        NAME "ine_gl_prd_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 312, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_prd_var"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 286, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_prd_var"
    END
    
    STATICTEXT 02004, "Hour/Quantity Mask:", 30, 76, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrqty_mask"
    END
    
    INPUTE 03004, "", 156, 73, 100, 19
    BEGIN
        NAME "ine_hrqty_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02005, "Material Factor Mask:", 30, 97, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mat_fac_msk"
    END
    
    INPUTE 03005, "", 156, 94, 100, 19
    BEGIN
        NAME "ine_mat_fac_msk"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02006, "Overhead Factor Mask:", 19, 118, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ovhd_fac_msk"
    END
    
    INPUTE 03006, "", 156, 115, 100, 19
    BEGIN
        NAME "ine_ovhd_fac_msk"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02007, "Material Factor:", 63, 139, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mat_factor"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_mat_factor"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Hour/Quantity Precision:", 6, 160, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bm_precision"
    END
    INPUTN 03008, "", 156, 157, 30, 19
    BEGIN
        NAME "inn_bm_precision"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
    END
END

