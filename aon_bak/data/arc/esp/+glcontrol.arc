//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// +GLCONTROL - GL Posting Control Global
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 2000
BEGIN
    NAME "win_+glcontrol"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Aplicación:", 89, 13, 64, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_system_id"
    END
    
    INPUTE 03001, "", 156, 10, 156, 19
    BEGIN
        NAME "ine_system_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00-000000AAA"
    END
    
    STATICTEXT 04001, "", 338, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_system_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 312, 10, 20, 19
    BEGIN
        NAME "tbnf_system_id"
    END
    
    CHECKBOX 03002, "¿Registrar en el GL?", 154, 31, 144, 19
    BEGIN
        NAME "cbx_post_gl"
        NOT OPAQUE
    END
    
    STATICTEXT 02003, "Período actual:", 67, 55, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_per"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_current_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02004, "Año actual:", 87, 76, 66, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_current_year"
    END
    
    INPUTE 03004, "", 156, 73, 40, 19
    BEGIN
        NAME "ine_current_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02005, "Código de ID del libro diario:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_journal_id"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_journal_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_journal_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_journal_id"
    END
    
    STATICTEXT 02006, "Número de auditoría:", 29, 118, 124, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_adt_no"
    END
    
    INPUTE 03006, "", 156, 115, 70, 19
    BEGIN
        NAME "ine_gl_adt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 7
    END
    
    CHECKBOX 03007, "Actualizar indicador", 154, 136, 148, 19
    BEGIN
        NAME "cbx_update_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02008, "Períodos contables totales:", 0, 160, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_pers"
    END
    
    INPUTE 03008, "", 156, 157, 35, 19
    BEGIN
        NAME "ine_total_pers"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02009, "Período fiscal actual:", 32, 181, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_period"
    END
    
    INPUTE 03009, "", 156, 178, 35, 19
    BEGIN
        NAME "ine_gl_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02010, "Año fiscal actual:", 53, 202, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_year"
    END
    
    INPUTD 03010, "", 156, 199, 85, 19
    BEGIN
        NAME "ind_gl_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21010, "", 241, 199, 20, 19
    BEGIN
        NAME "tbnc_gl_year"
    END
    
    STATICTEXT 02011, "Longitud del número de cuenta del GL:", 0, 223, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_acct_length"
    END
    
    INPUTE 03011, "", 156, 220, 35, 19
    BEGIN
        NAME "ine_acct_length"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02012, "Longitud máxima del número de cuenta del GL:", 0, 244, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_acct_len"
    END
    
    INPUTE 03012, "", 156, 241, 35, 19
    BEGIN
        NAME "ine_max_acct_len"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    CHECKBOX 03013, "¿Registrar detalle?", 154, 262, 136, 19
    BEGIN
        NAME "cbx_detail_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03014, "¿Utilizar presupuestos?", 154, 283, 167, 19
    BEGIN
        NAME "cbx_budget_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03015, "Unidades", 154, 304, 85, 19
    BEGIN
        NAME "cbx_units_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03016, "¿Conservar información detallada?", 154, 325, 233, 19
    BEGIN
        NAME "cbx_retain_det"
        NOT OPAQUE
    END
    
    CHECKBOX 03017, "Año fiscal cerrado?", 154, 346, 143, 19
    BEGIN
        NAME "cbx_gl_yr_closed"
        NOT OPAQUE
    END
    
    STATICTEXT 02018, "Método de registro:", 38, 370, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_post_code"
    END
    
    LISTBUTTON 03018, "", 156, 367, 189, 300
    BEGIN
        NAME "lbx_gl_post_code"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03019, "¿Asiento diario?", 154, 388, 123, 19
    BEGIN
        NAME "cbx_permit_je"
        NOT OPAQUE
    END
    
    CHECKBOX 03020, "¿Permitir registro al cierre del ejercicio?", 154, 409, 262, 19
    BEGIN
        NAME "cbx_post_yr_end"
        NOT OPAQUE
    END
    
    CHECKBOX 03021, "¿Registrar en períodos bloqueados?", 154, 430, 241, 19
    BEGIN
        NAME "cbx_post_locked"
        NOT OPAQUE
    END
    
    CHECKBOX 03022, "¿Usar el control de auditoría del GL?", 154, 451, 241, 19
    BEGIN
        NAME "cbx_gl_audit"
        NOT OPAQUE
    END
    
    CHECKBOX 03023, "¿Usar archivo de trabajo del GL?", 154, 472, 218, 19
    BEGIN
        NAME "cbx_gl_work_file"
        NOT OPAQUE
    END
    
    CHECKBOX 03024, "¿Imprimir resumen del GL?", 154, 493, 186, 19
    BEGIN
        NAME "cbx_prt_gl_sum"
        NOT OPAQUE
    END
    
    STATICTEXT 02025, "Descripción:", 80, 517, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03025, "", 156, 514, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02026, "Fecha de la transacción:", 13, 538, 140, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trns_date"
    END
    
    INPUTD 03026, "", 156, 535, 85, 19
    BEGIN
        NAME "ind_trns_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21026, "", 241, 535, 20, 19
    BEGIN
        NAME "tbnc_trns_date"
    END
    
    STATICTEXT 02027, "Período:", 105, 559, 48, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03027, "", 156, 556, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02028, "Año:", 126, 580, 27, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_year"
    END
    
    INPUTE 03028, "", 156, 577, 40, 19
    BEGIN
        NAME "ine_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02029, "Fecha de inicio del período:", 0, 601, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03029, "", 156, 598, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21029, "", 241, 598, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02030, "Fecha de inicio del período:", 0, 622, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03030, "", 156, 619, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21030, "", 241, 619, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02031, "Fecha de inicio del período:", 0, 643, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03031, "", 156, 640, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21031, "", 241, 640, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02032, "Fecha de inicio del período:", 0, 664, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03032, "", 156, 661, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21032, "", 241, 661, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02033, "Fecha de inicio del período:", 0, 685, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03033, "", 156, 682, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21033, "", 241, 682, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02034, "Fecha de inicio del período:", 0, 706, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03034, "", 156, 703, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21034, "", 241, 703, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02035, "Fecha de inicio del período:", 0, 727, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03035, "", 156, 724, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21035, "", 241, 724, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02036, "Fecha de inicio del período:", 0, 748, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03036, "", 156, 745, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21036, "", 241, 745, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02037, "Fecha de inicio del período:", 0, 769, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03037, "", 156, 766, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21037, "", 241, 766, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02038, "Fecha de inicio del período:", 0, 790, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03038, "", 156, 787, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21038, "", 241, 787, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02039, "Fecha de inicio del período:", 0, 811, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03039, "", 156, 808, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21039, "", 241, 808, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02040, "Fecha de inicio del período:", 0, 832, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03040, "", 156, 829, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21040, "", 241, 829, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02041, "Fecha de inicio del período:", 0, 853, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_beg"
    END
    
    INPUTD 03041, "", 156, 850, 85, 19
    BEGIN
        NAME "ind_pri_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21041, "", 241, 850, 20, 19
    BEGIN
        NAME "tbnc_pri_per_beg"
    END
    
    STATICTEXT 02042, "Fecha de inicio del período:", 0, 874, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03042, "", 156, 871, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21042, "", 241, 871, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02043, "Fecha de inicio del período:", 0, 895, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03043, "", 156, 892, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21043, "", 241, 892, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02044, "Fecha de inicio del período:", 0, 916, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03044, "", 156, 913, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21044, "", 241, 913, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02045, "Fecha de inicio del período:", 0, 937, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03045, "", 156, 934, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21045, "", 241, 934, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02046, "Fecha de inicio del período:", 0, 958, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03046, "", 156, 955, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21046, "", 241, 955, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02047, "Fecha de inicio del período:", 0, 979, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03047, "", 156, 976, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21047, "", 241, 976, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02048, "Fecha de inicio del período:", 0, 1000, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03048, "", 156, 997, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21048, "", 241, 997, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02049, "Fecha de inicio del período:", 0, 1021, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03049, "", 156, 1018, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21049, "", 241, 1018, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02050, "Fecha de inicio del período:", 0, 1042, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03050, "", 156, 1039, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21050, "", 241, 1039, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02051, "Fecha de inicio del período:", 0, 1063, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03051, "", 156, 1060, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21051, "", 241, 1060, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02052, "Fecha de inicio del período:", 0, 1084, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03052, "", 156, 1081, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21052, "", 241, 1081, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02053, "Fecha de inicio del período:", 0, 1105, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03053, "", 156, 1102, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21053, "", 241, 1102, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02054, "Fecha de inicio del período:", 0, 1126, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_beg"
    END
    
    INPUTD 03054, "", 156, 1123, 85, 19
    BEGIN
        NAME "ind_cur_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21054, "", 241, 1123, 20, 19
    BEGIN
        NAME "tbnc_cur_per_beg"
    END
    
    STATICTEXT 02055, "Fecha de inicio del período:", 0, 1147, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03055, "", 156, 1144, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21055, "", 241, 1144, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02056, "Fecha de inicio del período:", 0, 1168, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03056, "", 156, 1165, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21056, "", 241, 1165, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02057, "Fecha de inicio del período:", 0, 1189, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03057, "", 156, 1186, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21057, "", 241, 1186, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02058, "Fecha de inicio del período:", 0, 1210, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03058, "", 156, 1207, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21058, "", 241, 1207, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02059, "Fecha de inicio del período:", 0, 1231, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03059, "", 156, 1228, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21059, "", 241, 1228, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02060, "Fecha de inicio del período:", 0, 1252, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03060, "", 156, 1249, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21060, "", 241, 1249, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02061, "Fecha de inicio del período:", 0, 1273, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03061, "", 156, 1270, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21061, "", 241, 1270, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02062, "Fecha de inicio del período:", 0, 1294, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03062, "", 156, 1291, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21062, "", 241, 1291, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02063, "Fecha de inicio del período:", 0, 1315, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03063, "", 156, 1312, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21063, "", 241, 1312, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02064, "Fecha de inicio del período:", 0, 1336, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03064, "", 156, 1333, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21064, "", 241, 1333, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02065, "Fecha de inicio del período:", 0, 1357, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03065, "", 156, 1354, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21065, "", 241, 1354, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02066, "Fecha de inicio del período:", 0, 1378, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03066, "", 156, 1375, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21066, "", 241, 1375, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02067, "Fecha de inicio del período:", 0, 1399, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_beg"
    END
    
    INPUTD 03067, "", 156, 1396, 85, 19
    BEGIN
        NAME "ind_nxt_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21067, "", 241, 1396, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_beg"
    END
    
    STATICTEXT 02068, "Fecha de inicio del período:", 0, 1420, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03068, "", 156, 1417, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21068, "", 241, 1417, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02069, "Fecha de inicio del período:", 0, 1441, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03069, "", 156, 1438, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21069, "", 241, 1438, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02070, "Fecha de inicio del período:", 0, 1462, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03070, "", 156, 1459, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21070, "", 241, 1459, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02071, "Fecha de inicio del período:", 0, 1483, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03071, "", 156, 1480, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21071, "", 241, 1480, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02072, "Fecha de inicio del período:", 0, 1504, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03072, "", 156, 1501, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21072, "", 241, 1501, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02073, "Fecha de inicio del período:", 0, 1525, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03073, "", 156, 1522, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21073, "", 241, 1522, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02074, "Fecha de inicio del período:", 0, 1546, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03074, "", 156, 1543, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21074, "", 241, 1543, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02075, "Fecha de inicio del período:", 0, 1567, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03075, "", 156, 1564, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21075, "", 241, 1564, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02076, "Fecha de inicio del período:", 0, 1588, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03076, "", 156, 1585, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21076, "", 241, 1585, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02077, "Fecha de inicio del período:", 0, 1609, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03077, "", 156, 1606, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21077, "", 241, 1606, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02078, "Fecha de inicio del período:", 0, 1630, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03078, "", 156, 1627, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21078, "", 241, 1627, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02079, "Fecha de inicio del período:", 0, 1651, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03079, "", 156, 1648, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21079, "", 241, 1648, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02080, "Fecha de inicio del período:", 0, 1672, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pri_per_end"
    END
    
    INPUTD 03080, "", 156, 1669, 85, 19
    BEGIN
        NAME "ind_pri_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21080, "", 241, 1669, 20, 19
    BEGIN
        NAME "tbnc_pri_per_end"
    END
    
    STATICTEXT 02081, "Fecha de inicio del período:", 0, 1693, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03081, "", 156, 1690, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21081, "", 241, 1690, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02082, "Fecha de inicio del período:", 0, 1714, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03082, "", 156, 1711, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21082, "", 241, 1711, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02083, "Fecha de inicio del período:", 0, 1735, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03083, "", 156, 1732, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21083, "", 241, 1732, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02084, "Fecha de inicio del período:", 0, 1756, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03084, "", 156, 1753, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21084, "", 241, 1753, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02085, "Fecha de inicio del período:", 0, 1777, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03085, "", 156, 1774, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21085, "", 241, 1774, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02086, "Fecha de inicio del período:", 0, 1798, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03086, "", 156, 1795, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21086, "", 241, 1795, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02087, "Fecha de inicio del período:", 0, 1819, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03087, "", 156, 1816, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21087, "", 241, 1816, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02088, "Fecha de inicio del período:", 0, 1840, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03088, "", 156, 1837, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21088, "", 241, 1837, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02089, "Fecha de inicio del período:", 0, 1861, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03089, "", 156, 1858, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21089, "", 241, 1858, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02090, "Fecha de inicio del período:", 0, 1882, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03090, "", 156, 1879, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21090, "", 241, 1879, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02091, "Fecha de inicio del período:", 0, 1903, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03091, "", 156, 1900, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21091, "", 241, 1900, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02092, "Fecha de inicio del período:", 0, 1924, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03092, "", 156, 1921, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21092, "", 241, 1921, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02093, "Fecha de inicio del período:", 0, 1945, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cur_per_end"
    END
    
    INPUTD 03093, "", 156, 1942, 85, 19
    BEGIN
        NAME "ind_cur_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21093, "", 241, 1942, 20, 19
    BEGIN
        NAME "tbnc_cur_per_end"
    END
    
    STATICTEXT 02094, "Fecha de inicio del período:", 0, 1966, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03094, "", 156, 1963, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21094, "", 241, 1963, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02095, "Fecha de inicio del período:", 0, 1987, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03095, "", 156, 1984, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21095, "", 241, 1984, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02096, "Fecha de inicio del período:", 0, 2008, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03096, "", 156, 2005, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21096, "", 241, 2005, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02097, "Fecha de inicio del período:", 0, 2029, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03097, "", 156, 2026, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21097, "", 241, 2026, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02098, "Fecha de inicio del período:", 0, 2050, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03098, "", 156, 2047, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21098, "", 241, 2047, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02099, "Fecha de inicio del período:", 0, 2071, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03099, "", 156, 2068, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21099, "", 241, 2068, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02100, "Fecha de inicio del período:", 0, 2092, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03100, "", 156, 2089, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21100, "", 241, 2089, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02101, "Fecha de inicio del período:", 0, 2113, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03101, "", 156, 2110, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21101, "", 241, 2110, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02102, "Fecha de inicio del período:", 0, 2134, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03102, "", 156, 2131, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21102, "", 241, 2131, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02103, "Fecha de inicio del período:", 0, 2155, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03103, "", 156, 2152, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21103, "", 241, 2152, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02104, "Fecha de inicio del período:", 0, 2176, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03104, "", 156, 2173, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21104, "", 241, 2173, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02105, "Fecha de inicio del período:", 0, 2197, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03105, "", 156, 2194, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21105, "", 241, 2194, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    STATICTEXT 02106, "Fecha de inicio del período:", 0, 2218, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_nxt_per_end"
    END
    
    INPUTD 03106, "", 156, 2215, 85, 19
    BEGIN
        NAME "ind_nxt_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21106, "", 241, 2215, 20, 19
    BEGIN
        NAME "tbnc_nxt_per_end"
    END
    
    CHECKBOX 03107, "¿Bloqueado?", 154, 2236, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03108, "¿Bloqueado?", 154, 2257, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03109, "¿Bloqueado?", 154, 2278, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03110, "¿Bloqueado?", 154, 2299, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03111, "¿Bloqueado?", 154, 2320, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03112, "¿Bloqueado?", 154, 2341, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03113, "¿Bloqueado?", 154, 2362, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03114, "¿Bloqueado?", 154, 2383, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03115, "¿Bloqueado?", 154, 2404, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03116, "¿Bloqueado?", 154, 2425, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03117, "¿Bloqueado?", 154, 2446, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03118, "¿Bloqueado?", 154, 2467, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    CHECKBOX 03119, "¿Bloqueado?", 154, 2488, 102, 19
    BEGIN
        NAME "cbx_locked_flag"
        NOT OPAQUE
    END
    
    STATICTEXT 02120, "Fecha de inicio del período:", 0, 2512, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_app_per_beg"
    END
    
    INPUTD 03120, "", 156, 2509, 85, 19
    BEGIN
        NAME "ind_app_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21120, "", 241, 2509, 20, 19
    BEGIN
        NAME "tbnc_app_per_beg"
    END
    
    STATICTEXT 02121, "Fecha de inicio del período:", 0, 2533, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_app_per_end"
    END
    
    INPUTD 03121, "", 156, 2530, 85, 19
    BEGIN
        NAME "ind_app_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21121, "", 241, 2530, 20, 19
    BEGIN
        NAME "tbnc_app_per_end"
    END
    
    STATICTEXT 02122, "Fecha de inicio del período:", 0, 2554, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_per_beg"
    END
    
    INPUTD 03122, "", 156, 2551, 85, 19
    BEGIN
        NAME "ind_gl_per_beg"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21122, "", 241, 2551, 20, 19
    BEGIN
        NAME "tbnc_gl_per_beg"
    END
    
    STATICTEXT 02123, "Fecha de inicio del período:", 0, 2575, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_per_end"
    END
    
    INPUTD 03123, "", 156, 2572, 85, 19
    BEGIN
        NAME "ind_gl_per_end"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21123, "", 241, 2572, 20, 19
    BEGIN
        NAME "tbnc_gl_per_end"
    END
    
    STATICTEXT 02124, "Identificación del proceso:", 0, 2596, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03124, "", 156, 2593, 160, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 04124, "", 342, 2597, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_process_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20124, "", 316, 2593, 20, 19
    BEGIN
        NAME "tbnf_process_id"
    END
    
    STATICTEXT 02125, "Nombre del programa:", 20, 2617, 133, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_program_name"
    END
    
    INPUTE 03125, "", 156, 2614, 192, 19
    BEGIN
        NAME "ine_program_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    CHECKBOX 03126, "¿Utilizar cuenta de orden?", 154, 2635, 181, 19
    BEGIN
        NAME "cbx_use_suspense"
        NOT OPAQUE
    END
    
    STATICTEXT 02127, "Cuenta del GL:", 69, 2659, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03127, "", 156, 2656, 130, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04127, "", 312, 2660, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20127, "", 286, 2656, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02128, "Límite máximo [secuencia]:", 0, 2680, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_lim_str"
    END
    
    INPUTE 03128, "", 156, 2677, 150, 19
    BEGIN
        NAME "ine_max_lim_str"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02129, "Saldo máximo [secuencia]:", 0, 2701, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_max_bal_str"
    END
    
    INPUTE 03129, "", 156, 2698, 150, 19
    BEGIN
        NAME "ine_max_bal_str"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02130, "Máscara de la cuenta del GL:", 0, 2722, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_acct_output"
    END
    
    INPUTE 03130, "", 156, 2719, 150, 19
    BEGIN
        NAME "ine_acct_output"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02131, "Máscara del monto:", 39, 2743, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_amount_mask"
    END
    
    INPUTE 03131, "", 156, 2740, 150, 19
    BEGIN
        NAME "ine_amount_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02132, "Máscara de la unidad:", 27, 2764, 126, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_mask"
    END
    
    INPUTE 03132, "", 156, 2761, 120, 19
    BEGIN
        NAME "ine_unit_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02133, "Máscara del porcentaje:", 15, 2785, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_percent_mask"
    END
    
    INPUTE 03133, "", 156, 2782, 100, 19
    BEGIN
        NAME "ine_percent_mask"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
END

