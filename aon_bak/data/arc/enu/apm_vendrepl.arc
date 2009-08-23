//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APM_VENDREPL - Vendor Replenishment Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0480 0291
BEGIN
    NAME "win_apm_vendrepl"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Vendor ID:", 66, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03001, "", 130, 10, 60, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04001, "", 216, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 190, 10, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02002, "Buyer Code:", 57, 34, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_buyer_code"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_buyer_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_buyer_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_buyer_code"
    END
    
    STATICTEXT 02003, "Purchasing Address:", 5, 76, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_purch_addr"
    END
    
    INPUTE 03003, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_purch_addr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04003, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_purch_addr"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_purch_addr"
    END
    
    STATICTEXT 02004, "Review Cycle Days:", 17, 97, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_rev_days"
    END
    INPUTN 03004, "", 130, 94, 30, 19
    BEGIN
        NAME "inn_rev_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "##0-"
    END
    
    STATICTEXT 02005, "Next Review Date:", 24, 118, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_rev_date"
    END
    
    INPUTD 03005, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_nxt_rev_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_nxt_rev_date"
    END
    
    STATICTEXT 02006, "Prior Review Date:", 23, 139, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_rev_date"
    END
    
    INPUTD 03006, "", 130, 136, 85, 19
    BEGIN
        NAME "ind_pri_rev_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02007, "Last Receipt Date:", 24, 160, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstrec_date"
    END
    
    INPUTD 03007, "", 130, 157, 85, 19
    BEGIN
        NAME "ind_lstrec_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02008, "YTD Receipt:", 54, 202, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ytd_rec_amt"
    END
    INPUTN 03008, "", 130, 199, 80, 19
    BEGIN
        NAME "inn_ytd_rec_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02009, "YTD Receipt Lbs:", 30, 223, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ytd_rec_lbs"
    END
    INPUTN 03009, "", 130, 220, 80, 19
    BEGIN
        NAME "inn_ytd_rec_lbs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02010, "YTD Receipt Units:", 20, 244, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ytd_rec_unts"
    END
    INPUTN 03010, "", 130, 241, 80, 19
    BEGIN
        NAME "inn_ytd_rec_unts"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Purchase Target Type:", 237, 97, 130, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pur_tgt_type"
    END
    
    LISTBUTTON 03011, "", 370, 94, 78, 300
    BEGIN
        NAME "lbx_pur_tgt_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02012, "Target $:", 315, 118, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nyr_rec_amt"
    END
    INPUTN 03012, "", 370, 115, 80, 19
    BEGIN
        NAME "inn_nyr_rec_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Target Weight:", 283, 139, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nyr_rec_lbs"
    END
    INPUTN 03013, "", 370, 136, 80, 19
    BEGIN
        NAME "inn_nyr_rec_lbs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Target Units:", 292, 160, 75, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nyr_rec_unit"
    END
    INPUTN 03014, "", 370, 157, 80, 19
    BEGIN
        NAME "inn_nyr_rec_unit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

