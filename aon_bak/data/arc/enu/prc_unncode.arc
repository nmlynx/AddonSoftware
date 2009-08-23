//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRC_UNNCODE - Union Code
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0707
BEGIN
    NAME "win_prc_unncode"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_prc_unncode", 4, 0223, 0419, 0484
    BEGIN
        NAME "tab_prc_unncode"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Pay Codes" 0 1100
        TAB "Deductions" 1 1101
        TAB "Contributions" 2 1102
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_prc_unncode_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_prc_unncode_1101"
    END
    
    CHILD-WINDOW 1102, 1102, 10, 88
    BEGIN
        NAME "chp_prc_unncode_1102"
    END
    
    
    STATICTEXT 02001, "Union Code:", 55, 13, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_union_code"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_union_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 02002, "Union Name:", 53, 34, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03002, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    GROUPBOX 19003, "Additional ", -4, 55, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_addr_line_1"
    END
    
    STATICTEXT 02003, "Address:", 75, 76, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_1"
    END
    
    INPUTE 03003, "", 130, 73, 192, 19
    BEGIN
        NAME "ine_addr_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03004, "", 130, 94, 192, 19
    BEGIN
        NAME "ine_addr_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03005, "", 130, 115, 192, 19
    BEGIN
        NAME "ine_addr_line_3"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02006, "Zip Code:", 71, 139, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_zip_code"
    END
    
    INPUTE 03006, "", 130, 136, 117, 19
    BEGIN
        NAME "ine_zip_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02007, "Phone:", 88, 160, 39, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_no"
    END
    
    INPUTE 03007, "", 130, 157, 200, 19
    BEGIN
        NAME "ine_phone_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02008, "Contact Name:", 42, 181, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contact_name"
    END
    
    INPUTE 03008, "", 130, 178, 200, 19
    BEGIN
        NAME "ine_contact_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02009, "Employer License#:", 14, 202, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_union_id_no"
    END
    
    INPUTE 03009, "", 130, 199, 200, 19
    BEGIN
        NAME "ine_union_id_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
END
CHILD-WINDOW 1100 0 0 0416 0462
BEGIN
    NAME "chw_prc_unncode_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Pay Code:", 70, 13, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03101, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04101, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20101, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02102, "Pay Code:", 70, 34, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03102, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04102, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20102, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02103, "Pay Code:", 70, 55, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03103, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04103, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20103, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02104, "Pay Code:", 70, 76, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03104, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04104, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20104, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02105, "Pay Code:", 70, 97, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03105, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04105, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20105, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02106, "Pay Code:", 70, 118, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03106, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04106, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20106, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02107, "Pay Code:", 70, 139, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03107, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04107, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20107, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02108, "Pay Code:", 70, 160, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03108, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04108, "", 191, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20108, "", 165, 157, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02109, "Pay Code:", 70, 181, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03109, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04109, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20109, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END
    
    STATICTEXT 02110, "Pay Code:", 70, 202, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_code"
    END
    
    INPUTE 03110, "", 130, 199, 35, 19
    BEGIN
        NAME "ine_pay_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04110, "", 191, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pay_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20110, "", 165, 199, 20, 19
    BEGIN
        NAME "tbnf_pay_code"
    END

END
CHILD-WINDOW 1101 0 0 0416 0462
BEGIN
    NAME "chw_prc_unncode_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Deduction Code:", 30, 13, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03201, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04201, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20201, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02202, "Deduction Code:", 30, 34, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03202, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04202, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02203, "Deduction Code:", 30, 55, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03203, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04203, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20203, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02204, "Deduction Code:", 30, 76, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03204, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04204, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20204, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02205, "Deduction Code:", 30, 97, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03205, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04205, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20205, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02206, "Deduction Code:", 30, 118, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03206, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04206, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20206, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02207, "Deduction Code:", 30, 139, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03207, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04207, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20207, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02208, "Deduction Code:", 30, 160, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03208, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04208, "", 191, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20208, "", 165, 157, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02209, "Deduction Code:", 30, 181, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03209, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04209, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20209, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END
    
    STATICTEXT 02210, "Deduction Code:", 30, 202, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_deduct_code"
    END
    
    INPUTE 03210, "", 130, 199, 35, 19
    BEGIN
        NAME "ine_deduct_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04210, "", 191, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_deduct_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20210, "", 165, 199, 20, 19
    BEGIN
        NAME "tbnf_deduct_code"
    END

END
CHILD-WINDOW 1102 0 0 0416 0462
BEGIN
    NAME "chw_prc_unncode_1102"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02301, "Contribution Code:", 14, 13, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03301, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04301, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20301, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02302, "Contribution Code:", 14, 34, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03302, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04302, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20302, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02303, "Contribution Code:", 14, 55, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03303, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04303, "", 191, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20303, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02304, "Contribution Code:", 14, 76, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03304, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04304, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20304, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02305, "Contribution Code:", 14, 97, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03305, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04305, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20305, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02306, "Contribution Code:", 14, 118, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03306, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04306, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20306, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02307, "Contribution Code:", 14, 139, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03307, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04307, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20307, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02308, "Contribution Code:", 14, 160, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03308, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04308, "", 191, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20308, "", 165, 157, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02309, "Contribution Code:", 14, 181, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03309, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04309, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20309, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02310, "Contribution Code:", 14, 202, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03310, "", 130, 199, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04310, "", 191, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20310, "", 165, 199, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02311, "Contribution Code:", 14, 223, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03311, "", 130, 220, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04311, "", 191, 224, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20311, "", 165, 220, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02312, "Contribution Code:", 14, 244, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03312, "", 130, 241, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04312, "", 191, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20312, "", 165, 241, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02313, "Contribution Code:", 14, 265, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03313, "", 130, 262, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04313, "", 191, 266, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20313, "", 165, 262, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02314, "Contribution Code:", 14, 286, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03314, "", 130, 283, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04314, "", 191, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20314, "", 165, 283, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02315, "Contribution Code:", 14, 307, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03315, "", 130, 304, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04315, "", 191, 308, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20315, "", 165, 304, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02316, "Contribution Code:", 14, 328, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03316, "", 130, 325, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04316, "", 191, 329, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20316, "", 165, 325, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02317, "Contribution Code:", 14, 349, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03317, "", 130, 346, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04317, "", 191, 350, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20317, "", 165, 346, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02318, "Contribution Code:", 14, 370, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03318, "", 130, 367, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04318, "", 191, 371, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20318, "", 165, 367, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02319, "Contribution Code:", 14, 391, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03319, "", 130, 388, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04319, "", 191, 392, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20319, "", 165, 388, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END
    
    STATICTEXT 02320, "Contribution Code:", 14, 412, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contrib_code"
    END
    
    INPUTE 03320, "", 130, 409, 35, 19
    BEGIN
        NAME "ine_contrib_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04320, "", 191, 413, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_contrib_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20320, "", 165, 409, 20, 19
    BEGIN
        NAME "tbnf_contrib_code"
    END

END

