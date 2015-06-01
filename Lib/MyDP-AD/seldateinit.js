var RLParas = {
    MDayCount: new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31), //定义阳历中每个月的最大天数
    TheYear: new Date().getFullYear(), //定义年的变量的初始值
    TheMonth: new Date().getMonth() + 1, //定义月的变量的初始值
    TheDay: new Date().getDate(),     //定义当前日期的初始值
    CurDayObj: null,
    //日期单击事件
    clickHandler: function (me) {
        return function () {
            if (RLParas.CurDayObj != null) {
                RLParas.CurDayObj.className = "";
                delClassName(RLParas.CurDayObj, "selday");
            }
            addClassName(me, "selday");
            RLParas.CurDayObj = me;
            var arr = me.id.split("_");
            parent.setDateParas.TxtObj.value = arr[1] + "-" + arr[2] + "-" + arr[3];
            //stopBubble(event);
            parent.setDateParas.hideRiLi();
        }
    },
    //鼠标移开日期事件
    outHandler: function (me) {
        return function () {
            delClassName(me, "over");
        }
    },
    //鼠标进入日期事件
    overHandler: function (me) {
        return function () {
            addClassName(me, "over");
        }
    }
};

function reSet() {
    RLParas.TheYear = new Date().getFullYear();
    RLParas.TheMonth = new Date().getMonth() + 1;
    RLParas.TheDay = new Date().getDate();
    showRiLiHtml();
    stopBubble(event);
}
function isRunYear(year) {//判断是否闰平年
    if (0 == year % 4 && ((year % 100 != 0) || (year % 400 == 0))) {
        return true;
    } else {
        return false;
    }
}

function getMDayCount(year, month) {  //获某月的天数,month:1-12,JS编程时索引从0开始
    var c = RLParas.MDayCount[month - 1];
    if ((month == 2) && isRunYear(year)) c++; //闰年二月为29天
    return c;
}

function getDOfW(year, month, day) {     //求某天的星期几
    var dt = new Date(year, month - 1, day).getDay(); return dt;
}

//阻止事件冒泡函数 
function stopBubble(e) {
    if (e && e.stopPropagation) {
        e.stopPropagation();
    } else {
        window.event.cancelBubble = true;
    }
}


function showRiLiHtml() {
    
    var curDayID = "";
    var mdays = getMDayCount(RLParas.TheYear, RLParas.TheMonth);
    var fdow = getDOfW(RLParas.TheYear, RLParas.TheMonth, 1); //某月第一天是星期几？
    var tempHtml = "<ul>";
    tempHtml += getPrevMonthDaysHtml(fdow); //显示上个月在当前月视图里灰色显示的几个日期
    var d = "1";
    for (var i = fdow; i < 37; i++) {
        if (d <= mdays) {
            var li_id = RLParas.TheYear + "_" + RLParas.TheMonth + "_" + d;
            if (RLParas.TheDay == d) {
                tempHtml += "<li class='selday' id='li_" + li_id + "'>" + d + "</li>";
                curDayID = "li_" + li_id;

            } else {
                tempHtml += "<li id='li_" + li_id + "'>" + d + "</li>";
            }
        } else {
            tempHtml += "<li Author='chx'>&nbsp;</li>";
        }
        if ((i + 1) % 7 == 0) {
            tempHtml += "</ul>";
            tempHtml += "<ul Author='chx'>";
        }
        d++;
    }
    tempHtml += getBottomBtns(); //显示除去日期显示位置以外的空余位置，可以放快捷操作按钮
    tempHtml += "</ul>";
    document.getElementById("divDays").innerHTML = tempHtml; //呈现日期
    initSelYear(); //初始化年份选择下拉
    initSelMonth(); //初始化月份选择

    initEvents();

    RLParas.CurDayObj = document.getElementById(curDayID);
}
function setTxtDate() {
    if (parent.setDateParas.TxtValue != "") {
        var arr = parent.setDateParas.TxtValue.split('-');
        if (parseFloat(arr[0]) > 1900) {
            RLParas.TheYear = parseFloat(arr[0]);
            RLParas.TheMonth = parseFloat(arr[1]);
            RLParas.TheDay = parseFloat(arr[2]);
            showRiLiHtml();
        }
    }
}
//初始化日期各种事件
function initEvents() {
    var lis = document.getElementById("divDays").getElementsByTagName("LI");
    for (var i = 0; i < lis.length; i++) {
        if (lis[i].id.indexOf("li_") != -1) {
            addEvent(lis[i], "onclick", RLParas.clickHandler(lis[i]));
            addEvent(lis[i], "onmouseout", RLParas.outHandler(lis[i]));
            addEvent(lis[i], "onmouseover", RLParas.overHandler(lis[i]));
        }
    }
}


//显示除去日期显示位置以外的空余位置，可以放快捷操作按钮
function getBottomBtns() {
    //空余5个LI<li>&nbsp;</li><li>&nbsp;</li><li>&nbsp;</li>
    return "<li style='width:35px;float:right;' onclick='hideRiLi();'>关闭</li>";
}

//显示上个月在当前月视图里灰色显示的几个日期
function getPrevMonthDaysHtml(fdow) {
    var temp = "";
    if (fdow > 0) {
        var preM = RLParas.TheMonth - 1;
        var preY = RLParas.TheYear;
        if (preM < 1) {
            preM = 12; preY--;
        }
        var preMDS = getMDayCount(preY, preM);
        for (var i = preMDS - fdow + 1; i <= preMDS; i++) {
            var li_id = preY + "_" + preM + "_" + i;
            temp += "<li class='preday' id='li_" + li_id + "'>" + i + "</li>";
        }
    }
    return temp;
}
//增加指定的月数
function addMonth(num, me) {
    if (num > 12) {
        alert("增加月数不能超过12.");
    }
    RLParas.TheMonth += num;
    if (RLParas.TheMonth < 1) {
        RLParas.TheMonth = 12;
        RLParas.TheYear--;
    }
    if (RLParas.TheMonth > 12) {
        RLParas.TheMonth = 1;
        RLParas.TheYear++;
    }
    initSelMonth();
    showRiLiHtml();
    stopBubble(event);
}

//增加指定的年数
function addYear(num, me) {
    if (num > 100) {
        alert("增加年数不能超过12.");
    }
    RLParas.TheYear += num;
    if (RLParas.TheYear < 1900) {
        alert("年份不能小于1900");
        RLParas.TheYear = 1900;
    }
    if (RLParas.TheYear > 3000) {
        alert("年份不能大于3000");
        RLParas.TheYear = 3000;
    }
    initSelMonth();
    showRiLiHtml();
    stopBubble(event);
}

//年份选择改变
function chgYear(me) {
    RLParas.TheYear = parseFloat(me.value);
    showRiLiHtml();
}

//月份选择改变
function chgMonth(me) {
    RLParas.TheMonth = parseFloat(me.value);
    showRiLiHtml();
}

//初始化年份选择下拉
function initSelYear() {
    var selObj = document.getElementById("selYear");
    selObj.options.length = 0;
    for (var i = RLParas.TheYear - 10; i <= RLParas.TheYear + 10; i++) {
        var li = new Option(i.toString(), i.toString());
        selObj.options.add(li);
    }
    selObj.value = RLParas.TheYear.toString();
}

function initSelMonth() {
    document.getElementById("selMonth").value = RLParas.TheMonth.toString();
}

//为指定DOM对象增加一个类样式名
function addClassName(obj, clsname) {
    if (obj.className == undefined || obj.className == "") {
        obj.className = clsname;
    } else {
        if (obj.className.indexOf(clsname) == -1) {
            obj.className += ' ' + clsname;
        }
    }
}
//为指定DOM对象删除一个类样式名
function delClassName(obj, clsname) {
    if (obj.className == undefined || obj.className == "") {
        return
    } else {
        if (obj.className.indexOf(' ') == -1) {
            obj.className = "";
        } else {
            var arr = obj.className.split(' ');
            var newclsname = "";
            for (var a = 0; a < arr.length; a++) {
                if (arr[a] != clsname) {
                    newclsname += newclsname != "" ? ' ' + arr[a] : arr[a];
                }
            }
            obj.className = newclsname;
        }
    }
}
//给对象添加事件
function addEvent(obj, eventName, fn) {
    if (obj.addEventListener) { // Mozilla, Netscape, Firefox
        if (eventName.substr(0, 2) == "on") {
            eventName = eventName.substring(2, eventName.length)
        }
        obj.addEventListener(eventName, fn, false);
    } else { // IE
        obj.attachEvent(eventName, fn);
    }
}

function InitRiLiHTML() {
    var Html = "<div id='divMyRiLi' style='display:block;'>";
    Html += "<ul class='top'>";
    Html += "<li style='width:15px;'><a onclick='addMonth(-1,this);' title='上个月'>&nbsp;&lt;&nbsp;</a></li>";
    Html += "<li style='width:55px;'><select id='selYear' style='width:100%;' onchange='chgYear(this);' Author='chx'></select></li>";
    Html += "<li style='width:20px;'>年</li>";
    Html += "<li style='width:40px;'>";
    Html += "<select id='selMonth' style='width:100%;' onchange='chgMonth(this);' Author='chx'>";
    Html += "<option value='1'>01</option>";
    Html += "<option value='2'>02</option>";
    Html += "<option value='3'>03</option>";
    Html += "<option value='4'>04</option>";
    Html += "<option value='5'>05</option>";
    Html += "<option value='6'>06</option>";
    Html += "<option value='7'>07</option>";
    Html += "<option value='8'>08</option>";
    Html += "<option value='9'>09</option>";
    Html += "<option value='10'>10</option>";
    Html += "<option value='11'>11</option>";
    Html += "<option value='12'>12</option>";
    Html += "</select></li>";
    Html += "<li style='width:20px;'>月</li>";
    Html += "<li style='width:15px;float:right;'><a onclick='addMonth(1,this);' title='下个月'>&nbsp;&gt;&nbsp;</a></li>";
    Html += "</ul>";
    Html += "<ul class='weeks' Author='chx'><li Author='chx'>日</li><li Author='chx'>一</li><li Author='chx'>二</li><li Author='chx'>三</li><li Author='chx'>四</li><li Author='chx'>五</li><li Author='chx'>六</li></ul>";
    Html += "<div id='divDays'></div>";
    Html += "<ul class='btm' Author='chx'>";
    Html += "<li><a onclick='addYear(-1,this);' title='上一年' style='margin-right:2px;'>&lt;&lt;</a><a onclick='addMonth(-1,this);' title='上个月'>&nbsp;&lt;&nbsp;</a></li>";
    Html += "<li style='width:40px;margin:0 0 0 30px;'><a class='reset' onclick='reSet();'>重置</a></li>";
    Html += "<li style='float:right;'><a onclick='addMonth(1,this);' title='下个月'style='margin-right:2px;'>&nbsp;&gt;&nbsp;</a><a onclick='addYear(1,this);' title='下一年'>&gt;&gt;</a></li>";
    Html += "</ul>";
    Html += "</div>";

    document.getElementById("bodyID").innerHTML = Html;
}

function hideRiLi() {
    parent.setDateParas.hideRiLi();

}

function InitMyDP() {
    InitRiLiHTML();
    showRiLiHtml();
}

window.onload = function () {
    InitMyDP();
}



