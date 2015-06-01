<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_GRANT_SET.aspx.cs" Inherits="SYS_GRANT_SET" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="stylesheet" type="text/css" href="sys.css"/>
<link rel="stylesheet" type="text/css" href="fontaweone.css"/>
<link rel="stylesheet" type="text/css" href="bingding.css"/>
 <base target="_self"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<style>
    .box-title h3 {
        float: left;
        margin: 3px 0 3px 0;
        line-height: 24px;
        font-weight: 400;
        color: #444;
        font-size: 20px;
       }
      
</style>
<script type="text/javascript">
    $(function () {
        $("#btn_bd").click(function () {
            if ($("#username").val() == "" || $("#password").val() == "") {
                alert("用户名密码不能为空~");
                return;
            }
            var num1 = 1;
            var flag = setInterval(function () {
                //alert(num1);
                $("#message").html("启动绑定~~<font color='green'>" + num1 + "</font>");
                $.ajax({
                    type: "POST",
                    url: "SYS_GRANT_EXE.aspx",
                    data: { username: $("#username").val(), password: $("#password").val(), num: num1 },
                    dataType: "json",
                    success: function (data) {
                        console.log(data["result"]);
                        if (data["result"] == "绑定出错" || data["result"] == "绑定出错:请输入正确的用户名和密码") {
                            //alert(data["result"]);
                            $("#message").html(data["result"]);
                            clearInterval(flag); //导致第二次不能点击绑定 yanggh
                        } else {
                            $("#message").html("正在绑定~~<font color='green'>" + num1 + "</font>-阶段:" + "<font color='red'>" + data["result"] + "</font>");
                            console.log(data["result"]);
                            //console.log(("执行状态: 已空闲,10,(10代表已完成)" == data["result"]));
                            if (data["result"].indexOf('10') >= 0) {//执行状态: 已空闲,10,(10代表已完成)
                                $("#message").html("绑定成功~~<font color='green'>" + num1 + "</font>-阶段:将同步平台数据");
                            }
                            else if (data["result"].indexOf('20')>=0) {//执行状态: 已空闲,10,(10代表已完成)
                                $("#message").html("平台信息同步成功~~");//jinsj，js包含20，即为成功
                                clearInterval(flag);
                            }
                            //num1++;
                        }
                    },
                    error: function (data) {
                        console.log(data);
                    }
                });
                num1++;
            }, 2000);
        });
    });
       

</script>
<body>
        <div class="box-title">
            <div class="span12">
                <h3><i class="icon-cog" style="margin-left:70px;"></i>公众帐号智能绑定<small>(公众平台安全中心的手机保护需处于未开启状态)</small></h3>

            </div>
          
        </div>
        <div class="box-content">
            <div class="bboxl step1">
                <div class="pd" style="margin-left:20px;position: absolute;left: 20px;top: 30px;">
                    <div class="f14 mb30">
                        请输入微信公众平台帐号信息，非微信生意通/政务通帐号。无帐号点击<a href="https://mp.weixin.qq.com" target="_blank">申请</a>
                    </div>

                    <form  class="form-horizontal form-validate2">
                        <div class="control-group">
                            <label class="control-label" for="username">微信公众平台帐号:</label>
                            <div class="controls">
                                <input type="text" name="username" id="username" class="input-large" data-rule-required="true" data-rule-maxlength="60" />
                                <span for="username" class="help-block error valid"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="password">密码:</label>
                            <div class="controls">
                                <input type="password" name="password" id="password" class="input-large" data-rule-required="true" data-rule-maxlength="60" />
                                <span for="password" class="help-block error valid"></span>
                            </div>
                        </div>
                        <div class="login-code-panel dn" id="verify_area" style="display: none;">    
                            <input type="text" id="verify">
                                <span class="icon-wrapper">
                                <img id="img1" src="https://mp.weixin.qq.com/cgi-bin/verifycode?username=1470069136@qq.com123&amp;r=1398263021490"></span>
                                <%--<a class="login-change-code" href="javascript:;" id="changeimg_link">换一张</a>--%>
                        </div>
                       
                            <div class="form-actions">
                            <button type="button" id="btn_bd"  data-loading-text="绑定中..." class="btn btn-primary" >智能绑定</button>
                            <span id="message"></span>
                        </div>

                        </form>
                        </div>
                    </div>
                    </div>

  
    
</body>
</asp:Content>
