String.prototype.replaceAll = stringReplaceAll;

function stringReplaceAll(AFindText, ARepText) {
    raRegExp = new RegExp(AFindText, "g");
    return this.replace(raRegExp, ARepText)
}

function ListManager(paraObjIn) {
    if (paraObjIn == undefined && paraObjIn == null) {
        paraObjIn = {};
    }
    this.paraObj = {
        listCID: paraObjIn.listCID || "tbList"

    };
    var valObj = {
        selKeyID: "",selTRObj:null
    };
    this.getSelectedID = function () {
        return valObj.selKeyID;
    }

    //设置表头的默认宽度
    var setTHWidth = function (tdObj) {
        if (tdObj.children().length <= 0) {
            var ttt = tdObj.text(); 
            var w = ttt.length * 18;
            if (w <30) {
                w = 30;
            }
            tdObj.html("<div style='width:" + w + "px;'>" + ttt + "</div>");
        }

    }
    

    this.initBodyRows = function () {
        var i = 0;
        var listObj = $("#" + this.paraObj.listCID);

        //listObj.parent().width(listObj.parent().prev().width()); //列表宽度 自动绝对设置为上个兄弟节点的宽度，避免因为设置为100%，出现宽度BUG

        var htds = listObj.find("thead").find("tr").children();
        var hideArr = new Array();


        //var hideColsObj = $("input[id$='_hideTableColsID']");
        var showColsObj = $("input[id$='_showTableColsID']");

        //---begin列排序相关
        var hidSortColObj = $("input[id$='hidColSort']"); //存放当前排序字段和其他字段排序状态:tb.col1,asc`tb.col2,desc|tb.col3,asc
        var sortInfoArr = null;
        if (hidSortColObj.length > 0) {
            if (hidSortColObj.val() == "") {
                hidSortColObj.val("`");
            }
            sortInfoArr = hidSortColObj.val().split('`');
        }
        //---end列排序相关

        for (i = 0; i < htds.length; i++) {
            var tdObj = $(htds[i]);

            var datastr = tdObj.attr("data");
            var colname = "";
            var tbcolshow = 0; //页面上强制显示或隐藏
            if (datastr != undefined) {
                var dataObj = eval("(" + datastr + ")");
                colname = dataObj.colname;
                tbcolshow = dataObj.show;
            }
            if (colname == undefined || colname == "") {
                colname = $(htds[i]).attr("colname");
            }

            if (colname != undefined && colname != "") {

                colname = colname.replaceAll("\\]", "").replaceAll("\\[", "");
                if (showColsObj.length > 0) {
                    if (showColsObj.val().indexOf("," + colname) == -1 && tbcolshow != 1) {
                        hideArr.push(i); //没有在系统配置为显示，并且页面上没有强制显示的列隐藏
                        $(htds[i]).hide();
                    } else {
                        setTHWidth(tdObj); //设置列的默认宽度
                    }
                }

                //---begin列排序相关
                if (sortInfoArr != null) {
                    var oldSortStr = colname + ",asc";
                    if (sortInfoArr[1].indexOf(colname + ",asc") != -1) {
                        tdObj.attr("class", "asc"); //根据隐藏表单的值，记录当前列应该呈现为倒序还是升序排序
                    } else if (sortInfoArr[1].indexOf(colname + ",desc") != -1) {
                        oldSortStr = colname + ",desc";
                        tdObj.attr("class", "desc");
                    } else {
                        tdObj.attr("class", "asc");
                    }
                    //单击列执行排序功能
                    var thClsName = tdObj.attr("class"); // alert(thClsName);
                    if (thClsName != undefined && thClsName != "") {
                        tdObj.bind("click", { THObj: tdObj, colName: colname }, function (e) {

                            var hidColObj = $("input[id$='hidColSort']");
                            var clsname = e.data.THObj.attr("class");
                            var hidArr = hidColObj.val().split('`');
                            if (clsname.indexOf("asc") != -1) {
                                hidArr[0] = e.data.colName + ",asc";
                                e.data.THObj.attr("class", "desc");
                                if (hidArr[1].indexOf(oldSortStr) != -1) {
                                    hidArr[1] = hidArr[1].replace(oldSortStr, e.data.colName + ",desc");
                                } else {
                                    hidArr[1] += "|" + e.data.colName + ",desc";
                                }
                            } else {
                                hidArr[0] = e.data.colName + ",desc";
                                e.data.THObj.attr("class", "asc");
                                if (hidArr[1].indexOf(oldSortStr) != -1) {
                                    hidArr[1] = hidArr[1].replace(oldSortStr, e.data.colName + ",asc");
                                } else {
                                    hidArr[1] += "|" + e.data.colName + ",asc";
                                }
                            }

                            hidColObj.val(hidArr[0] + "`" + hidArr[1]);

                            var hidname = hidColObj.attr("name");
                            var lbSortColObj = $("a[id$='lbColSort']");
                            var lbname = hidname.split('$')[0] + "$" + lbSortColObj.attr("id");

                            lbname = lbname.replace("_", "$"); //alert(lbname);
                            __doPostBack(lbname, "");
                        });
                    }
                }
                //---end列排序相关

            } else {
                setTHWidth(tdObj); //设置列的默认宽度
            }
        }
        var bodyObj = $("#" + this.paraObj.listCID).find("tbody");

        $(document).bind("keydown", bodyObj, function (e) {
            //alert(e.keyCode);
            if (e.keyCode == "38") {
                var nnn = valObj.selTRObj.prev();
                if (nnn.length > 0) {
                    nnn.trigger("click");
                } else {
                    var as = $("div.pages").find("table").find("tr:first").find("a");
                    var aaa = new Function($(as[1]).attr("href"));
                    aaa();
                }
            } else if (e.keyCode == "40") {
                var nnn = valObj.selTRObj.next();
                if (nnn.length > 0) {
                    nnn.trigger("click");
                } else {
                    var as = $("div.pages").find("table").find("tr:first").find("a");
                    var aaa = new Function($(as[as.length - 2]).attr("href"));
                    aaa();
                }
            }
        });
        var trs = bodyObj.find("tr");

        for (i = 0; i < trs.length; i++) {
            var trObj = $(trs[i]);
            this.bindEventToTR(trObj, trs);
            if (i == 0) {
                trObj.trigger("click"); //默认选中表格第一行 
            }

            var tds = trObj.children();
            for (var a = 0; a < hideArr.length; a++) {
                $(tds[hideArr[a]]).hide();
            }
        }
    }

    this.bindEventToTR = function (trObj, trs) {
        trObj.bind("click", trObj, function (e) {
            trs.removeClass("sel");
            e.data.removeClass("over");
            e.data.addClass("sel");
            valObj.selKeyID = e.data.find("input[type='checkbox']").val();
            valObj.selTRObj = e.data;
            _trClick_Exd(e.data);
        });
        trObj.bind("mouseover", trObj, function (e) {
            trs.removeClass("over");
            var selClass = e.data.attr("class");
            if (selClass == undefined || selClass.indexOf("sel") == -1) {
                e.data.addClass("over");
            }
        });
        trObj.bind("mouseout", trObj, function (e) {
            e.data.removeClass("over");
        });
    }

    this.newRecord = function (url, morePName, type) {
        if (type == undefined) { type = 1; }
        if (url.indexOf("?") == -1) {
            url += "?";
        } else {
            url += "&";
        }
        if (morePName != "" && morePName != undefined) {
            if (morePName.indexOf("=") == -1) {
                if (valObj.selKeyID == "") {
                    alert("请选择一条记录！");
                    return false;
                }
                url += morePName + "=" + valObj.selKeyID + "&";
            } else {
                url += morePName + "&";
            }
        }
        //alert(url);
        var re = "";
        if (type == 1 || type == undefined) {
            url += "modlg=1";
            re = window.showModalDialog(url, "modlg_window", "dialogHeight=650px; dialogWidth=750px;dialogLeft:;dialogTop:; status=no;"); if (!re) { re = window.returnValue; } //jin-shenjian chrome刷新父画面
        }
        if (type == 2) {
            url += "openwin=1";
            re = window.open(url, "new_window", "height:650,width:750,top:,left:,alwaysRaised:yes,depended:yes,location:no,menubar:no,resizable:yes,toolbar:no,hotkeys:no,z-look:yes");
        }
        if (type == 3) {
            url += "preurl=" + escape(location.href);
            location.href = url;
        }

        if (type == 1 && re != undefined) {
            if (re.indexOf("{valObj:") != -1) {
                this.addToList(re);
            } else {
                if (re.indexOf(".aspx") != -1) {
                    window.location.href = re;
                } else {
                    window.location.reload();
                }
            }
        }
    }

    this.addToList = function (dataStr) {
        var objs = null;
        if (dataStr.indexOf('[') == -1) {
            objs = new Array();
            objs.push(eval(dataStr));
        } else {
            objs = eval(dataStr);
        }
        for (var i = 0; i < objs.length; i++) {
            var dataObj = objs[i];

            var lsitObj = $("#" + this.paraObj.listCID);
            var trObj = lsitObj.find("thead").find("tr:first").clone();
            var keyname = trObj.attr("keyname");
            var keyval = dataObj[keyname];
            var tds = trObj.children();
            for (var a = 0; a < tds.length; a++) {
                var colname = $(tds[a]).attr("colname");
                if (colname != undefined) {
                    $(tds[a]).html(dataObj[colname]);
                } else {
                    var datastr = $(tds[a]).attr("data");
                    if (datastr != undefined) {
                        var data = eval("(" + datastr + ")");
                        $(tds[a]).html(dataObj[data.colname]);
                    }
                }

                var cks = $(tds[a]).find("input[type='checkbox']");
                if (cks.length > 0) {
                    cks.replaceWith("<input type='checkbox' value='" + keyval + "' />");
                }
            }
            var bodyObj = lsitObj.find("tbody");
            bodyObj.prepend(trObj);
            this.bindEventToTR(trObj, bodyObj.children());
        }
    }

    this.editRecord = function (url, type) {
        if (type == undefined) { type = 1; }
        if (url.indexOf("?") == -1) {
            url += "?";
        } else {
            url += "&";
        }
        url += "KeyID=" + valObj.selKeyID;
        var re = "";
        if (type == 1 || type == undefined) {
            url += "&modlg=1";
            re = window.showModalDialog(url, "modlg_window", "dialogHeight=650px; dialogWidth=750px;dialogLeft:;dialogTop:; status=no;"); if (!re) { re = window.returnValue; } //jin-shenjian chrome刷新父画面
        }
        if (type == 2) {
            url += "&openwin=1";
            re = window.open(url, "edit_window", "height:650,width:750,top:,left:,alwaysRaised:yes,depended:yes,location:no,menubar:no,resizable:yes,toolbar:no,hotkeys:no,z-look:yes");
        }
        if (type == 3) {
            url += "&preurl=" + escape(location.href);
            location.href = url;
        }

        if (type == 1 && re != undefined) {
            var dataObj = eval(re);
            var trObj = $("#" + this.paraObj.listCID).find("thead").find("tr:first").clone();
            var tds = trObj.children();
            var curTDS = $("#" + this.paraObj.listCID).find("tbody").find("tr[class*='sel']").children();
            for (var a = 0; a < tds.length; a++) {
                var colname = $(tds[a]).attr("colname");
                var val = "";
                if (colname != undefined) {
                    val = dataObj[colname];
                }
                else {
                    var datastr = $(tds[a]).attr("data");
                    if (datastr != undefined) {
                        var data = eval("(" + datastr + ")");
                        val = dataObj[data.colname];
                    }
                }
                if (val != "") {
                    var oldTxt = $(curTDS[a]).text();
                    if (oldTxt != val && oldTxt != "&nbsp;" && val != undefined) {
                        $(curTDS[a]).addClass("edited");
                    }
                    $(curTDS[a]).html(val);
                }
            }
        }
    }

    this.getSelectedIDS = function () {
        var cks = $("#" + this.paraObj.listCID).find("tbody:first").find("input[type='checkbox']");
        var arr = new Array();
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked == true) {
                arr.push(cks[i].value);
            }
        }
        return arr.toString();
    }

    this.delBySelIDS = function (backUrl, reUrl, msg) {

        var bodyObj = $("#" + this.paraObj.listCID).find("tbody:first");
        var cks = bodyObj.find("input[type='checkbox']");

        _delByKeyIDS_Begin(bodyObj);

        var arr = new Array();
        var arrTR = new Array();
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked == true) {
                arr.push(cks[i].value);
                arrTR.push($(cks[i]).parent().parent());
            }
        }
        if (arr.length == 0) {
            alert("请至少勾选一条记录！"); return false;
        }
        if (!confirm("您确定要删除所选的记录吗？")) {
            return false;
        }
        var curObj;
        //        if (event.target) {
        //            curObj = event.target;//火狐不支持 执行到这里 出错
        //        }
        //alert(curObj);
        if (backUrl.indexOf("?") == -1) {
            backUrl += "?";
        } else {
            backUrl += "&";
        }
        $.ajax({
            url: backUrl + "DelKeyIDS=" + arr.toString(),
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
                _delByKeyIDS_End(-arrTR.length);
            },
            error: function (a, b, c) {
                alert(a);
            }
        });
    }
}

ListManager.prototype.initPageSizeEvt = function (inputid) {
    var inputObj = $("input[id$='" + inputid + "']");
    inputObj.bind("blur", inputObj, function (e) {
        var str = e.data.val();
        if (/\d{1,3}/.test(str) != true) {
            alert("页大小必须是1-3位数字。"); e.data.val("");
            e.data[0].focus();
            return;
        }
        var tds = $("div.pages").find("table").find("tr:first").children();
        if (tds.length > 0) {
            var strNum = $(tds[0]).text();
            var reg1 = new RegExp("总记录.*?(\\d+)", "g");
            var oldNum = parseFloat(reg1.exec(strNum)[1]);
            if (parseFloat(str) > oldNum) {
                alert("每页记录数不能大于总记录数。"); e.data.val(oldNum);
                return;
            }
        }
    });

}

ListManager.prototype.initFindDL = function () {
    var dls = $("div.topfind").find("dl");

    //var hideFindColsObj = $("input[id$='_hideFindColsID']");
    var showFindColsObj = $("input[id$='_showFindColsID']");

    //alert(showFindColsObj.val());
    dls.each(function (i) {
        var colname = $(this).attr("colname");
        if (colname != undefined && colname != "") {
            colname = colname.replaceAll("\\]", "").replaceAll("\\[", "");
            if (showFindColsObj.length > 0) {
                if (showFindColsObj.val().indexOf("," + colname) == -1) {
                    $(this).hide();
                }
            }
            //            if (hideFindColsObj.length > 0) {
            //                if (hideFindColsObj.val().indexOf("," + colname) != -1) {
            //                    $(this).hide();
            //                }
            //            }
        }
    });
}
//删除所选对象成功后的附加操作，参数为删除的记录数
function _delByKeyIDS_End(delNum) { }

//点击某行后的附加操作，参数为当前行对象
function _trClick_Exd(trObj) { };

function _delByKeyIDS_Begin(bodyObj) {
    var hides = bodyObj.find("input[type='hidden']");
    for (var a = 0; a < hides.length; a++) {
        var isck = $(hides[a]).prev().attr("checked");
        if (isck == true || isck == "checked") {
            var v = hides[a].value;
            if (v.lastIndexOf(",") == v.length - 1) {
                alert("节点信息不能删除！");
                $(hides[a]).prev().attr("checked", false);
            }
        }
    }
}
//清空顶部查询表单内容
function _topFindClear(me) {
    var pObj = $(me).parent().parent().parent().parent();
    pObj.find("input[type='text']").val("");
    pObj.find("textarea").val("");
    var sels = pObj.find("select");
    for (var a = 0; a < sels.length; a++) {
        sels[a].selectedIndex = 0;//  sels[a].options[0].value;
    }
}

function _selAll(me) {
    var bodyObj = $(me).parent().parent().parent().next();
    bodyObj.find("input[type='checkbox']").attr("checked", me.checked);
    
}

function _autoFrameHeight(ifrID) {
    var ifm = document.getElementById(ifrID);
    var subWeb = document.frames ? document.frames[ifrID].document : ifm.contentDocument;
    if (ifm != null && subWeb != null) {
        $(ifm).height(subWeb.body.scrollHeight);
    }
}
