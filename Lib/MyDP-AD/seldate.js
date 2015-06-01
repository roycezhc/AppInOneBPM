/*firefox*/
function __firefox() {
    HTMLElement.prototype.__defineGetter__("runtimeStyle", __element_style);
    window.constructor.prototype.__defineGetter__("event", __window_event);
    Event.prototype.__defineGetter__("srcElement", __event_srcElement);
}
function __element_style() {
    return this.style;
}
function __window_event() {
    return __window_event_constructor();
}
function __event_srcElement() {
    return this.target;
}
function __window_event_constructor() {
    if (document.all) {
        return window.event;
    }
    var _caller = __window_event_constructor.caller;
    while (_caller != null) {
        var _argument = _caller.arguments[0];
        if (_argument) {
            var _temp = _argument.constructor;
            if (_temp.toString().indexOf("Event") != -1) {
                return _argument;
            }
        }
        _caller = _caller.caller;
    }
    return null;
}
if (window.addEventListener) {
    __firefox();
}
/*end firefox*/

var domPos = function () {
    var _X = 0; var _Y = 0;
    this.getX = function () { return _X; };
    this.setX = function (x) { _X = x; };
    this.getY = function () { return _Y; };
    this.setY = function (y) { _Y = y; };
    var _W = 0; var _H = 0;
    this.getW = function () { return _W; };
    this.setW = function (w) { _W = w; };
    this.getH = function () { return _H; };
    this.setH = function (h) { _H = h; };
}

function getDomPos(domObj) {
    var pos = new domPos();
    if (event.offsetX) {
        pos.setX(event.clientX - event.offsetX);
        pos.setY(event.clientY - event.offsetY + document.documentElement.scrollTop);
    } else {
        pos.setX(event.clientX - event.layerX);
        pos.setY(event.clientY - event.layerY + document.documentElement.scrollTop);
    }
    pos.setH(domObj.offsetHeight);
    pos.setW(domObj.offsetWidth);
    return pos;
}
var setDateParas = {
    TxtObj: null,
    TxtValue: '',
    addEvent: function (obj, eventName, fn) {
        if (obj.addEventListener) { // Mozilla, Netscape, Firefox
            if (eventName.substr(0, 2) == "on") {
                eventName = eventName.substring(2, eventName.length)
            }
            obj.addEventListener(eventName, fn, false);
        } else { // IE
            obj.attachEvent(eventName, fn);
        }
    },
    hideRiLi: function () {
        var riliObj = document.getElementById("divSetDate");
        if (event == null || event == undefined) {
            riliObj.style.display = "none"; 
            return;
        }
        // alert(event.target.getAttribute("onclick"));
        if (event.target) {
            with (event.target) {
                var aaa = getAttribute("onclick");
                if (tagName != "INPUT" && tagName != "OPTION") {
                    riliObj.style.display = "none";
                }
            }
        } else {
            with (window.event.srcElement) {
                var aaa = getAttribute("onclick");
                if (tagName != "INPUT" && tagName != "OPTION") {
                    riliObj.style.display = "none";
                }
            }
        }
    }
};
function setday(me) {

    setDateParas.TxtObj = me;
    if (me.value != "") {

        setDateParas.TxtValue = me.value;
    }
    var ifrObj = document.getElementById("ifrSetDate");
    ifrObj.contentWindow.setTxtDate();
    //ifrObj.src = "setdate.htm?r=" + Math.random();
    var pos = getDomPos(me);
    var riliObj = document.getElementById("divSetDate");
    riliObj.style.display = "block";

    var h = getDomPos(riliObj).getH();
    var y = pos.getY() + pos.getH();

    var _blockHeight = (document.documentElement.clientHeight == 0 ? document.body.clientHeight : document.documentElement.clientHeight);
    var _scrollTop = document.documentElement.scrollTop + document.body.scrollTop;

    if (_blockHeight - (y - _scrollTop) < h) {
        y -= h + pos.getH();
    }

    riliObj.style.top = y - 2 + "px";
    riliObj.style.left = pos.getX() - 2 + "px";


}

window.onload = function () {
    setDateParas.addEvent(document, "onclick", setDateParas.hideRiLi);
    var js = document.getElementsByTagName("script"); //alert();
    var jsPath = "";
    for (var i = 0; i < js.length; i++) {
        if (js[i].src.toLowerCase().indexOf("/mydp-ad/seldate.js") != -1) {
            jsPath = js[i].src.substring(0, js[i].src.lastIndexOf("/") + 1);
            break;
        }
    }

    //var html = "<div id='divSetDate' style='width:180px;height:200px; position:absolute;top:100px;left:100px;border:solid 1px #009;'>";
    var html = "<iframe id='ifrSetDate' frameborder='0' style='width:100%;height:100%;' src='" + jsPath + "setdate.htm'></iframe>";
    //html += "</div>";

    var divRL = document.createElement("div");
    divRL.innerHTML = html;
    divRL.id = "divSetDate";
    divRL.style.display = "none";
    divRL.style.position = "absolute";
    divRL.style.top = "100px";
    divRL.style.left = "100px";
    divRL.style.width = "180px";
    divRL.style.height = "200px";
    var body = document.getElementsByTagName("body");
    body[0].appendChild(divRL);

    setDateParas.addEvent(document, "onclick", setDateParas.hideRiLi);
} 