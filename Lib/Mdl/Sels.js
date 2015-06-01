var Sels={};
Sels.Para = {
    nameIndex: 2, idIndex: 1
}

function selsok() {
    try {
        var selinfo = "[" + $("input[id$='hidOld']").val() + "]"; // document.getElementById(hidObdID).value;
        //window.returnValue = selinfo ; //返回选中对象：{ID:，名:}
        _selOK_B(selinfo);
        //刷新父页面
       // selInfo = "re";
        if (window.opener != null) {
            window.opener.returnValue = selinfo;
            if (window.opener.cbs) {
                window.opener.cbs();
            }
        } else {
            window.returnValue = selinfo;
        }
        window.close();
    } catch (e) {
        alert(e)
    }
}
function _selOK_B(sels) { 

}

function removeByObjStr(srcObjStr, moveObjStr) {
    //alert(srcObjStr);
    //alert(moveObjStr);
    var str = "";
    if (srcObjStr.indexOf('[') == -1) {
        srcObjStr = "[" + srcObjStr + "]";
    }
    if (moveObjStr.indexOf('(') == -1) {
        moveObjStr = "(" + moveObjStr + ")";
    }
    var srcObj = eval(srcObjStr);
    var moveObj = eval(moveObjStr);
    for (var i = 0; i < srcObj.length; i++) {
        if (isObjEqual(srcObj[i], moveObj) == false) {
            str += str == "" ? getObjStr(srcObj[i]) : "," + getObjStr(srcObj[i]);
        }
    }
    return str;
}

function isObjEqual(obj1, obj2) {
    for (var el in obj1) {
        if (obj1[el.toString()] == obj2[el.toString()]) {
            continue;
        } else {
            return false;
        }
    }
}

function getObjStr(obj) {
    var str = "{";
    for (var el in obj) {
        if (str.length > 1) {
            str += ",";
        }
        str += el.toString() + ":'" + obj[el.toString()] + "'";
    }
    str += "}";
    return str;
}

function getRowText(tds) {
    //alert(tds[Sels.Para.idIndex].innerHTML);
    return "{ID:'" + tds[Sels.Para.idIndex].innerHTML + "',Name:'" + tds[Sels.Para.nameIndex].innerHTML + "'}";
}

function _canSel(tds) {
    return true;
}

function selsThis(el) {
    var hid = $("input[id$='hidOld']");
    var selinfo = hid.val();
    var trObj = $(el.parentNode.parentNode);
    var tds = trObj.find("td");

    var obj = document.getElementById("selectedlist");
    if (el.checked == true) {
        if (selinfo == "") {
            selinfo = getRowText(tds);
        } else {
            selinfo += "," + getRowText(tds);
        }
        //颜色也要改变
        $(el.parentNode.parentNode).css({ color: "#000", background: "#dde" });
        addOption(obj, tds[Sels.Para.idIndex].innerHTML, tds[Sels.Para.nameIndex].innerHTML, false);
        if (trObj.parent().find("input[type='checkbox']").attr("checked") == true) {
            $("#ckSelAll").attr("checked", true);
        }
    } else {
        selinfo = removeByObjStr(selinfo, getRowText(tds));
        //颜色也要改变
        $(el.parentNode.parentNode).css({ color: "#000", background: "none" });
        removeByValue(obj, tds[Sels.Para.idIndex].innerHTML);
        $("#ckSelAll").attr("checked", false);
    }
    hid.val(selinfo); //alert(selinfo);
}
//页面加载后，根据隐藏域里的信息初始化左边列表框，选中右边表格相关行的选择框
function setSelectHtml() {
    try {
        var objHid = $("input[id$='hidOld']"); // alert(objHid.value);
        if (objHid.val() != "") {
            var obj = document.getElementById("selectedlist");
            var arr = eval("[" + objHid.val() + "]");
            for (var j = 0; j < arr.length; j++) {
                addOption(obj, arr[j].ID, arr[j].Name, false);
            }
            var trs =$("div.tblist").find("table tbody").find("tr");
            var selNum = 0;
            for (var i = 0; i < trs.length; i++) {
                var ck = $(trs[i]).find("input");
                var hadVal = false;
                for (var a = 0; a < arr.length; a++) {
                    if (ck.val() == arr[a].ID) {
                        hadVal = true; selNum++; break;
                    }
                }
                if (hadVal == true) {
                    ck.attr("checked", true);
                    ck.parent().parent().css({ color: "#000", background: "#dde" });
                }
            }
            if (trs.length == selNum) {
                $("#ckSelAll").attr("checked", true);
            }
        }
    } catch (e) { }
}

$(function () {
    //Sels_Load();
});
function Sels_Load() {
    setSelectHtml();

    var trs = $("div.tblist").find("table tbody").find("tr");
    for (var i = 0; i < trs.length; i++) {
        $(trs[i]).bind("click", trs[i], function (e) {
            if (e.target.tagName != "INPUT" && _canSel($(e.data).children())) {
                var ck = $(e.data).find("input");
                if (ck.attr("checked") == "" || ck.attr("checked") == undefined || ck.attr("checked") == false) {
                    ck.attr("checked", "checked");
                } else {
                    ck.attr("checked", false);
                }

                selsThis(ck[0]);

            }
        });

    }
    var listSel = $("#selectedlist");
    listSel.bind("dblclick", listSel[0], function (e) {
        var curOp = e.data.options[e.data.selectedIndex];

        var cks = $("div.tblist").find("table tbody").find("input[value='" + curOp.value + "']");
        var tds = cks.parent().parent().children();
        if (cks.length > 0) {
            cks[0].checked = false;
            selsThis(cks[0]);
        } else {
            var hid = $("input[id$='hidOld']");
            hid.val(removeByObjStr(hid.val(), getRowText(tds)));
        }
        removeByValue(e.data, curOp.value);
    });
    var qingkong = $("#btnClear");
    qingkong.bind("click", function (e) {
        $('#selectedlist').children().each(function () {
            if ($(this).val() != '') {
                this.selected = true; $(this).dblclick(); //
            }
        });
    });
}

function _selsAll(el) {
    var cks = $("div.tblist").find("table tbody").find("input[type='checkbox']");
    for (var i = 0; i < cks.length; i++) {
        cks[i].checked = el.checked;
        selsThis(cks[i]);
    }
}