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
    //alert(exdname);
    var exdfile = $(me).attr("exdfile");
    if (exdfile != undefined && exdfile != "") {
        if (exdfile.indexOf(exdname) == -1) {
            alert("文件类型不符要求！");
        }
    }
}


function selDept_B(me) { return true; };
//选择部门完成后执行的操作，自动生成订单编号
function selDept_E(me) {
    var hidObj = $(me).parent().find("input[type='hidden']");
    $.get("Back.aspx?DEPT_ID=" + escape(hidObj.val()) + "&r=" + Math.random(), function (data) {
        //$("input[id$='txtRECNO']").val(data);
    });
    $("input[name^='STAFF_ID']").val("");
    $("input[name^='STAFF_NAME']").val("");
}
function selDept(me) {
alert("aa")
    selDept_B(me);
    var dirPre = $("input[id$='hidAppPath']").val();
    var hidObj = $(me).parent().find("input[type='hidden']");
    var txtObj = $(me).parent().find("input[type='text']");
    var old = hidObj.val();
    var moreP = $(me).attr('moreP'); if (moreP == undefined) { moreP = ''; }
    var win = window.showModalDialog(dirPre + "HR/DEPT/DeptSel.aspx?r=" + Math.random() + "&" + moreP, "", "dialogHeight: 500px; dialogWidth: 300px; dialogTop:; dialogLeft:; edge: Raised; center: Yes; help: No; resizable: No; status: No;"); if (!win) { win = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (win != "" && win != undefined) {
        var dataObj = eval(win);
        hidObj.val(dataObj.id);
        txtObj.val(dataObj.name);
        selDept_E(me);
    }
}

function selExistsRec(me, tbinfo) {
    var dirPre = $("input[id$='hidAppPath']").val();
    alert(tbinfo);
    var result = window.showModalDialog(dirPre + 'Bill/ExistsRecSel.aspx?tbinfo=' + tbinfo + '&r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;'); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (result != undefined) {
        var obj = eval(result);
        var hidObj = $(me).prev();
        hidObj.val(obj.ID);
        hidObj.prev().val(obj.NAME);
    } else {
        var hidObj = $(me).prev();
        hidObj.val("0");
        hidObj.prev().val("无");
    }
}

function selStaff_B(me) { return true; };
function selStaff_E(me) { 

};
function selStaff(me) {
    selStaff_B(me);
    var dirPre = $("input[id$='hidAppPath']").val();
    var moreP = $(me).attr('moreP'); if (moreP == undefined) { moreP = '&p=1'; }
    var deptID = $("input[name='DEPT_ID']").val();
    if (deptID != undefined && deptID != "") {
        moreP += "&DEPT_ID=" + deptID;
    }
    var result = window.showModalDialog(dirPre + "HR/Staff/STAFFSel.aspx?r=" + Math.random() + moreP, "newwindow", "dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (result != undefined && result != '') {
        var obj = eval(result);
        var puts = $(me).parent().find('input');
        puts[0].value = obj.Name;
        puts[1].value = obj.ID;

        selStaff_E(me);
    }
}


//弹出页面选择一个日期时间
function setdatetime(me) {
    var sels = window.showModalDialog("../Lib/SelTime.aspx?old=" + me.value, "winCondSet", "dialogHeight=350px; dialogWidth=450px;dialogLeft:;dialogTop:; status=no;"); if (!sels) { sels = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (sels != undefined) {
        me.value = sels;
    } else {
        me.value = "";
    }
}
 function bindTrInputEvent(trObj){
    var inputObj = trObj.find("input[onfocus*='getCalResult']");
    //alert(inputObj.length+"||");
    if(inputObj.length>0){
        var focusStr = inputObj.attr("onfocus");
        var m = /.+,'(.+?)'\)/.exec(focusStr);
        var calstr=m[1];
        var arr = calstr.split(/[\+\*\-\/]/);
        //alert(arr.length);
        for (var i = 0; i < arr.length; i++) {
            var ooo = trObj.find("input[name$='_" + arr[i] + "']");
            ooo.bind("keyup", ooo, function (e) {
                //alert("sss");
                var knum = parseFloat(e.keyCode);
                if ((knum <= 57 && knum >= 48) || (knum <= 105 && knum >= 96)) {
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

    //alert(bodyObj.html());
}
//在明细表单里删除一行
function delRow(me) {
    var bodyObj = $(me).parent().parent().parent(); //alert(bodyObj.html()); alert(bodyObj.find("tr").length);
    if (bodyObj.find("tr").length < 2) {
        alert("至少保留已调明细！");
    } else {
        $(me).parent().parent().remove();
    }

}

function setCalResult(me, colname) {
    var trObj = $(me).parent().parent().parent();
    var inputObj = trObj.find("input[onfocus*='getCalResult']");
    //alert(inputObj.length+"||");
    if (inputObj.length > 0) {
        inputObj.trigger("onfocus");
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
        var f = new Function(funStr + ";");
        $(me).val(f())
    }
}