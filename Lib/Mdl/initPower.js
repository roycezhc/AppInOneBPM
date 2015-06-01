$(function () {
    //alert(_pageUrlArr[0]);
    $("body").append("<input class='powerupbtn' type='button' value='上传权限字典' onclick='upPowerDic();' style='width:120px;position:absolute;left:200px;bottom:3px;'/>");

    $("body").append("<input class='powerupbtn' type='button' value='上传页面数据字段名' onclick='upPowerCols();' style='width:150px;position:absolute;left:300px;bottom:3px;'/>");
    //alert(window.location.pathname);
    //alert(window.location.hostname);
    //alert(window.location.host);
});

function upPowerCols() {
    var tds = $("div.tblist table thead td");
    var cols = "";
    var names = "";
    tds.each(function (i) {
        if (cols != "") {
            cols += ","; names += ",";
        }
        var colname = $(this).attr("colname");
        if (colname != undefined && colname != "") {
            cols += colname;
            names += escape($(this).text());
        } else {
            var ddd = $(this).attr("data");
            if (ddd != undefined && ddd != "") {
                colname = eval("(" + ddd + ")").colname;
                if (colname != undefined && colname != "") {
                    cols += colname;
                    names += escape($(this).text());
                }
            }
        }
    });
    tds = $("div.tblist table thead th");
    tds.each(function (i) {
        if (cols != "") {
            cols += ","; names += ",";
        }
        var colname = $(this).attr("colname");
        if (colname != undefined && colname != "") {
            cols += colname;
            names += escape($(this).text());
        } else {
            var ddd = $(this).attr("data");
            if (ddd != undefined && ddd != "") {
                colname = eval("(" + ddd + ")").colname;
                if (colname != undefined && colname != "") {
                    cols += colname;
                    names += escape($(this).text());
                }
            }
        }
    });
    
    if (cols != "") {
        var para = {
            UpPageCols: cols,
            colnames: names,
            PageUrl: _pageUrlArr[1]
        };
        //?wcp 页面地址歧义
        $.ajax({
            type: "POST",
            url: _pageUrlArr[0] + "SYS/Power/PowerBtnUp.aspx?r=" + Math.random(),
            data: para,
            dataType: "html",
            timeout: 20000,
            success: function (data) {
                alert(data);
            },
            error: function (a, b, c) {
                if (b == "timeout") {
                    alert("异步处理超时" + a + "-" + b + "-" + c);
                } else {
                    alert("异步处理错误" + a + "-" + b + "-" + c);
                }
            },
            complete: function (xht, sta) {
                if (sta == "error") {
                    alert("服务端处理错误" + xht + "-" + sta);
                }
            }
        });
    }
}

function upPowerDic() {
    var btns = $("body").find("input[power],a[power],li[power],div[power]");
    if (btns.length > 0) {
        var paras = "";
        for (var a = 0; a < btns.length; a++) {
            var btnObj = $(btns[a]);
            var vvv = btnObj.val();
            if (vvv == undefined||vvv=="") {
                vvv = btnObj.text();
            }
            var ctrlType = "Button";
            var tagName = btnObj[0].tagName;
            if (tagName == "INPUT") {
                ctrlType = "1";
            }
            else if (tagName == "A") {
                ctrlType = "2";
            }
            else if (tagName == "DIV") {
                ctrlType = "4";
            }
            else if (tagName == "LI") {
                ctrlType = "5";
            }
            else {
                ctrlType = "2";
            }
            var pageUrl = _pageUrlArr[1];
            var preurl = _pageUrlArr[0];
            var powerCode=btnObj.attr("power");
            if (paras.indexOf(powerCode) != -1) {
                continue;
            }
            //alert(pageUrl);
            if (paras != "") {
                paras += ",";
            }
            paras += "{btnType:" + ctrlType + ",dicCode:'" + powerCode + "',btnName:'" + vvv + "',pageDir:'" + pageUrl + "'}";

        }
        var result = window.showModalDialog(preurl + "SYS/Power/PowerListUp.aspx?r=" + Math.random(), paras, "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
       
    } else {
        alert("找不到权限按钮。");
    }
}