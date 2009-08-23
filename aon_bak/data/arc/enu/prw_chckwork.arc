//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRW_CHCKWORK - Check Work Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0165
BEGIN
    NAME "win_prw_chckwork"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Check Number:", 37, 13, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_no"
    END
    
    INPUTE 03001, "", 130, 10, 91, 19
    BEGIN
        NAME "ine_check_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Computer/Manual/Reversal/Void:", 0, 34, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pr_chk_type"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_pr_chk_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02003, "Employee Number:", 17, 55, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_employee_no"
    END
    
    INPUTE 03003, "", 130, 52, 117, 19
    BEGIN
        NAME "ine_employee_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 04003, "", 273, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_employee_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 247, 52, 20, 19
    BEGIN
        NAME "tbnf_employee_no"
    END
    
    STATICTEXT 02004, "Sequence Number:", 17, 76, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sequence_num"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_sequence_num"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02005, "Void Computer Check:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_voided_check"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_voided_check"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02006, "Check Date:", 58, 118, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_date"
    END
    
    INPUTD 03006, "", 130, 115, 85, 19
    BEGIN
        NAME "ind_check_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21006, "", 215, 115, 20, 19
    BEGIN
        NAME "tbnc_check_date"
    END
END

