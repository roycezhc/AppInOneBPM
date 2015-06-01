String.prototype.replaceAll = stringReplaceAll;

function stringReplaceAll(AFindText, ARepText) {
    raRegExp = new RegExp(AFindText, "g");
    return this.replace(raRegExp, ARepText)
}

var SP = {
    wfid:0,
    procid:0,
    divStepMapObj:null,//步骤图形显示区域
    divMoveObj:null,//临时拖动的DIV对象
    firstRowTop:0,//第一行距离顶部的距离
    rowsObj: null, //用于存放节点的行对象集合
    leftWidth:0,
    hdNum:0,//活动个数
    lyNum:0,//路由个数
    stepsHtml: ["<div class='step type-0' data=\"{name:'{NAME}',type:0,id:'{ID}'}\"><h2><b>{NAME}</b></h2><p><a></a></p></div>",
                "<div class='step type-1' data=\"{name:'{NAME}',type:1,id:'{ID}'}\"><h2><b>{NAME}</b></h2><p><a onclick=\"stepSetting(this);\">属性配置</a><a onclick=\"delStepInPath(this,1);\">删除</a></p></div>",
                "<div class='step type-2' data=\"{name:'{NAME}',type:2,id:'{ID}'}\"><h2><b>{NAME}</b></h2><p><a onclick=\"stepSetting(this);\">属性配置</a><a onclick=\"delStepInPath(this,2);\">删除</a></p></div>",
                "<div class='step type-3' data=\"{name:'{NAME}',type:3,id:'{ID}'}\"><h2><b>{NAME}</b></h2><p><a></a></p></div>"],
    rowHtml: "<div class='row'></div>",
    backLineHtml: "<div class='xian1' data=\"{ID}-{NID}\"><div><div></div><span><a onclick='setLineCond({ID},{NID},2);'>条件</a><a onclick='delLine({ID},{NID},2,this);'>删除</a></span></div></div>"
};
//把JSON对象转为为对应的JSON格式字符串
SP.jsonToStr = function (objData) {
    var str = "{";
    for (var el in objData) {
        if (str.length > 1) {
            str += ",";
        }
        str += el.toString() + ":'" + objData[el.toString()] + "'";
    }
    str += "}";
    return str;
}
//把JSON对象转化为连接参数字符串
SP.jsonToPara = function (tndata) {
    var str = "";
    for (var el in tndata) {
        if (str.length > 1) {
            str += "&";
        }
        str += el.toString() + "=" + escape(tndata[el.toString()]);
    }
    return str;
}

SP.hadBegin=function() {
    return SP.divStepMapObj.find("div.type-0").length > 0;
}
SP.hadEnd=function() {
    return SP.divStepMapObj.find("div.type-3").length > 0;
}
SP.reSetRowsObj = function () {
    SP.rowsObj = SP.divStepMapObj.find("div.row");
}
//movedStep 移动活添加到指定行的节点对象
SP.initLeft=function(rowObj, movedStep) {
    var steps = rowObj.children();
    if (steps.length > 0) {
        if (movedStep != null) {
            movedStep.css({ "margin-left": '10px' });
        }
        var rowW = rowObj.width();
        var stepNum = steps.length;
        var stepDiv = $(steps[0]);
        var stepWidth = stepDiv.width();
        //alert(stepDiv.css("margin-left"));
        var left = (rowW - stepWidth * stepNum) / 2; // alert(rowW+"="+stepNum * stepWidth + "+" + left);
        stepDiv.css({ "margin-left": left + 'px' });

        //alert(stepDiv.css("margin-left"));
    }
}

SP.updateName=function(me) {

    var bObj = $(me).parent();
    var dataObj = eval("(" + bObj.parent().parent().attr("data") + ")"); //alert(dataObj.id);
    $.ajax({
        url: "STEPATH_BACK.aspx?UpdateStepName=" + Math.random(),
        cache: false,
        data: "STEP_ID=" + dataObj.id + "&STEP_NAME=" + escape(me.value),
        success: function (svrData) {
            var id = parseInt(svrData);
            if (id > 0) {
                bObj.html(me.value);
            }
        },
        error: function (a, b, c) {
            alert(a);
        }
    });


}

SP.cancelUpdate=function(me) {
    var bObj = $(me).parent();
    bObj.html(me.value);
}

SP.initStepEvent=function(stepObj) {
    var dataObj = eval("(" + stepObj.attr("data") + ")");
    stepObj.bind("mousedown", stepObj, function (e) {
        if (dataObj.type == 1 || dataObj.type == 2) {
            SP.divMoveObj.data("move", true);
            window.setTimeout(SP.toBeMoved(e.data), 500);
        }
    });

    stepObj.bind("mouseup", stepObj, function (e) {
        SP.divMoveObj.data("move", false);
    });
    var bObj = stepObj.find("b");
    bObj.bind("dblclick", bObj, function (e) {
        var val = e.data.text();
        e.data.html("<input type='text' name='stepname_" + dataObj.id + "' value='" + val + "' ondblclick='SP.updateName(this);' onblur='SP.cancelUpdate(this);'/>");
        e.data.find("input")[0].focus();
    });
}

SP.getOverRowObj = function (para) {
    var ttt = typeof (para);

    var d = 0;
    if (ttt == "number") {

        d = parseInt((para - SP.firstRowTop) / 52);
    } else {
        //window.status = para.offset().top;
        d = parseInt((para.offset().top + $("#divRight").scrollTop() - SP.firstRowTop) / 52);
    }

    if (SP.rowsObj.length <= d) {
        return null;
    }
    else {
        return $(SP.rowsObj[d]);
    }
}

//设置节点为可移动状态
SP.toBeMoved=function(obj) {
    return function () {

        if (SP.divMoveObj.data("move") == true) {
            var off = obj.offset();
            var dataStr = obj.attr("data");
            var dataObj = eval("(" + dataStr + ")");

            if (dataObj.type == 2) {
                SP.divMoveObj.html("<h2>跳转到-></h2>");
            } else {
                SP.divMoveObj.html("<h2>" + obj.find("h2").html() + "</h2>");
            }
            SP.divMoveObj.attr("data", dataStr);
            SP.divStepMapObj.data("movedStep", obj);

            SP.divMoveObj.css({ top: off.top + "px", left: off.left + "px", width: obj.width() + "px", height: obj.height() + "px" });
            SP.divMoveObj.show();
        }
    }
}

SP.updateStepPath = function (rowObj, stepid, delOld) {
    //alert(rowObj.getPrevStepIDS()+"|"+rowObj.getNextStepIDS()+"|"+stepid);
    var moreP = "";
    if (delOld == true) {
        moreP = "&delOld=1";
    } alert("sss");
    $.ajax({
        url: "STEPATH_BACK.aspx?UpdateStepPath=" + Math.random(),
        cache: false,
        data: "wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_ID=" + stepid + "&PrevIDS=" + rowObj.getPrevStepIDS() + "&NextIDS=" + rowObj.getNextStepIDS() + "&PATH_TYPE=1" + moreP,
        success: function (svrData) {
            if (parseInt(svrData) <= 0) {
                alert("调整位置失败！");
            }
        },
        error: function (a, b, c) {
            alert(a);
        }
    });
}

SP.addNewToRow = function (rowObj, newStep, delOld) {
    var dataObj = eval("(" + newStep.attr("data") + ")");
    var nextids = rowObj.getNextStepIDS();
    var previds = rowObj.getPrevStepIDS();
    var moreP = "";
    if (delOld == true) {
        moreP = "&delOld=1";
    }
    
    $.ajax({
        url: "STEPATH_BACK.aspx?addNewToRow=" + Math.random(),
        cache: false,
        data: "wfid=" + SP.wfid + "&procid=" + SP.procid + "&NextIDS=" + nextids + "&PrevIDS=" + previds + "&STEP_NAME=" + escape(dataObj.name) + "&STEP_TYPE=" + dataObj.type + moreP,
        success: function (svrData) {
            var id = parseInt(svrData);
            if (id > 0) {
                rowObj.append(newStep);
                SP.initLeft(rowObj, newStep); //添加节点后 调整位置
                dataObj.id = id;
                var newDataStr = SP.jsonToStr(dataObj);
                newStep.attr("data", newDataStr);
                SP.initStepEvent(newStep);
            }
        },
        error: function (a, b, c) {
            alert(a);
        }
    });


}

SP.getDivStepByID = function (id, steps) {
    for (var a = 0; a < steps.length; a++) {
        if ($(steps[a]).getStepDataObj().id == id) {
            return $(steps[a]);
        }
    }

    return null;
}

SP.showBackLine=function(toRow, movedRoate) {
    var stepid = movedRoate.getStepDataObj().id;
    var nextid = toRow.getRowStepIDS();

    var htmlStr = SP.backLineHtml.replaceAll("{ID}", stepid);
    htmlStr = htmlStr.replaceAll("{NID}", nextid);
    //alert(htmlStr);
    var xian1 = $(htmlStr);

    var toOff = toRow.offset();
    var oldOff = movedRoate.offset();
    var top = toOff.top - SP.firstRowTop + 20;
    var left = oldOff.left - SP.leftWidth + movedRoate.width() + 2;
    var height = oldOff.top - toOff.top;
    var width = 240 + Math.random() * 100;
    xian1.css({ top: top + "px", left: left + "px", height: height + "px", width: width + "px" });

    SP.divStepMapObj.append(xian1);
}

SP.addBackLine=function(toRow, movedRoate) {
    var stepid = movedRoate.getStepDataObj().id;
    var nextid = toRow.getRowStepIDS();
    $.ajax({
        url: "STEPATH_BACK.aspx?AddBackLine=" + Math.random(),
        cache: false,
        data: "wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_ID=" + stepid + "&NEXT_ID=" + nextid + "&PATH_TYPE=3",
        success: function (svrData) {
            var id = parseInt(svrData);
            if (id > 0) {
                SP.showBackLine(toRow, movedRoate);
            }
        },
        error: function (a, b, c) {
            alert(a);
        }
    });
}

SP.checkIntersect=function(obj1, obj2, distance) {//检测碰撞,distance为吸附的范围
    var left1 = obj1.offsetLeft;
    var top1 = obj1.offsetTop;
    var left2 = obj2.offsetLeft;
    var top2 = obj2.offsetTop;
    var width1 = obj1.offsetWidth;
    var height1 = obj1.offsetHeight;
    var width2 = obj2.offsetWidth;
    var height2 = obj2.offsetHeight;
    return (
            ((left1 - left2 >= 0 && left1 - left2 < width2 + distance) ||
            (left2 - left1 >= 0 && left2 - left1 < width1 + distance)) &&
            ((top1 - top2 >= 0 && top1 - top2 < height2 + distance) ||
            (top2 - top1 >= 0 && top2 - top1 < height1 + distance))
        );
}

//获取下一行DIV对象
jQuery.fn.getNextRow = function () {
    var nnn = this.next();
    if (nnn.length > 0 && nnn.attr("class").indexOf("row") != -1) {
        return nnn;
    }
    return null;
}
//获取上一行DIV对象
jQuery.fn.getPrevRow = function () {
    var nnn = this.prev();
    if (nnn.length > 0 && nnn.attr("class").indexOf("row") != -1) {
        return nnn;
    }
    return null;
}

//获取某行包含的节点ID字符串
jQuery.fn.getRowStepIDS = function () {
    var ids = "";
    var steps = this.find("div.step");
    steps.each(function (i) {
        var dataObj = eval("(" + $(this).attr("data") + ")");
        ids += ids == "" ? dataObj.id : "," + dataObj.id;
    });
    return ids;
}

//获取下一行包含的节点ID字符串
jQuery.fn.getNextStepIDS = function () {
    var nnn = this.getNextRow(); 
    var ids = "";
    if (nnn != null) {
        ids = nnn.getRowStepIDS();
    }
    return ids;
}
//获取上一行包含的节点ID字符串
jQuery.fn.getPrevStepIDS = function () {
    var nnn = this.getPrevRow();
    var ids = "";
    if (nnn != null) {
        ids = nnn.getRowStepIDS();
    }
    return ids;
}

//获取某行包含的节点类型
jQuery.fn.getRowType = function () {
    if (this.children().length == 0) {
        return -1;
    }
    var sss = this.find("div.type-0");
    if (sss.length > 0) {
        return 0;
    }
    sss = this.find("div.type-1");
    if (sss.length > 0) {
        return 1;
    }
    sss = this.find("div.type-2");
    if (sss.length > 0) {
        return 2;
    }
    sss = this.find("div.type-3");
    if (sss.length > 0) {
        return 3;
    }
}


//获取某行包含的节点ID字符串
jQuery.fn.getStepDataObj = function () {
    if (this.attr("class").indexOf("step") != -1) {
        var dataObj = eval("(" + this.attr("data") + ")");

        return dataObj;
    }
    return null;
}