//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARC_SALESDISC - Sales Discount Code Mx
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0123
BEGIN
    NAME "win_arc_salesdisc"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "I:", 121, 13, 6, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_record_id_i"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_record_id_i"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Sales Discount Code:", 4, 34, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sls_disc_cd"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_sls_disc_cd"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02003, "Description:", 56, 55, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sls_disc_desc"
    END
    
    INPUTE 03003, "", 130, 52, 160, 19
    BEGIN
        NAME "ine_sls_disc_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02004, "Sales Discount Percent:", 0, 76, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_sls_disc_prcnt"
    END
    INPUTN 03004, "", 130, 73, 42, 19
    BEGIN
        NAME "inn_sls_disc_prcnt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "####0-"
    END
END

