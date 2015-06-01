var curSelTR = null;
var managePara = {
   listID:"",
   selectedID:"0",
   cookieName:'',
   cookieOut:12,
   colselCID:"",
   preDir:"/"
};
function selAll(me) {
    $(me).parent().parent().parent().next().find("input[type='checkbox']").attr("checked", me.checked);
}

//顶部标题栏 打开或关闭相邻操作区域 
function openNextArea(me) {
    var txt = $(me).attr("class");
    if (txt == undefined || txt.indexOf("opened") == -1) {
        $(me).addClass("opened");
        $(me).parent().parent().parent().next().show();
    } else {
        $(me).removeClass("opened");
        $(me).parent().parent().parent().next().hide();
    }
    if (parent.document.URL != document.URL) {
        if (parent.autoFrameHeight) {
            parent.autoFrameHeight();
        }
    }
}

function iFrameHeight(ifrID) {
    var ifm = document.getElementById(ifrID);
    var subWeb = document.frames ? document.frames[ifrID].document : ifm.contentDocument;
    if (ifm != null && subWeb != null) {
        $(ifm).height(subWeb.body.scrollHeight);
    }
}

function autoFrameHeight(me) {
    if (me.id != undefined) {
        iFrameHeight(me.id);
    }
}

//清空顶部查询表单内容
function _topFindClear(me) {
    var pObj = $(me).parent().parent().parent().parent().parent();
    pObj.find("input[type='text']").val("");
    pObj.find("textarea").val("");
    pObj.find("select").val("");
}

function addTRByDataObj(tbId, dataObjStr) {
    var dataObj = eval(dataObjStr);
    var trObj = $("#" + tbId).find("thead").find("tr:first").clone();
    var keyname = trObj.attr("keyname");
    var keyval = dataObj[keyname];
    var tds = trObj.children();
    for (var a = 0; a < tds.length; a++) {
        var colname = $(tds[a]).attr("colname");
        if (colname != undefined) {
            $(tds[a]).html(dataObj[colname]);
        }
        var links = $(tds[a]).find("a");
        links.removeClass("hide");
        if (links.length > 0) {
            if (keyname != undefined) {
                
                var aStr = $(tds[a]).html();
                var reg = new RegExp("{" + keyname + "}", "g");
                aStr = aStr.replace(reg, keyval);
                $(tds[a]).html(aStr);
            }
        }

        var cks = $(tds[a]).find("input[type='checkbox']");
        if (cks.length > 0) {
            cks.replaceWith("<input type='checkbox' value='" + keyval + "' />");
        }
    }
    trObj.removeClass("hide");
    _initRowLinkEvent(trObj);
    $("#" + tbId).find("tbody").prepend(trObj);
    updatePagerRecord(1);
    
}

function updatePagerRecord(num) {
    var tds = $("div.pages").find("table").find("tr:first").children();
    if (tds.length > 0) {
        var str = $(tds[0]).text();
        var reg1 = new RegExp("总记录.*?(\\d+)", "g");
        var oldNum = parseFloat(reg1.exec(str)[1]);

        var reg = new RegExp("总记录.*?\\d+", "g");
        str = str.replace(reg, "总记录：" + (oldNum + num));
        $(tds[0]).html(str);
    }
}

function editTRByDataObj(tbId, curTR, dataObjStr) {
    var dataObj = eval(dataObjStr);
    var trObj = $("#" + tbId).find("thead").find("tr:first").clone();
    var tds = trObj.children();
    var curTDS = curTR.children();
    for (var a = 0; a < tds.length; a++) {
        var colname = $(tds[a]).attr("colname");
        if (colname != undefined) {
            var val = dataObj[colname];
            var oldTxt = $(curTDS[a]).text();
            //alert(oldTxt+"|"+val+"|"+colname);
            if (oldTxt != val && oldTxt != "&nbsp;" && val!=undefined) {
                $(curTDS[a]).addClass("edited");
            }
            $(curTDS[a]).html(val);
           
        }
    }
}

function _editRecord(tbId, me) {
    curSelTR = $(me).parent().parent();
    var url = $(me).attr("href");
    if (url.indexOf("?") != -1) {
        url += "&";
    } else {
        url += "?";
    }
    var result = window.showModalDialog(url + "r=" + Math.random(), "newwindow", "dialogHeight=650px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (result != undefined && result != "") {
        editTRByDataObj(tbId, curSelTR, result);
    }
    return false;
}

function _newRecord(url) {
    if (url.indexOf("?") != -1) {
        url += "&";
    } else {
        url += "?";
    }
    _checkLogin();
    var result = window.showModalDialog(url + "r=" + Math.random(), "newwindow", "dialogHeight=650px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
    if (result != undefined && result != "") {
        addTRByDataObj(managePara.listID, result);
    }
    return false;
}

//打开高级编辑页面，信息分组编辑
function _openAdvEditWin(me) {
    curSelTR = $(me).parent().parent();
    var url = $(me).attr("href");
    var result = window.showModalDialog(url + "&r=" + Math.random(), "newwindow", "dialogHeight=650px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面

    return false;
}


function _delBySelKeyIDS(backUrl, reUrl, msg) {
    if (!confirm("您确定要删除所选的记录吗？")) {
        return false;
    }
    var cks = $("#" + managePara.listID).find("tbody:first").find("input[type='checkbox']");
    var arr = new Array();
    var arrTR = new Array();
    for (var i = 0; i < cks.length; i++) {
        if (cks[i].checked == true) {
            arr.push(cks[i].value);
            arrTR.push($(cks[i]).parent().parent());
        }
    }
  
    var curObj = event.target;
    $.ajax({
        url: backUrl + "?DelKeyIDS=" + arr.toString(),
        cache: false,
        success: function (svrData) {
            if (svrData == "") {
                alert("删除失败！");
            } else {
                var reg = /^\d*$/;
                if (reg.test(svrData) == true) {
                    if (parseInt(svrData) > 0) {
                        var s = "";
                        if (msg != undefined) {
                            s = msg + "成功";
                        } else {
                            if (curObj) {
                                s = curObj.innerHTML + "成功";
                            } else {
                                s = "操作成功";
                            }
                        }

                    } else {
                        s = "操作失败";
                    }
                    s += "!";
                    alert(s);
                } else {
                    alert(svrData);
                }
            }
            if (reUrl != undefined) {
                window.location.href = reUrl;
            } else {
                for (var c = 0; c < arrTR.length; c++) {
                    $(arrTR[c]).remove();
                }
            }
            updatePagerRecord(-arrTR.length);
        },
        error: function (a, b, c) {
            alert(a);
        }
    });
}

function _delInfoByKeyID(me, backUrl, msg) {
    if (!window.confirm('您确定要删除此记录吗？')) {
        return false;
    }
    var curObj = $(me);
    $.ajax({
        url: backUrl,
        cache: false,
        success: function (svrData) {
            if (svrData == "") {
                alert("删除失败！");
            } else {
                var reg = /^\d*$/;
                if (reg.test(svrData) == true) {
                    if (parseInt(svrData) > 0) {
                        var s = "";
                        if (msg != undefined) {
                            s = msg + "成功";
                        } else {
                            if (curObj) {
                                s = curObj.text() + "成功";
                            } else {
                                s = "操作成功";
                            }
                        }
                        var trObj=curObj.parent().parent();
                        if (trObj.next().length > 0 && trObj.next().attr("class") == 'detail') {
                            trObj.next().remove();
                        }
                        trObj.remove();

                    } else {
                        s = "操作失败";
                    }
                    s += "!";
                    alert(s);
                    updatePagerRecord(-1);
                } else {
                    alert(svrData);
                }
            }
        }
    });

    return false;
}


function delByRealIDAndID(me, keyid, backUrl, realpara, msg) {
    //alert(keyid + "|" + backUrl + "|" + realpara);
    if (!window.confirm('您确定要删除此关联记录吗？')) {
        return false;
    }
    if (realpara == undefined || realpara == "") {
        if (parent.delRealSels) {
            parent.delRealSels(keyid);
        } else {
            alert("获取不到关联信息ID，无法删除！");
        }
        return false;
    }
    var curObj = $(me);
    $.ajax({
        url: backUrl + "?DelRealKeyID=" + keyid + "&" + realpara,
        cache: false,
        success: function (svrData) {
            if (svrData == "") {
                alert("删除失败！");
            } else {
                var reg = /^\d*$/;
                if (reg.test(svrData) == true) {
                    if (parseInt(svrData) > 0) {
                        var s = "";
                        if (msg != undefined) {
                            s = msg + "成功";
                        } else {
                            if (curObj) {
                                s = curObj.text() + "成功";
                            } else {
                                s = "操作成功";
                            }
                        }

                        curObj.parent().parent().remove();
                        if (parent.delRealSels) {
                            parent.delRealSels(keyid);
                        }

                    } else {
                        s = "操作失败";
                    }
                    s += "!";
                    alert(s);
                } else {
                    alert(svrData);
                }
            }
        }
    });
}

//根据当前点击的删除连接地址AJAX处理后台代码
function _oprByBackUrl(me, backUrl, msg) {
    //alert(backUrl);
    var curObj = $(me);
    $.ajax({
        url: backUrl,
        cache: false,
        success: function (svrData) {
            if (svrData == "") {
                alert("删除失败！");
            } else {
                var reg = /^\d*$/;
                if (reg.test(svrData) == true) {
                    if (parseInt(svrData) > 0) {
                        var s = "";
                        if (msg != undefined) {
                            s = msg + "成功";
                        } else {
                            if (curObj) {
                                s = curObj.text() + "成功";
                            } else {
                                s = "操作成功";
                            }
                        }

                        curObj.parent().parent().remove();
                        if (_oprByBackUrlSuccess) {
                            _oprByBackUrlSuccess();
                        }
                    } else {
                        s = "操作失败";
                    }
                    s += "!";
                    alert(s);
                } else {
                    alert(svrData);
                }
            }
        }
    });
}

//点击列表的某行时，通过AJAX在当前行下面显示该记录的详细信息，参数：当前行对象，选中的KEYID
function _showDetailInfo(aObj) {
    var trObj = aObj.parent().parent();

    if (trObj.next().length > 0 && trObj.next().attr("class") == 'detail') {
        trObj.next().show();
        return;
    }
    //alert(aObj.attr("href"));
    $.ajax({
        url: aObj.attr("href") + "&ajax=1",
        cache: true,
        success: function (svrData) {
            if (svrData != "") {
                var num = trObj.children().length;
               //svrData = "<div class='wintit'><a onclick='_hideDetail(this);'>收起</a></div>" + svrData;
                var newTR = "<tr class='detail'><td>&nbsp;</td><td>&nbsp;</td><td colspan='" + (num - 2) + "'>" + svrData + "</td></tr>";
                trObj.after(newTR);
            }
        },
        error: function (a, b, c) {
            alert(a);
        }
    });
}

//初始化列表里各行的单选事件和处理代码
function _initBodyRow() {
    var trs = $("#" + managePara.listID).find("tbody").find("tr");
    for (var i = 0; i < trs.length; i++) {
        var trObj = $(trs[i]);
        trObj.bind("click", trObj, function (e) {
            trs.removeClass("sel");
            e.data.addClass("sel");
            managePara.selectedID = e.data.find("input[type='checkbox']").val();
            _trClickMore(e.data);
        });
        trObj.bind("mouseover", trObj, function (e) {
            trs.removeClass("sel");
            e.data.addClass("sel");
        });

        _initRowLinkEvent(trObj);
    }
}

function _trClickMore(trObj) { 
   
}

function _initRowLinkEvent(trObj) {
    var oprAS = trObj.find("a");
    for (var a = 0; a < oprAS.length; a++) {
        var aObj = $(oprAS[a]);
        if (aObj.text() == "编辑") {
            aObj.bind("click", aObj, function (e) {
                return _editRecord(managePara.listID, e.data[0]);
            });
        }

        if (aObj.text() == "高级编辑") {
            aObj.bind("click", aObj, function (e) {
                return _openAdvEditWin(e.data[0]);
            });
        }

        if (aObj.text() == "删除") {
            aObj.bind("click", aObj, function (e) {
                return _delInfoByKeyID(e.data[0], e.data.attr("href"));
            });
        }

        //从关联表里移除某个记录，此时没有操作后台数据库
        if (aObj.text() == "移除") {
            aObj.bind("click", aObj, function (e) {
                return _delRealIDFromList(e.data[0], e.data.attr("data"));
            });
        }

        if (aObj.text() == "详细" || aObj.text() == "隐藏") {
            aObj.bind("click", aObj, function (e) {
                if (e.data.text() == "详细") {
                    e.data.text("隐藏");
                    _showDetailInfo(e.data);
                } else {
                    e.data.text("详细");
                    e.data.parent().parent().next().hide();
                }
                return false;
            });
        }
    }
}

//关闭选择“显示隐藏列”的区域
function _closeSelCol(me) {
    $(me).parent().parent().hide();
}

//单选框代表某一列数据，当选择次单选框时，在列表里显示活隐藏对应的列
function _colCkSel(me) {
    _showhideByName(me.value, me.checked);
}

//根据列名显示或隐藏列表里对应的列，show==true表示显示
function _showhideByName(name, show) {
    var tdObj = $("#" + managePara.listID).find("thead").find("tr").find("td[colname='" + name + "']");
    if (tdObj.length > 0) {
        if (show == true) {
            _hideOneCol(tdObj, true);
        } else {
            _hideOneCol(tdObj);
        }
    }
}

////根据传递进来的列名字符串集合，显示或隐藏列表里对应的列，show==true表示显示
function _initColHideByNames(names, show) {
    if (names == undefined || names == "") {
        return;
    }
    var ishow = show || false;
    if (names.indexOf(",") == -1) {
        _showhideByName(names, ishow);
    } else {
        var arr = names.split(',');
        for (var a = 0; a < arr.length; a++) {
            _showhideByName(arr[a], ishow);
        }
    }
}

//初始化列标题单元格事件和处理代码，自动生成可供选择的下拉列集合选择器
function _initHeadRow() {
    if (managePara.colselCID == "") {
        return;
    }
    var tds = $("#" + managePara.listID).find("thead").find("tr").children();
    //$(tds[1]).width($(tds[1]).text().length*12);
    
    for (var i = 2; i < tds.length; i++) {
        var tdObj = $(tds[i]);
        tdObj.append("<a class='colclose' onclick='_closeCol(this);'>&nbsp;</a>");
        tdObj.bind("mouseover", tdObj, function (e) {
            e.data.find("a").css({ display: "inline-block" });
            e.data.find("a").show();
        });
        tdObj.bind("mouseout", tdObj, function (e) {
            e.data.find("a").hide();
        });
        var colname = tdObj.attr("colname");
        var colnames = "";
        if (colname != undefined && colname != "") {
            colnames += colnames == "" ? colname : "," + colname;
            $("#" + managePara.colselCID).append("<li><input id='ck_" + colname + "' onclick='_colCkSel(this);' checked='checked' type='checkbox' value='" + colname + "'/><label for='ck_" + colname + "'>" + tdObj.text() + "</label></li>");
        }

        setCookie(managePara.cookieName, colnames);
    }
    $("#" + managePara.colselCID).append("<li><a onclick='_closeSelCol(this);'>关闭</a></li>");
}

//根据某单元格TD对象显示或隐藏列表里的列，show==true表示显示
function _hideOneCol(tdObj, show) {
    if (tdObj.length == 0) {
        return;
    }
    var trObj = tdObj.parent();
    var tds = trObj.children();
    var index = 0;
    for (var i = 2; i < tds.length; i++) {
        if (tdObj.text() == $(tds[i]).text()) {
            index = i;
            break;
        }
    }
    var colname = tdObj.attr("colname");
    var d = new Date();
    d.setHours(d.getHours() + managePara.cookieOut);

    if (show == true) {
        tdObj.show();
        var hidenames = getCookie(managePara.cookieName) || "";
        if (hidenames.indexOf(colname) != -1) {
            hidenames = RemoveFromString(hidenames, colname, ',');
        }
        setCookie(managePara.cookieName, hidenames, d);
    } else {
        tdObj.hide();
        var hidenames = getCookie(managePara.cookieName) || "";
        if (hidenames.indexOf(colname) == -1) {
            hidenames += hidenames == "" ? colname : "," + colname;
            setCookie(managePara.cookieName, hidenames, d);
            //alert(getCookie(managePara.cookieName));
        }
    }

    var trs = $("#" + managePara.listID).find("tbody").children();
    for (var i = 0; i < trs.length; i++) {
        var trObj = $(trs[i]);
        if (show == true) {
            $(trObj.children()[index]).show();
        } else {
            $(trObj.children()[index]).hide();
        }
    }
    var cks = $("#" + managePara.colselCID).find("input[type='checkbox']");
    for (var a = 0; a < cks.length; a++) {
        if (cks[a].value == tdObj.attr("colname")) {
            if (show == true) {
                cks[a].checked = true;
            } else {
                cks[a].checked = false;
            }
            break;
        }
    }
}

function _closeCol(me) {
    var tdObj = $(me).parent();
    _hideOneCol(tdObj);

    return false;
}

//function _hideDetail(me) {
//    $(me).parent().parent().parent().hide();
//}



function _hideColsSel(me) {
    $(me).next().show();
}

function _delRealIDFromList(me, id) {
    _delOneAndReturn(id);
    $(me).parent().parent().remove();
    return false;
}

function _addOneAndReturn(id) {
    var hidObj = $("input[id$='hidMulIDS']");
    var oldIDS = hidObj.val();
    var temp = "," + oldIDS + ",";
    if (temp.indexOf("," + id + ",") != -1) {
        alert("您所选的记录已经存在！");
    } else {
        if (oldIDS != "") {
            oldIDS += "," + id;
        } else {
            oldIDS = id;
        }
    }
    hidObj.val(oldIDS);
    return oldIDS;
}

var _checkLogin = function () {

    $.ajax({
        type: "GET",
        url: managePara.preDir + "SYS/SYSBack.aspx?IsTimeOut=1",
        async: false,
        success: function (msg) {
            if (msg == "1") {
                var result = window.showModalDialog(managePara.preDir + "Login.aspx?ckPass=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
            }
        }
    });
}

function _getSelRealIDS() {
    return $("input[id$='hidMulIDS']").val();
}

function _delOneAndReturn(id) {
    var hidObj = $("input[id$='hidMulIDS']");
    var oldIDS = hidObj.val();
    var re = "";
    if (oldIDS.indexOf(",") != -1) {
        var arr = oldIDS.split(',');
        for (var a = 0; a < arr.length; a++) {
            if (id != arr[a]) {
                re += re == "" ? arr[a] : "," + arr[a];
            }
        }
    } else {
        if (id != oldIDS) {
            re = oldIDS;
        }
    }
    hidObj.val(re);
}