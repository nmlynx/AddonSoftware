//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFC_WOTYPECD - Work Order Type Codes
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0333
BEGIN
    NAME "win_sfc_wotypecd"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Work Order Type:", 24, 13, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
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
    
    STATICTEXT 02003, "Work Order Category [I/N/R]:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_category"
    END
    
    LISTBUTTON 03003, "", 130, 52, 151, 300
    BEGIN
        NAME "lbx_wo_category"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Close at Standard or Actual?:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_stdact_flag"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_stdact_flag"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    GROUPBOX 19005, "G/L Accounts ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_gl_wip_acct"
    END
    
    STATICTEXT 02005, "Work In Process Account:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_wip_acct"
    END
    
    INPUTE 03005, "", 130, 115, 130, 19
    BEGIN
        NAME "ine_gl_wip_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04005, "", 286, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_wip_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 260, 115, 20, 19
    BEGIN
        NAME "tbnf_gl_wip_acct"
    END
    
    STATICTEXT 02006, "Close To Account:", 20, 139, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_close_to"
    END
    
    INPUTE 03006, "", 130, 136, 130, 19
    BEGIN
        NAME "ine_gl_close_to"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04006, "", 286, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_close_to"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 260, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_close_to"
    END
    
    STATICTEXT 02007, "Direct Labor Account:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_dir_lab"
    END
    
    INPUTE 03007, "", 130, 157, 130, 19
    BEGIN
        NAME "ine_gl_dir_lab"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04007, "", 286, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_dir_lab"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 260, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_dir_lab"
    END
    
    STATICTEXT 02008, "Overhead Labor Account:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ovh_lab"
    END
    
    INPUTE 03008, "", 130, 178, 130, 19
    BEGIN
        NAME "ine_gl_ovh_lab"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 286, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ovh_lab"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 260, 178, 20, 19
    BEGIN
        NAME "tbnf_gl_ovh_lab"
    END
    
    STATICTEXT 02009, "Purchase To Account:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_pur_acct"
    END
    
    INPUTE 03009, "", 130, 199, 130, 19
    BEGIN
        NAME "ine_gl_pur_acct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04009, "", 286, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_pur_acct"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 260, 199, 20, 19
    BEGIN
        NAME "tbnf_gl_pur_acct"
    END
    
    STATICTEXT 02010, "Dir Labor Variance Account:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_lab_var"
    END
    
    INPUTE 03010, "", 130, 220, 130, 19
    BEGIN
        NAME "ine_gl_lab_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04010, "", 286, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_lab_var"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 260, 220, 20, 19
    BEGIN
        NAME "tbnf_gl_lab_var"
    END
    
    STATICTEXT 02011, "Ovhd Labor Variance Acct:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_ovh_var"
    END
    
    INPUTE 03011, "", 130, 241, 130, 19
    BEGIN
        NAME "ine_gl_ovh_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04011, "", 286, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_ovh_var"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 260, 241, 20, 19
    BEGIN
        NAME "tbnf_gl_ovh_var"
    END
    
    STATICTEXT 02012, "Material Variance Account:", 0, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_mat_var"
    END
    
    INPUTE 03012, "", 130, 262, 130, 19
    BEGIN
        NAME "ine_gl_mat_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04012, "", 286, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_mat_var"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 260, 262, 20, 19
    BEGIN
        NAME "tbnf_gl_mat_var"
    END
    
    STATICTEXT 02013, "Subcontract Variance Acct:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_sub_var"
    END
    
    INPUTE 03013, "", 130, 283, 130, 19
    BEGIN
        NAME "ine_gl_sub_var"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04013, "", 286, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_sub_var"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20013, "", 260, 283, 20, 19
    BEGIN
        NAME "tbnf_gl_sub_var"
    END
END

