//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLE_JRNLHDR - Journal Entry Header
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0850 0365
BEGIN
    NAME "win_gle_jrnlhdr"
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
    
    STATICTEXT 02002, "Código de ID del libro diario:", 0, 34, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_journal_id"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_journal_id"
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
        NAME "dis_journal_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_journal_id"
    END
    
    STATICTEXT 02003, "ID de transacción:", 48, 55, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_je_trans_id"
    END
    
    INPUTE 03003, "", 156, 52, 130, 19
    BEGIN
        NAME "ine_je_trans_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02004, "Descripción:", 80, 76, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03004, "", 156, 73, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02005, "Fecha de la transacción:", 13, 97, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_date"
    END
    
    INPUTD 03005, "", 156, 94, 85, 19
    BEGIN
        NAME "ind_trans_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 241, 94, 20, 19
    BEGIN
        NAME "tbnc_trans_date"
    END
    
    STATICTEXT 02006, "Fecha de anulación:", 38, 118, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_reverse_date"
    END
    
    INPUTD 03006, "", 156, 115, 85, 19
    BEGIN
        NAME "ind_reverse_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 241, 115, 20, 19
    BEGIN
        NAME "tbnc_reverse_date"
    END
    
    STATICTEXT 02007, "Débitos:", 573, 55, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_debit_amt"
    END
    INPUTN 03007, "", 624, 52, 64, 19
    BEGIN
        NAME "inn_debit_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Créditos:", 568, 76, 53, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_amt"
    END
    INPUTN 03008, "", 624, 73, 64, 19
    BEGIN
        NAME "inn_credit_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Saldo:", 586, 97, 35, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_balance"
    END
    INPUTN 03009, "", 624, 94, 64, 19
    BEGIN
        NAME "inn_balance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Unidades:", 695, 97, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_units"
    END
    INPUTN 03010, "", 756, 94, 64, 19
    BEGIN
        NAME "inn_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    CHILD-WINDOW 1109 1109 5 0148
END
CHILD-WINDOW 1109 0840 0005
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0838 100
    BEGIN
        NAME "grd_GLE_JRNLDET"
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
        COLUMNS 7
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 80
        GRIDCOLTITLE 1, "Account"
        GRIDCOLWIDTH 2, 250
        GRIDCOLTITLE 2, "Description"
        GRIDCOLWIDTH 3, 240
        GRIDCOLTITLE 3, "Memo"
        GRIDCOLWIDTH 4, 56
        GRIDCOLTITLE 4, "Debit"
        GRIDCOLWIDTH 5, 56
        GRIDCOLTITLE 5, "Credit"
        GRIDCOLWIDTH 6, 56
        GRIDCOLTITLE 6, "Units"
    END

END

