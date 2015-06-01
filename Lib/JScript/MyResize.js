function InitELH(h, listid, list1, list2) {
    var docH = $(window).height();
    $("#" + listid).height(docH - h);

    if (list1 != undefined && list1 != "") {
        $("#" + list1).height(docH - h);
    }
    if (list2 != undefined && list2 != "") {
        $("#" + list2).height(docH - h);
    }
}

function InitDivH(_h,objs, jianGZ1, jianGZ2, jianGZ3) {
    var i = 0;
    var h = 0;
    if (arguments.length > 2) {
        for (i = 2; i < arguments.length; i++) {
            var tops = $(arguments[i]);
            for (var a = 0; a < tops.length; a++) {
                var stylestr = $(tops[a]).attr("style"); //alert(stylestr);
                if (stylestr == undefined || stylestr == "" || stylestr.toLowerCase().replace(" ", "").indexOf("display:none") == -1) {
                    h += $(tops[a]).height();
                }
            }
        }
    }
    if (objs.length != undefined && objs.length > 0) {
        var docH = $(window).height();
        for (i = 0; i < objs.length; i++) {
            objs[i].height(docH - h - _h);
        }
    }
}


function doResize(jianH) {
    //alert('doResize');
    if (jianH == undefined) {
        jianH = 30;
    }

    var winH = $(window).height();
    var tops = $("div.titnav"); //alert(tops.length);
    var topH = 0;
    for (var a = 0; a < tops.length; a++) {
        var stylestr = $(tops[a]).attr("style"); //alert(stylestr);
        if (stylestr == undefined || stylestr == "" || stylestr.toLowerCase().replace(" ", "").indexOf("display:none") == -1) {
            topH += $(tops[a]).height();
        }
    }
    //alert("topH:" + topH);
    var finds = $("div.topfind"); //alert(tops.length);
    var findH = 0;
    for (var a = 0; a < finds.length; a++) {
        var stylestr = $(finds[a]).attr("style"); //alert(stylestr);
        if (stylestr == undefined || stylestr == "" || stylestr.toLowerCase().replace(" ", "").indexOf("display:none") == -1) {
            findH += $(finds[a]).height();
        }
    }
    //alert("findH:" + findH);

    var toolH = $("div.tool").height();
    if (toolH == null) {
        toolH = 0;
    }
    //alert("toolH:" + toolH);

    var hWarn = $("div.warn").height();

    var hInfo = $("div.info").height();
    var hFoot = $("div.foot").height();
    //alert("hWarn:" + hWarn);

    var pagesH = $("div.pages").height();
    if (pagesH == null) {
        pagesH = 0;
    }
    //alert("pagesH:" + pagesH);

    var tblistArr = $("div.tblist");
    var tbarr = new Array();

    for (var a = 0; a < tblistArr.length; a++) {
        var stylestr = $(tblistArr[a]).attr("style");
        //if (stylestr == undefined || stylestr == "" || stylestr.toLowerCase().indexOf("height") == -1) 
        {
            tbarr.push($(tblistArr[a]));
        }        
    }
//  alert("topH:" + topH + "findH:" + findH + "toolH:" + toolH + "pagesH:" + pagesH + "hWarn:" + hWarn);

    var tbH = 0; var realTbH = 0;
    
    for (var a = 0; a < tbarr.length; a++) {
        realTbH = (winH - topH - findH - toolH - pagesH - hWarn - jianH - hInfo - hFoot) / tbarr.length;
        tbH = $(tbarr[a]).find("table").height();
        
        if (realTbH < 0)
            realTbH = tbH;
        else if (realTbH > tbH) {//选择小的高，这样可以压缩到一个页面里。导航条出现在页面
            realTbH = tbH;
        }
        tbarr[a].height(realTbH + 20);//30 //zlg

//        alert("winH:" + winH + "topH:" + topH + "findH:" + findH + "toolH:" + toolH + "pagesH:" + pagesH + "hWarn:" + hWarn
//        + "jianH:" + jianH + "hInfo:" + hInfo + "hFoot:" + hFoot
//        + "tbH:" + (realTbH + 20));
    }    
}

function bindWinResize(jianH, doResizeMy) {
    if (doResizeMy != undefined) {
        window.status = typeof (doResizeMy);
        
        var aaa = function () {
            doResize(jianH); doResizeMy();
        }; 
        aaa();
        $(window).bind("resize", null, function (e) {
            //clearTimeout(_scrollTimer3);
            //var _scrollTimer3 = setTimeout(aaa, 100); 
            setTimeout(aaa, 100); 
        });
    } else {        
        var aaa = function () {
            doResize(jianH); 
        };
        aaa(); 
        $(window).bind("resize", null, function (e) {
//            clearTimeout(_scrollTimer3);
//            var _scrollTimer3 = setTimeout(aaa, 100); 
            setTimeout(aaa, 100); 
        });
    }
}

