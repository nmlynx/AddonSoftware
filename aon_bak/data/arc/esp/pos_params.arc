//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POS_PARAMS - Purchase Order Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0488 0342
BEGIN
    NAME "win_pos_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_pos_params", 4, 0030, 0481, 0337
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
CHILD-WINDOW 1100 0 0 0478 0315
BEGIN
    NAME "chw_pos_params_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Landed Cost Method:", 77, 13, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_land_method"
    END
    
    LISTBUTTON 03101, "", 204, 10, 81, 300
    BEGIN
        NAME "lbx_land_method"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03102, "Display Comments?", 202, 31, 145, 19
    BEGIN
        NAME "cbx_display_cmts"
        NOT OPAQUE
    END
    
    STATICTEXT 02103, "Número inicial de línea de comentarios:", 0, 55, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_beg_cmt_line"
    END
    
    INPUTE 03103, "", 204, 52, 35, 19
    BEGIN
        NAME "ine_beg_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02104, "Número de finalización de línea de comentarios:", 0, 76, 201, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_cmt_line"
    END
    
    INPUTE 03104, "", 204, 73, 35, 19
    BEGIN
        NAME "ine_end_cmt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03105, "Print Vendor Item?", 202, 94, 137, 19
    BEGIN
        NAME "cbx_prt_vdr_item"
        NOT OPAQUE
    END
    
    CHECKBOX 03106, "Update Unreleased Work Orders?", 202, 115, 224, 19
    BEGIN
        NAME "cbx_updt_plan_wo"
        NOT OPAQUE
    END
    
    CHECKBOX 03107, "Retain PO M-Line Type History?", 202, 136, 213, 19
    BEGIN
        NAME "cbx_m_line_hist"
        NOT OPAQUE
    END
    
    CHECKBOX 03108, "Retain PO V-Line Type History?", 202, 157, 211, 19
    BEGIN
        NAME "cbx_v_line_hist"
        NOT OPAQUE
    END

END
CHILD-WINDOW 1101 0 0 0478 0315
BEGIN
    NAME "chw_pos_params_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Medio de envío del proveedor:", 12, 13, 177, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_ship_via"
    END
    
    INPUTE 03201, "", 192, 10, 120, 19
    BEGIN
        NAME "ine_ap_ship_via"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02202, "Purchase Order Freight Terms:", 8, 34, 181, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_frt_terms"
    END
    
    INPUTE 03202, "", 192, 31, 120, 19
    BEGIN
        NAME "ine_po_frt_terms"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02203, "Libre a bordo [FOB]:", 72, 55, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fob"
    END
    
    INPUTE 03203, "", 192, 52, 120, 19
    BEGIN
        NAME "ine_fob"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    CHECKBOX 03204, "¿Retener para emisión manual?", 190, 73, 211, 19
    BEGIN
        NAME "cbx_hold_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02205, "PO  Req  Message Code:", 50, 97, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_req_msg_code"
    END
    
    INPUTE 03205, "", 192, 94, 35, 19
    BEGIN
        NAME "ine_po_req_msg_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04205, "", 253, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_req_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20205, "", 227, 94, 20, 19
    BEGIN
        NAME "tbnf_po_req_msg_code"
    END
    
    STATICTEXT 02206, "PO Standard Message Code:", 26, 118, 163, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_msg_code"
    END
    
    INPUTE 03206, "", 192, 115, 35, 19
    BEGIN
        NAME "ine_po_msg_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04206, "", 253, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_msg_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20206, "", 227, 115, 20, 19
    BEGIN
        NAME "tbnf_po_msg_code"
    END
    
    STATICTEXT 02207, "Purchase Order Line Code:", 32, 139, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_code"
    END
    
    INPUTE 03207, "", 192, 136, 35, 19
    BEGIN
        NAME "ine_po_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04207, "", 253, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20207, "", 227, 136, 20, 19
    BEGIN
        NAME "tbnf_po_line_code"
    END
    
    GROUPBOX 19208, "Requisition Generation Defaults ", -4, 160, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_req_s_linecd"
    END
    
    STATICTEXT 02208, "Standard Type Line Code:", 40, 181, 149, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_s_linecd"
    END
    
    INPUTE 03208, "", 192, 178, 35, 19
    BEGIN
        NAME "ine_req_s_linecd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04208, "", 253, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_req_s_linecd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20208, "", 227, 178, 20, 19
    BEGIN
        NAME "tbnf_req_s_linecd"
    END
    
    STATICTEXT 02209, "Non-stock Type Line Code:", 30, 202, 159, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_n_linecd"
    END
    
    INPUTE 03209, "", 192, 199, 35, 19
    BEGIN
        NAME "ine_req_n_linecd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04209, "", 253, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_req_n_linecd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20209, "", 227, 199, 20, 19
    BEGIN
        NAME "tbnf_req_n_linecd"
    END
    
    STATICTEXT 02210, "Message Type Line Code:", 42, 223, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_req_m_linecd"
    END
    
    INPUTE 03210, "", 192, 220, 35, 19
    BEGIN
        NAME "ine_req_m_linecd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04210, "", 253, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_req_m_linecd"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20210, "", 227, 220, 20, 19
    BEGIN
        NAME "tbnf_req_m_linecd"
    END
    
    GROUPBOX 19211, "Invoice Entry Default ", -4, 244, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_po_inv_code"
    END
    
    STATICTEXT 02211, "Other Type Line Code:", 59, 265, 130, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_inv_code"
    END
    
    INPUTE 03211, "", 192, 262, 35, 19
    BEGIN
        NAME "ine_po_inv_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04211, "", 253, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_inv_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20211, "", 227, 262, 20, 19
    BEGIN
        NAME "tbnf_po_inv_code"
    END

END

