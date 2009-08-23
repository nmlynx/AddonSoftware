//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARE_INVHDR - AR Invoice Entry Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0786 0448
BEGIN
    NAME "win_are_invhdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Batch No:", 72, 13, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_batch_no"
    END
    
    INPUTE 03001, "", 130, 10, 70, 19
    BEGIN
        NAME "ine_batch_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "AR Invoice No:", 43, 34, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_inv_no"
    END
    
    INPUTE 03002, "", 130, 31, 70, 19
    BEGIN
        NAME "ine_ar_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUU"
    END
    
    STATICTEXT 02003, "Invoice Date:", 53, 55, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_inv_date"
    END
    
    INPUTD 03003, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_inv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_inv_date"
    END
    
    STATICTEXT 02004, "Customer ID:", 50, 76, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03004, "", 130, 73, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04004, "", 204, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 178, 73, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02005, "Address:", 75, 97, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cust_addr1"
    END
    
    INPUTE 03005, "", 130, 94, 400, 19
    BEGIN
        NAME "ine_cust_addr1"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    INPUTE 03006, "", 130, 115, 400, 19
    BEGIN
        NAME "ine_cust_addr2"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    INPUTE 03007, "", 130, 136, 400, 19
    BEGIN
        NAME "ine_cust_addr3"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    INPUTE 03008, "", 130, 157, 400, 19
    BEGIN
        NAME "ine_cust_addr4"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    INPUTE 03009, "", 130, 178, 400, 19
    BEGIN
        NAME "ine_cust_ctst"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    
    INPUTE 03010, "", 130, 199, 400, 19
    BEGIN
        NAME "ine_cust_zip"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000-0000"
    END
    
    STATICTEXT 02011, "Distribution Code:", 380, 34, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03011, "", 490, 31, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04011, "", 551, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 525, 31, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02012, "Terms Code:", 413, 55, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03012, "", 490, 52, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04012, "", 551, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 525, 52, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02013, "Invoice Type:", 410, 76, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sim_inv_type"
    END
    
    LISTBUTTON 03013, "", 490, 73, 100, 300
    BEGIN
        NAME "lbx_sim_inv_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02014, "Total Quantity:", 581, 118, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_qty"
    END
    INPUTN 03014, "", 670, 115, 56, 19
    BEGIN
        NAME "inn_tot_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Total Amount:", 584, 139, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tot_amt"
    END
    INPUTN 03015, "", 670, 136, 56, 19
    BEGIN
        NAME "inn_tot_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    CHILD-WINDOW 1109 1109 5 0252
END
CHILD-WINDOW 1109 0776 0046
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0774 100
    BEGIN
        NAME "grd_ARE_INVDET"
        CLIENTEDGE
        ROWHEAD 20, 05902
        ROWS 20
        COLUMNHEAD 18, 05901
        USERSIZE
        HORIZLINES
        HSCROLLBAR
        VERTLINES
        VSCROLLBAR
        GRIDROWDEFAULTHEIGHT 18
        COLUMNS 8
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 80
        GRIDCOLTITLE 1, "GL Acct"
        GRIDCOLWIDTH 2, 250
        GRIDCOLTITLE 2, "Description"
        GRIDCOLWIDTH 3, 64
        GRIDCOLTITLE 3, "Ship Date"
        GRIDCOLWIDTH 4, 240
        GRIDCOLTITLE 4, "Memo"
        GRIDCOLWIDTH 5, 56
        GRIDCOLTITLE 5, "Qty"
        GRIDCOLWIDTH 6, 56
        GRIDCOLTITLE 6, "Price"
        GRIDCOLWIDTH 7, 56
        GRIDCOLTITLE 7, "Extension"
    END

END

