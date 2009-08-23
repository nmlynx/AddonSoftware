//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// MPM_FORECAST - Forecast Type Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0400 0774
BEGIN
    NAME "win_mpm_forecast"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "MRP Forecast Type:", 14, 13, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_forecast"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_forecast"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 3
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
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
    
    STATICTEXT 02003, "Description:", 56, 55, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03003, "", 130, 52, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    GROUPBOX 19004, "Additional ", -4, 76, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_include_comm"
    END
    
    CHECKBOX 03004, "Include Committed?", 128, 94, 146, 19
    BEGIN
        NAME "cbx_include_comm"
        NOT OPAQUE
    END
    
    STATICTEXT 02005, "Work Order Type:", 24, 118, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03005, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02006, "Number of Periods:", 14, 139, 113, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_of_pers"
    END
    INPUTN 03006, "", 130, 136, 30, 19
    BEGIN
        NAME "inn_no_of_pers"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "#0-"
    END
    
    STATICTEXT 02007, "Days Per Period:", 33, 160, 94, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_per"
    END
    INPUTN 03007, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_days_in_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    GROUPBOX 19008, "Plan Dates ", -4, 181, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_plan_date"
    END
    
    STATICTEXT 02008, "Plan Date:", 70, 202, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03008, "", 130, 199, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21008, "", 215, 199, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02009, "Plan Date:", 70, 223, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03009, "", 130, 220, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21009, "", 215, 220, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02010, "Plan Date:", 70, 244, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03010, "", 130, 241, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21010, "", 215, 241, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02011, "Plan Date:", 70, 265, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03011, "", 130, 262, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21011, "", 215, 262, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02012, "Plan Date:", 70, 286, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03012, "", 130, 283, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21012, "", 215, 283, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02013, "Plan Date:", 70, 307, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03013, "", 130, 304, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21013, "", 215, 304, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02014, "Plan Date:", 70, 328, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03014, "", 130, 325, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21014, "", 215, 325, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02015, "Plan Date:", 70, 349, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03015, "", 130, 346, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 215, 346, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02016, "Plan Date:", 70, 370, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03016, "", 130, 367, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21016, "", 215, 367, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02017, "Plan Date:", 70, 391, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03017, "", 130, 388, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21017, "", 215, 388, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02018, "Plan Date:", 70, 412, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03018, "", 130, 409, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21018, "", 215, 409, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02019, "Plan Date:", 70, 433, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03019, "", 130, 430, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21019, "", 215, 430, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02020, "Plan Date:", 70, 454, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03020, "", 130, 451, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21020, "", 215, 451, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02021, "Plan Date:", 70, 475, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03021, "", 130, 472, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21021, "", 215, 472, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02022, "Plan Date:", 70, 496, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03022, "", 130, 493, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21022, "", 215, 493, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02023, "Plan Date:", 70, 517, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03023, "", 130, 514, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21023, "", 215, 514, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02024, "Plan Date:", 70, 538, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03024, "", 130, 535, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21024, "", 215, 535, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02025, "Plan Date:", 70, 559, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03025, "", 130, 556, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21025, "", 215, 556, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02026, "Plan Date:", 70, 580, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03026, "", 130, 577, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21026, "", 215, 577, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02027, "Plan Date:", 70, 601, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03027, "", 130, 598, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21027, "", 215, 598, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02028, "Plan Date:", 70, 622, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03028, "", 130, 619, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21028, "", 215, 619, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02029, "Plan Date:", 70, 643, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03029, "", 130, 640, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21029, "", 215, 640, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02030, "Plan Date:", 70, 664, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03030, "", 130, 661, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21030, "", 215, 661, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02031, "Plan Date:", 70, 685, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03031, "", 130, 682, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21031, "", 215, 682, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02032, "Plan Date:", 70, 706, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03032, "", 130, 703, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21032, "", 215, 703, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
    
    STATICTEXT 02033, "Plan Date:", 70, 727, 57, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_plan_date"
    END
    
    INPUTD 03033, "", 130, 724, 85, 19
    BEGIN
        NAME "ind_plan_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21033, "", 215, 724, 20, 19
    BEGIN
        NAME "tbnc_plan_date"
    END
END

