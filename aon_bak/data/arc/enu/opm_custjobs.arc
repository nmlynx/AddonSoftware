//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPM_CUSTJOBS - Customer Job Number
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0400 0417
BEGIN
    NAME "win_opm_custjobs"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Job Number:", 55, 13, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_job_no"
    END
    
    INPUTE 03001, "", 130, 10, 130, 19
    BEGIN
        NAME "ine_job_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
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
    
    STATICTEXT 02003, "Address:", 75, 55, 52, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_addr_line_1"
    END
    
    INPUTE 03003, "", 130, 52, 192, 19
    BEGIN
        NAME "ine_addr_line_1"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    INPUTE 03004, "", 130, 73, 192, 19
    BEGIN
        NAME "ine_addr_line_2"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 24
    END
    
    STATICTEXT 02005, "City:", 101, 97, 26, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_city"
    END
    
    INPUTE 03005, "", 130, 94, 176, 19
    BEGIN
        NAME "ine_city"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 22
    END
    
    STATICTEXT 02006, "State:", 96, 118, 31, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_state_code"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_state_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02007, "Zip:", 105, 139, 22, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_zip_code"
    END
    
    INPUTE 03007, "", 130, 136, 117, 19
    BEGIN
        NAME "ine_zip_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUU"
    END
    
    STATICTEXT 02008, "Contact:", 78, 160, 49, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_contact_name"
    END
    
    INPUTE 03008, "", 130, 157, 200, 19
    BEGIN
        NAME "ine_contact_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02009, "Phone:", 88, 181, 39, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_no"
    END
    
    INPUTE 03009, "", 130, 178, 200, 19
    BEGIN
        NAME "ine_phone_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00000000000000000000"
    END
    
    STATICTEXT 02010, "Ext:", 105, 202, 22, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_phone_exten"
    END
    
    INPUTE 03010, "", 130, 199, 40, 19
    BEGIN
        NAME "ine_phone_exten"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
    
    CHECKBOX 03011, "Retain?", 128, 220, 71, 19
    BEGIN
        NAME "cbx_retain_cust"
        NOT OPAQUE
    END
    
    GROUPBOX 19012, "Preliminary Lien Info ", -4, 244, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_lien_date"
    END
    
    STATICTEXT 02012, "Date:", 98, 265, 29, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lien_date"
    END
    
    INPUTD 03012, "", 130, 262, 85, 19
    BEGIN
        NAME "ind_lien_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21012, "", 215, 262, 20, 19
    BEGIN
        NAME "tbnc_lien_date"
    END
    
    STATICTEXT 02013, "Lien Number:", 49, 286, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lien_no"
    END
    
    INPUTE 03013, "", 130, 283, 120, 19
    BEGIN
        NAME "ine_lien_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02014, "Amount:", 77, 307, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lien_amount"
    END
    INPUTN 03014, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_lien_amount"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "First Shipment Date:", 10, 328, 117, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_fst_shp_date"
    END
    
    INPUTD 03015, "", 130, 325, 85, 19
    BEGIN
        NAME "ind_fst_shp_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21015, "", 215, 325, 20, 19
    BEGIN
        NAME "tbnc_fst_shp_date"
    END
    
    STATICTEXT 02016, "Total Sales to Date:", 16, 349, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_total_sales"
    END
    INPUTN 03016, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_total_sales"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Last Invoice Date:", 25, 370, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lstinv_date"
    END
    
    INPUTD 03017, "", 130, 367, 85, 19
    BEGIN
        NAME "ind_lstinv_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21017, "", 215, 367, 20, 19
    BEGIN
        NAME "tbnc_lstinv_date"
    END
END

