//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRM_EMPLMAST - Employee Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0589 0479
BEGIN
    NAME "win_prm_emplmast"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_prm_emplmast", 4, 0076, 0582, 0403
    BEGIN
        NAME "tab_prm_emplmast"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Employee Information" 0 1100
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_prm_emplmast_1100"
    END
    
    
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
    
    STATICTEXT 02002, "Last Name:", 64, 34, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_surname"
    END
    
    INPUTE 03002, "", 130, 31, 160, 19
    BEGIN
        NAME "ine_empl_surname"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 02003, "First Name:", 61, 55, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_givname"
    END
    
    INPUTE 03003, "", 130, 52, 140, 19
    BEGIN
        NAME "ine_empl_givname"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 14
    END
END
CHILD-WINDOW 1100 0 0 0579 0381
BEGIN
    NAME "chw_prm_emplmast_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Address:", 60, 13, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_1"
    END
    
    INPUTE 03101, "", 115, 10, 192, 19
    BEGIN
        NAME "ine_addr_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03102, "", 115, 31, 192, 19
    BEGIN
        NAME "ine_addr_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02103, "City:", 86, 55, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_city"
    END
    
    INPUTE 03103, "", 115, 52, 176, 19
    BEGIN
        NAME "ine_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02104, "State:", 81, 76, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_state_code"
    END
    
    INPUTE 03104, "", 115, 73, 35, 19
    BEGIN
        NAME "ine_state_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02105, "Zip/Postal Code:", 15, 97, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_zip_code"
    END
    
    INPUTE 03105, "", 115, 94, 117, 19
    BEGIN
        NAME "ine_zip_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02106, "Home Phone:", 35, 118, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_home_phone"
    END
    
    INPUTE 03106, "", 115, 115, 200, 19
    BEGIN
        NAME "ine_home_phone"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02107, "Work Phone:", 40, 139, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_work_phone"
    END
    
    INPUTE 03107, "", 115, 136, 200, 19
    BEGIN
        NAME "ine_work_phone"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02108, "Ext:", 90, 160, 22, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_work_extens"
    END
    
    INPUTE 03108, "", 115, 157, 40, 19
    BEGIN
        NAME "ine_work_extens"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02109, "Social Security#:", 17, 181, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_soc_sec_no"
    END
    
    INPUTE 03109, "", 115, 178, 90, 19
    BEGIN
        NAME "ine_soc_sec_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02110, "Emergency Contact:", 0, 202, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_emer_contact"
    END
    
    INPUTE 03110, "", 115, 199, 192, 19
    BEGIN
        NAME "ine_emer_contact"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02111, "Relationship:", 37, 223, 75, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_emer_relate"
    END
    
    INPUTE 03111, "", 115, 220, 100, 19
    BEGIN
        NAME "ine_emer_relate"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02112, "Emergency Phone:", 5, 244, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_emer_phone"
    END
    
    INPUTE 03112, "", 115, 241, 200, 19
    BEGIN
        NAME "ine_emer_phone"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02113, "Memo:", 74, 265, 38, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_empl_memo"
    END
    
    INPUTE 03113, "", 115, 262, 100, 19
    BEGIN
        NAME "ine_empl_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02114, "Union Code:", 40, 286, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_union_code"
    END
    
    INPUTE 03114, "", 115, 283, 39, 19
    BEGIN
        NAME "ine_union_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04114, "", 180, 287, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_union_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20114, "", 154, 283, 20, 19
    BEGIN
        NAME "tbnf_union_code"
    END
    
    STATICTEXT 02115, "Alternate Sequence:", 331, 13, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03115, "", 450, 10, 100, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02116, "Gender:", 401, 34, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sex"
    END
    
    LISTBUTTON 03116, "", 450, 31, 85, 300
    BEGIN
        NAME "lbx_sex"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02117, "Race:", 417, 55, 30, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_race"
    END
    
    INPUTE 03117, "", 450, 52, 35, 19
    BEGIN
        NAME "ine_race"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02118, "Marital Status:", 365, 76, 82, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_marital_sts"
    END
    
    LISTBUTTON 03118, "", 450, 73, 76, 300
    BEGIN
        NAME "lbx_marital_sts"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02119, "Birth Date:", 387, 97, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_birth_date"
    END
    
    INPUTD 03119, "", 450, 94, 85, 19
    BEGIN
        NAME "ind_birth_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21119, "", 535, 94, 20, 19
    BEGIN
        NAME "tbnc_birth_date"
    END
    
    STATICTEXT 02120, "Hire Date:", 390, 118, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hire_date"
    END
    
    INPUTD 03120, "", 450, 115, 85, 19
    BEGIN
        NAME "ind_hire_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21120, "", 535, 115, 20, 19
    BEGIN
        NAME "tbnc_hire_date"
    END
    
    STATICTEXT 02121, "Anniversary Date:", 343, 139, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_anniv_date"
    END
    
    INPUTD 03121, "", 450, 136, 85, 19
    BEGIN
        NAME "ind_anniv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21121, "", 535, 136, 20, 19
    BEGIN
        NAME "tbnc_anniv_date"
    END
    
    STATICTEXT 02122, "Review Date:", 375, 160, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_review_date"
    END
    
    INPUTD 03122, "", 450, 157, 85, 19
    BEGIN
        NAME "ind_review_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21122, "", 535, 157, 20, 19
    BEGIN
        NAME "tbnc_review_date"
    END
    
    STATICTEXT 02123, "Termination Date:", 343, 181, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_term_date"
    END
    
    INPUTD 03123, "", 450, 178, 85, 19
    BEGIN
        NAME "ind_term_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21123, "", 535, 178, 20, 19
    BEGIN
        NAME "tbnc_term_date"
    END
    
    STATICTEXT 02124, "Termination Code:", 339, 202, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_term_code"
    END
    
    INPUTE 03124, "", 450, 199, 35, 19
    BEGIN
        NAME "ine_term_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02125, "Pay Period:", 384, 223, 63, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pay_period"
    END
    
    LISTBUTTON 03125, "", 450, 220, 109, 300
    BEGIN
        NAME "lbx_pay_period"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02126, "Home Department:", 337, 244, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dept_code"
    END
    
    INPUTE 03126, "", 450, 241, 35, 19
    BEGIN
        NAME "ine_dept_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02127, "Normal Title:", 373, 265, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_normal_title"
    END
    
    INPUTE 03127, "", 450, 262, 35, 19
    BEGIN
        NAME "ine_normal_title"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02128, "Hourly/Salaried:", 352, 286, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrlysalary"
    END
    
    LISTBUTTON 03128, "", 450, 283, 77, 300
    BEGIN
        NAME "lbx_hrlysalary"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02129, "Full/Part Time:", 362, 307, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_full_or_part"
    END
    
    LISTBUTTON 03129, "", 450, 304, 88, 300
    BEGIN
        NAME "lbx_full_or_part"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03130, "Pension Plan?", 448, 325, 109, 19
    BEGIN
        NAME "cbx_pension_plan"
        NOT OPAQUE
    END

END

