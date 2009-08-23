//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLU_CREATEBUDGET - Create Budget Revision
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0431 0100
BEGIN
    NAME "win_glu_createbudget"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Revisión del presupuesto:", 2, 13, 151, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_budget_revs"
    END
    
    LISTBUTTON 03001, "", 156, 10, 245, 300
    BEGIN
        NAME "lbx_budget_revs"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

