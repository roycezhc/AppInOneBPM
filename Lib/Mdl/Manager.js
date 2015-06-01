
function addToTab(me) {
    //alert("sss");
    //alert($(me));
    //alert(parent.addLinkToTab);
    parent.addLinkToTab($(me));
    return false;
}

var _recordWindowWidth = 750;
var _recordWindowHeight = 650;
function _doPostBackRe() { };
String.prototype.replaceAll = stringReplaceAll;

//begin 表格排序
var IsAsc = true;
function SortTable(TableID, Col, DataType) {
//    var imgSort = document.getElementById('col' + Col);
//    //判断是逆序还是顺序 
//    if (IsAsc == true) {
//        imgSort.src = 'img/arrow_small_down.png';
//    }
//    else {
//        imgSort.src = 'img/arrow_small_up.png';
//    }
    IsAsc = !IsAsc;
    var DTable = document.getElementById(TableID);
    var DBody = DTable.tBodies[0];
    var DataRows = DBody.rows;
    var MyArr = new Array;
    for (var i = 0; i < DataRows.length; i++) {
        MyArr[i] = DataRows[i];
    }
    
    //判断上次排序的列和这次是否为同一列 
    if (DBody.CurrentCol == Col) {
        
        MyArr.reverse(); //将数组倒置 
    }
    else {
        //alert(Col);
        MyArr.sort(CustomCompare(Col, DataType));
    } 
    //创建一个文档碎片，将所有的行都添加进去，相当于一个暂存架，目的是（如果直接加到document.body里面，会插入一行，就刷新一次，如果数据多了就会影响用户体验） 
    //先将行全部放在暂存架里面，然后将暂存架里面的行 一起添加到document.body，这样表格只会刷新一次。 
    //就像你去商店购物，要先将要买的物品（行）全部写在单子上（文档碎片），然后超市全部购买，而不会想到一样东西就去一次，那么 
    var frag = document.createDocumentFragment();
    for (var i = 0; i < MyArr.length; i++) {
        frag.appendChild(MyArr[i]); //将数组里的行全部添加到文档碎片中 
    }
    DBody.appendChild(frag); //将文档碎片中的行全部添加到 body中 
    DBody.CurrentCol = Col; //记录下当前排序的列 
}
function CustomCompare(Col, DataType) {
    return function CompareTRs(TR1, TR2) {
        var value1, value2;
        //判断是不是有customvalue这个属性 
        if (TR1.cells[Col].getAttribute("customvalue")) {
            value1 = convert(TR1.cells[Col].getAttribute("customvalue"), DataType);
            value2 = convert(TR2.cells[Col].getAttribute("customvalue"), DataType);
        }
        else {
            //alert(TR1.cells[Col].firstChild);
            if (TR1.cells[Col].firstChild && TR2.cells[Col].firstChild) {
                //alert(TR1.cells[Col].firstChild.nodeValue + "|" + TR2.cells[Col].firstChild.nodeValue);
                value1 = convert(TR1.cells[Col].firstChild.nodeValue, DataType);
                //alert(value1);
                value2 = convert(TR2.cells[Col].firstChild.nodeValue, DataType);
            } else {
                value1 = convert("0", DataType);
                value2 = convert("0", DataType);
            }
        }
        if (value1 < value2)
            return -1;
        else if (value1 > value2)
            return 1;
        else
            return 0;
    };
}
function convert(DataValue, DataType) {
    //alert(DataValue);
    if (DataValue == undefined || DataValue == null || DataValue == "") {
        return "";
    }
    switch (DataType) {
        case "int":
            return parseInt(DataValue);
        case "float":
            return parseFloat(DataValue);
        case "date":
            return new Date(Date.parse(DataValue));
        default:
            return DataValue.toString();
    }
}
//end 表格排序

function stringReplaceAll(AFindText, ARepText) {
    raRegExp = new RegExp(AFindText, "g");
    return this.replace(raRegExp, ARepText)
}

function ListManager(paraObjIn) {
    if (paraObjIn == undefined && paraObjIn == null) {
        paraObjIn = {};
    }
    this.paraObj = {
        listCID: paraObjIn.listCID || "tbList",
        valIndex: paraObjIn.valIndex == undefined ? 1 : paraObjIn.valIndex,
        sort: paraObjIn.sort||false

    };
    //alert(this.paraObj.valIndex);
    var valObj = {
        selKeyID: "",selTRObj:null
    };
    this.getSelectedID = function () {
        return valObj.selKeyID;
    }

    //设置表头的默认宽度
    var setTHWidth = function (tdObj) {
        //if (tdObj.children().length <= 0) {
        var ttt = tdObj.text();
        var w = ttt.length * 18;
        if (w < 30) {
            w = 30;
        }
        tdObj.html("<div style='width:" + w + "px;'>" + tdObj.html() + "</div>");
        //alert(tdObj.html());
        //}

    }
    //获取列配置对象,前后台配置结合
    var getColDataObj = function (thObj, backSetDataObj) {

        var obj = { name: '', show: 1, sort: 1, lname: '', ctype: 'string', find: 1 };
        //find=1 基本查询条件，2可选查询条件，3不作为查询条件
        var datastr = thObj.attr("data");
        if (datastr != "" && datastr != undefined) {
            var dataObj = eval("(" + datastr + ")");
            //alert(dataObj["colname"]);
            var colname = dataObj.name == undefined ? dataObj.colname : dataObj.name;
            colname = colname.replaceAll("\\]", "").replaceAll("\\[", "");
            obj.lname = colname;
            obj.name = colname;
            if (colname.indexOf(".") != -1) {
                obj.name = colname.split(".")[1];
            }
            //zlg
            if (backSetDataObj != undefined) {
                var backSetObj = backSetDataObj[obj.name];
                if (backSetObj == undefined) {
                    backSetObj = {};
                }
                if (backSetObj.show != undefined) {
                    obj.show = backSetObj.show;
                } else if (dataObj.show != undefined) {
                    obj.show = dataObj.show;
                }

                if (backSetObj.sort != undefined) {
                    obj.sort = backSetObj.sort;
                }
                else if (dataObj.sort != undefined) {
                    obj.sort = dataObj.sort;
                }
                if (backSetObj.ctype != undefined) {
                    obj.ctype = backSetObj.ctype;
                } else if (dataObj.ctype != undefined) {
                    obj.ctype = dataObj.ctype;
                }
                if (backSetObj.find != undefined) {
                    obj.find = backSetObj.find;
                } else if (dataObj.find != undefined) {
                    obj.find = dataObj.find;
                }
            }

        } else {
            var colname = thObj.attr("colname");
            if (colname != "" && colname != colname) {
                colname = colname.replaceAll("\\]", "").replaceAll("\\[", "");
                obj.lname = colname;
                obj.name = colname;
                if (colname.indexOf(".") != -1) {
                    obj.name = colname.split(".")[1];
                }
                var backSetObj = backSetDataObj[colname];
                if (backSetObj != undefined) {
                    for (var el in backSetObj) {
                        obj[el.toString()] = backSetObj[el.toString()];
                    }
                }
            }

        }

        return obj;
    }

    var getColNameFromDL = function (dlObj) {
        var colname = dlObj.attr("colname");
        if (colname != undefined && colname != "") {
            colname = colname.replaceAll("\\]", "").replaceAll("\\[", "");
            if (colname.indexOf(".") != -1) {
                colname = colname.split(".")[1];
            }
            return colname;
        } else {
            return "";
        }

    }
    var hide_DL1 = 0;
    this.hide_DL = function () {
        hide_DL1 = 1;
    }
    this.initBodyRows = function () {
        var i = 0;
        var listObj = $("#" + this.paraObj.listCID);

        //        try {
        //            if (listObj.height() < 100) {
        //                //listObj.height(100);
        //            }
        //           
        //        } catch (e) { }

        //listObj.parent().width(listObj.parent().prev().width()); //列表宽度 自动绝对设置为上个兄弟节点的宽度，避免因为设置为100%，出现宽度BUG

        var htds = listObj.find("thead").find("tr").find("td"); //.children();//zlg这样便于嵌入其他标签
        var hideArr = new Array();
        var showArr = new Array();

        //获取后台配置的列表里显示的列配置字符串
        var _backPageColsSetID = $("input[id$='_backPageColsSetID']");
        if (_backPageColsSetID != undefined) {

            var showTBColsObj = eval("(" + $("input[id$='_backPageColsSetID']").val() + ")"); //{colName:{ name: '', show: 1, sort: 1, lname: '', ctype: 'string', find: 1 }}

            if (hide_DL1 == 0) {
                //begin 查询条件隐藏处理
                var topfindls = $("div.topfind").find("dl");
                topfindls.each(function (i) {
                    var colname = getColNameFromDL($(this));
                    if (colname != "") { 
                        //zlg
                        if (showTBColsObj != undefined) {
                            var colSetObj = showTBColsObj[colname];
                            if (colSetObj != undefined) {
                                if (colSetObj.find == 1) {
                                    $(this).removeClass("more");
                                    $(this).removeClass("hide");
                                } else if (colSetObj.find == 2) {
                                    $(this).addClass("more");
                                } else if (colSetObj.find == 3) {
                                    $(this).addClass("hide");
                                }
                            }
                            else {
                                $(this).addClass("hide");
                            }
                        }
                    }
                });
                ///end 查询条件隐藏处理
            }

            for (i = 0; i < htds.length; i++) {
                var tdObj = $(htds[i]);
                var colSetObj = getColDataObj(tdObj, showTBColsObj);
                if (colSetObj.name != "") {

                    if (colSetObj.show == 0) {
                        hideArr.push(i); $(htds[i]).hide();
                    } else {
                        showArr.push(i); $(htds[i]).show();
                        setTHWidth(tdObj); //设置列的默认宽度
                    }
                    //---begin列排序相关
                    if (this.paraObj.sort == true) {
                        tdObj.attr("class", "asc");
                        //单击列执行排序功能
                        tdObj.bind("click", { tbID: listObj.attr("id"), colIndex: i, thOBJ: tdObj, colType: colSetObj.ctype }, function (e) {
                            try {
                                if (e.target.tagName == "INPUT") {
                                    return;
                                }
                                var thClsName = e.data.thOBJ.attr("class"); //alert(colType);
                                SortTable(e.data.tbID, e.data.colIndex, e.data.colType)

                                if (thClsName.indexOf("asc") != -1) {
                                    e.data.thOBJ.attr("class", "desc");
                                } else {
                                    e.data.thOBJ.attr("class", "asc");
                                }
                            } catch (e) {
                                alert(e);
                            }
                        });
                    }
                    //---end列排序相关

                } else {
                    setTHWidth(tdObj); //设置列的默认宽度
                }
            }
        }

        var bodyObj = $("#" + this.paraObj.listCID).find("tbody:last");

        $(document).bind("keydown", bodyObj, function (e) {
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
        var trs = bodyObj.find("tr[class!='hide']");
        //alert(hideArr.length);
        for (i = 0; i < trs.length; i++) {
            var trObj = $(trs[i]);
            this.bindEventToTR(trObj, trs);
            if (i == 0) {
                trObj.trigger("click"); //默认选中表格第一行 
            }

            var tds = trObj.find("td"); //.children();//zlg
            for (var a = 0; a < hideArr.length; a++) {
                $(tds[hideArr[a]]).hide();
            }
            for (var a = 0; a < showArr.length; a++) {
                $(tds[showArr[a]]).show();
            }
        }
    }

    this.bindEventToTR = function (trObj, trs) {
        var tdIndex = this.paraObj.valIndex;
        trObj.bind("click", trObj, function (e) {
            trs.removeClass("sel");
            e.data.removeClass("over");
            e.data.addClass("sel");
            valObj.selKeyID = e.data.find("input[type='checkbox']").val();
            if (valObj.selKeyID == undefined) {
                valObj.selKeyID = e.data.find("input[type='hidden']").val();
            }
            if (valObj.selKeyID == undefined) {
                var tdobj = $(e.data.children()[tdIndex]);
                valObj.selKeyID = tdobj.text();
            }
            valObj.selTRObj = e.data;
            _trClick_Exd(e.data);
            _trClick_End(e.data);
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

    this.newRecord = function (url, morePName, type, width, height) {
        if (type == undefined) { type = 1; }
        if (width == undefined) { width = _recordWindowWidth; }
        if (height == undefined) { height = _recordWindowHeight; }
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
        var re = "";

        if (type == 1 || type == undefined) {
            url += "modlg=1&r=" + Math.random(); //alert(url);
            re = window.showModalDialog(url, "modlg_window", "dialogHeight=" + height + "px; dialogWidth=" + width + "px;dialogLeft:;dialogTop:; status=no;");
            console.log(re+":aaaaa");
            if (!re) { re = window.returnValue; }
            //showDialog({ url: url, width: _recordWindowWidth, height: _recordWindowHeight-300, returnFunc: getReturn })
        }
        else if (type == 2) {
            url += "openwin=1&r=" + Math.random();
            re = window.open(url, "new_window", "height:" + height + ",width:" + width + ",top:,left:,alwaysRaised:yes,depended:yes,location:no,menubar:no,resizable:yes,toolbar:no,hotkeys:no,z-look:yes");
        }
        else if (type == 3) {
            url += "preurl=" + escape(location.href) + "&r=" + Math.random();
            location.href = url;
        }

        if (type == 1 && re != undefined) {
            if (re.indexOf("{valObj:") != -1) {
                this.addToList(re);
            } else {
                if (re.indexOf(".aspx") != -1) {
                    window.location.href = re;
                } else {
                    if (re == "re") {
                        window.location.reload();
                    } else {
                        _doPostBackRe();
                    }
                }
            }
        } else {
            _doPostBackRe();
            //window.location.reload();
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
            var bodyObj = lsitObj.find("tbody[TPL='yes']");
            if (bodyObj.length > 0) {
                var trHtml = bodyObj.html();
                for (var d in dataObj) {
                    trHtml = trHtml.replaceAll("{" + d.toString() + "}", dataObj[d.toString()]);
                }
                var trObj = $(trHtml);
                var bodyObj = lsitObj.find("tbody:last");
                bodyObj.append(trObj);
                this.bindEventToTR(trObj, bodyObj.children());
            }
        }
    }


//        this.addToList = function (dataStr) {
//            var objs = null;
//            if (dataStr.indexOf('[') == -1) {
//                objs = new Array();
//                objs.push(eval(dataStr));
//            } else {
//                objs = eval(dataStr);
//            }
//            for (var i = 0; i < objs.length; i++) {
//                var dataObj = objs[i];

//                var lsitObj = $("#" + manager.paraObj.listCID);
//                var trObj = lsitObj.find("thead").find("tr:first").clone();
//                var keyname = trObj.attr("keyname");
//                var keyval = dataObj[keyname];
//                var tds = trObj.children();
//                for (var a = 0; a < tds.length; a++) {
//                    var colname = $(tds[a]).attr("colname");
//                    if (colname != undefined) {
//                        $(tds[a]).html(dataObj[colname]);
//                    } else {
//                        var datastr = $(tds[a]).attr("data");
//                        if (datastr != undefined) {
//                            var data = eval("(" + datastr + ")");
//                            $(tds[a]).html(dataObj[data.colname]);
//                        }
//                    }

//                    var cks = $(tds[a]).find("input[type='checkbox']");
//                    if (cks.length > 0) {
//                        cks.replaceWith("<input type='checkbox' value='" + keyval + "' />");
//                    }
//                }
//                var bodyObj = lsitObj.find("tbody");
//                bodyObj.prepend(trObj);
//                this.bindEventToTR(trObj, bodyObj.children());
//            }
//        }

    this.editRecord = function (url, morePName, type, width, height) {
        if (type == undefined) { type = 1; }
        if (width == undefined) { width = _recordWindowWidth; }
        if (height == undefined) { height = _recordWindowHeight; }
        if (url.indexOf("?") == -1) {
            url += "?";
        } else {
            url += "&";
        }
        url += "KeyID=" + valObj.selKeyID; //alert(valObj.selKeyID);
        if (morePName != undefined && morePName != "") {
            url += "&" + morePName;
        }

        var re = "";
      
        if (type == 1 || type == undefined) {
            url += "&modlg=1&r=" + Math.random();
            re = window.showModalDialog(url, "modlg_window", "dialogHeight=" + height + "px; dialogWidth=" + width + "px;dialogLeft:;dialogTop:; status=no;");
           
            if (!re) {
                // re = window.returnValue;
            } //jin-shenjian chrome刷新父画面
        }
        else if (type == 2) {
            url += "&openwin=1&r=" + Math.random();
            re = window.open(url, "edit_window", "height:" + height + ",width:" + width + ",top:,left:,alwaysRaised:yes,depended:yes,location:no,menubar:no,resizable:yes,toolbar:no,hotkeys:no,z-look:yes");
        }
        else if (type == 3) {
            url += "&preurl=" + escape(location.href) + "&r=" + Math.random();
            location.href = url;
        }
        //alert(url);
        if (type == 1 && re != undefined && re.indexOf("{valObj:") != -1) {
            alert('aaa');
            var dataObj = eval(re);
            var trObj = $("#" + this.paraObj.listCID).find("thead").find("tr:first").clone();
            var tds = trObj.find("td");//.children();//zlg
            var curTDS = $("#" + this.paraObj.listCID).find("tbody:last").find("tr[class*='sel']").find("td"); //.children();//zlg
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
        if (type == 1 && re != undefined) {
            if (re.indexOf("{valObj:") == -1) {
                if (re.indexOf(".aspx") != -1) {
                    window.location.href = re;
                } else {
                    if (re == "re") {
                        window.location.reload();
                    } else {
                        _doPostBackRe();
                    }
                }
            }
        }
        
    }

    this.getSelectedIDS = function () {
        var cks = $("#" + this.paraObj.listCID).find("tbody:last").find(".first").find("input[type='checkbox']");
        var arr = new Array();
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked == true) {
                arr.push(cks[i].value);
            }
        }
        return arr.toString();
    }
    this.delKeyID = function (backUrl, reUrl) {

        $.ajax({
            url: backUrl,
            cache: false,
            success: function (svrData) {
                //console.log(svrData);
                if (svrData == "1") {
                    alert("删除成功！");
                }
                location.reload();
            },
            error: function (a, b, c) {
                alert(a + "--err");
            }
        });
    }
    this.delByKeyID = function (backUrl, reUrl) {
        if (valObj.selKeyID == "" || valObj.selKeyID == undefined) {
            alert("请选择一条记录！");
            return false;
        }
        if (!confirm("您确定要删除所选的记录吗？")) {
            return false;
        }
        if (backUrl.indexOf("?") == -1) {
            backUrl += "?";
        } else {
            backUrl += "&";
        }
       //alert(backUrl + "DelByKeyID=" + valObj.selKeyID);
        $.ajax({
            url: backUrl + "DelByKeyID=" + valObj.selKeyID,
            cache: false,
            success: function (svrData) {
                if (svrData == "") {
                    alert("删除失败！"); //正常情况下返回 JSON字符串:{re:1,msg:''}
                } else {
                    var reObj = eval("(" + svrData + ")"); // alert(svrData);
                    var msg = reObj.msg;
                    if (reObj.re > 0) {
                        if (msg == "" || msg == undefined) { msg = "删除成功！"; }
                        valObj.selTRObj.remove(); valObj.selKeyID = "";
                    } else {
                        if (msg == "" || msg == undefined) { msg = "删除失败！"; }
                        alert(msg);
                    }

                }
                if (reUrl != undefined && reUrl != "") {
                    location.href = reUrl;
                }
            },
            error: function (a, b, c) {
                alert(a + "--err");
            }
        });
        
    }

    this.delBySelIDS = function (backUrl, reUrl, msg) {
        //wcp 当一行表格中有多个checkbox时，只去td class=first中的checkbox
        var bodyObj = $("#" + this.paraObj.listCID).find("tbody:last").find(".first");
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
       // if (backUrl.indexOf("?") == -1) {
        if (arr.length == 0) {
            alert("请至少勾选一条记录！"); return false;
        }
        if (!confirm("您确定要删除所选的记录吗？")) {
            return false;
        }
       // }
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
        //DEL START 多余弹框 jin-shenjian 2013/10/12
        //alert(backUrl + "DelKeyIDS=" + arr.toString());
        //DEL END 多余弹框 jin-shenjian 2013/10/12
        $.ajax({
            url: backUrl + "DelKeyIDS=" + arr.toString(),
            cache: false,
            success: function (svrData) {
                //alert(svrData);
                if (svrData == "") {
                    alert("删除失败！");
                } else {
                    var reg = /^\d*$/;
                    var delOK = false;
                    if (reg.test(svrData) == true) {
                        if (parseInt(svrData) > 0) {
                            var s = "";
                            if (msg != undefined) {
                                s = msg + "成功"; delOK = true;
                            } else {
                                if (curObj) {
                                    s = curObj.innerHTML + "成功!"; alert(s);
                                } else {
                                    s = "操作成功!";
                                }
                                delOK = true;
                            }

                        } else {
                            s = "操作失败!"; alert(s);
                        }

                    } else {
                        alert(svrData);
                        if (svrData.indexOf("成功") != -1) { delOK = true; }
                    }
                    if (delOK == true) {
                        if (reUrl != undefined) {
                            window.location.href = reUrl;
                        } else {
                            for (var c = 0; c < arrTR.length; c++) {
                                $(arrTR[c]).remove();
                            }
                        }
                    }
                }

                _delByKeyIDS_End(-arrTR.length);
            },
            error: function (a, b, c) {
                alert(a + "-error-" + b + "-" + c);
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
        var tds = $("div.pages").find("table").find("tr:first").find("td"); //.children();//zlg
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
}

ListManager.prototype.initFindBtn = function (cookieID) {
    var chaxunBtn = "#display_search";
    if ($(chaxunBtn)) {
        $(chaxunBtn).click(function () {
            $(".topfind").toggleClass("hide");
            if ($(chaxunBtn).val() == "显示查询") $(chaxunBtn).val("隐藏查询"); else $(chaxunBtn).val("显示查询");
            $.cookie(cookieID, $(chaxunBtn).val());
        });
        if ($.cookie(cookieID) == "隐藏查询") {
            $(chaxunBtn).click();
        }
    }
}

//删除所选对象成功后的附加操作，参数为删除的记录数
function _delByKeyIDS_End(delNum) { }

//点击某行后的附加操作，参数为当前行对象
function _trClick_Exd(trObj) { }
function _trClick_End(trObj) { }

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
    pObj.find("input[type='hidden']").val("");
    pObj.find("textarea").val("");
    var sels = pObj.find("select");
    for (var a = 0; a < sels.length; a++) {
        sels[a].selectedIndex = 0;//  sels[a].options[0].value;
    }
}

function _selAll(me) {
    
    var tdObj = null;
    
    if ($(me).parent()[0].tagName == "DIV") {//??
        tdObj = $(me).parent().parent();
    } else {
        tdObj = $(me).parent();
    }
    var tbodyObj = tdObj.parent().parent().next();
    if (tbodyObj.attr("TPL") == 'yes') //中间多了一个 <tbody TPL="yes" class="hide"> 多增加一个 .next();//zlg
        tbodyObj = tbodyObj.next();
    
    var trs = tbodyObj.children();
    var colIndex = tdObj.parent().find("td").index(tdObj); ; //.children().index(tdObj);
    var ck = me.checked;
    trs.each(function (i) {
        $($(this).children()[colIndex]).find("input[type='checkbox']").attr("checked", ck);
    });
    
}

function _autoFrameHeight(ifrID) {
    var ifm = document.getElementById(ifrID);
    var subWeb = document.frames ? document.frames[ifrID].document : ifm.contentDocument;
    if (ifm != null && subWeb != null) {
        $(ifm).height(subWeb.body.scrollHeight);
    }
}


function _topMoreColsToFind(me) {
    var divObj = $(me).parent().parent().parent().parent();
    var dls = divObj.find("dl.more");
    var ccc=$(me).attr("class");
    if (ccc.indexOf("tohide") != -1) {
        dls.hide(); $(me).attr("class", "toshow"); $(me).val("展开更多条件");
    } else {
        dls.show(); $(me).attr("class", "tohide"); $(me).val("收起更多条件");
    }
}

////显示弹出窗口
//function showDialog(url, width, height, returnFunc) {
//    options = ""
//    var obj = this;
//    if (options.curWin) obj = parent;
//    if (options.curWin == 2) obj = parent.parent;
//    obj.window.pwShow(options);
//}

//function getReturn(ret) {
//    if (ret.indexOf("{valObj:") != -1) {
//        this.addToList(ret);
//    } else {
//        if (ret.indexOf(".aspx") != -1) {
//            window.location.href = ret;
//        } else {
//            if (ret == "re") {
//                window.location.reload();
//            } else {
//                _doPostBackRe();
//            }
//        }
//    }
//}

    function showModalDialog(url, windowName, parame) {

        if (navigator.userAgent.indexOf("Chrome") > 0) {
            var lst = parame.split(';');
            var height;
            var width;
            for (var i = 0; i < lst.length - 1; i++) {
                if (lst[i].indexOf("dialogHeight") >= 0) {
                    height = lst[i].replace("dialogHeight", "").replace("px", "").replace(":", "").replace("=", "").trim();
                }
                if (lst[i].indexOf("dialogWidth") >= 0) {
                    width = lst[i].replace("dialogWidth", "").replace("px", "").replace(":", "").replace("=", "").trim();
                }
            }
            var winOption = "height=" + height + ",width=" + width + ",top=50,left=50,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,fullscreen=0";
            window.open(url, "_blank", winOption);
            return window.returnValue;
        }
        else {
            return aa(url, windowName, parame);
        }
    }
    //超过num后，加上tooptip
    function showTooltip(obj,num) {
        var text = obj.text();
        if (text.length>num) {
        var str = text.substr(text, num) + "..";
             obj.text(str);
             obj.attr("title", text);
        }
    }