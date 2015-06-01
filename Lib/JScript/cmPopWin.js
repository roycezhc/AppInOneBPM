/*
弹出式编辑窗口函数
*/

var blankFile = '/site/Lib/JScript/cmPopWinLoading.html';
popWinHtml();
function popWinHtml(){
    var writeHtml ='<div id="loader_div"><div id="loader_Inner_div">正在載入...</div></div>'
	    +'<div id="popupMask">&nbsp;</div>'
	    +'<div id="popup_Container_div">'
		    +'<div id="popup_Inner_div">'
			    +'<div id="popup_TitleBar_div">'
				    +'<div id="popup_Title_div"></div>'
				    +'<div class="popup_Controls_div" onclick="pwHide()">r</div>'
				    +'<div class="popup_Controls_div" style="display:none" id="normalDiv">2</div>'
				    +'<div class="popup_Controls_div" id="maxDiv">1</div>'
				    +'<div class="popup_Controls_div" id="minDiv">0</div>'
				    +'<div class="COMMON_Spacer_div"></div>'
			    +'</div>'
			    +'<iframe scrolling="no" src="about:blank" frameborder="0" id="popup_Frame_iframe" width="100%" height="100%" name="popup_Frame_iframe"></iframe>'
		    +'</div>'
	    +'</div>';
    document.write(writeHtml);
}



//返回高度
function pwGetViewportHeight() {
	if (window.innerHeight!=window.undefined) return window.innerHeight;
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;
	if (document.body) return document.body.clientHeight; 
	return window.undefined;
}
//返回宽度
function pwGetViewportWidth() {
	if (window.innerWidth!=window.undefined) return window.innerWidth; 
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientWidth; 
	if (document.body) return document.body.clientWidth; 
	return window.undefined; 
}

var gPopupContainer = null;
var gPopFrame = null;
var gReturnFunc;
var gPopupIsShown = false;
var gHideSelects = false;
var loadUrl,loadWidth,loadHeight,loadPos;
var newTop,newLeft, nTitleBarHeight;

var gTabIndexes = new Array();
var gTabbableTags = new Array("A","BUTTON","TEXTAREA","INPUT","IFRAME");	


//是否是IE浏览器
function isIEBrowser(){
	return navigator.userAgent.indexOf("MSIE")>-1;
}

//初始化
function pwInit() {
	gPopupMask = document.getElementById("popupMask");
	gPopupContainer = document.getElementById("popup_Container_div");
	gPopFrame = document.getElementById("popup_Frame_iframe");	
	
	var brsVersion = parseInt(window.navigator.appVersion.charAt(0), 10);
	if (brsVersion <= 6 && window.navigator.userAgent.indexOf("MSIE") > -1) {
		gHideSelects = true;
	}
}
cmAddEvent(window, "load", pwInit);


//加载弹出式编辑窗口
function pwShow(options) {
    this.ops = {
		url : '',
		width : 0,
		height : 0,
		nPos : 1,//窗口默认1-居中；0-居左；2-居右
		curWin : 0, //默认0-子窗口打开；1-父窗口打开；2-子窗口模式下父窗口打开
		returnFunc : null //回调函数
	};
	$.extend(this.ops, options);
	loadUrl=ops.url; loadWidth=ops.width; loadHeight=ops.height; loadPos=ops.nPos;

	if(gPopupContainer==null) pwInit();
	gPopupIsShown = true;
	pwDisableTabIndexes();
	gPopupMask.style.display = "block";
	gPopupContainer.style.display = "block";
	
	pwSetPos(ops.width, ops.height, ops.nPos);
	
	document.getElementById("popup_Title_div").innerHTML="加载中..."
	nTitleBarHeight = parseInt(document.getElementById("popup_TitleBar_div").offsetHeight, 10);
	
	if (navigator.product == 'Gecko') { ops.width += 6; ops.height += 6; }
	
	gPopupContainer.style.width = ops.width + "px";
	gPopupContainer.style.height = parseInt(ops.height + nTitleBarHeight + 4) + "px";
	
	gPopFrame.style.width =parseInt(document.getElementById("popup_TitleBar_div").offsetWidth, 10) + "px";
	gPopFrame.style.height = parseInt(ops.height) + "px";
	gPopFrame.src = ops.url;
	
	gReturnFunc = ops.returnFunc;
	
	if (gHideSelects == true) pwHideSelectBoxes();
	if(isIEBrowser()) $("select").css("display","none");	
	window.setTimeout("pwSetTitle();", 600);
}

//设计弹出式编辑窗口位置
var gi = 0;
function pwSetPos(width, height,nPos) {
	if( nPos==null) nPos=1;
	if (gPopupIsShown == true) {
		if (width == null || isNaN(width)) width = gPopupContainer.offsetWidth;
		if (height == null) height = gPopupContainer.offsetHeight;
		
		var fullHeight = pwGetViewportHeight();
		var fullWidth = pwGetViewportWidth();
		
		var theBody = document.documentElement;
		
		
		var scTop = parseInt(theBody.scrollTop,10);
		var scLeft = parseInt(theBody.scrollLeft,10);
				
		gPopupMask.style.height = fullHeight + "px";
		gPopupMask.style.width = fullWidth + "px";
		gPopupMask.style.top = scTop + "px";
		gPopupMask.style.left = scLeft + "px";
		
		window.status = gPopupMask.style.top + " " + gPopupMask.style.left + " " + gi++;
						
		var nTitleBarHeight = parseInt(document.getElementById("popup_TitleBar_div").offsetHeight, 10);
		
		
		var nLeftOffset=0;
		switch(nPos){
		case 0: // 靠左
			nLeftOffset=0;	
			break;
		case 1: // 居中
			nLeftOffset=(fullWidth - width) / 2
			break;
		case 2: // 靠右
			nLeftOffset=(fullWidth - width)-25;	
			break;
		default:
			break;
		}
		newTop = (scTop + ((fullHeight - (height+nTitleBarHeight)) / 2)) + "px";	
		newLeft = (scLeft + nLeftOffset) + "px";
		gPopupContainer.style.top = newTop;
		gPopupContainer.style.left =  newLeft;
	}
}
cmAddEvent(window, "resize", pwSetPos);
cmAddEvent(window, "scroll", pwSetPos);


//关闭弹出编辑窗口
function pwHide(callReturnFunc) {
	gPopupIsShown = false;
	pwRestoreTabIndexes();
	if (gPopupMask == null) return;
	gPopupMask.style.display = "none";	
	if (gPopupContainer == null) return;
	gPopFrame.src = blankFile;
	gPopupContainer.style.display = "none";
	if (callReturnFunc == true && gReturnFunc != null) gReturnFunc(window.frames["popup_Frame_iframe"].returnVal);
	if (gHideSelects == true) pwDisplaySelectBoxes();
	if(isIEBrowser()) $("select").css("display","");
}


//设置弹出窗口标题--从加载的页面文件的TITLE标记获取。
function pwSetTitle() {
	if (window.frames["popup_Frame_iframe"].document.title == null) {
		window.setTimeout("pwSetTitle();", 10);
	} else {
		document.getElementById("popup_Title_div").innerHTML = window.frames["popup_Frame_iframe"].document.title;
	}
}





function zoom(rate){
    gPopupContainer.style.height = Math.floor( parseInt(gPopupContainer.style.height) * rate );
    gPopFrame.style.height = Math.floor( parseInt(gPopFrame.style.height) * rate );
    pwSetPos;
}

function pwKeyDownHandler(e) {
    if (gPopupIsShown && e.keyCode == 9) return false;
}

if (!document.all) {
    document.onkeypress = pwKeyDownHandler ;
}




//Tab键Index功能禁用
function pwDisableTabIndexes() {
	if (document.all) {
		var i = 0;
		for (var j = 0; j < gTabbableTags.length; j++) {
			var tagElements = document.getElementsByTagName(gTabbableTags[j]);
			for (var k = 0 ; k < tagElements.length; k++) {
				gTabIndexes[i] = tagElements[k].tabIndex;
				tagElements[k].tabIndex="-1";
				i++;
			}
		}
	}
}
//Tab键Index功能恢复
function pwRestoreTabIndexes() {
	if (document.all) {
		var i = 0;
		for (var j = 0; j < gTabbableTags.length; j++) {
			var tagElements = document.getElementsByTagName(gTabbableTags[j]);
			for (var k = 0 ; k < tagElements.length; k++) {
				tagElements[k].tabIndex = gTabIndexes[i];
				tagElements[k].tabEnabled = true;
				i++;
			}
		}
	}
}


//隐藏透明背景层
function pwHideSelectBoxes() {
	for(var i = 0; i < document.forms.length; i++) {
		for(var e = 0; e < document.forms[i].length; e++){
			if(document.forms[i].elements[e].tagName == "SELECT") {
				document.forms[i].elements[e].style.visibility="hidden";
			}
		}
	}
}


//显示透明背景层
function pwDisplaySelectBoxes() {
	for(var i = 0; i < document.forms.length; i++) {
		for(var e = 0; e < document.forms[i].length; e++){
			if(document.forms[i].elements[e].tagName == "SELECT") {
			document.forms[i].elements[e].style.visibility="visible";
			}
		}
	}
}

//加事作监测
function cmAddEvent(obj, evenTypeName, fn){
 if (obj.addEventListener){
    obj.addEventListener(evenTypeName, fn, true);
    return true;
 } else if (obj.attachEvent){
    return obj.attachEvent("on"+evenTypeName, fn);
 } else {
    return false;
 }
}


//移除事件监测
function cmRemoveEvent(obj, evenTypeName, fn){
	if (obj.removeEventListener){
		obj.removeEventListener(evenTypeName, fn, true);
		return true;
	} else if (obj.detachEvent){
		var r = obj.detachEvent("on"+evenTypeName, fn);
		return r;
	} else {
		alert("Handler could not be removed");
	}
}


//弹出编辑窗常规操作  拖曳 最小化    最大化   恢复正常大小
var oldFlag;
$(function () {
    //拖曳
    $('#popup_Container_div')
        .bind('dragstart', function (event) {
            if ($(event.target).is('#popup_Container_div')) return false;
            $(this).addClass('active');
        })
        .bind('drag', function (event) {
            $(this).css({
                top: event.offsetY,
                left: event.offsetX
            });
        })
        .bind('dragend', function (event) {
            $(this).removeClass('active');
        });
    //最小化
    $("#minDiv").click(function () {
        var scTop = parseInt(document.documentElement.scrollHeight - 30, 10);
        var scLeft = parseInt(document.documentElement.scrollLeft, 10);

        $("#popup_Container_div").animate({ opacity: "5", top: scTop, left: scLeft, height: "24", width: "100" }, "fast", function () {
            $("#popup_Frame_iframe").hide();
            $("#popup_Title_div").hide();
            $("#normalDiv").css('display', "block");
            $("#maxDiv").css('display', "none");
        });
        oldFlag = 0;
    });
    //恢复正常大小
    $("#normalDiv").click(function () {
        cLoadHeight = gPopFrame.contentWindow.document.body.scrollHeight;
        if (oldFlag == 0) cLoadHeight = gPopFrame.contentWindow.document.body.clientHeight
        $("#popup_Container_div").animate({ opacity: "100", top: newTop, left: newLeft, height: parseInt(cLoadHeight + nTitleBarHeight + 4, 10), width: loadWidth }, "fast", function () {
            gPopFrame.style.width = "100%";
            if (oldFlag == 2) gPopFrame.style.height = cLoadHeight + "px";
            $("#popup_Frame_iframe").show();
            $("#popup_Title_div").show();
            $("#normalDiv").css('display', "none");
            $("#maxDiv").css('display', "block");
        });
    });
    //最大化
    $("#maxDiv").click(function () {
        var scHeight = parseInt(document.documentElement.scrollHeight - 6, 10);
        var scWidth = parseInt(document.documentElement.scrollWidth - 6, 10);
        $("#popup_Container_div").animate({ opacity: "100", top: 0, left: 0, height: scHeight, width: scWidth }, "fast", function () {
            gPopFrame.style.width = "100%";
            gPopFrame.style.height = parseInt($("#popup_Container_div").height() - 26, 10) + "px";
            $("#popup_Frame_iframe").show();
            $("#popup_Title_div").show();
            $("#normalDiv").css('display', "block");
            $("#maxDiv").css('display', "none");
        });
        oldFlag = 2;
    });
});
