//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// CRM_ACTIVITIES - CRM Activities
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0480 0333
BEGIN
    NAME "win_crm_activities"
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
    
    INPUTE 03003, "", 130, 52, 60, 19
    BEGIN
        NAME "ine_trans_time_stamp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00:00"
    END
    
    STATICTEXT 02004, "Activity Type:", 48, 76, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_activity_type"
    END
    
    LISTBUTTON 03004, "", 130, 73, 104, 300
    BEGIN
        NAME "lbx_activity_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02005, "Activity Date:", 50, 97, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_activity_date"
    END
    
    INPUTD 03005, "", 130, 94, 85, 19
    BEGIN
        NAME "ind_activity_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21005, "", 215, 94, 20, 19
    BEGIN
        NAME "tbnc_activity_date"
    END
    
    STATICTEXT 02006, "Activity Time:", 48, 118, 79, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_activity_time"
    END
    
    INPUTE 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "ine_activity_time"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00:00:00"
    END
    
    STATICTEXT 02007, "Duration:", 72, 139, 55, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_duration"
    END
    INPUTN 03007, "", 130, 136, 30, 19
    BEGIN
        NAME "inn_duration"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0"
    END
    
    STATICTEXT 02008, "Priority Code:", 47, 160, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_priority"
    END
    
    INPUTE 03008, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_priority"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    CHECKBOX 03009, "Display Alarm?", 128, 178, 116, 19
    BEGIN
        NAME "cbx_alarm"
        NOT OPAQUE
    END
    
    STATICTEXT 02010, "Activity Status:", 41, 202, 86, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_status_flag"
    END
    
    LISTBUTTON 03010, "", 130, 199, 80, 300
    BEGIN
        NAME "lbx_status_flag"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02011, "Activity Location:", 26, 223, 101, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_act_location"
    END
    
    INPUTE 03011, "", 130, 220, 160, 19
    BEGIN
        NAME "ine_act_location"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02012, "User ID:", 81, 244, 46, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_user_id"
    END
    
    INPUTE 03012, "", 130, 241, 150, 19
    BEGIN
        NAME "ine_user_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04012, "", 306, 245, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_user_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20012, "", 280, 241, 20, 19
    BEGIN
        NAME "tbnf_user_id"
    END
    
    CHECKBOX 03013, "Private Record?", 128, 262, 120, 19
    BEGIN
        NAME "cbx_private"
        NOT OPAQUE
    END
    
    STATICTEXT 02014, "Comment:", 67, 286, 60, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_comment"
    END
    
    INPUTE 03014, "", 130, 283, 320, 19
    BEGIN
        NAME "ine_comment"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
END

