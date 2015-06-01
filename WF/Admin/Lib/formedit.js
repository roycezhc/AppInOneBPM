String.prototype.replaceAll = stringReplaceAll;

function stringReplaceAll(AFindText, ARepText) {
    raRegExp = new RegExp(AFindText, "g");
    return this.replace(raRegExp, ARepText)
}
//文件上传是，选择重传复选框
function showReUpFile(me) {
    if (me.checked == true) {
        $(me).prev().prev().show();
    } else {
        $(me).prev().prev().hide();
    }
}
//选择文件上传是类型判断
function fileValueChg(me) {
    var exdname = me.value.substring(me.value.lastIndexOf('.'), me.value.length);
    alert(exdname);
    var exdfile = $(me).attr("exdfile");
    if (exdfile != undefined && exdfile != "") {
        if (exdfile.indexOf(exdname) == -1) {
            alert("文件类型不符要求！");
        }
    }
}

//选择部门完成后执行的操作，自动生成订单编号
function selDept_E(me) {
    $.get("RecBack.aspx?DEPT_ID=" + escape($(me).prev().val()) + "&r=" + Math.random(), function (data) {
        $("input[id$='txtRECNO']").val(data);
    });
    $("input[id$='hidStaff_ID']").val("");
    $("input[id$='txtStaff_NAME']").val("");

}
////选择部门前执行操作，判断
//function selDept_First(me) {
//    var deptObj = $("input[id$='hidDEPT_ID']");
//    if (deptObj.length > 0) {
//        if (deptObj.val() == "") {
//            alert("请先选择部门!");
//            return false;
//        } else {
//            $(me).attr("moreP", "DEPT_ID=" + deptObj.val());
//            //alert($(me).attr("moreP"));
//            return true;
//        }
//    }
//}

//弹出页面选择一个日期时间
function setdatetime(me) {
    var sels = window.showModalDialog("../Lib/SelTime.aspx?old=" + me.value, "winCondSet", "dialogHeight=350px; dialogWidth=450px;dialogLeft:;dialogTop:; status=no;");if (!sels) { sels = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (sels != undefined) {
        if (navigator.userAgent.indexOf("Chrome") <0)
             me.value = sels;
    } else {
        me.value = "";
    }
}
 function bindTrInputEvent(trObj){
    var inputObj = trObj.find("input[onfocus*='getCalResult']");
    if(inputObj.length>0){
        var focusStr = inputObj.attr("onfocus");
        var m = /.+,'(.+?)'\)/.exec(focusStr);
        var calstr=m[1];
        var arr =calstr.split(/[\+\*\-/]/);
        for(var i=0;i<arr.length;i++){
        var ooo=trObj.find("input[name$='_"+arr[i]+"']");
        ooo.bind("keyup",ooo,function(e){
            var knum=parseFloat(e.keyCode);
            if((knum<=57&&knum>=48)||(knum<=105&&knum>=96)){
               getCalResult(inputObj[0], calstr);
            }
        });
        }
    }
}

//在明细表单里新增一行
function addRow(me) {
    var bodyObj = $(me).parent().parent().parent().next();
    var oldNum = parseFloat($("input[id$='hidDetailRows']").val());
    oldNum += 1;
    $("input[id$='hidDetailRows']").val(oldNum);
    var html = bodyObj.find("tr:first").html();
    html = html.replaceAll("tr_\\d_", "tr_" + oldNum + "_");
    var newTR = $("<tr>" + html + "</tr>");
    bindTrInputEvent(newTR);
    bodyObj.append(newTR);
}
//在明细表单里删除一行
function delRow(me) {
    var bodyObj = $(me).parent().parent().parent();
    if (bodyObj.find("tr").length < 2) {
        alert("至少保留已调明细！");
    } else {
        $(me).parent().parent().remove();
    }
}
//明细表单里，当一列是同行另外两列的计算结果时，在控件获取焦点时执行此方法，自动填充计算值
function getCalResult(me, calstr) {
    if (calstr == "" || calstr == undefined) {
        return;
    }
    var reg = /([\*\+\-\/])?([a-zA-Z_0-9])*/g;
    var re = calstr.match(reg);
    if (re.length > 0) {
        var trObj = $(me).parent().parent().parent();
        var funStr = "return ";
        for (var i = 0; i < re.length; i++) {
            if (re[i] == "") {
                continue;
            }
            var firstC = re[i].substr(0, 1);
            var name = "";
            if (firstC == '*' || firstC == '+' || firstC == '/' || firstC == '-') {
                name = re[i].substring(1, re[i].length);
            } else {
                firstC = "";
                name = re[i];
            }
            var val = "0";
            var valObj = trObj.find("input[name$='_" + name + "']");
            if (valObj.length > 0) {
                val = valObj.val();
            }
            if (val == "")
            { val = "0"; }
            else{
              if(/^\d*\.?\d+$/.test(val)==false){
                  val = "0";
              }
           }
            funStr += firstC + "parseFloat('" + val + "')";
        }
        //window.status=funStr;
        var f = new Function(funStr + ";");
        $(me).val(f())
    }
}