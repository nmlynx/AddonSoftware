//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFE_WOOPRADJ - WO Operations Cost Adjustments
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0270
BEGIN
    NAME "win_sfe_woopradj"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Work Order Location:", 2, 13, 125, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_location"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_wo_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02002, "Work Order Number:", 5, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03002, "", 130, 31, 91, 19
    BEGIN
        NAME "ine_wo_no"
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
    
    STATICTEXT 02004, "Transaction Sequence Number:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_seq"
    END
    
    INPUTE 03004, "", 130, 73, 156, 19
    BEGIN
        NAME "ine_trans_seq"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
    
    STATICTEXT 02005, "New WO Number after Adjustment:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_wo_no"
    END
    
    INPUTE 03005, "", 130, 94, 70, 19
    BEGIN
        NAME "ine_new_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02006, "Transaction Date After Adjust:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_trn_date"
    END
    
    INPUTD 03006, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_new_trn_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_new_trn_date"
    END
    
    STATICTEXT 02007, "Nbr of Units After Adjustment:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_units"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_new_units"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Direct Rate After Adjustment:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_dir_rate"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_new_dir_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Overhead Rate After Adjustment:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_ovr_rate"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_new_ovr_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "New Setup Hours:", 24, 202, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_set_hrs"
    END
    INPUTN 03010, "", 130, 199, 48, 19
    BEGIN
        NAME "inn_new_set_hrs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
    
    STATICTEXT 02011, "New Quantity Complete:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_qty_comp"
    END
    INPUTN 03011, "", 130, 220, 48, 19
    BEGIN
        NAME "inn_new_qty_comp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
END

