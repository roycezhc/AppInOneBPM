(function ($) {
    function getRightWidth(layObj, leftObj, centObj, rightObj) {
        var winW = $(window).width();

        var layLRMargin = leftObj.offset().left * 2; //容器左右边距所占宽度
        var layBorderW = layObj.outerWidth() - layObj.width(); //左右布局的容器边框所占宽度
        var leftW = leftObj.outerWidth(); //左边DIV所占宽度
        var centW = 0; //中间DIV所占宽度
        var centBorderW = 2;
        if (centObj != null) {
            centW = centObj.outerWidth();
            //centBorderW = (centObj.offset().left - leftObj.offset().left - leftW) * 2
        }
        //alert(centBorderW);
        var jianW = 15;
        var rightBorderW = rightObj.outerWidth() - rightObj.width();
        var rightWidth = winW - layLRMargin - layBorderW - leftW - centW - rightBorderW - jianW;
        //alert(winW + "-" + layLRMargin + "-" + layBorderW + "-" + leftW + "-" + centW + "-k" + centBorderW + "k-" + rightBorderW + "-" + jianW + "=" + rightWidth);
        if ($.browser.mozilla) {
            rightWidth -= 15;
        }
        //alert(rightWidth);
        return rightWidth;
    }
    $.fn.Layout_LR = function (option) {
        var jianH = option.jianH || this.offset().top + 5;
        var divs = this.children();
        var divsNum = divs.length;
        var leftObj = $(divs[0]);
        var rightObj = null;
        var centObj = null; //alert(divsNum);
        if (divsNum < 3) {
            rightObj = $(divs[1]);

        } else {
            centObj = $(divs[1]);
            rightObj = $(divs[2]);
        }
        this.append("<div class='clear'></div>");

        var winH = $(window).height();

        this.addClass("lay-lr");
        leftObj.addClass("lr-left");
        rightObj.addClass("lr-right");


        if (centObj != null) {
            centObj.addClass("lr-cent");
            var hsdiv = centObj.find("div.show");
            if (hsdiv.length == 0) {
                hsdiv = centObj.find("div.hide");
            }
            if (hsdiv.length == 0) {
                hsdiv = centObj.find("div.showhide");
            }
            hsdiv.bind("click", hsdiv, function (e) {
                var css = e.data.attr("class");
                var ritW = rightObj.width();
                if (css == "show") {
                    e.data.attr("class", "hide");
                    ritW += centObj.prev().width();
                    centObj.prev().hide();

                } else if (css == "hide") {
                    e.data.attr("class", "show");
                    ritW -= centObj.prev().width();
                    centObj.prev().show();
                } else {
                    var hsta = hsdiv.attr("ishide");
                    var oldtext = hsdiv.text();
                    oldtext = oldtext.substring(2, oldtext.length);

                    if (hsta == undefined || hsta != "yes") {
                        ritW += centObj.prev().width();
                        centObj.prev().hide();
                        e.data.attr("ishide", "yes");
                        hsdiv.text("显示" + oldtext);
                    } else {
                        ritW -= centObj.prev().width();
                        centObj.prev().show();
                        hsdiv.text("隐藏" + oldtext);
                        e.data.attr("ishide", "no");
                    }
                }
                rightObj.width(ritW);
            });
        }

        var rightWidth = getRightWidth(this, leftObj, centObj, rightObj);
        //alert(rightWidth);
        leftObj.height(winH - jianH);
        rightObj.height(winH - jianH);
        if (centObj != null) {
            centObj.height(winH - jianH);
        }
        rightObj.width(rightWidth);

        var layObj = this;
        $(window).bind("resize", function (e) {
            winH = $(window).height();

            var rightWidth = getRightWidth(layObj, leftObj, centObj, rightObj);

            leftObj.height(winH - jianH);
            rightObj.height(winH - jianH);
            if (centObj != null) {
                centObj.height(winH - jianH);
            }
            rightObj.width(rightWidth);
        });
    }

    var js = document.getElementsByTagName("script");
    var jsPath = "";

    for (var i = 0; i < js.length; i++) {
        if (js[i].src.toLowerCase().indexOf("laylr/laylr.js") != -1) {
            jsPath = js[i].src.substring(0, js[i].src.lastIndexOf("/") + 1);
            break;
        }
    }
    var headObj = document.getElementsByTagName("head")[0];
    var css = document.createElement("link");
    css.setAttribute("rel", "stylesheet");
    css.setAttribute("type", "text/css");
    css.setAttribute("href", jsPath + "laylr.css");
    headObj.appendChild(css);

})(jQuery);