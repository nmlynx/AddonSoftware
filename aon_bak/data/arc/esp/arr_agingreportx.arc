//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_AGINGREPORTX - Aging Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0847 0290
BEGIN
    NAME "win_arr_agingreportx"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Fecha de antigüedad:", 5, 13, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_date"
    END
    
    INPUTD 03001, "", 132, 10, 85, 19
    BEGIN
        NAME "ind_report_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21001, "", 217, 10, 20, 19
    BEGIN
        NAME "tbnc_report_date"
    END
    
    STATICTEXT 02002, "Antigüedad por:", 34, 34, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_type"
    END
    
    LISTBUTTON 03002, "", 132, 31, 91, 300
    BEGIN
        NAME "lbx_report_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Resumen o detalle:", 19, 76, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_summ_det"
    END
    
    LISTBUTTON 03003, "", 132, 73, 74, 300
    BEGIN
        NAME "lbx_report_summ_det"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Secuencia de informe:", 1, 97, 128, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_option"
    END
    
    LISTBUTTON 03004, "", 132, 94, 88, 300
    BEGIN
        NAME "lbx_report_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Secuencia de clasificación:", 250, 13, 155, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03005, "", 408, 10, 140, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Beginning ID del cliente:", 266, 34, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03006, "", 408, 31, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04006, "", 482, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 456, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02007, "Ending ID del cliente:", 283, 55, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03007, "", 408, 52, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04007, "", 482, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 456, 52, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02008, "Beginning Vendedor:", 283, 76, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03008, "", 408, 73, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04008, "", 469, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 443, 73, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02009, "Ending Vendedor:", 301, 97, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03009, "", 408, 94, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04009, "", 469, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 443, 94, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    CHECKBOX 03010, "Antigüedad futura", 670, 10, 137, 19
    BEGIN
        NAME "cbx_future_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Créditos antiguos", 670, 31, 135, 19
    BEGIN
        NAME "cbx_age_credits"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "Actualizar el resumen de antigüedad del cliente", 670, 73, 307, 19
    BEGIN
        NAME "cbx_update_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Incluir comentarios del cliente", 670, 94, 207, 19
    BEGIN
        NAME "cbx_cust_comments"
        NOT OPAQUE
    END
    
    GROUPBOX 19014, "Períodos de antigüedad ", -4, 118, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_fixed_periods"
    END
    
    CHECKBOX 03014, "Períodos de antigüedad de tamaño fijo", 130, 136, 255, 19
    BEGIN
        NAME "cbx_fixed_periods"
        NOT OPAQUE
    END
    
    STATICTEXT 02015, "Tamaño del período de antigüedad:", 0, 160, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_per"
    END
    INPUTN 03015, "", 132, 157, 56, 19
    BEGIN
        NAME "inn_days_in_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    INPUTD 03016, "", 132, 220, 85, 19
    BEGIN
        NAME "ind_agedate_fut_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03017, "", 252, 220, 85, 19
    BEGIN
        NAME "ind_agedate_cur_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21017, "", 337, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_cur_from"
    END
    
    INPUTD 03018, "", 252, 241, 85, 19
    BEGIN
        NAME "ind_agedate_cur_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03019, "", 372, 220, 85, 19
    BEGIN
        NAME "ind_agedate_30_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21019, "", 457, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_30_from"
    END
    
    INPUTD 03020, "", 372, 241, 85, 19
    BEGIN
        NAME "ind_agedate_30_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03021, "", 492, 220, 85, 19
    BEGIN
        NAME "ind_agedate_60_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21021, "", 577, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_60_from"
    END
    
    INPUTD 03022, "", 492, 241, 85, 19
    BEGIN
        NAME "ind_agedate_60_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03023, "", 612, 220, 85, 19
    BEGIN
        NAME "ind_agedate_90_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21023, "", 697, 220, 20, 19
    BEGIN
        NAME "tbnc_agedate_90_from"
    END
    
    INPUTD 03024, "", 612, 241, 85, 19
    BEGIN
        NAME "ind_agedate_90_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03025, "", 732, 241, 85, 19
    BEGIN
        NAME "ind_agedate_120_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02026, "Future", 144, 202, 35, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_future"
    END
    
    STATICTEXT 02027, "Current", 264, 202, 42, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_current"
    END
    
    STATICTEXT 02028, "30 Days", 384, 202, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_30"
    END
    
    STATICTEXT 02029, "60 Days", 504, 202, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_60"
    END
    
    STATICTEXT 02030, "90 Days", 624, 202, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_90"
    END
    
    STATICTEXT 02031, "120+ Days", 744, 202, 59, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_120"
    END
    
    STATICTEXT 02032, "From:", 96, 223, 31, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_from"
    END
    
    STATICTEXT 02033, "Thru:", 96, 244, 29, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_thru"
    END
END

