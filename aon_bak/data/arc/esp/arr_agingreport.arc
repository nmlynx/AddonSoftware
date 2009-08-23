//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARR_AGINGREPORT - Aging Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0907 0332
BEGIN
    NAME "win_arr_agingreport"
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
    
    STATICTEXT 02005, "Secuencia de clasificación:", 310, 13, 155, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03005, "", 468, 10, 140, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Beginning ID del cliente:", 326, 34, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03006, "", 468, 31, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04006, "", 542, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 516, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02007, "Ending ID del cliente:", 343, 55, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03007, "", 468, 52, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04007, "", 542, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 516, 52, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02008, "Beginning Sec. alt.:", 357, 76, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03008, "", 468, 73, 100, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02009, "Ending Sec. alt.:", 374, 97, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03009, "", 468, 94, 100, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02010, "Beginning Vendedor:", 343, 118, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03010, "", 468, 115, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04010, "", 529, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 503, 115, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02011, "Ending Vendedor:", 361, 139, 104, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03011, "", 468, 136, 35, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04011, "", 529, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20011, "", 503, 136, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    CHECKBOX 03012, "Antigüedad futura", 730, 52, 137, 19
    BEGIN
        NAME "cbx_future_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03013, "Créditos antiguos", 730, 73, 135, 19
    BEGIN
        NAME "cbx_age_credits"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "Actualizar el resumen de antigüedad del cliente", 730, 115, 307, 19
    BEGIN
        NAME "cbx_update_aging"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Incluir comentarios del cliente", 730, 136, 207, 19
    BEGIN
        NAME "cbx_cust_comments"
        NOT OPAQUE
    END
    
    GROUPBOX 19016, "Períodos de antigüedad ", -4, 160, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_fixed_periods"
    END
    
    CHECKBOX 03016, "Períodos de antigüedad de tamaño fijo", 190, 178, 255, 19
    BEGIN
        NAME "cbx_fixed_periods"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "Formato para exportar", 490, 178, 164, 19
    BEGIN
        NAME "cbx_col_format"
        NOT OPAQUE
    END
    
    STATICTEXT 02018, "Tamaño del período de antigüedad:", 0, 202, 189, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_days_in_per"
    END
    INPUTN 03018, "", 192, 199, 56, 19
    BEGIN
        NAME "inn_days_in_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    INPUTD 03019, "", 192, 262, 85, 19
    BEGIN
        NAME "ind_agedate_fut_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03020, "", 312, 262, 85, 19
    BEGIN
        NAME "ind_agedate_cur_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21020, "", 397, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_cur_from"
    END
    
    INPUTD 03021, "", 312, 283, 85, 19
    BEGIN
        NAME "ind_agedate_cur_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03022, "", 432, 262, 85, 19
    BEGIN
        NAME "ind_agedate_30_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21022, "", 517, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_30_from"
    END
    
    INPUTD 03023, "", 432, 283, 85, 19
    BEGIN
        NAME "ind_agedate_30_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03024, "", 552, 262, 85, 19
    BEGIN
        NAME "ind_agedate_60_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21024, "", 637, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_60_from"
    END
    
    INPUTD 03025, "", 552, 283, 85, 19
    BEGIN
        NAME "ind_agedate_60_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03026, "", 672, 262, 85, 19
    BEGIN
        NAME "ind_agedate_90_from"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21026, "", 757, 262, 20, 19
    BEGIN
        NAME "tbnc_agedate_90_from"
    END
    
    INPUTD 03027, "", 672, 283, 85, 19
    BEGIN
        NAME "ind_agedate_90_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    INPUTD 03028, "", 792, 283, 85, 19
    BEGIN
        NAME "ind_agedate_120_thru"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02029, "Future", 204, 244, 35, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_future"
    END
    
    STATICTEXT 02030, "Current", 324, 244, 42, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_current"
    END
    
    STATICTEXT 02031, "30 Days", 444, 244, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_30"
    END
    
    STATICTEXT 02032, "60 Days", 564, 244, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_60"
    END
    
    STATICTEXT 02033, "90 Days", 684, 244, 43, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_90"
    END
    
    STATICTEXT 02034, "120+ Days", 804, 244, 59, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_120"
    END
    
    STATICTEXT 02035, "From:", 144, 265, 31, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_from"
    END
    
    STATICTEXT 02036, "Thru:", 144, 286, 29, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_label_thru"
    END
END

