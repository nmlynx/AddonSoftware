//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRS_MAGMED2S - Supplement State Rec 2S
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0396
BEGIN
    NAME "win_prs_magmed2s"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "W2 St. Emplr Acct #:", 11, 13, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_st_emp_ac"
    END
    
    INPUTE 03001, "", 130, 10, 120, 19
    BEGIN
        NAME "ine_w2_st_emp_ac"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000000"
    END
    
    STATICTEXT 02002, "W2 Reporting Period:", 4, 34, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_rpt_per"
    END
    
    INPUTE 03002, "", 130, 31, 40, 19
    BEGIN
        NAME "ine_w2_rpt_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02003, "W2 St Qtr Unemp Wage:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_qtr_ue_wg"
    END
    
    INPUTE 03003, "", 130, 52, 90, 19
    BEGIN
        NAME "ine_w2_qtr_ue_wg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02004, "W2 St Qtrly Unemp Tax Wages:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_st_qtr_ue"
    END
    
    INPUTE 03004, "", 130, 73, 90, 19
    BEGIN
        NAME "ine_w2_st_qtr_ue"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02005, "W2 Number of Weeks Worked:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_weeks_wrk"
    END
    
    INPUTE 03005, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_w2_weeks_wrk"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02006, "W2 Date First Employed:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_date_emp"
    END
    
    INPUTE 03006, "", 130, 115, 40, 19
    BEGIN
        NAME "ine_w2_date_emp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02007, "W2 Date Of Separation:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_date_sep"
    END
    
    INPUTE 03007, "", 130, 136, 40, 19
    BEGIN
        NAME "ine_w2_date_sep"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02008, "W2 State Code:", 41, 160, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_state_id"
    END
    
    INPUTE 03008, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_w2_state_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02009, "W2 Ann St Tax Wages:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_st_tax_wg"
    END
    
    INPUTE 03009, "", 130, 178, 90, 19
    BEGIN
        NAME "ine_w2_st_tax_wg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000000000"
    END
    
    STATICTEXT 02010, "W2 St Income Tax W/H:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_st_tax_wh"
    END
    
    INPUTE 03010, "", 130, 199, 80, 19
    BEGIN
        NAME "ine_w2_st_tax_wh"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000"
    END
    
    STATICTEXT 02011, "W2 Voluntary Disability Ins:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_vol_dis"
    END
    
    INPUTE 03011, "", 130, 220, 50, 19
    BEGIN
        NAME "ine_w2_vol_dis"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000"
    END
    
    STATICTEXT 02012, "W2 California SDI Withholding:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_ca_sdi"
    END
    
    INPUTE 03012, "", 130, 241, 50, 19
    BEGIN
        NAME "ine_w2_ca_sdi"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000"
    END
    
    STATICTEXT 02013, "W2 Tax Type:", 49, 265, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_tax_type"
    END
    
    INPUTE 03013, "", 130, 262, 35, 19
    BEGIN
        NAME "ine_w2_tax_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02014, "W2 Tax Entity:", 45, 286, 82, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_tax_enty"
    END
    
    INPUTE 03014, "", 130, 283, 50, 19
    BEGIN
        NAME "ine_w2_tax_enty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 5
    END
    
    STATICTEXT 02015, "W2 Local Wages:", 32, 307, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_loc_wage"
    END
    
    INPUTE 03015, "", 130, 304, 90, 19
    BEGIN
        NAME "ine_w2_loc_wage"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02016, "W2 Local Income Tax Withhld:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_loc_tax"
    END
    
    INPUTE 03016, "", 130, 325, 70, 19
    BEGIN
        NAME "ine_w2_loc_tax"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    STATICTEXT 02017, "W2 Optional State Control Nbr:", 0, 349, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_w2_opt_cntl"
    END
    
    INPUTE 03017, "", 130, 346, 70, 19
    BEGIN
        NAME "ine_w2_opt_cntl"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
END

