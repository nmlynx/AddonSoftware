//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POE_REPSEL - Replenishment Selections
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0249
BEGIN
    NAME "win_poe_repsel"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Número de secuencia:", 24, 13, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_num"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_sequence_num"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Beginning Buyer Code:", 21, 34, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_beg_buyer"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_beg_buyer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02003, "Ending Buyer Code:", 39, 55, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_end_buyer"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_end_buyer"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02004, "Beginning Vendor:", 46, 76, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_begin_vend"
    END
    
    INPUTE 03004, "", 156, 73, 60, 19
    BEGIN
        NAME "ine_begin_vend"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 02005, "Ending Vendor:", 63, 97, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ending_vend"
    END
    
    INPUTE 03005, "", 156, 94, 60, 19
    BEGIN
        NAME "ine_ending_vend"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 02006, "Beginning Review Date:", 19, 118, 134, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_begrev_date"
    END
    
    INPUTD 03006, "", 156, 115, 85, 19
    BEGIN
        NAME "ind_begrev_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 241, 115, 20, 19
    BEGIN
        NAME "tbnc_begrev_date"
    END
    
    STATICTEXT 02007, "Ending Review Date:", 37, 139, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_endrev_date"
    END
    
    INPUTD 03007, "", 156, 136, 85, 19
    BEGIN
        NAME "ind_endrev_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 241, 136, 20, 19
    BEGIN
        NAME "tbnc_endrev_date"
    END
    
    STATICTEXT 02008, "From Warehouse ID:", 36, 160, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_from_whse"
    END
    
    INPUTE 03008, "", 156, 157, 35, 19
    BEGIN
        NAME "ine_from_whse"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02009, "Thru Warehouse ID:", 38, 181, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_thru_whse"
    END
    
    INPUTE 03009, "", 156, 178, 35, 19
    BEGIN
        NAME "ine_thru_whse"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02010, "Replenishment Comments:", 0, 202, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rep_comments"
    END
    
    INPUTE 03010, "", 156, 199, 240, 19
    BEGIN
        NAME "ine_rep_comments"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
END

