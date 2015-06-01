<%@ Page Language="C#" StylesheetTheme="" AutoEventWireup="true" Inherits="IndexNew" CodeFile="Index2.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="Themes/<%=theme %>/index.css" rel="stylesheet" type="text/css" />
    <link href="Themes/<%=theme %>/layout.css" rel="stylesheet" type="text/css" />
    <script src="Lib/JQuery/jquery.min.js" type="text/javascript"></script>
    <script src="Themes/Default/index.js?r=<%=new Random().Next() %>" type="text/javascript"></script>
    <style type="text/css">
.sortbar .col {
_position: static;
}
.sortbar {
height: 32px;
border: 1px solid #e3e3e3;
border-top: 0;
background-color: #f2f2f2;
_font-size: 0;
}
.sortbar {
position: relative;
z-index: 250;
}
.sortbar .switch-btns a, .sortbar .sorting-btns, .sortbar .switch-btns {
_display: inline;
_zoom: 1;
}
.sortbar .switch-btns li .icon-btn-switch-wrap {
width: 44px;
height: 32px;
margin-top: 0;
border-left: 1px #e5e5e5 solid;
float: left;
margin-right: 0;
}
.sortbar .switch-btns li.selected .icon-btn-switch-wrap {
background: white;
}
    
    </style>
    <script type="text/javascript">
        function setA_indexUrl(url) {
            var src1 = document.getElementById("a_index");
            src1.src = url;
        }
//        $(window).on('beforeunload', function () {
//            return 'Your own message goes here...';
//        });

        $(document).ready(function () {

            var lis = $("#left").find("li");
            var his = getCookie('LinkTab');
            setCookie('LinkTab', '');
            if (his == "" || his == undefined) {
                return false;
            }
            var str = new Array();
            var arr = new Array();
            str = his.split("`");
            if (str.length > 1) {
                for (var j = 0; j < lis.length; j++) {
                    var liObj = $(lis[j]);
                    var aObj = liObj.find("a:first");
                    if (str[str.length - 2] == aObj.text()) {
                        aObj.click();
                    }
                }
            }
            else {
                for (var j = 0; j < lis.length; j++) {
                    var liObj = $(lis[j]);
                    var aObj = liObj.find("a:first");
                    if (his == aObj.text()) {
                        aObj.click();
                    }
                }
            }
            //展开所有打开的选项卡
            //            for (i = 0; i < str.length; i++) {
            //                for (var j = 0; j < lis.length; j++) {
            //                    var liObj = $(lis[j]);
            //                    var aObj = liObj.find("a:first");
            //                    if (str[i] == aObj.text()) {
            //                        arr.push(j);
            //                    }
            //                }
            //            }
            //            for (k = 0; k < arr.length; k++) {
            //                var liObj = $(lis[arr[k]]);
            //                var aObj = liObj.find("a:first");
            //                aObj.click();
            //            }

        });
        window.onbeforeunload = function (e) {
            var n = window.event.screenX - window.screenLeft;
            var b = n > document.documentElement.scrollWidth - 20;
            if (b && window.event.clientY < 0 || window.event.altKey) {
                //alert("是关闭而非刷新");
                window.event.returnValue = "是否关闭？";
            } else {
                //alert("是刷新而非关闭");
                window.event.returnValue = "将刷新本页，是否确认？";
            }
        }

    </script>
    <%if(AgileFrame.Core.MyConfigurationSettings.GetValue("User_IsRunMode")=="Developer"){ %>
    <link href="Themes/<%=theme %>/dev_index.css" rel="stylesheet" type="text/css" />
    <%} %>
</head>
<body style="overflow:hidden;" >
    <form id="form1" runat="server">
    <div id="index">
    <div id="head">        
         <%#titleOrLogoHtml%>
         <ul id="menu">
             <%--<li><a>OA办公</a></li><li><a>CRM</a></li>--%>
              <asp:Literal ID="litMenu" runat="server"></asp:Literal>
               
            </ul>
         <ol>
           <li><span>欢迎您：</span>
           <a href="#"><asp:Literal ID="litNameExd" runat="server"></asp:Literal></a>
           <span>(<asp:Literal ID="litName" runat="server"></asp:Literal>)</span>
           </li>
           <li><a href="SYS/webrepass.aspx" data="{key:'mdl_0107',name:'修改密码'}" id ='chgPwd'>修改密码</a>
           <a href="">刷新页</a>
           <a href="Login.aspx?out=1">退出</a></li>
           <li><span><asp:Literal ID="litSet" runat="server"></asp:Literal></span></li>
         </ol>
    </div>
    <div id="guide">
        <ul><li class="sel"><a href="MIS/DefaultMain.aspx" class="home" data="{key:'a_index'}"><span>个人门户</span></a></li>
           <%-- <li class="sel"><a href="MIS/Default.aspx" class="home" data="{key:'a_index'}">首页</a></li>--%>
          <%-- <li><a href="<%#appPath %>MIS/Task/MyTask.aspx" data="{key:'wdrw'}"><span>我的任务</span></a></li>
           <li class="first"><a href="<%#appPath %>MIS/Task/TaskSend.aspx" data="{key:'fbrw'}"><span>分配任务</span></a></li>--%>
           <%-- <li><a href="<%#appPath %>MIS/Task/MyLog.aspx" data="{key:'wdhb'}"><span>我的汇报</span></a></li>--%>
            <%--<li><a href="<%#appPath %>MIS/Task/MyTask.aspx" data="{key:'wdrw'}"><span>我的任务</span><b></b></a></li>--%>

        </ul>
        <div>
            <em></em>
            <ol></ol>
        </div>
    </div>
    <div id="main">
        <iframe src="MIS/DefaultMain_WecAccount.aspx" width="100%" height="600px" ></iframe>
    </div>
    </div>
    </form>
</body>
</html>