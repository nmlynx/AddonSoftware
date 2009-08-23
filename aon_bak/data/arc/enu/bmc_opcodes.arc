//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// BMC_OPCODES - Operation Codes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0207
BEGIN
    NAME "win_bmc_opcodes"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Operation Code:", 31, 13, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_code"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_op_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 130, 31, 200, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02003, "Direct Labor Account:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_dir_lab"
    END
    
    INPUTE 03003, "", 130, 52, 130, 19
    BEGIN
        NAME "ine_gl_dir_lab"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 286, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_dir_lab"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 260, 52, 20, 19
    BEGIN
        NAME "tbnf_gl_dir_lab"
    END
    
    STATICTEXT 02004, "Ovhd Labor Variance Acct:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ovh_var"
    END
    
    INPUTE 03004, "", 130, 73, 130, 19
    BEGIN
        NAME "ine_gl_ovh_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 286, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ovh_var"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 260, 73, 20, 19
    BEGIN
        NAME "tbnf_gl_ovh_var"
    END
    
    GROUPBOX 19005, "Rates and Times ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_direct_rate"
    END
    
    STATICTEXT 02005, "Direct Rate:", 60, 118, 67, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_direct_rate"
    END
    INPUTN 03005, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_direct_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Pieces Per Hour:", 33, 139, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pcs_per_hour"
    END
    INPUTN 03006, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_pcs_per_hour"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Overhead Factor:", 26, 160, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ovhd_factor"
    END
    INPUTN 03007, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_ovhd_factor"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Queue Time:", 264, 118, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_queue_time"
    END
    INPUTN 03008, "", 340, 115, 48, 19
    BEGIN
        NAME "inn_queue_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
    
    STATICTEXT 02009, "Setup Time:", 269, 139, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_setup_time"
    END
    INPUTN 03009, "", 340, 136, 48, 19
    BEGIN
        NAME "inn_setup_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
    
    STATICTEXT 02010, "Move Time:", 271, 160, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_move_time"
    END
    INPUTN 03010, "", 340, 157, 48, 19
    BEGIN
        NAME "inn_move_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
END

