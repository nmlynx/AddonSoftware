//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARM_CUSTMAST - Customer Master
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0736 0434
BEGIN
    NAME "win_arm_custmast"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    TABCONTROL 1050, "tab_arm_custmast", 4, 0055, 0729, 0379
    BEGIN
        NAME "tab_arm_custmast"
        FIXEDWIDTH
        NOT RIGHTJUSTIFY
        RAGGEDRIGHT
        NOT OPAQUE
        AUTOMANAGEMENT
        TAB "Name and Address" 0 1100
        TAB "Profile" 1 1101
        TAB "Aging and Sales Summary" 2 1102
    END
    
    CHILD-WINDOW 1100, 1100, 10, 88
    BEGIN
        NAME "chp_arm_custmast_1100"
    END
    
    CHILD-WINDOW 1101, 1101, 10, 88
    BEGIN
        NAME "chp_arm_custmast_1101"
    END
    
    CHILD-WINDOW 1102, 1102, 10, 88
    BEGIN
        NAME "chp_arm_custmast_1102"
    END
    
    
    STATICTEXT 02001, "Customer ID:", 50, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 130, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 02002, "Customer Name:", 30, 34, 97, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_name"
    END
    
    INPUTE 03002, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_customer_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
END
CHILD-WINDOW 1100 0 0 0726 0357
BEGIN
    NAME "chw_arm_custmast_1100"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02101, "Address:", 75, 13, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_1"
    END
    
    INPUTE 03101, "", 130, 10, 192, 19
    BEGIN
        NAME "ine_addr_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03102, "", 130, 31, 192, 19
    BEGIN
        NAME "ine_addr_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03103, "", 130, 52, 192, 19
    BEGIN
        NAME "ine_addr_line_3"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03104, "", 130, 73, 192, 19
    BEGIN
        NAME "ine_addr_line_4"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02105, "City:", 101, 97, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_city"
    END
    
    INPUTE 03105, "", 130, 94, 176, 19
    BEGIN
        NAME "ine_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02106, "St:", 113, 118, 14, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_state_code"
    END
    
    INPUTE 03106, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_state_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02107, "Zip Code:", 171, 118, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_zip_code"
    END
    
    INPUTE 03107, "", 230, 115, 80, 19
    BEGIN
        NAME "ine_zip_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02108, "Country:", 76, 139, 51, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_country"
    END
    
    INPUTE 03108, "", 130, 136, 192, 19
    BEGIN
        NAME "ine_country"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02109, "Telephone Number:", 12, 181, 115, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_no"
    END
    
    INPUTE 03109, "", 130, 178, 112, 19
    BEGIN
        NAME "ine_phone_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02110, "Ext:", 255, 181, 22, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_exten"
    END
    
    INPUTE 03110, "", 280, 178, 35, 19
    BEGIN
        NAME "ine_phone_exten"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    STATICTEXT 02111, "Fax Number:", 53, 202, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fax_no"
    END
    
    INPUTE 03111, "", 130, 199, 112, 19
    BEGIN
        NAME "ine_fax_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02112, "Contact Name:", 42, 223, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contact_name"
    END
    
    INPUTE 03112, "", 130, 220, 160, 19
    BEGIN
        NAME "ine_contact_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02113, "Alternate Sequence:", 351, 13, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_alt_sequence"
    END
    
    INPUTE 03113, "", 470, 10, 80, 19
    BEGIN
        NAME "ine_alt_sequence"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02114, "Date Opened:", 388, 55, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_opened_date"
    END
    
    INPUTD 03114, "", 470, 52, 85, 19
    BEGIN
        NAME "ind_opened_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21114, "", 555, 52, 20, 19
    BEGIN
        NAME "tbnc_opened_date"
    END
    
    STATICTEXT 02115, "Customer Ship Via:", 356, 76, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_ship_via"
    END
    
    INPUTE 03115, "", 470, 73, 80, 19
    BEGIN
        NAME "ine_ar_ship_via"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02116, "Free On Board [FOB]:", 345, 97, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fob"
    END
    
    INPUTE 03116, "", 470, 94, 120, 19
    BEGIN
        NAME "ine_fob"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 15
    END
    
    STATICTEXT 02117, "Resale Number:", 376, 118, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_resale_no"
    END
    
    INPUTE 03117, "", 470, 115, 160, 19
    BEGIN
        NAME "ine_resale_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02118, "DB Number:", 398, 139, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_db_no"
    END
    
    INPUTE 03118, "", 470, 136, 72, 19
    BEGIN
        NAME "ine_db_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 9
    END
    
    STATICTEXT 02119, "SIC Code:", 411, 160, 56, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sic_code"
    END
    
    INPUTE 03119, "", 470, 157, 64, 19
    BEGIN
        NAME "ine_sic_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 8
    END
    
    CHECKBOX 03120, "Retain?", 468, 178, 71, 19
    BEGIN
        NAME "cbx_retain_cust"
        NOT OPAQUE
    END

END
CHILD-WINDOW 1101 0 0 0726 0357
BEGIN
    NAME "chw_arm_custmast_1101"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02201, "Customer Type:", 34, 13, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_type"
    END
    
    INPUTE 03201, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_customer_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04201, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20201, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_type"
    END
    
    STATICTEXT 02202, "Salesperson Code:", 19, 34, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03202, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04202, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_slspsn_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20202, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_slspsn_code"
    END
    
    STATICTEXT 02203, "Terms Code:", 53, 55, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_terms_code"
    END
    
    INPUTE 03203, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_ar_terms_code"
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
        NAME "dis_ar_terms_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20203, "", 165, 52, 20, 19
    BEGIN
        NAME "tbnf_ar_terms_code"
    END
    
    STATICTEXT 02204, "Freight Terms Code:", 8, 76, 119, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_frt_terms"
    END
    
    INPUTE 03204, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_frt_terms"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04204, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_frt_terms"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20204, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_frt_terms"
    END
    
    STATICTEXT 02205, "Territory Code:", 37, 97, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_territory"
    END
    
    INPUTE 03205, "", 130, 94, 35, 19
    BEGIN
        NAME "ine_territory"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04205, "", 191, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_territory"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20205, "", 165, 94, 20, 19
    BEGIN
        NAME "tbnf_territory"
    END
    
    STATICTEXT 02206, "Distribution Code:", 20, 118, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_dist_code"
    END
    
    INPUTE 03206, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_ar_dist_code"
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
        NAME "dis_ar_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20206, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_ar_dist_code"
    END
    
    STATICTEXT 02207, "Message Code:", 39, 139, 88, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_message_code"
    END
    
    INPUTE 03207, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_message_code"
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
        NAME "dis_message_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20207, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_message_code"
    END
    
    STATICTEXT 02208, "Customer Pricing Code:", 0, 160, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pricing_code"
    END
    
    INPUTE 03208, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_pricing_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUU"
    END
    
    STATICTEXT 04208, "", 191, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pricing_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20208, "", 165, 157, 20, 19
    BEGIN
        NAME "tbnf_pricing_code"
    END
    
    STATICTEXT 02209, "Sales Discount Code:", 4, 181, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_disc_code"
    END
    
    INPUTE 03209, "", 130, 178, 35, 19
    BEGIN
        NAME "ine_disc_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04209, "", 191, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_disc_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20209, "", 165, 178, 20, 19
    BEGIN
        NAME "tbnf_disc_code"
    END
    
    STATICTEXT 02210, "Label Code:", 59, 202, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_label_code"
    END
    
    INPUTE 03210, "", 130, 199, 35, 19
    BEGIN
        NAME "ine_label_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02211, "Tax Code:", 378, 13, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03211, "", 440, 10, 70, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04211, "", 536, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20211, "", 510, 10, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
    
    STATICTEXT 02212, "Cycle Code:", 368, 34, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ar_cyclecode"
    END
    
    INPUTE 03212, "", 440, 31, 35, 19
    BEGIN
        NAME "ine_ar_cyclecode"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04212, "", 501, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ar_cyclecode"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20212, "", 475, 31, 20, 19
    BEGIN
        NAME "tbnf_ar_cyclecode"
    END
    
    STATICTEXT 02213, "Sales Analysis:", 352, 55, 85, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sa_flag"
    END
    
    LISTBUTTON 03213, "", 440, 52, 113, 300
    BEGIN
        NAME "lbx_sa_flag"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02214, "Credit Limit:", 366, 76, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_credit_limit"
    END
    INPUTN 03214, "", 440, 73, 64, 19
    BEGIN
        NAME "inn_credit_limit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02215, "Credit Hold:", 367, 97, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cred_hold"
    END
    
    LISTBUTTON 03215, "", 440, 94, 100, 300
    BEGIN
        NAME "lbx_cred_hold"
        SELECTIONHEIGHT 19
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
    END
    
    CHECKBOX 03216, "Finance Charge?", 438, 136, 126, 19
    BEGIN
        NAME "cbx_finance_chg"
        NOT OPAQUE
    END
    
    CHECKBOX 03217, "Statements?", 438, 157, 100, 19
    BEGIN
        NAME "cbx_statements"
        NOT OPAQUE
    END
    
    CHECKBOX 03218, "Retain Detail Invoice History?", 438, 178, 199, 19
    BEGIN
        NAME "cbx_inv_hist_flg"
        NOT OPAQUE
        READONLY
        NOT TABTRAVERSABLE
    END

END
CHILD-WINDOW 1102 0 0 0726 0357
BEGIN
    NAME "chw_arm_custmast_1102"
    BORDERLESS
    BACKGROUNDCOLOR RGB(248,248,248)
    KEYBOARDNAVIGATION
    EVENTMASK 62915588
    ENTERASTAB
    
    STATICTEXT 02301, "Future:", 86, 13, 41, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_future"
    END
    INPUTN 03301, "", 130, 10, 64, 19
    BEGIN
        NAME "inn_aging_future"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02302, "Current:", 78, 34, 49, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_cur"
    END
    INPUTN 03302, "", 130, 31, 64, 19
    BEGIN
        NAME "inn_aging_cur"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02303, "30 Days:", 77, 55, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_30"
    END
    INPUTN 03303, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_aging_30"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02304, "60 Days:", 77, 76, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_60"
    END
    INPUTN 03304, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_aging_60"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02305, "90 Days:", 77, 97, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_90"
    END
    INPUTN 03305, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_aging_90"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02306, "120 Days:", 69, 118, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_aging_120"
    END
    INPUTN 03306, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_aging_120"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02307, "Balance:", 80, 139, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dsp_balance"
    END
    INPUTN 03307, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_dsp_balance"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02308, "Average Days to Pay:", 245, 13, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days"
    END
    INPUTN 03308, "", 370, 10, 56, 19
    BEGIN
        NAME "inn_avg_days"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02309, "Last Invoice Date:", 265, 55, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstinv_date"
    END
    
    INPUTD 03309, "", 370, 52, 85, 19
    BEGIN
        NAME "ind_lstinv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21309, "", 455, 52, 20, 19
    BEGIN
        NAME "tbnc_lstinv_date"
    END
    
    STATICTEXT 02310, "Last Payment Date:", 257, 76, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstpay_date"
    END
    
    INPUTD 03310, "", 370, 73, 85, 19
    BEGIN
        NAME "ind_lstpay_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21310, "", 455, 73, 20, 19
    BEGIN
        NAME "tbnc_lstpay_date"
    END
    
    STATICTEXT 02311, "MTD", 130, 181, 24, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_mtd"
    END
    
    STATICTEXT 02312, "Sales MTD:", 65, 202, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_sales"
    END
    INPUTN 03312, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_mtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02313, "Cost MTD:", 67, 223, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_cost"
    END
    INPUTN 03313, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02314, "Gross Profit:", 54, 244, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dsp_mtd_profit"
    END
    INPUTN 03314, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_dsp_mtd_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02315, "Gross Profit %:", 43, 265, 84, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_dsp_mtd_prof_pct"
    END
    INPUTN 03315, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_dsp_mtd_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    
    STATICTEXT 02316, "Av Days to Pay MTD:", 9, 286, 118, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_avg_days_mtd"
    END
    INPUTN 03316, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_avg_days_mtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02317, "High Credit MTD:", 27, 307, 100, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_mtd_high_crd"
    END
    INPUTN 03317, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_mtd_high_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02318, "YTD", 230, 181, 22, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_ytd"
    END
    INPUTN 03319, "", 230, 199, 64, 19
    BEGIN
        NAME "inn_ytd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03320, "", 230, 220, 64, 19
    BEGIN
        NAME "inn_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03321, "", 230, 241, 64, 19
    BEGIN
        NAME "inn_dsp_ytd_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03322, "", 230, 262, 64, 19
    BEGIN
        NAME "inn_dsp_ytd_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    INPUTN 03323, "", 230, 283, 64, 19
    BEGIN
        NAME "inn_avg_days_ytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03324, "", 230, 304, 64, 19
    BEGIN
        NAME "inn_ytd_hi_cred"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02325, "Prior Year", 330, 181, 53, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_pri"
    END
    INPUTN 03326, "", 330, 199, 64, 19
    BEGIN
        NAME "inn_pyr_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03327, "", 330, 220, 64, 19
    BEGIN
        NAME "inn_pri_ytd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03328, "", 330, 241, 64, 19
    BEGIN
        NAME "inn_dsp_pri_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03329, "", 330, 262, 64, 19
    BEGIN
        NAME "inn_dsp_pri_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    INPUTN 03330, "", 330, 283, 64, 19
    BEGIN
        NAME "inn_avg_dtp_pytd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03331, "", 330, 304, 64, 19
    BEGIN
        NAME "inn_pyr_hi_crd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02332, "Next Month", 430, 181, 62, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_lbl_nxt"
    END
    INPUTN 03333, "", 430, 199, 64, 19
    BEGIN
        NAME "inn_nmtd_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03334, "", 430, 220, 64, 19
    BEGIN
        NAME "inn_nxt_mtd_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03335, "", 430, 241, 64, 19
    BEGIN
        NAME "inn_dsp_nxt_profit"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    INPUTN 03336, "", 430, 262, 64, 19
    BEGIN
        NAME "inn_dsp_nxt_prof_pct"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##0.00-"
    END
    INPUTN 03337, "", 430, 283, 64, 19
    BEGIN
        NAME "inn_avg_dtp_nmtd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    INPUTN 03338, "", 430, 304, 64, 19
    BEGIN
        NAME "inn_nmtd_high_cr"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END

END

