//#charset: windows-1252

VERSION "4.0"

WINDOW 101 "Digital Dashboard" 100 100 980 651
BEGIN
    EVENTMASK 3287287500
    ICON ""
    INVISIBLE
    KEYBOARDNAVIGATION
    GROUPBOX 100, "Data Set", 5, 85, 155, 555
    BEGIN
        FONT "Arial" 10,bold
        NAME ""
    END

    GROUPBOX 101, "Zoomed View", 170, 85, 795, 555
    BEGIN
        FONT "Arial" 10,bold
        NAME "chartGroupBox"
    END

    SLIDER 102, 91, 25, 869, 30
    BEGIN
        NAME "12perSlider"
        ORIENTATION 1073741824
        MAXIMUM 12
        MINIMUM 1
        VALUE 7
        MAJORTICKSPACING 2
        PAINTTICKS
        SNAPTOTICKS
    END

    STATICTEXT 103, "Jan", 75, 55, 60, 20
    BEGIN
        NAME "12per01"
        NOT OPAQUE
    END

    STATICTEXT 104, "Mar", 230, 55, 60, 20
    BEGIN
        NAME "12per03"
        NOT OPAQUE
    END

    STATICTEXT 105, "May", 385, 55, 60, 20
    BEGIN
        NAME "12per05"
        NOT OPAQUE
    END

    STATICTEXT 106, "July", 540, 55, 60, 20
    BEGIN
        NAME "12per07"
        NOT OPAQUE
    END

    STATICTEXT 107, "Sept", 695, 55, 60, 20
    BEGIN
        NAME "12per09"
        NOT OPAQUE
    END

    STATICTEXT 108, "Nov", 850, 55, 60, 20
    BEGIN
        NAME "12per11"
        NOT OPAQUE
    END

    GROUPBOX 109, "Accounting Period", 5, 5, 970, 70
    BEGIN
        FONT "Arial" 10,bold
        NAME ""
    END

    STATICTEXT 110, "Feb", 155, 55, 60, 20
    BEGIN
        NAME "12per02"
        NOT OPAQUE
    END

    STATICTEXT 111, "Apr", 310, 55, 60, 20
    BEGIN
        NAME "12per04"
        NOT OPAQUE
    END

    STATICTEXT 112, "June", 465, 55, 60, 20
    BEGIN
        NAME "12per06"
        NOT OPAQUE
    END

    STATICTEXT 113, "Aug", 620, 55, 60, 20
    BEGIN
        NAME "12per08"
        NOT OPAQUE
    END

    STATICTEXT 114, "Oct", 775, 55, 60, 20
    BEGIN
        NAME "12per10"
        NOT OPAQUE
    END

    STATICTEXT 115, "Dec", 915, 55, 60, 20
    BEGIN
        NAME "12per12"
        NOT OPAQUE
    END

    LISTBUTTON 116, "", 14, 35, 67, 65
    BEGIN
        NAME "year"
        SELECTIONHEIGHT 21
    END

    GROUPBOX 117, "Query Progress", 170, 85, 795, 555
    BEGIN
        FONT "Dialog" 10,bold
        INVISIBLE
        NAME "progressGroupBox"
    END

    SLIDER 118, 91, 25, 869, 30
    BEGIN
        INVISIBLE
        NAME "13perSlider"
        ORIENTATION 1073741824
        MAXIMUM 13
        MINIMUM 1
        VALUE 7
        MAJORTICKSPACING 2
        PAINTTICKS
        SNAPTOTICKS
    END

    STATICTEXT 119, "Static Text", 75, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per01"
        NOT OPAQUE
    END

    STATICTEXT 120, "Static Text", 145, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per02"
        NOT OPAQUE
    END

    STATICTEXT 121, "Static Text", 217, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per03"
        NOT OPAQUE
    END

    STATICTEXT 122, "Static Text", 287, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per04"
        NOT OPAQUE
    END

    STATICTEXT 123, "Static Text", 359, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per05"
        NOT OPAQUE
    END

    STATICTEXT 124, "Static Text", 429, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per06"
        NOT OPAQUE
    END

    STATICTEXT 125, "Static Text", 501, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per07"
        NOT OPAQUE
    END

    STATICTEXT 126, "Static Text", 571, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per08"
        NOT OPAQUE
    END

    STATICTEXT 127, "Static Text", 643, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per09"
        NOT OPAQUE
    END

    STATICTEXT 128, "Static Text", 713, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per10"
        NOT OPAQUE
    END

    STATICTEXT 129, "Static Text", 784, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per11"
        NOT OPAQUE
    END

    STATICTEXT 130, "Static Text", 854, 55, 60, 20
    BEGIN
        INVISIBLE
        NAME "13per12"
        NOT OPAQUE
    END

    STATICTEXT 131, "Static Text", 945, 55, 60, 30
    BEGIN
        INVISIBLE
        NAME "13per13"
        NOT OPAQUE
    END

END

