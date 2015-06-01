
var resizeTimer = null;

function InitELH(h, listid, list1, list2) {
    var docH = $(window).height();
    $("#" + listid).height(docH - h);

    if (list1 != undefined && list1 != "") {
       $("#" + list1).height(docH - h);
    }
    if (list2 != undefined && list2 != "") {
       $("#" + list2).height(docH - h);
    }
}

function InitELWH(w, h, listid) {
    var docH = $(window).height();
    if (w > 0) {
        var docW = $(window).width();
        $("#" + listid).width(docW - w);
    }
    $("#" + listid).height(docH - h);
}

function doResize() { }
function gotoResize() {
    doResize();
    resizeTimer = null;
}

function bindWinResize() {
    doResize();
    $(window).bind("resize", null, function (e) {
        resizeTimer = resizeTimer ? null : setTimeout("gotoResize()", 0);
    });
}