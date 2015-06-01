$(function () {
    var tabsObj = $("div.tabs");

    for (var a = 0; a < tabsObj.length; a++) {
        var divs = $(tabsObj[a]).children();
        if (divs.length != 2) {
            alert("面板html代码有错误！");
            break;
        }

        var btnsObj = $(divs[0]).children();
        var contsObj = $(divs[1]).children();

        if (btnsObj.length != contsObj.length) {
            alert("面板html代码有错误！面板按钮和内容区域个数不一样！");
            break;
        }
        $(divs[0]).addClass("tab-btn"); $(divs[1]).addClass("tab-panel");
        for (var i = 0; i < btnsObj.length; i++) {
            var clsMore = $(btnsObj[i]).attr("class");
            if (clsMore != undefined && clsMore.indexOf('more') != -1) {
                return;
            }
            if (i == 0) {
                $(btnsObj[i]).attr("class", "show");
                $(contsObj[i]).attr("class", "show");
            } else {
                $(btnsObj[i]).attr("class", "hide");
                $(contsObj[i]).attr("class", "hide");
            }
            $(btnsObj[i]).bind("click", i, function (event) {
                btnsObj.attr("class", "hide");
                contsObj.attr("class", "hide");

                var tabObj = $(btnsObj[event.data]);
                var contObj = $(contsObj[event.data]);
                tabObj.attr("class", "show");
                contObj.attr("class", "show");

                tabClick(tabObj, contObj);
                return false;
            });
        }

        
    }



    var js = document.getElementsByTagName("script");
    var jsPath = "";

    for (var i = 0; i < js.length; i++) {
        if (js[i].src.toLowerCase().indexOf("tabs/tabs.js") != -1) {
            jsPath = js[i].src.substring(0, js[i].src.lastIndexOf("/") + 1);
            break;
        }
    }

    var headObj = document.getElementsByTagName("head")[0];
    var css = document.createElement("link");
    css.setAttribute("rel", "stylesheet");
    css.setAttribute("type", "text/css");
    css.setAttribute("href", jsPath + "tabs.css");
    headObj.appendChild(css);

});

function tabClick(tabObj, contObj) {
   
}