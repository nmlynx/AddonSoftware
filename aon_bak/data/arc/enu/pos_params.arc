//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POS_PARAMS - Purchase Order Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0456 0342
BEGIN
    NAME "win_pos_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_pos_params", 4, 0030, 0449, 0337
    BEGIN
        NAME "tab_pos_params"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "System Parameters" 0 1100
        TAB "Defaults" 1 1101
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_pos_params_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_pos_params_1101"
    END
    
END
CHILD-WINDOW 1100 0 0 0446 0315
BEGIN
    NAME "chw_pos_params_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Landed Cost Method:", 43, 13, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_land_method"
    END
    
    LISTBUTTON 03101, "", 170, 10, 81, 300
    BEGIN
        NAME "lbx_land_method"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03102, "Display Comments?", 168, 31, 145, 19
    BEGIN
        NAME "cbx_display_cmts"
        NOT OPAQUE
    END
    
    STATICTEXT 02103, "Starting Comments Line Number:", 0, 55, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_beg_cmt_line"
    END
    
    INPUTE 03103, "", 170, 52, 35, 19
    BEGIN
        NAME "ine_beg_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02104, "Ending Comments Line Number:", 0, 76, 167, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_cmt_line"
    END
    
    INPUTE 03104, "", 170, 73, 35, 19
    BEGIN
        NAME "ine_end_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03105, "Print Vendor Item?", 168, 94, 137, 19
    BEGIN
        NAME "cbx_prt_vdr_item"
        NOT OPAQUE
    END
    
    CHECKBOX 03106, "Update Unreleased Work Orders?", 168, 115, 224, 19
    BEGIN
        NAME "cbx_updt_plan_wo"
        NOT OPAQUE
    END
    
    CHECKBOX 03107, "Retain PO M-Line Type History?", 168, 136, 213, 19
    BEGIN
        NAME "cbx_m_line_hist"
        NOT OPAQUE
    END
    
    CHECKBOX 03108, "Retain PO V-Line Type History?", 168, 157, 211, 19
    BEGIN
        NAME "cbx_v_line_hist"
        NOT OPAQUE
    END

END
CHILD-WINDOW 1101 0 0 0446 0315
BEGIN
    NAME "chw_pos_params_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Vendor Ship Via:", 62, 13, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_ship_via"
    END
    
    INPUTE 03201, "", 160, 10, 120, 19
    BEGIN
        NAME "ine_ap_ship_via"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02202, "Purchase Order Freight Terms:", 0, 34, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_frt_terms"
    END
    
    INPUTE 03202, "", 160, 31, 120, 19
    BEGIN
        NAME "ine_po_frt_terms"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02203, "Free On Board [FOB]:", 35, 55, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fob"
    END
    
    INPUTE 03203, "", 160, 52, 120, 19
    BEGIN
        NAME "ine_fob"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    CHECKBOX 03204, "Hold For Manual Release?", 158, 73, 178, 19
    BEGIN
        NAME "cbx_hold_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02205, "PO  Req  Message Code:", 18, 97, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_req_msg_code"
    END
    
    INPUTE 03205, "", 160, 94, 35, 19
    BEGIN
        NAME "ine_po_req_msg_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04205, "", 221, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_req_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20205, "", 195, 94, 20, 19
    BEGIN
        NAME "tbnf_po_req_msg_code"
    END
    
    STATICTEXT 02206, "PO Standard Message Code:", 0, 118, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_msg_code"
    END
    
    INPUTE 03206, "", 160, 115, 35, 19
    BEGIN
        NAME "ine_po_msg_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04206, "", 221, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20206, "", 195, 115, 20, 19
    BEGIN
        NAME "tbnf_po_msg_code"
    END
    
    STATICTEXT 02207, "Purchase Order Line Code:", 0, 139, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_code"
    END
    
    INPUTE 03207, "", 160, 136, 35, 19
    BEGIN
        NAME "ine_po_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04207, "", 221, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20207, "", 195, 136, 20, 19
    BEGIN
        NAME "tbnf_po_line_code"
    END
    
    GROUPBOX 19208, "Requisition Generation Defaults ", -4, 160, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_req_s_linecd"
    END
    
    STATICTEXT 02208, "Standard Type Line Code:", 8, 181, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_s_linecd"
    END
    
    INPUTE 03208, "", 160, 178, 35, 19
    BEGIN
        NAME "ine_req_s_linecd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04208, "", 221, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_req_s_linecd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20208, "", 195, 178, 20, 19
    BEGIN
        NAME "tbnf_req_s_linecd"
    END
    
    STATICTEXT 02209, "Non-stock Type Line Code:", 0, 202, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_n_linecd"
    END
    
    INPUTE 03209, "", 160, 199, 35, 19
    BEGIN
        NAME "ine_req_n_linecd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04209, "", 221, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_req_n_linecd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20209, "", 195, 199, 20, 19
    BEGIN
        NAME "tbnf_req_n_linecd"
    END
    
    STATICTEXT 02210, "Message Type Line Code:", 10, 223, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_m_linecd"
    END
    
    INPUTE 03210, "", 160, 220, 35, 19
    BEGIN
        NAME "ine_req_m_linecd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04210, "", 221, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_req_m_linecd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20210, "", 195, 220, 20, 19
    BEGIN
        NAME "tbnf_req_m_linecd"
    END
    
    GROUPBOX 19211, "Invoice Entry Default ", -4, 244, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_po_inv_code"
    END
    
    STATICTEXT 02211, "Other Type Line Code:", 27, 265, 130, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_inv_code"
    END
    
    INPUTE 03211, "", 160, 262, 35, 19
    BEGIN
        NAME "ine_po_inv_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04211, "", 221, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_inv_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20211, "", 195, 262, 20, 19
    BEGIN
        NAME "tbnf_po_inv_code"
    END

END

