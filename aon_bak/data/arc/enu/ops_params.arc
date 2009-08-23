//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPS_PARAMS - OP Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0826 0249
BEGIN
    NAME "win_ops_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    CHECKBOX 03001, "Use Customer Job Numbers?", 188, 10, 198, 19
    BEGIN
        NAME "cbx_job_nos"
        NOT OPAQUE
    END
    
    STATICTEXT 02002, "Months to Retain Job Numbers:", 6, 34, 181, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_retain_jobs"
    END
    
    INPUTE 03002, "", 190, 31, 35, 19
    BEGIN
        NAME "ine_retain_jobs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    CHECKBOX 03003, "Cash Sale?", 188, 52, 91, 19
    BEGIN
        NAME "cbx_cash_sale"
        NOT OPAQUE
    END
    
    STATICTEXT 02004, "Customer ID:", 110, 76, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03004, "", 190, 73, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04004, "", 276, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 250, 73, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02005, "# of Days/Commit into Future:", 8, 97, 179, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_commit_days"
    END
    
    INPUTE 03005, "", 190, 94, 35, 19
    BEGIN
        NAME "ine_commit_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02006, "Last Committed Date:", 62, 118, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstcom_date"
    END
    
    INPUTD 03006, "", 190, 115, 85, 19
    BEGIN
        NAME "ind_lstcom_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02007, "Minimum Order Amount:", 41, 139, 146, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_ord_amt"
    END
    INPUTN 03007, "", 190, 136, 40, 19
    BEGIN
        NAME "inn_min_ord_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0.00"
    END
    
    STATICTEXT 02008, "Average Lead Time:", 73, 160, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_def_shp_days"
    END
    
    INPUTE 03008, "", 190, 157, 35, 19
    BEGIN
        NAME "ine_def_shp_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02009, "Minimum Line Amount:", 52, 181, 135, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_line_amt"
    END
    INPUTN 03009, "", 190, 178, 40, 19
    BEGIN
        NAME "inn_min_line_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0.00"
    END
    
    STATICTEXT 02010, "Minimum Cash Sale:", 71, 202, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_min_csh_sale"
    END
    INPUTN 03010, "", 190, 199, 48, 19
    BEGIN
        NAME "inn_min_csh_sale"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0.00"
    END
    
    CHECKBOX 03011, "Skip Line Code Entry?", 528, 31, 155, 19
    BEGIN
        NAME "cbx_skip_ln_code"
        NOT OPAQUE
    END
    
    STATICTEXT 02012, "Line Code:", 466, 55, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_line_code"
    END
    
    INPUTE 03012, "", 530, 52, 35, 19
    BEGIN
        NAME "ine_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 04012, "", 591, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 565, 52, 20, 19
    BEGIN
        NAME "tbnf_line_code"
    END
    
    CHECKBOX 03013, "Allow Backorders?", 528, 73, 136, 19
    BEGIN
        NAME "cbx_backorders"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Enter Cost on Dropship?", 528, 94, 174, 19
    BEGIN
        NAME "cbx_dropshp_cost"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Enter Warehouse on Dropship?", 528, 115, 211, 19
    BEGIN
        NAME "cbx_dropshp_whse"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "Retain Detail Invoice History?", 528, 136, 199, 19
    BEGIN
        NAME "cbx_inv_hist_flg"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    CHECKBOX 03017, "Receipt Printer on System?", 528, 157, 185, 19
    BEGIN
        NAME "cbx_rec_prt_sys"
        NOT OPAQUE
    END
    
    CHECKBOX 03018, "Print Sales GL Detail?", 528, 178, 151, 19
    BEGIN
        NAME "cbx_prt_gl_det"
        NOT OPAQUE
    END
    
    STATICTEXT 02019, "Default POS Station:", 412, 202, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_default_station"
    END
    
    INPUTE 03019, "", 530, 199, 208, 19
    BEGIN
        NAME "ine_default_station"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04019, "", 764, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_default_station"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20019, "", 738, 199, 20, 19
    BEGIN
        NAME "tbnf_default_station"
    END
END

