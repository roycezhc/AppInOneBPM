function selDpts(me, dirPre, seltype) {
    var hidObj = $(me).parent().find("input");
    var old = hidObj.val();
    var win = window.showModalDialog(dirPre + "HR/DEPT/DeptSels.aspx?old=" + old + seltype + "&r=" + Math.random(), "", "dialogHeight: 500px; dialogWidth: 300px; dialogTop:; dialogLeft:; edge: Raised; center: Yes; help: No; resizable: No; status: No;"); if (!win) { win = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (win != "" && win != undefined) {
        var reStr = "";
        $(me).prev().empty();
        var arr = eval(win);
        for (var i = 0; i < arr.length; i++) {
            var aaa = arr[i];
            $(me).prev().append("<li><span>" + aaa.DptName + "</span><label id='" + aaa.DptID + "' onclick='delOneDpt(this)'></label></li>");
            reStr += reStr == "" ? aaa.DptID : "," + aaa.DptID;
        }
        hidObj.val(reStr);
    }

}
function delOneDpt(me) {
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