//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVE_TRANSHDR - Inventory Transaction Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0626 0365
BEGIN
    NAME "win_ive_transhdr"
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
    
    STATICTEXT 02002, "Reference Number:", 15, 34, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_iv_trans_no"
    END
    
    INPUTE 03002, "", 130, 31, 91, 19
    BEGIN
        NAME "ine_iv_trans_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "Transaction Date:", 24, 55, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_date"
    END
    
    INPUTD 03003, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_trans_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_trans_date"
    END
    
    STATICTEXT 02004, "Transaction Code:", 220, 34, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_code"
    END
    
    INPUTE 03004, "", 330, 31, 35, 19
    BEGIN
        NAME "ine_trans_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 391, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_trans_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 365, 31, 20, 19
    BEGIN
        NAME "tbnf_trans_code"
    END
    
    STATICTEXT 02005, "Comment:", 267, 55, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_cmt"
    END
    
    INPUTE 03005, "", 330, 52, 200, 19
    BEGIN
        NAME "ine_trans_cmt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    GROUPBOX 19006, "Item Warehouse Values ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_location"
    END
    
    STATICTEXT 02006, "Location:", 4, 118, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_location"
    END
    
    INPUTE 03006, "", 60, 115, 100, 19
    BEGIN
        NAME "ine_location"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02007, "On Hand:", 182, 118, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_on_hand"
    END
    INPUTN 03007, "", 240, 115, 64, 19
    BEGIN
        NAME "inn_qty_on_hand"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Committed:", 309, 118, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_commit"
    END
    INPUTN 03008, "", 380, 115, 64, 19
    BEGIN
        NAME "inn_qty_commit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Available:", 461, 118, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_avail"
    END
    INPUTN 03009, "", 520, 115, 64, 19
    BEGIN
        NAME "inn_qty_avail"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    CHILD-WINDOW 1109 1109 5 0148
END
CHILD-WINDOW 1109 0616 0016
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0614 100
    BEGIN
        NAME "grd_IVE_TRANSDET"
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
        COLUMNS 13
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 35
        GRIDCOLTITLE 1, "Whse ID"
        GRIDCOLWIDTH 2, 160
        GRIDCOLTITLE 2, "Item ID"
        GRIDCOLWIDTH 3, 250
        GRIDCOLTITLE 3, "Description"
        GRIDCOLWIDTH 4, 80
        GRIDCOLTITLE 4, "GL Account"
        GRIDCOLWIDTH 5, 250
        GRIDCOLTITLE 5, "Description"
        GRIDCOLWIDTH 6, 128
        GRIDCOLTITLE 6, "User ID"
        GRIDCOLWIDTH 7, 56
        GRIDCOLTITLE 7, "Trans Qty"
        GRIDCOLWIDTH 8, 160
        GRIDCOLTITLE 8, "Lot/Serial No"
        GRIDCOLWIDTH 9, 56
        GRIDCOLTITLE 9, "Lot/Serial No Loc"
        GRIDCOLWIDTH 10, 320
        GRIDCOLTITLE 10, "Lot/Serial No Cmt"
        GRIDCOLWIDTH 11, 56
        GRIDCOLTITLE 11, "Unit Cost"
        GRIDCOLWIDTH 12, 56
        GRIDCOLTITLE 12, "Total Cost"
    END

END

