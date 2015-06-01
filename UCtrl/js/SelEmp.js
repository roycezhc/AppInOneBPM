function selEmps(me, dirPre, seltype) {
    window.me = me;
    var hidObj = $(me).parent().find("input");
    var old = hidObj.val();
    var win = window.showModalDialog(dirPre + "HR/Staff/StaffSels.aspx?ids=" + old + seltype + "&r=" + Math.random(), "", "dialogHeight: 500px; dialogWidth: 600px; dialogTop:; dialogLeft:; edge: Raised; center: Yes; help: No; resizable: No; status: No;"); if (!win) { win = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (win != "" && win != undefined) {
        var reStr = "";
        $(me).prev().empty();
        var arr = eval(win);
        for (var i = 0; i < arr.length; i++) {
            var aaa = arr[i];
            $(me).prev().append("<li><span>" + aaa.Name + "</span><label class='selsDel' id='" + aaa.ID + "' onclick='delOneEmp(this)'></label></li>");
            reStr += reStr == "" ? aaa.ID : "," + aaa.ID;
        }
        hidObj.val(reStr);
    }

}
function delOneEmp(me) {
    var empid = me.id;
    var hidObj = $(me).parent().parent().prev();
    var str = hidObj.val();
    var reStr = "";
    if (str.indexOf(",") == -1) {
        if (str != empid) {
            reStr = empid;
        }
    } else {
        var arr = str.split(',');
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] != empid) {
                reStr += reStr == "" ? arr[i] : "," + arr[i];
            }
        }
    }
    $(me).parent().remove();
    hidObj.val(reStr);
}
function cbs() {
    var reStr = "";
    win = window.returnValue;
    $(me).prev().empty();
    var hidObj = $(me).parent().find("input");
    var arr = eval(win);
    for (var i = 0; i < arr.length; i++) {
        var aaa = arr[i];
        $(me).prev().append("<li><span>" + aaa.Name + "</span><label class='selsDel' id='" + aaa.ID + "' onclick='delOneEmp(this)'></label></li>");
        reStr += reStr == "" ? aaa.ID : "," + aaa.ID;
    }
    hidObj.val(reStr);
}
