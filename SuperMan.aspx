<%@ Page Title="管理平台登录"  StylesheetTheme="" Language="C#" AutoEventWireup="true" Inherits="SuperMan" CodeFile="SuperMan.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Lib/JQuery/jquery.min.js" type="text/javascript"></script>    
    <script src="Lib/userAgent.js" type="text/javascript"></script>
    <link href="/Themes/PMMS/css/main.css" rel="stylesheet" type="text/css" /></head>
</head>
<body>
    <form runat="server">
     <input name="preUrl" type="hidden" value="<%=preUrl %>" />
<div class="header">
	<h1 class="headerLogo"></h1>
	<div class="headerLine" > </div>
    <div class="headerIntro"><span class="title">信息化集成平台</span><br><span class="note">Collaborative OA Office System</span></div>
</div>
<div class="main" id="mainBg">
	<div class="main-inner" id="mainCnt" >
		<div id="theme">
		</div>
	</div>
	<!--登录框-->
	<div id="loginBlock" class="login tab-1">
        <div class="loginFunc">
			<div id="lbNormal" class="loginFuncNormal">
				系统授权号
			</div>
		</div>
		<div class="loginForm">
			<div id="login163" name="login163" >
				<div id="idInputLine" class="loginFormIpt showPlaceholder">
					<b class="ico ico-uid"></b>
					<input class="loginFormTdIpt" runat="server" tabindex="1" title="请输入帐号" id="username" name="username" type="text" maxlength="50" />
				</div>
				<div id="pwdInputLine" class="loginFormIpt showPlaceholder">
					<b class="ico ico-pwd"></b>
					<input class="loginFormTdIpt" runat="server" tabindex="2" title="请输入密码" id="password" name="password" type="password"/>
				</div>
				<div class="loginFormCheck">
					<div id="lfAutoLogin" class="loginFormCheckInner">
						<b class="ico-checkbox" onclick="check(this)"></b>
						<label id="remAutoLoginTxt" for="reme">
							<input tabindex="3" title="十天内免登录" class="loginFormCbx" value="1"  type="checkbox" id="reme" name="reme" />
						保存用户名</label>
                        
					</div>
				</div>
				<div class="loginFormBtn">
                    
                    <asp:Button ID="Button1" CssClass="btn btn-login" runat="server" Text="初始化" onclick="btnSysInit_Click"/>
				</div>
			</div>
		</div>
         <div style="position:relative;top:5px;" align="center">
           <div id="forward" class="bottom-btn bottom-btn-left-out"></div>
           <div class="bottom-space-block"></div>
           <div id="backward" class="bottom-btn bottom-btn-right-out"></div>
        </div>
	</div>
</div>
<script type="text/javascript">
    $.fn.extend({
        textTips: function (obj) {//使用方法：$('#name').textTips({tips:'请输入你的名字',startColor:'#cccccc',endColor:'#000000'});
            if ($(this).val() == '') {
                $(this).val(obj.tips).css({ 'color': obj.startColor })
            }
            this.focusin(function (e) {
                if (this.value == obj.tips) {
                    this.value = '';
                    this.style.color = obj.endColor;
                    if (!Browser.isIE)
                        this.type = obj.type;
                }
            }).focusout(function (e) {
                if (this.value == "") {
                    this.value = obj.tips;
                    this.style.color = obj.startColor;
                    this.type = "text";
                }
            })
        }
    })
    $(function () {
        $('#username').textTips({ tips: '用户名', startColor: '#b9b9b9', endColor: '#000000', type: "text" });
        $('#password').textTips({ tips: '密码', startColor: '#b9b9b9', endColor: '#000000', type: "password" });
        if (Browser.isIE) {
            //            $("#password").remove();
            //            $("pwdInputLine").append('<input class="loginFormTdIpt" tabindex="2" title="请输入密码" id="password" name="password" type="password"/>');
            //            $("#password").focus(); // 焦点转移
        }
    })

    function check(obj) {
        if (obj.className == "autoLogin-checked") {
            obj.className = "ico-checkbox";
            $('#reme').removeAttr("checked");
        }
        else {
            obj.className = "autoLogin-checked";
            $('#reme').attr("checked", 'true');
        }
    }
    
    var i = 1;
    var count = 2;
    var bgcolor = new Array("", "#4cbab5", "#294e56");
    $(function () {
        $("#forward").mousemove(function () {
            $("#forward").removeClass("bottom-btn-left-out");
            $("#forward").addClass("bottom-btn-left-over");
        });
        $("#backward").mouseover(function () {
            $("#backward").removeClass("bottom-btn-right-out");
            $("#backward").addClass("bottom-btn-right-over");
        });
        $("#forward").mouseout(function () {
            $("#forward").removeClass("bottom-btn-left-over");
            $("#forward").addClass("bottom-btn-left-out");
        });
        $("#backward").mouseout(function () {
            $("#backward").removeClass("bottom-btn-right-over");
            $("#backward").addClass("bottom-btn-right-out");
        });
        //.main-inner{background-image: url(../img/login_bg1.png); background-position: 50% 0%; background-repeat: no-repeat no-repeat;}
        $("#forward").click(function () {
            i--;
            i = i > 0 ? i : count;
            $(".main").css("background-color", bgcolor[i]);
            $(".main-inner").attr("style", "background-position: 50% 0%; DISPLAY: inline-block; BACKGROUND-IMAGE: url(Themes/PMMS/img/login_bg" + i + ".png); background-repeat: no-repeat no-repeat;");
        });
        $("#backward").click(function () {
            i++;
            i = i <= count ? i : 1;
            $(".main").css("background-color", bgcolor[i]);
            $(".main-inner").attr("style", "background-position: 50% 0%; DISPLAY: inline-block; BACKGROUND-IMAGE: url(Themes/PMMS/img/login_bg" + i + ".png); background-repeat: no-repeat no-repeat;");
        });
    });
    </script>
        </form>
</body>
</html>
