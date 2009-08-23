//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// CRM_DOCUMENTS - CRM Documents
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0580 0165
BEGIN
    NAME "win_crm_documents"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
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
    
    STATICTEXT 04001, "", 216, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 190, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Transaction Date:", 24, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_date_stamp"
    END
    
    INPUTD 03002, "", 130, 31, 85, 19
    BEGIN
        NAME "ind_trans_date_stamp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    
    STATICTEXT 02003, "Transaction Time:", 22, 55, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_time_stamp"
    END
    
    INPUTE 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "ine_trans_time_stamp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00:00"
    END
    
    STATICTEXT 02004, "User ID:", 81, 76, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03004, "", 130, 73, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04004, "", 306, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 280, 73, 20, 19
    BEGIN
        NAME "tbnf_user_id"
    END
    
    CHECKBOX 03005, "Private Record?", 128, 94, 120, 19
    BEGIN
        NAME "cbx_private"
        NOT OPAQUE
    END
    
    STATICTEXT 02006, "Document Location:", 10, 118, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_doc_location"
    END
    
    INPUTE 03006, "", 130, 115, 400, 19
    BEGIN
        NAME "ine_doc_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 60
    END
    TOOLBUTTON 20006, "", 530, 115, 20, 19
    BEGIN
        NAME "tbnf_doc_location"
    END
END

