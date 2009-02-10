//#charset: windows-1252

VERSION "4.0"

WINDOW 1000 "Purchase Order Calendar" 100 100 638 523
BEGIN
    DIALOGBEHAVIOR
    EVENTMASK 1073742856
    INVISIBLE
    KEYBOARDNAVIGATION
    MANAGESYSCOLOR
    NAME "win_pocal"
    CHILD-WINDOW 1110, 100, 13, 66
    BEGIN
    END

    TOOLBUTTON 101, "BITMAP=sys/images/im_nb_fst_i.png", 16, 37, 20, 20
    BEGIN
        IMAGEFILE "sys/images/im_nb_fst_i.png"
        NAME "btn_prev_yr"
        SHORTCUE "Previous year"
    END

    TOOLBUTTON 102, "BITMAP=sys/images/im_nb_prv_i.png", 35, 37, 20, 20
    BEGIN
        IMAGEFILE "sys/images/im_nb_prv_i.png"
        NAME "btn_prev_mo"
        SHORTCUE "Previous month"
    END

    TOOLBUTTON 103, "BITMAP=sys/images/im_nb_nxt_i.png", 148, 37, 20, 20
    BEGIN
        IMAGEFILE "sys/images/im_nb_nxt_i.png"
        NAME "btn_next_mo"
        SHORTCUE "Next month"
    END

    TOOLBUTTON 104, "BITMAP=sys/images/im_nb_lst_i.png", 167, 37, 20, 20
    BEGIN
        IMAGEFILE "sys/images/im_nb_lst_i.png"
        NAME "btn_next_yr"
        SHORTCUE "Next year"
    END

    TOOLBUTTON 105, "BITMAP=sys/images/im_tb_cal_f.png", 186, 37, 20, 20
    BEGIN
        IMAGEFILE "sys/images/im_tb_cal_f.png"
        NAME "btn_curr_mo"
        SHORTCUE "Current month"
    END

    EDIT 106, "", 57, 37, 90, 21
    BEGIN
        CLIENTEDGE
        FONT "Tahoma" 8,bold
        JUSTIFICATION 16384
        NAME "Edit Control"
        READONLY
    END

    STATICTEXT 107, "Calendar begins", 212, 40, 112, 25
    BEGIN
        JUSTIFICATION 32768
        NAME "txtBegins"
    END

    STATICTEXT 108, "ends", 391, 40, 32, 25
    BEGIN
        JUSTIFICATION 32768
        NAME "txtEnds"
    END

    EDIT 109, "", 327, 37, 60, 21
    BEGIN
        CLIENTEDGE
        NAME "Edit Control"
        READONLY
    END

    EDIT 110, "", 426, 37, 60, 21
    BEGIN
        CLIENTEDGE
        NAME "Edit Control"
        READONLY
    END

END

CHILD-WINDOW 1110 0 0 442 362
BEGIN
    BORDERLESS
    EVENTMASK 3287287492
    NAME ""
    GRID 100, "", 7, 9, 428, 374
    BEGIN
        CLIENTEDGE
        COLUMNHEAD 20, 5001
        COLUMNS 7
        GRIDROWDEFAULTHEIGHT 40
        HORIZLINES
        MAXCOLS 65535
        NAME "grd_calendar"
        ROWHEAD 20, 5000
        ROWS 6
        VERTLINES
    END

END

