//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFM_OPCALNDR - Operations Calendar
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0774
BEGIN
    NAME "win_sfm_opcalndr"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Operation Code:", 31, 13, 96, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_op_code"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_op_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_op_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_op_code"
    END
    
    STATICTEXT 02002, "Year:", 98, 34, 29, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_year"
    END
    
    INPUTE 03002, "", 130, 31, 52, 19
    BEGIN
        NAME "ine_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02003, "Month:", 87, 55, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_month"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_month"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02004, "Number Of Days In The Month:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_mth"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_days_in_mth"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02005, "Number Of Hours Worked Per Day:", 0, 97, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03005, "", 130, 94, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02006, "Number Of Hours Worked Per Day:", 0, 118, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03006, "", 130, 115, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02007, "Number Of Hours Worked Per Day:", 0, 139, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03007, "", 130, 136, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02008, "Number Of Hours Worked Per Day:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03008, "", 130, 157, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02009, "Number Of Hours Worked Per Day:", 0, 181, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03009, "", 130, 178, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02010, "Number Of Hours Worked Per Day:", 0, 202, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03010, "", 130, 199, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02011, "Number Of Hours Worked Per Day:", 0, 223, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03011, "", 130, 220, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02012, "Number Of Hours Worked Per Day:", 0, 244, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03012, "", 130, 241, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02013, "Number Of Hours Worked Per Day:", 0, 265, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03013, "", 130, 262, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02014, "Number Of Hours Worked Per Day:", 0, 286, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03014, "", 130, 283, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02015, "Number Of Hours Worked Per Day:", 0, 307, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03015, "", 130, 304, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02016, "Number Of Hours Worked Per Day:", 0, 328, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03016, "", 130, 325, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02017, "Number Of Hours Worked Per Day:", 0, 349, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03017, "", 130, 346, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02018, "Number Of Hours Worked Per Day:", 0, 370, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03018, "", 130, 367, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02019, "Number Of Hours Worked Per Day:", 0, 391, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03019, "", 130, 388, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02020, "Number Of Hours Worked Per Day:", 0, 412, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03020, "", 130, 409, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02021, "Number Of Hours Worked Per Day:", 0, 433, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03021, "", 130, 430, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02022, "Number Of Hours Worked Per Day:", 0, 454, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03022, "", 130, 451, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02023, "Number Of Hours Worked Per Day:", 0, 475, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03023, "", 130, 472, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02024, "Number Of Hours Worked Per Day:", 0, 496, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03024, "", 130, 493, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02025, "Number Of Hours Worked Per Day:", 0, 517, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03025, "", 130, 514, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02026, "Number Of Hours Worked Per Day:", 0, 538, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03026, "", 130, 535, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02027, "Number Of Hours Worked Per Day:", 0, 559, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03027, "", 130, 556, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02028, "Number Of Hours Worked Per Day:", 0, 580, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03028, "", 130, 577, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02029, "Number Of Hours Worked Per Day:", 0, 601, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03029, "", 130, 598, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02030, "Number Of Hours Worked Per Day:", 0, 622, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03030, "", 130, 619, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02031, "Number Of Hours Worked Per Day:", 0, 643, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03031, "", 130, 640, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02032, "Number Of Hours Worked Per Day:", 0, 664, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03032, "", 130, 661, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02033, "Number Of Hours Worked Per Day:", 0, 685, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03033, "", 130, 682, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02034, "Number Of Hours Worked Per Day:", 0, 706, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03034, "", 130, 703, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02035, "Number Of Hours Worked Per Day:", 0, 727, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_hrs_per_day"
    END
    INPUTN 03035, "", 130, 724, 40, 19
    BEGIN
        NAME "inn_hrs_per_day"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
END

