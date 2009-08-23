//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARS_PARAMS - AR Parameters
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0476 0249
BEGIN
    NAME "win_ars_params"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Current Period:", 87, 13, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03001, "", 180, 10, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02002, "Current Year:", 98, 34, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03002, "", 180, 31, 35, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    GROUPBOX 19003, "Settings ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_dist_by_item"
    END
    
    CHECKBOX 03003, "Distribute Sales By Item?", 178, 73, 171, 19
    BEGIN
        NAME "cbx_dist_by_item"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "Bank Reconciliation?", 178, 94, 148, 19
    BEGIN
        NAME "cbx_br_interface"
        NOT OPAQUE
    END
    
    GROUPBOX 19005, "Labels ", -4, 118, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_label_across"
    END
    
    STATICTEXT 02005, "Number of Labels Across:", 26, 139, 151, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_across"
    END
    
    INPUTE 03005, "", 180, 136, 35, 19
    BEGIN
        NAME "ine_label_across"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02006, "Horizontal Chars  Per Label:", 15, 160, 162, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_width"
    END
    
    INPUTE 03006, "", 180, 157, 35, 19
    BEGIN
        NAME "ine_label_width"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02007, "Vertical Lines Per Label:", 40, 181, 137, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_length"
    END
    
    INPUTE 03007, "", 180, 178, 35, 19
    BEGIN
        NAME "ine_label_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02008, "Point of Sale Station:", 59, 202, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_default_station"
    END
    
    INPUTE 03008, "", 180, 199, 208, 19
    BEGIN
        NAME "ine_default_station"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04008, "", 414, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_default_station"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 388, 199, 20, 19
    BEGIN
        NAME "tbnf_default_station"
    END
END

