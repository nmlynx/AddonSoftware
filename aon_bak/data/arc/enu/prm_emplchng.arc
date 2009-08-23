//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRM_EMPLCHNG - Employee Pay Change
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0123
BEGIN
    NAME "win_prm_emplchng"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Employee Number:", 17, 13, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_employee_no"
    END
    
    INPUTE 03001, "", 130, 10, 117, 19
    BEGIN
        NAME "ine_employee_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 273, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_employee_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 247, 10, 20, 19
    BEGIN
        NAME "tbnf_employee_no"
    END
    
    STATICTEXT 02002, "New Change Date:", 22, 34, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_chg_date"
    END
    
    INPUTD 03002, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_new_chg_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21002, "", 215, 31, 20, 19
    BEGIN
        NAME "tbnc_new_chg_date"
    END
    
    STATICTEXT 02003, "New Change Rate:", 23, 55, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_chg_rate"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_new_chg_rate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "New Change Hours:", 12, 76, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_new_chg_hrs"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_new_chg_hrs"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

