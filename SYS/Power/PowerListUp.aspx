<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_Power_PowerListUp" CodeFile="PowerListUp.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    $(function () {
        var obj = window.dialogArguments.toString();
        //alert(obj);
        var objList = eval("[" + obj + "]");
        for (var i = 0; i < objList.length; i++) {
            //alert(objList[i].toString());
            var para = "{ btnType: '" + objList[i].btnType + "', dicCode: '" + objList[i].dicCode + "', btnName: '" + objList[i].btnName + "', pageDir: '" + objList[i].pageDir + "' }";
            //alert(para);
            var str = "<li><input id='cb_" + objList[i].dicCode + "' value=\"" + para + "\" type='checkbox' /><label for='cb_" + objList[i].dicCode + "'>" + objList[i].btnName + "</label></li>";
            $("#ulList").append(str);
        }
    });

    var upNum = 0;
    var upArr = new Array();
    function upPower() {
        var cbs = $("#ulList").find("input[type='checkbox']");
        for (var a = 0; a < cbs.length; a++) {
            if (cbs[a].checked == true) {
                //alert(cbs[a].value);
                upArr.push(eval("(" + cbs[a].value + ")"));
            }
        }
        if (upArr.length > 0) {
            upOne(upArr[0]);
        }
    }
    var upCount = 0;
    function upOne(para) {
        $.ajax({
            type: "GET",
            data: para,
            url: "PowerBtnUp.aspx?upbtn=" + Math.random(),
            timeout: 20000,
            success: function (data) {
                if (parseFloat(data) > 0) {
                    upCount++;
                }
                upNum++; //= parseFloat(data);
                if (upNum < upArr.length) {
                    upOne(upArr[upNum]);
                } else {
                    if (upCount > 0) {
                        alert("上传完成");
                    } else {
                        alert("上传失败，或许是系统未配置此页面作为一个权限模块！");
                    }
                }
            },
            error: function (a, b, c) {
                if (b == "timeout") {
                    alert("异步处理超时");
                } else {
                    alert("异步处理错误");
                }
            },
            complete: function (xht, sta) {
                if (sta == "error") {
                    alert("服务端处理错误");
                }
            }
        });
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div style="margin:20px;">
<div>
<ul id="ulList">

</ul>
</div>
<div>
    <input id="btnUP" type="button" value="上传" style="height:22px;" onclick="upPower();" />
</div></div>
</asp:Content>

