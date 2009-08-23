//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APE_MANCHECKHDR - Manual Check Entry Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 1022 0365
BEGIN
    NAME "win_ape_mancheckhdr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Batch No:", 98, 13, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_batch_no"
    END
    
    INPUTE 03001, "", 156, 10, 70, 19
    BEGIN
        NAME "ine_batch_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Tipo de AP:", 87, 34, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_type"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_ap_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_ap_type"
    END
    
    STATICTEXT 02003, "N.º de cheque:", 69, 55, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_no"
    END
    
    INPUTE 03003, "", 156, 52, 70, 19
    BEGIN
        NAME "ine_check_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02004, "Proveedor:", 90, 76, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03004, "", 156, 73, 48, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04004, "", 230, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 204, 73, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02005, "Tipo de trans.:", 69, 97, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_type"
    END
    
    LISTBUTTON 03005, "", 156, 94, 72, 300
    BEGIN
        NAME "lbx_trans_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Fecha del cheque:", 49, 118, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_date"
    END
    
    INPUTD 03006, "", 156, 115, 85, 19
    BEGIN
        NAME "ind_check_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 241, 115, 20, 19
    BEGIN
        NAME "tbnc_check_date"
    END
    
    STATICTEXT 02007, "Totals", 576, 34, 33, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_tots"
    END
    
    STATICTEXT 02008, "Facturas:", 508, 55, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disp_tot_inv"
    END
    INPUTN 03008, "", 564, 52, 56, 19
    BEGIN
        NAME "inn_disp_tot_inv"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Descuentos:", 489, 76, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disp_tot_disc"
    END
    INPUTN 03009, "", 564, 73, 56, 19
    BEGIN
        NAME "inn_disp_tot_disc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Retención:", 500, 97, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disp_tot_reten"
    END
    INPUTN 03010, "", 564, 94, 56, 19
    BEGIN
        NAME "inn_disp_tot_reten"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Cheque:", 513, 118, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disp_tot_check"
    END
    INPUTN 03011, "", 564, 115, 56, 19
    BEGIN
        NAME "inn_disp_tot_check"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Comentarios:", 650, 55, 79, 77
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comments"
    END
    
    CUSTOMEDIT 03012, "", 732, 52, 260, 80
    BEGIN
        NAME "ced_comments"
        CLIENTEDGE
        IGNORETABS
        WORDWRAP
        VSCROLLBAR
        HSCROLLBAR
        READONLY
        NOT TABTRAVERSABLE
    END
    CHILD-WINDOW 1109 1109 5 0169
END
CHILD-WINDOW 1109 1012 0014
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 1010 100
    BEGIN
        NAME "grd_APE_MANCHECKDET"
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
        COLUMNS 9
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 80
        GRIDCOLTITLE 1, "Invoice"
        GRIDCOLWIDTH 2, 64
        GRIDCOLTITLE 2, "Date"
        GRIDCOLWIDTH 3, 35
        GRIDCOLTITLE 3, "DC"
        GRIDCOLWIDTH 4, 250
        GRIDCOLTITLE 4, "Description"
        GRIDCOLWIDTH 5, 56
        GRIDCOLTITLE 5, "Inv Amt"
        GRIDCOLWIDTH 6, 56
        GRIDCOLTITLE 6, "Disc Amt"
        GRIDCOLWIDTH 7, 56
        GRIDCOLTITLE 7, "Retention Amt"
        GRIDCOLWIDTH 8, 56
        GRIDCOLTITLE 8, "Net Paid"
    END

END

