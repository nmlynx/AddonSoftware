//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_DETAIL - Open Order Detail Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0275
BEGIN
    NAME "win_opr_detail"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning ID del cliente:", 14, 13, 139, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 156, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 242, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 216, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Ending ID del cliente:", 31, 34, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03002, "", 156, 31, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04002, "", 242, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 216, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02003, "Beginning Order Date:", 24, 55, 129, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_date"
    END
    
    INPUTD 03003, "", 156, 52, 85, 19
    BEGIN
        NAME "ind_order_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 241, 52, 20, 19
    BEGIN
        NAME "tbnc_order_date"
    END
    
    STATICTEXT 02004, "Ending Order Date:", 41, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_date"
    END
    
    INPUTD 03004, "", 156, 73, 85, 19
    BEGIN
        NAME "ind_order_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 241, 73, 20, 19
    BEGIN
        NAME "tbnc_order_date"
    END
    
    STATICTEXT 02005, "Order Entered By:", 50, 97, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_taken_by"
    END
    
    INPUTE 03005, "", 156, 94, 160, 19
    BEGIN
        NAME "ine_ord_taken_by"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 02006, "Vendedor:", 93, 118, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03006, "", 156, 115, 39, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04006, "", 221, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 195, 115, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02007, "Print Status:", 83, 139, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_opr_print_status"
    END
    
    LISTBUTTON 03007, "", 156, 136, 89, 300
    BEGIN
        NAME "lbx_opr_print_status"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03008, "Open?", 154, 157, 67, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Quoted?", 154, 178, 79, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "¿Permitir pedidos pendientes?", 154, 199, 206, 19
    BEGIN
        NAME "cbx_backorders"
        NOT OPAQUE
    END
    
    STATICTEXT 02011, "Non Stock Option:", 47, 223, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_sequence"
    END
    
    LISTBUTTON 03011, "", 156, 220, 188, 300
    BEGIN
        NAME "lbx_report_sequence"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

