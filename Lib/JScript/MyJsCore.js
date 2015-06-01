function getCurNoCacheHref() {
    var href = window.location.href;
    var hash = location.hash;
    if (hash != "") {
        href = href.substring(0, href.indexOf(hash));
    }
    if (href.indexOf("?") != -1) {
        var a = href.indexOf("r=");
        if (a > 0) {
            href = href.substring(0, a) + "r=" + Math.random(); //;new String().substring(
        } else {
            href += "&r=" + Math.random();
        }
    } else {
        href += "?r=" + Math.random();
    }
    return href;
}

//获取上一个兄弟节点
function getPreNode(el, tag) {
    if (el.previousSibling != null && el.previousSibling != undefined) {
        if (el.previousSibling.tagName == tag) {
            return el.previousSibling;
        }
        else {
            return getPreNode(el.previousSibling, tag);
        }
    } else {
        return null;
    }
}
//获取下一个兄弟节点
function getNextNode(el, tag) {
    if (el.nextSibling != null && el.nextSibling != undefined) {
        if (el.nextSibling.tagName == tag) {
            return el.nextSibling;
        } else {
            return getNextNode(el.nextSibling, tag);
        }
    }
}
//判断文件格式是否合法
function isLawFile(str, fileExd) {
    if (str == "") { return true; }
    str = str.substring(str.lastIndexOf("."), str.length); //sss.doc--.doc
    if (fileExd.indexOf(str) != -1) {
        return true;
    } else {
        return false;
    }
}
//在由指定符号隔开的字符串中删除某个字符串
function RemoveFromString(str, movestr, chr) {
    var newstr = "";
    if (str.indexOf(chr) > 0) {
        var arr = new Array();
        arr = str.split(chr);
        for (i = 0; i < arr.length; i++) {
            if (arr[i] != movestr) {
                newstr += newstr == "" ? arr[i] : chr + arr[i];
            }
        }
    }
    else {
        if (str != movestr) {
            newstr = str;
        }
    }
    return newstr;
}
//将字符串根据特定分割符拆分为数组
function GetArray(str, ch) {
    var arr = new Array();
    if (str != "") {
        if (str.indexOf(ch) != -1) {
            arr = str.split(ch);
        }
        else {
            arr.push(str);
        }
    }
    return arr;
}
//比较第二个时间是否大于等于第一个时间
function compareTime(begintime, endtime) {
    var arrb = begintime.split(' ');
    var arrb_1 = arrb[0].split('-');
    var arrb_2 = arrb[1].split(':');

    var arre = endtime.split(' ');
    var arre_1 = arre[0].split('-');
    var arre_2 = arre[1].split(':');

    var ddd1 = new Date(arrb_1[0], arrb_1[1], arrb_1[2], arrb_2[0], arrb_2[1], arrb_2[2], 0);
    var ddd2 = new Date(arre_1[0], arre_1[1], arre_1[2], arre_2[0], arre_2[1], arre_2[2], 0);

    if (ddd1 >= ddd2) {
        return false;
    } else {
        return true;
    }
}

//比较第二个日期大于第一个日期返回2，小于返回0，等于返回1
function compareDate(begintime, endtime) {
    if (begintime == endtime) {
        return 1;
    }
    var arrb = begintime.split('-');
    var arre = endtime.split('-');
    var ddd1 = new Date(arrb[0], arrb[1], arrb[2], 0, 0, 0, 0);
    var ddd2 = new Date(arre[0], arre[1], arre[2], 0, 0, 0, 0);
    if (ddd2 > ddd1) {
        return 2;
    } else {
        return 0;
    }
}

function closeWin() {
    //从内嵌页面发起的
    if (parent && parent.parent) {
        parent.window.opener = null;
        parent.window.open('', '_self');
        parent.window.close();
    }
    window.opener = null;
    window.open('', '_self');
    window.close();
}

///不提示关闭整个外部框架页
function closeTopWin() {
    if (window.confirm('您确认要退出系统吗？')) {
        top.opener = null;
        top.open('', '_self');
        top.close();
        window.close();
    }
}

String.prototype.replaceAll = stringReplaceAll;

function stringReplaceAll(AFindText, ARepText) {
    raRegExp = new RegExp(AFindText, "g");
    return this.replace(raRegExp, ARepText)
}

function addPageToFavorite(tit) {
    if (parent && parent.addToFavorite) {
        parent.addToFavorite();
    } else {
        var urlstr = window.location.href.toString();
        window.external.addFavorite(urlstr, tit);
    }
}

function urlparse(urlstr) {
    var parse = urlstr.match(/^(([a-z]+):\/\/)?([^\/\?#]+)\/*([^\?#]*)\??([^#]*)#?(\w*)$/i);
    var result = {
        'schema': parse[2],
        'host': parse[3],
        'path': parse[4],
        'query': parse[5],
        'anchor': parse[6]
    };
    return result;
}